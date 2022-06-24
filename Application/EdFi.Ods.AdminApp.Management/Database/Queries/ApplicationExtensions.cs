// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Admin.DataAccess.Models;

namespace EdFi.Ods.AdminApp.Management.Database.Queries
{
    public static class ApplicationExtensions
    {
        public static bool IsSystemReservedApplication(this Application application)
        {
            return application != null && application.Vendor.IsSystemReservedVendor();
        }

        public static int MaximumApplicationNameLength = 50;
    }
}
