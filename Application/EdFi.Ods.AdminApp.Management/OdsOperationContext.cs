// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.AdminApp.Management
{
    public interface IOdsOperationContext
    {
        OdsInstance Instance { get; }
        OdsEnvironment TargetEnvironment { get; }
        OdsRole TargetRole { get; }
    }
    

    public class OdsApiOperationContext : IOdsOperationContext
    {
        public OdsApiOperationContext(OdsInstance instance)
        {
            Instance = instance;
            TargetEnvironment = OdsEnvironment.Production;
        }

        public OdsInstance Instance { get; }
        public OdsEnvironment TargetEnvironment { get; }
        public OdsRole TargetRole => OdsRole.Api;
    }
}
