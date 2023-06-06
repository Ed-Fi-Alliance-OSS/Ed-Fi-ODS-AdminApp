// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Threading.Tasks;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Admin.DataAccess.Models;
using EdFi.Ods.AdminApp.Management.Configuration.Claims;
using EdFi.Ods.AdminApp.Management.Helpers;
using Microsoft.Extensions.Options;

namespace EdFi.Ods.AdminApp.Management.OdsInstanceServices
{
    public class OdsInstanceFirstTimeSetupService : IOdsInstanceFirstTimeSetupService
    {
        private readonly IOdsSecretConfigurationProvider _odsSecretConfigurationProvider;
        private readonly IFirstTimeSetupService _firstTimeSetupService;
        private readonly IUsersContext _usersContext;
        private readonly AppSettings _appSettings;

        public OdsInstanceFirstTimeSetupService(IOdsSecretConfigurationProvider odsSecretConfigurationProvider, 
            IFirstTimeSetupService firstTimeSetupService, 
            IUsersContext usersContext,
            IOptions<AppSettings> appSettings)
        {
            _odsSecretConfigurationProvider = odsSecretConfigurationProvider;
            _firstTimeSetupService = firstTimeSetupService;
            _usersContext = usersContext;
            _appSettings = appSettings.Value;
        }

        public async Task CompleteSetup(OdsInstance odsInstance, CloudOdsClaimSet claimSet)
        {
            await CreateAndSaveApiKeyAndSecret(odsInstance, claimSet);
            _firstTimeSetupService.EnsureAdminDatabaseInitialized();
            await _usersContext.SaveChangesAsync();
        }

        private async Task CreateAndSaveApiKeyAndSecret(OdsInstance odsInstance, CloudOdsClaimSet claimSet)
        {
            var secretConfiguration = new OdsSecretConfiguration();

            var applicationCreateResult = await _firstTimeSetupService.CreateAdminAppInAdminDatabase(claimSet.ClaimSetName, odsInstance.Name,
                    _appSettings.AwsCurrentVersion);

            if (await _odsSecretConfigurationProvider.GetSecretConfiguration(odsInstance.OdsInstanceId) == null)
            {
                secretConfiguration.ProductionApiKeyAndSecret = applicationCreateResult.ProductionKeyAndSecret;

                await _odsSecretConfigurationProvider.SetSecretConfiguration(secretConfiguration, odsInstance.OdsInstanceId);
            }
        }     
    }
}
