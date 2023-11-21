// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.AdminApp.Management;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using FluentValidation;
using System.Linq;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels.ClaimSets
{
    public class OverrideDefaultAuthorizationStrategyModel : IOverrideDefaultAuthorizationStrategyModel
    {
        public int ClaimSetId { get; set; }
        public int ResourceClaimId { get; set; }
        public int[] AuthorizationStrategyForCreate { get; set; }
        public int[] AuthorizationStrategyForRead { get; set; }
        public int[] AuthorizationStrategyForUpdate { get; set; }
        public int[] AuthorizationStrategyForDelete { get; set; }
        public int[] AuthorizationStrategyForReadChanges { get; set; }
    }

    public class OverrideDefaultAuthorizationStrategyModelValidator : AbstractValidator<OverrideDefaultAuthorizationStrategyModel>
    {
        private readonly IGetResourcesByClaimSetIdQuery _getResourcesByClaimSetIdQuery;
        private readonly IOdsSecurityModelVersionResolver _resolver;


        public OverrideDefaultAuthorizationStrategyModelValidator(IGetResourcesByClaimSetIdQuery getResourcesByClaimSetIdQuery,
            IOdsSecurityModelVersionResolver resolver)
        {
            _getResourcesByClaimSetIdQuery = getResourcesByClaimSetIdQuery;
            _resolver = resolver;
            var securityModel = _resolver.DetermineSecurityModel();


            RuleFor(m => m).Must(m => ExistInTheSystem(m.ClaimSetId, m.ResourceClaimId)).WithMessage("No actions for this claimset and resource exist in the system");
            RuleFor(m => m.AuthorizationStrategyForCreate).Must(m => HasValidValuesForAction(m)).WithMessage("No authorization strategies selected for Create");
            RuleFor(m => m.AuthorizationStrategyForRead).Must(m => HasValidValuesForAction(m)).WithMessage("No authorization strategies selected for Read");
            RuleFor(m => m.AuthorizationStrategyForUpdate).Must(m => HasValidValuesForAction(m)).WithMessage("No authorization strategies selected for Update");
            RuleFor(m => m.AuthorizationStrategyForDelete).Must(m => HasValidValuesForAction(m)).WithMessage("No authorization strategies selected for Delete");
            RuleFor(m => m.AuthorizationStrategyForReadChanges).Must(m => HasValidValuesForAction(m)).When(p=> securityModel == EdFiOdsSecurityModelCompatibility.Six).WithMessage("No authorization strategies selected for Read Changes");
        }

        private bool ExistInTheSystem(int claimSetId, int resourceClaimId)
        {
            return _getResourcesByClaimSetIdQuery.SingleResource(claimSetId, resourceClaimId) != null;
        }

        private bool HasValidValuesForAction(int[] authorizationStrategiesIds)
        {
            bool hasValidValues = false;
            hasValidValues = !authorizationStrategiesIds.Any(p => p == -1);
            return hasValidValues;
        }
    }
}
