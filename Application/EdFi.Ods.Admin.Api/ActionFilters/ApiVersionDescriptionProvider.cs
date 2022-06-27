// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.AspNetCore.Mvc.ApiExplorer;

namespace EdFi.Ods.Admin.Api.ActionFilters
{
    public class ApiVersionDescriptionProvider : IApiVersionDescriptionProvider
    {
        public IReadOnlyList<ApiVersionDescription> ApiVersionDescriptions => new List<ApiVersionDescription>
        {
            new ApiVersionDescription(new ApiVersion(1,0), "v1", false),
            new ApiVersionDescription(new ApiVersion(2,0), "v2", false)
        };

        public bool IsDeprecated(ActionDescriptor actionDescriptor, ApiVersion apiVersion)
        {            
            var description = ApiVersionDescriptions.SingleOrDefault(x => x.ApiVersion.MajorVersion == apiVersion.MajorVersion);
            if (description != null)
            {
                return description.IsDeprecated;
            }
            return false;
        }
    }
}
