// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;

namespace EdFi.Ods.AdminApp.Management
{
    public static class OdsWebsiteExtensions
    {
        public static bool HasTag(this OdsWebsite site, string tagName)
        {
            return site.Tags != null && site.Tags.ContainsKey(tagName);
        }

        public static bool HasTagWithValue(this OdsWebsite site, string tagName, string tagValue)
        {
            return site.HasTag(tagName) &&
                   site.Tags[tagName].Equals(tagValue, StringComparison.InvariantCultureIgnoreCase);
        }

        public static string GetTagValue(this OdsWebsite site, string tagName)
        {
            return site.HasTag(tagName) ? site.Tags[tagName] : null;
        }

        public static bool IsInRole(this OdsWebsite site, OdsRole role)
        {
            return site.Role == role;
        }

        public static bool IsInEnvironment(this OdsWebsite site, OdsEnvironment environment)
        {
            return site.Environment == environment;
        }

        public static bool IsProductionApi(this OdsWebsite site)
        {
            return site.IsInRole(OdsRole.Api) && site.IsInEnvironment(OdsEnvironment.Production);
        }

        public static bool IsAdminApp(this OdsWebsite site)
        {
            return site.IsInRole(OdsRole.AdminApp);
        }

        public static bool IsSwaggerWebsite(this OdsWebsite site)
        {
            return site.IsInRole(OdsRole.Swagger);
        }
    }
}
