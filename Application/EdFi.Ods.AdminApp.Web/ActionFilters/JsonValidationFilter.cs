// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using EdFi.Ods.AdminApp.Web.Helpers;
using Newtonsoft.Json;

namespace EdFi.Ods.AdminApp.Web.ActionFilters
{
    public class JsonValidationFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var request = filterContext.HttpContext.Request;
            var modelState = filterContext.ModelState;
            var requestMethod = request.Method;

            if (requestMethod != "POST" || modelState.IsValid)
                return;

            if (request.IsAjaxRequest())
            {
                var result = new ContentResult();
                var content = JsonConvert.SerializeObject(modelState,
                    new JsonSerializerSettings
                    {
                        ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                    });
                result.Content = content;
                result.ContentType = "application/json";

                filterContext.HttpContext.Response.StatusCode = 400;
                filterContext.Result = result;
            }
        }
    }
}
