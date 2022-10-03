// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;

namespace EdFi.Ods.AdminApp.Management.Database.Models
{
    public class Role : Enumeration<Role, int>
    {
        public string OidcClaimValue { get; }

        public static readonly Role SuperAdmin = new Role(1, "Super Administrator", "edfi_admin_app/super_admin");
        public static readonly Role Admin = new Role(2, "Administrator", "edfi_admin_app/admin");

        private Role(int value, string displayName, string oidcClaimValue)
            : base(value, displayName)
        {
            OidcClaimValue = oidcClaimValue;
        }

        public static Role FromOidcClaims(IEnumerable<string> roleClaimValues)
        {
            if (roleClaimValues.Contains(SuperAdmin.OidcClaimValue))
                return SuperAdmin;
            if (roleClaimValues.Contains(Admin.OidcClaimValue))
                return Admin;
            return null;
        }
    }
}
