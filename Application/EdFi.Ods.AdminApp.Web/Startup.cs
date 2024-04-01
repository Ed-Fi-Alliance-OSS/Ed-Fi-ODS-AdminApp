// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Reflection;
using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management;
using EdFi.Ods.AdminApp.Management.Api.Automapper;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;
using EdFi.Ods.AdminApp.Management.Helpers;
using EdFi.Ods.AdminApp.Web._Installers;
using EdFi.Ods.AdminApp.Web.ActionFilters;
using EdFi.Ods.AdminApp.Web.Helpers;
using EdFi.Ods.AdminApp.Web.Infrastructure;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using FluentValidation.AspNetCore;
using log4net;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using NUglify.Css;
using NUglify.JavaScript;
using System.Security.Claims;
using System.Linq;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http.Features;
using System.Data;

namespace EdFi.Ods.AdminApp.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var executingAssembly = Assembly.GetExecutingAssembly();

            var databaseEngine = Configuration["AppSettings:DatabaseEngine"];

            var identitySettings = new IdentitySettings();
            Configuration.GetSection("IdentitySettings").Bind(identitySettings);

            services.AddDbContext<AdminAppDbContext>(ConfigureForAdminDatabase);
            services.AddDbContext<AdminAppIdentityDbContext>(ConfigureForAdminDatabase);
            services.AddDbContext<AdminAppDataProtectionKeysDbContext>(ConfigureForAdminDatabase);

            if(identitySettings.Type == IdentitySettingsConstants.EntityFrameworkIdentityType)
                ConfigureForEntityFrameworkIdentity(services);
            else if (identitySettings.Type == IdentitySettingsConstants.OpenIdIdentityType)
                ConfigureForOpenIdConnectIdentity(services, identitySettings);
            else
                throw new NotSupportedException(
                    $"Unknown Identity Type {identitySettings.Type} configured. Please configure a supported Identity Type. Currently supported types are: EntityFramework and OpenIdConnect");

            services.AddControllersWithViews(options =>
                    {
                        options.Filters.Add(new AuthorizeFilter());
                        options.Filters.Add(new AuthorizeFilter("UserMustExistPolicy"));
                        options.Filters.Add<AutoValidateAntiforgeryTokenAttribute>();
                        options.Filters.Add<JsonValidationFilter>();
                        options.Filters.Add<SetupRequiredFilter>();
                        options.Filters.Add<InstanceContextFilter>();
                    })
                    .AddFluentValidation(
                        opt =>
                        {
                            opt.RegisterValidatorsFromAssembly(executingAssembly);

                            opt.ValidatorOptions.DisplayNameResolver = (type, memberInfo, expression)
                                => memberInfo?
                                    .GetCustomAttribute<System.ComponentModel.DataAnnotations.DisplayAttribute>()?.GetName();
                        });

            services.AddWebOptimizer(
                pipeline =>
                {
                    var minifyJsSettings = new CodeSettings
                    {
                        LocalRenaming = LocalRenaming.CrunchAll,
                        MinifyCode = true
                    };

                    var minifyCssSettings = new CssSettings
                    {
                        MinifyExpressions = true
                    };

                    pipeline.AddCssBundle("/bundles/bootstrap-multiselect.min.css", minifyCssSettings, "/content/css/bootstrap-multiselect.css");
                    pipeline.AddCssBundle("/bundles/site.min.css", minifyCssSettings, "/content/css/Site.css");
                    pipeline.AddCssBundle("/bundles/jquery-multiselect.min.css", minifyCssSettings, "/content/css/jquery-multiselect.css");
                    pipeline.AddJavaScriptBundle("/bundles/bootstrap-multiselect.min.js", minifyJsSettings, "/Scripts/bootstrap-multiselect.js");
                    pipeline.AddJavaScriptBundle("/bundles/jquery-multiselect.min.js", minifyJsSettings, "/Scripts/jquery-multiselect.js");
                    pipeline.AddJavaScriptBundle("/bundles/modernizr.min.js", minifyJsSettings, "/Scripts/modernizr-2.8.3.js");
                    pipeline.AddJavaScriptBundle("/bundles/site.min.js", minifyJsSettings, "/Scripts/site.js", "/Scripts/site-form-handlers.js");
                    pipeline.AddJavaScriptBundle("/bundles/claimset.min.js", minifyJsSettings, "/Scripts/resource-editor.js");
                    pipeline.AddJavaScriptBundle("/bundles/authstrategy.min.js", minifyJsSettings, "/Scripts/auth-editor.js");
                });

            services.AddDataProtection().PersistKeysToDbContext<AdminAppDataProtectionKeysDbContext>();

            services.AddAutoMapper(executingAssembly, typeof(AdminManagementMappingProfile).Assembly);

            services.Configure<AppSettings>(Configuration.GetSection("AppSettings"));
            services.Configure<IdentitySettings>(Configuration.GetSection("IdentitySettings"));
            services.Configure<ConnectionStrings>(Configuration.GetSection("ConnectionStrings"));

            services.AddHttpClient();

            services.Configure<FormOptions>(options =>
            {
                options.ValueCountLimit = int.MaxValue;
            });

            var appSettings = new AppSettings();
            Configuration.GetSection("AppSettings").Bind(appSettings);
            ConfigurationAppSettings = appSettings;

            var connectionStrings = new ConnectionStrings();
            Configuration.GetSection("ConnectionStrings").Bind(connectionStrings);
            ConfigurationConnectionStrings = connectionStrings;

            var appStartup = appSettings.AppStartup;

            if (appStartup == "OnPrem")
                new OnPremInstaller().Install(services, appSettings);


            services.AddHealthCheck(Configuration.GetConnectionString("Admin"), IsSqlServer(databaseEngine));


        }

        private void ConfigureForEntityFrameworkIdentity(IServiceCollection services)
        {
            services.AddIdentity<AdminAppUser, IdentityRole>()
                .AddEntityFrameworkStores<AdminAppIdentityDbContext>()
                .AddDefaultTokenProviders();

            services.AddControllersWithViews(
                options =>
                {
                    options.Filters.Add<PasswordChangeRequiredFilter>();
                    options.Filters.Add<UserContextFilter>();
                });

            services.Configure<IdentityOptions>(options =>
            {
                options.User.RequireUniqueEmail = true;
            });

            services.ConfigureApplicationCookie(options =>
            {
                options.LoginPath = "/Identity/Login";
                options.LogoutPath = "/Identity/LogOut";
                options.AccessDeniedPath = "/Identity/Login";
            });

            services.AddAuthorization(options =>
            {
                options.AddPolicy("UserMustExistPolicy", policyBuilder =>
                    { policyBuilder.AddRequirements(new UserMustExistRequirement()); });
            });

            services.AddScoped<IAuthorizationHandler, UserMustExistHandler>();
        }

        private void ConfigureForOpenIdConnectIdentity(IServiceCollection services, IdentitySettings identitySettings)
        {
            var openIdSettings = identitySettings.OpenIdSettings;
            services.AddControllersWithViews(
                options =>
                {
                    options.Filters.Add<OpenIdConnectUserContextFilter>();
                });
            services.AddScoped<IOpenIdConnectLoginService, OpenIdConnectLoginService>();
            services.AddAuthentication(options =>
            {
                options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = openIdSettings.AuthenticationScheme;
            })
            .AddCookie(
                options =>
                {

                    options.LoginPath = "/OpenIdConnect/Login";
                    options.LogoutPath = "/OpenIdConnect/Logout";
                    options.AccessDeniedPath = "/OpenIdConnect/Login";

                    options.Events.OnRedirectToAccessDenied = context =>
                    { ;
                        context.HttpContext.Response.StatusCode = 401;
                        return Task.FromResult(Task.CompletedTask);
                    };

                    options.Events.OnSignedIn = async context =>
                    {
                        await EnsureIdentityUserSetupForOpenIdConnectUser(context);
                    };
                })
            .AddOpenIdConnect(openIdSettings.AuthenticationScheme, options =>
            {
                options.SignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;

                options.Authority = openIdSettings.Authority;

                options.ClientId = openIdSettings.ClientId;
                options.ClientSecret = openIdSettings.ClientSecret;
                options.ResponseType = openIdSettings.ResponseType;

                options.Scope.Clear();
                foreach (var scope in openIdSettings.Scopes)
                    options.Scope.Add(scope);

                options.SaveTokens = openIdSettings.SaveTokens;
                options.RequireHttpsMetadata = openIdSettings.RequireHttpsMetadata;
                options.GetClaimsFromUserInfoEndpoint = openIdSettings.GetClaimsFromUserInfoEndpoint;

                options.TokenValidationParameters = new TokenValidationParameters
                {
                    NameClaimType = openIdSettings.ClaimTypeMappings.NameClaimType,
                    RoleClaimType = openIdSettings.ClaimTypeMappings.RoleClaimType
                };

                options.Events.OnTicketReceived = async context => await TranslateOidcClaims(context);
            });

            services.AddAuthorization(options =>
            {
                options.DefaultPolicy = new AuthorizationPolicyBuilder()
                    .RequireClaim(ClaimTypes.Role, Role.GetAll().Select(r => r.DisplayName))
                    .Build();

                options.AddPolicy("UserMustExistPolicy", policyBuilder =>
                    { policyBuilder.AddRequirements(new UserMustExistRequirement()); });
            });

            services.AddScoped<IAuthorizationHandler, OpenIdConnectUserMustExistHandler>();

            async Task EnsureIdentityUserSetupForOpenIdConnectUser(CookieSignedInContext context)
            {
                var openIdConnectLoginService =
                    context.HttpContext.RequestServices.GetRequiredService<IOpenIdConnectLoginService>();

                var claimsIdentity = context.Principal?.Identity as ClaimsIdentity;
                var oidcUserId = claimsIdentity?.Claims.FirstOrDefault(m => m.Type == ClaimTypes.NameIdentifier)?.Value;
                var oidcUserEmail = claimsIdentity?.Claims.FirstOrDefault(m => m.Type == ClaimTypes.Email)?.Value;
                var oidcUserRoles = claimsIdentity?.Claims.Where(m => m.Type == ClaimTypes.Role).Select(c => c.Value);

                if (claimsIdentity != null)
                {
                    var loginProvider = identitySettings.OpenIdSettings.LoginProvider;
                    var identityUserId = openIdConnectLoginService!.GetIdentityUserIdForOpenIdConnectUser(oidcUserId, loginProvider)
                                         ?? await openIdConnectLoginService!.AddUserLoginForOpenIdConnect(oidcUserId, oidcUserEmail, loginProvider, loginProvider);

                    if (identityUserId != null)
                    {
                        openIdConnectLoginService.UpdateUserRolesFromIncomingClaim(identityUserId, oidcUserRoles.ToArray());
                    }
                }
            }

            Task TranslateOidcClaims(TicketReceivedContext context)
            {
                var claimsIdentity = context.Principal?.Identity as ClaimsIdentity;

                void ReplaceClaimIfNotNull(string oidcClaimType, string adminAppClaimType)
                {
                    var claim = claimsIdentity.Claims.FirstOrDefault(m => m.Type == oidcClaimType);
                    if (oidcClaimType != adminAppClaimType && claim != null && !string.IsNullOrEmpty(claim.Value))
                    {
                        claimsIdentity.AddClaim(new Claim(adminAppClaimType, claim.Value));
                        claimsIdentity.RemoveClaim(claim);
                    }
                }

                if (claimsIdentity != null)
                {
                    ReplaceClaimIfNotNull(openIdSettings.ClaimTypeMappings.IdentifierClaimType, ClaimTypes.NameIdentifier);
                    ReplaceClaimIfNotNull(openIdSettings.ClaimTypeMappings.NameClaimType, ClaimTypes.Name);
                    ReplaceClaimIfNotNull(openIdSettings.ClaimTypeMappings.EmailClaimType, ClaimTypes.Email);

                    var roleClaims = claimsIdentity.Claims.Where(m => m.Type == openIdSettings.ClaimTypeMappings.RoleClaimType).ToList();
                    if(roleClaims.Any())
                    {
                        var role = Role.FromOidcClaims(roleClaims.Select(r => r.Value));
                        foreach (var oldClaim in roleClaims) { claimsIdentity.RemoveClaim(oldClaim); }
                        if(role != null) { claimsIdentity.AddClaim(new Claim(ClaimTypes.Role, role.DisplayName)); }
                    }
                }

                return Task.CompletedTask;
            }
        }

        private void ConfigureForAdminDatabase(DbContextOptionsBuilder options)
        {
            var connectionString = Configuration.GetConnectionString("Admin");
            var databaseEngine = Configuration["AppSettings:DatabaseEngine"];

            if (IsSqlServer(databaseEngine))
                options.UseSqlServer(connectionString);
            else
                options.UseNpgsql(connectionString).UseLowerCaseNamingConvention();
        }

        private static bool IsSqlServer(string databaseEngine) => "SqlServer".Equals(databaseEngine, StringComparison.InvariantCultureIgnoreCase);

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            var loggingOptions = Configuration.GetSection("Log4NetCore")
                .Get<Log4NetProviderOptions>();

            var pathBase = Configuration.GetValue<string>("AppSettings:PathBase");
            if (!string.IsNullOrEmpty(pathBase))
            {
                app.UsePathBase("/" + pathBase.Trim('/'));
            }

            loggerFactory.AddLog4Net(loggingOptions);

            if (env.IsProduction())
            {
                app.UseExceptionHandler("/Home/Error");
            }
            else
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseStatusCodePages(ctx =>
            {
                var response = ctx.HttpContext.Response;

                if (response.StatusCode == (int)HttpStatusCode.Unauthorized || response.StatusCode == (int)HttpStatusCode.Forbidden)
                {
                    var basePath = response.HttpContext.Request.PathBase;
                    var userUnauthorizedPath = "/Home/UserUnauthorized";
                    if (basePath.HasValue)
                    {
                        userUnauthorizedPath = $"{basePath}/Home/UserUnauthorized";
                    }
                    response.Redirect(userUnauthorizedPath);
                }
                return Task.CompletedTask;
            });

            app.UseWebOptimizer();

            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");

                if (!env.IsProduction())
                {
                    endpoints.MapPost(
                        "/development-product-registration-sink", async context =>
                        {
                            using var reader = new StreamReader(context.Request.Body);

                            var body = await reader.ReadToEndAsync();

                            var logger = LogManager.GetLogger(typeof(Startup));
                            logger.Debug($"Development Product Registration Sink Received Message: {Environment.NewLine}{body}");

                            var model = JsonConvert.DeserializeObject<ProductRegistrationModel>(body);

                            context.Response.StatusCode = (int)HttpStatusCode.OK;

                            await context.Response.WriteAsync(
                                "Development Product Registration Sink received registration " +
                                $"notification with ProductRegistrationId {model.ProductRegistrationId}. " +
                                "This notification will NOT be reported to the Production registration endpoint.");
                        });
                }

                endpoints.MapHealthChecks("/health");
            });
        }

        public static AppSettings ConfigurationAppSettings { get; set; }
        public static ConnectionStrings ConfigurationConnectionStrings { get; set; }
    }
}
