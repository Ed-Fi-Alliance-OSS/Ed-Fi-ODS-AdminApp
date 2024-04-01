// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
extern alias SecurityCompatiblity53;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EdFi.Common.Extensions;
using EdFi.Admin.DataAccess.Contexts;

using EdFi.Ods.AdminApp.Management;
using EdFi.Ods.AdminApp.Management.Api;
using EdFi.Ods.AdminApp.Management.Configuration.Application;
using EdFi.Ods.AdminApp.Management.Helpers;
using EdFi.Ods.AdminApp.Web.Infrastructure;
using EdFi.Common.Security;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using EdFi.Ods.AdminApp.Management.Services;
using EdFi.Ods.AdminApp.Web.Display.HomeScreen;
using EdFi.Security.DataAccess.Contexts;
using log4net;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using Microsoft.EntityFrameworkCore;

namespace EdFi.Ods.AdminApp.Web._Installers
{
    public abstract class CommonConfigurationInstaller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(CommonConfigurationInstaller));

        public void Install(IServiceCollection services, AppSettings appSettings)
        {
            services.AddScoped<SecurityCompatiblity53::EdFi.SecurityCompatiblity53.DataAccess.Contexts.ISecurityContext>(x =>
            {
                var connectionStrings = x.GetService<IOptions<ConnectionStrings>>();
                DbContextOptions dbContextOptions = GetDbContextOptions(appSettings, connectionStrings.Value.Security);
                if (appSettings.DatabaseEngine.EqualsIgnoreCase("SqlServer"))
                    return new SecurityCompatiblity53::EdFi.SecurityCompatiblity53.DataAccess.Contexts.SqlServerSecurityContext(dbContextOptions);

                return new SecurityCompatiblity53::EdFi.SecurityCompatiblity53.DataAccess.Contexts.PostgresSecurityContext(dbContextOptions);
            });

            services.AddScoped<ISecurityContext>(x =>
            {
                var connectionStrings = x.GetService<IOptions<ConnectionStrings>>();
                DbContextOptions dbContextOptions = GetDbContextOptions(appSettings, connectionStrings.Value.Security);
                if (appSettings.DatabaseEngine.EqualsIgnoreCase("SqlServer"))
                    return new SqlServerSecurityContext(dbContextOptions);

                return new PostgresSecurityContext(dbContextOptions);
            });

            services.AddScoped<IUsersContext>(x =>
            {
                var connectionStrings = x.GetService<IOptions<ConnectionStrings>>();
                DbContextOptions dbContextOptions = GetDbContextOptions(appSettings, connectionStrings.Value.Admin);
                if (appSettings.DatabaseEngine.EqualsIgnoreCase("SqlServer"))
                    return new SqlServerUsersContext(dbContextOptions);

                return new PostgresUsersContext(dbContextOptions);
            });

            services.AddSingleton(TokenCache.DefaultShared);

            services.AddScoped<AdminAppUserContext>();

            services.AddTransient<ICloudOdsAdminAppSettingsApiModeProvider, CloudOdsAdminAppSettingsApiModeProvider>();

            services.AddTransient<IOdsApiConnectionInformationProvider, CloudOdsApiConnectionInformationProvider>();

            services.AddSingleton<ISecureHasher, Pbkdf2HmacSha1SecureHasher>();
            services.AddSingleton<IPackedHashConverter, PackedHashConverter>();

            services.AddSingleton<ISecureHasherProvider, SecureHasherProvider>(
                x => new SecureHasherProvider(new List<ISecureHasher> { x.GetService<ISecureHasher>() }));

            services.AddSingleton<ISecurePackedHashProvider, SecurePackedHashProvider>();
            services.AddSingleton<IHashConfigurationProvider, DefaultHashConfigurationProvider>();

            InstallHostingSpecificClasses(services);

            services.AddTransient<IHomeScreenDisplayService, HomeScreenDisplayService>();

            services.AddScoped<InstanceContext>();

            services.AddTransient<ApplicationConfigurationService>();

            services.AddTransient<IClaimSetCheckService, ClaimSetCheckService>();

            foreach (var type in typeof(IMarkerForEdFiOdsAdminAppManagement).Assembly.GetTypes())
            {
                if (type.IsClass && !type.IsAbstract && (type.IsPublic || type.IsNestedPublic))
                {
                    var concreteClass = type;

                    if (concreteClass == typeof(OdsApiFacade))
                        continue; //IOdsApiFacade is never resolved. Instead, classes inject IOdsApiFacadeFactory.

                    if (concreteClass == typeof(OdsRestClient))
                        continue; //IOdsRestClient is never resolved. Instead, classes inject IOdsRestClientFactory.

                    if (concreteClass == typeof(TokenRetriever))
                        continue; //ITokenRetriever is never resolved. Instead, other dependencies construct TokenRetriever directly.

                    var interfaces = concreteClass.GetInterfaces().ToArray();

                    if (interfaces.Length == 1)
                    {
                        var serviceType = interfaces.Single();

                        if (serviceType.FullName == $"{concreteClass.Namespace}.I{concreteClass.Name}")
                            services.AddTransient(serviceType, concreteClass);
                    }
                    else if (interfaces.Length == 0)
                    {
                        if (concreteClass.Name.EndsWith("Command") ||
                            concreteClass.Name.EndsWith("Query") ||
                            concreteClass.Name.EndsWith("Service"))
                            services.AddTransient(concreteClass);
                    }
                }
            }

            services.AddSingleton<IStringEncryptorService, AESEncryptorService>(
                    x => new AESEncryptorService(appSettings.EncryptionKey));

            services.AddSingleton<IOdsSecurityModelVersionResolver>(sp =>
            {
                var apiServerUrl = appSettings.ProductionApiUrl;
                var validator = sp.GetRequiredService<IOdsApiValidator>();
                return new OdsSecurityVersionResolver(validator, apiServerUrl);
            });
        }

        protected abstract void InstallHostingSpecificClasses(IServiceCollection services);


        private static IServiceProvider ServiceProviderFunc(IServiceCollection collection)
        {
            return collection.BuildServiceProvider();
        }

        protected static DbContextOptions GetDbContextOptions(AppSettings appSettings, string connectionString)
        {
            var builder = new DbContextOptionsBuilder();
            if (appSettings.DatabaseEngine.EqualsIgnoreCase("SqlServer")) { 
                builder.UseSqlServer(connectionString);
            }
            else {
                builder.UseNpgsql(connectionString).UseLowerCaseNamingConvention(); ;
            }
            return builder.Options;
        }
    }
}
