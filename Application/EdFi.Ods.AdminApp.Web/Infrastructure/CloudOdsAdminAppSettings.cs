// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using EdFi.Ods.AdminApp.Management.Helpers;

namespace EdFi.Ods.AdminApp.Web.Infrastructure
{
    public class CloudOdsAdminAppSettings
    {
        private static readonly Lazy<CloudOdsAdminAppSettings> _instance =
            new(() => new CloudOdsAdminAppSettings());

        public static AppSettings AppSettings
        {
            get
            {
                return Startup.ConfigurationAppSettings;
            }
        }


        protected CloudOdsAdminAppSettings() { }

        public static CloudOdsAdminAppSettings Instance => _instance.Value;

        public string OdsInstanceName => AppSettings.DefaultOdsInstance;

        public string ProductionApiUrl => AppSettings.ProductionApiUrl;

        public string ApiExternalUrl => AppSettings.ApiExternalUrl;

        public string DatabaseEngine => AppSettings.DatabaseEngine;

        public int SecurityMetadataCacheTimeoutMinutes
        {
            get
            {
                var timeOut = AppSettings.SecurityMetadataCacheTimeoutMinutes;
                return int.Parse(timeOut ?? "0");
            }
        }        
    }
}
