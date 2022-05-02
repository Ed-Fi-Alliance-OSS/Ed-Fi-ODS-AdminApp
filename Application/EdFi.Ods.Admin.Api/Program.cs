// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoWrapper;
using EdFi.Ods.Admin.Api.Extensions;
using log4net;

var builder = WebApplication.CreateBuilder(args);

builder.UseServicesConfigurator();

// logging
ILog _logger = LogManager.GetLogger("Program");
_logger.Info("Starting Admin API");

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseHttpsRedirection();

app.UseExceptionHandler(exceptionHandlerApp =>{
    exceptionHandlerApp.Run(async context => await ExceptionHandler.ExecuteAsync(context, _logger));
});

app.UseApiResponseAndExceptionWrapper();
app.UseRouting();
app.UseRouteBuilders();

app.Run();
