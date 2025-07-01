// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Web.Helpers;
using FluentValidation;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;

namespace EdFi.Ods.AdminApp.Web.ActionFilters
{
    public class FluentValidationManualFilter : IAsyncActionFilter
    {
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            foreach (var arg in context.ActionArguments)
            {
                if (arg.Value == null)
                {
                    continue;
                }
                var validatorType = typeof(IValidator<>).MakeGenericType(arg.Value.GetType());
                var validator = context.HttpContext.RequestServices.GetService(validatorType) as IValidator;
                if (validator == null)
                {
                    continue;
                }
                var validationContext = new ValidationContext<object>(arg.Value);
                var result = await validator.ValidateAsync(validationContext);
                if (!result.IsValid)
                {
                    foreach (var error in result.Errors)
                    {
                        context.ModelState.TryAddModelError(error.PropertyName, error.ErrorMessage);
                    }
                }
            }
            // Stop the pipeline if validation failed
            if (!context.ModelState.IsValid)
            {
                // Handle AJAX requests
                if (context.HttpContext.Request.IsAjaxRequest())
                {
                    var jsonSerializerSettings = new JsonSerializerSettings
                    {
                        ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                    };

                    var contentResult = new ContentResult
                    {
                        Content = JsonConvert.SerializeObject(context.ModelState, jsonSerializerSettings),
                        ContentType = "application/json",
                        StatusCode = 400,
                    };

                    context.Result = contentResult;
                    return;
                }

                // For non-AJAX requests, let existing filters handle the response
                return;
            }
            await next();
        }
    }
}
