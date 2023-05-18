// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Flurl;

namespace EdFi.Ods.AdminApp.Management.AdminApi
{
    public class AdminApiConnectionInformation
    {
        public string ApiServerUrl { get; set; }
        public string ClientKey { get; set; }
        public string ClientSecret { get; set; }

        public string ApiBaseUrl
        {
            get
            {
                var uri = ApiServerUrl.AppendPathSegments("v1");

                return uri;
            }
        }

        public string OAuthUrl
        {
            get
            {
                var uri = ApiServerUrl;

                return uri;
            }
        }

        public string OAuthRegisterUrl
        {
            get
            {
                var uri = ApiServerUrl.AppendPathSegments("connect", "register");

                return uri;
            }
        }
    }
}
