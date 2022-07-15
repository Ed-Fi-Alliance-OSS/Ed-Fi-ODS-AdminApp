// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Versioning;

public static class HttpContextExtensions
{
        public static IApiVersioningFeature ApiVersioningFeature(this HttpContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException(nameof(context));
            }

            var feature = context.Features.Get<IApiVersioningFeature>();

            if (feature == null)
            {
                feature = new ApiVersioningFeature(context);
                context.Features.Set(feature);
            }

            return feature;
        }

        public static ApiVersion? GetRequestedApiVersion(this HttpContext context) => context.ApiVersioningFeature().RequestedApiVersion;
}
