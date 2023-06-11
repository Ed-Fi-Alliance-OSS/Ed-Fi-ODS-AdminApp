// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.AdminApp.Management
{
    public interface ICloudOdsOperationContext
    {
        CloudOdsInstance Instance { get; }
        CloudOdsEnvironment TargetEnvironment { get; }
        CloudOdsRole TargetRole { get; }
    }
    

    public class CloudOdsApiOperationContext : ICloudOdsOperationContext
    {
        public CloudOdsApiOperationContext(CloudOdsInstance instance)
        {
            Instance = instance;
            TargetEnvironment = CloudOdsEnvironment.Production;
        }

        public CloudOdsInstance Instance { get; }
        public CloudOdsEnvironment TargetEnvironment { get; }
        public CloudOdsRole TargetRole => CloudOdsRole.Api;
    }
}
