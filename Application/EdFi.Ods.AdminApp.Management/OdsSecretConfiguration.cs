// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.AdminApp.Management
{
    public class OdsSecretConfiguration
    {
        public OdsApiCredential ProductionApiKeyAndSecret { get; set; }
        public ABProxyApiCredential LearningStandardsCredential { get; set; }
        public ABProxyApiCredential ProductionAcademicBenchmarkApiClientKeyAndSecret { get; set; }

        public OdsAdminAppApiCredentials GetOdsAdminAppApiCredentials() => new OdsAdminAppApiCredentials
        {
            ProductionApiCredential = ProductionApiKeyAndSecret
        };
    }
}
