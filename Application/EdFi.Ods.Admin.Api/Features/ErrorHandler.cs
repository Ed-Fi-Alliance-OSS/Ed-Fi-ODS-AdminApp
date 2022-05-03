// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Admin.Api.Features.Error;
using Microsoft.AspNetCore.Diagnostics;

namespace EdFi.Ods.Admin.Api.Features
{
    public class ErrorHandler : IRouteBuilderBase
    {
        public void AddEndPoints(IEndpointRouteBuilder endpoints)
        {
            endpoints.Map("/error", HandleError);
        }

        internal Task<IResult> HandleError(HttpContext context, ILogger<ErrorHandler> logger)
        {
            var exceptionHandlerFeature = context.Features.Get<IExceptionHandlerPathFeature>();
            var exception = exceptionHandlerFeature?.Error ?? new Exception();

            if (exception is FailedValidationException validationException)
            {
                logger.LogDebug(exception, "Validation error");
                return Task.FromResult(AdminApiError.Validation(validationException.Result.Errors));
            }

            logger.LogError(exception, "An uncaught error has occurred");
            return Task.FromResult(AdminApiError.Unexpected(exception));
        }
    }
}
