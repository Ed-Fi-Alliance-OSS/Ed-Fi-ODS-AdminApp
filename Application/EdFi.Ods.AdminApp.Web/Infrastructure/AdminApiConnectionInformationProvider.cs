// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.


using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management.AdminApi;


namespace EdFi.Ods.AdminApp.Web.Infrastructure
{
    public class AdminApiConnectionInformationProvider : IAdminApiConnectionInformationProvider
    {   
        public async Task<AdminApiConnectionInformation> GetConnectionInformation()
        {           
            var connectionInformation = new AdminApiConnectionInformation()
            {
                ApiServerUrl = $"https://localhost:7214",
                ClientKey = "test",
                ClientSecret = "test"               
            };
            return connectionInformation;
        }      
    }
}
