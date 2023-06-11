// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.AdminApp.Management
{
    public class OdsRole : Enumeration<OdsRole>
    {
        public static readonly OdsRole AdminApp = new OdsRole(1, "AdminApp");
        public static readonly OdsRole Api = new OdsRole(2, "Api");
        public static readonly OdsRole Swagger = new OdsRole(3, "Swagger");
        

        protected OdsRole(int value, string displayName) : base(value, displayName)
        {
        }
    }
}
