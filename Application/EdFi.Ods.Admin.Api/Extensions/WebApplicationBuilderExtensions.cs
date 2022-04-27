using EdFi.Admin.DataAccess.Contexts;
using EdFi.Ods.Admin.Api.Enums;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Security.DataAccess.Contexts;
using FluentValidation.AspNetCore;
using Microsoft.EntityFrameworkCore;
using System.Reflection;

namespace EdFi.Ods.Admin.Api.Extensions
{
    public static class WebApplicationBuilderExtensions
    {
        public static void UseServicesConfigurator(this WebApplicationBuilder webApplicationBuilder)
        {
            // Add services to the container.
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            webApplicationBuilder.Services.AddEndpointsApiExplorer();
            webApplicationBuilder.Services.AddSwaggerGen();

            // Logging
            var loggingOptions = webApplicationBuilder.Configuration.GetSection("Log4NetCore").Get<Log4NetProviderOptions>();
            webApplicationBuilder.Logging.AddLog4Net(loggingOptions);

            // Fluent validation
            var executingAssembly = Assembly.GetExecutingAssembly();
            webApplicationBuilder.Services.AddFluentValidation(
                                   opt =>
                                   {
                                       opt.RegisterValidatorsFromAssembly(executingAssembly);

                                       opt.ValidatorOptions.DisplayNameResolver = (type, memberInfo, expression)
                                           => memberInfo?
                                               .GetCustomAttribute<System.ComponentModel.DataAnnotations.DisplayAttribute>()?.GetName();
                                   });

            // Services
            var databaseEngine = webApplicationBuilder.Configuration["AppSettings:DatabaseEngine"];
            var adminConnectionString = webApplicationBuilder.Configuration.GetConnectionString("Admin");
            var securityConnectionString = webApplicationBuilder.Configuration.GetConnectionString("Security");

            webApplicationBuilder.Services.AddDbContext<AdminAppDbContext>(options =>       
            {                              
                if (DatabaseEngineEnum.Parse(databaseEngine).Equals(DatabaseEngineEnum.PostgreSql))                
                    options.UseNpgsql(adminConnectionString);                
                else if(DatabaseEngineEnum.Parse(databaseEngine).Equals(DatabaseEngineEnum.SqlServer))
                    options.UseSqlServer(adminConnectionString);                
            });

            webApplicationBuilder.Services.AddScoped<ISecurityContext>(x =>
            {               
                if (DatabaseEngineEnum.Parse(databaseEngine).Equals(DatabaseEngineEnum.SqlServer))
                    return new SqlServerSecurityContext(securityConnectionString);

                return new PostgresSecurityContext(securityConnectionString);
            });

            webApplicationBuilder.Services.AddScoped<IUsersContext>(x =>
            {
                if (DatabaseEngineEnum.Parse(databaseEngine).Equals(DatabaseEngineEnum.SqlServer))
                    return new SqlServerUsersContext(adminConnectionString);

                return new PostgresUsersContext(adminConnectionString);
            });
        }       
    }
}
