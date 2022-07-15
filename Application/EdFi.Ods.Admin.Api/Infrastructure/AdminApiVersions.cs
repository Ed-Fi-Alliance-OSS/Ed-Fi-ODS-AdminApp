// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Reflection;

namespace EdFi.Ods.Admin.Api.Infrastructure
{
    public class AdminApiVersions
    {
        public const string v1 = "v1";
        public const string v2 = "v2";
        public static List<string> GetAllVersions()
        {
            return typeof(AdminApiVersions)
                .GetFields(BindingFlags.Public | BindingFlags.Static)
                .Where(fi => fi.IsLiteral && !fi.IsInitOnly && fi.FieldType == typeof(string))
                .Select(x => x.GetRawConstantValue() as string ?? "")
                .ToList();
        }
    }
}
