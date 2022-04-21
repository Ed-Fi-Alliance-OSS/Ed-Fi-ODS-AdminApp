// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Admin.Api.Extensions;
using EdFi.Ods.AdminApp.Management.Database;
using FluentValidation.AspNetCore;
using log4net;
using Microsoft.EntityFrameworkCore;
using System.Reflection;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// logging
var loggingOptions = builder.Configuration.GetSection("Log4NetCore").Get<Log4NetProviderOptions>();
builder.Logging.AddLog4Net(loggingOptions);
ILog _logger = LogManager.GetLogger("Program");
_logger.Info("Starting Admin API");

// Fluent validation
var executingAssembly = Assembly.GetExecutingAssembly();
 builder.Services.AddFluentValidation(
                        opt =>
                        {
                            opt.RegisterValidatorsFromAssembly(executingAssembly);

                            opt.ValidatorOptions.DisplayNameResolver = (type, memberInfo, expression)
                                => memberInfo?
                                    .GetCustomAttribute<System.ComponentModel.DataAnnotations.DisplayAttribute>()?.GetName();
                        });

// Services
var connectionString = builder.Configuration.GetConnectionString("Admin");
builder.Services.AddDbContext<AdminAppDbContext>(o => o.UseSqlServer(connectionString));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseHttpsRedirection();
app.UseRouting();
app.UseRouteBuilders();

app.Run();
