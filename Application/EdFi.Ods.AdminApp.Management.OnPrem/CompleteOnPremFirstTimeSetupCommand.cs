// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Threading.Tasks;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Admin.DataAccess.Models;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using EdFi.Ods.AdminApp.Management.Configuration.Claims;
using EdFi.Ods.AdminApp.Management.OdsInstanceServices;
using EdFi.Security.DataAccess.Contexts;
using Action = System.Action;

namespace EdFi.Ods.AdminApp.Management.OnPrem
{
    public class CompleteOnPremFirstTimeSetupCommand : ICompleteOdsFirstTimeSetupCommand
    {
        private readonly IUsersContext _usersContext;
        private readonly ISecurityContext _securityContext;
        private readonly ICloudOdsClaimSetConfigurator _cloudOdsClaimSetConfigurator;
        private readonly IOdsInstanceFirstTimeSetupService _firstTimeSetupService;
        private readonly IAssessmentVendorAdjustment _assessmentVendorAdjustment;
        private readonly IClaimSetCheckService _claimSetCheckService;

        public Action ExtraDatabaseInitializationAction { get; set; }

        public CompleteOnPremFirstTimeSetupCommand(
            IUsersContext usersContext,
            ISecurityContext securityContext,
            ICloudOdsClaimSetConfigurator cloudOdsClaimSetConfigurator,
            IOdsInstanceFirstTimeSetupService firstTimeSetupService,
            IAssessmentVendorAdjustment assessmentVendorAdjustment,
            IClaimSetCheckService claimSetCheckService)
        {
            _assessmentVendorAdjustment = assessmentVendorAdjustment;
            _claimSetCheckService = claimSetCheckService;
            _usersContext = usersContext;
            _securityContext = securityContext;
            _cloudOdsClaimSetConfigurator = cloudOdsClaimSetConfigurator;
            _firstTimeSetupService = firstTimeSetupService;
        }

        public async Task<bool> Execute(CloudOdsClaimSet claimSet)
        {
            ExtraDatabaseInitializationAction?.Invoke();
            var restartRequired = false;

            // TODO: ODS API 7 specific implementation
            //var defaultOdsInstance = new OdsInstance
            //{
            //    Name = "EdFi ODS"
            //};
            //await _firstTimeSetupService.CompleteSetup(defaultOdsInstance, claimSet);


            if (!_claimSetCheckService.RequiredClaimSetsExist())
            {
                CreateClaimSetForAdminApp(claimSet);

                ApplyAdditionalClaimSetModifications();

                restartRequired = true;
            }
            
            await _usersContext.SaveChangesAsync();
            await _securityContext.SaveChangesAsync();

            return restartRequired;
        }

        private void CreateClaimSetForAdminApp(CloudOdsClaimSet cloudOdsClaimSet)
        {
            _cloudOdsClaimSetConfigurator.ApplyConfiguration(cloudOdsClaimSet);
        }

        private void ApplyAdditionalClaimSetModifications()
        {

            _assessmentVendorAdjustment.ReadAndCreatePerformanceLevelDescriptors();
        }
    }
}
