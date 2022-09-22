// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using FluentValidation;

namespace EdFi.Ods.Admin.Api.Features.ClaimSets
{
    public class ResourceClaimValidator
    {
        public static void Validate<T>(IQueryable<string> dbResourceClaims,
                IQueryable<int> dbAuthStrategies, ResourceClaimModel resourceClaim, ValidationContext<T> context, string? claimSetName)
        {
            if (!dbResourceClaims.Contains(resourceClaim.Name))
            {
                context.AddFailure("ResourceClaims", $"This Claim Set contains a resource which is not in the system. Claimset Name: {claimSetName} Resource name: '{resourceClaim.Name}'.\n");
            }
            if (resourceClaim.DefaultAuthStrategiesForCRUD != null && resourceClaim.DefaultAuthStrategiesForCRUD.Any())
            {
                foreach (var defaultAS in resourceClaim.DefaultAuthStrategiesForCRUD.Where(x => x != null))
                {
                    if (!dbAuthStrategies.Contains(defaultAS.AuthStrategyId))
                    {
                        context.AddFailure("ResourceClaims", $"This resource claim contains a authorization strategy id which is not in the system. Claimset Name: {claimSetName} Resource name: '{resourceClaim.Name} Authorization strategy id: {defaultAS.AuthStrategyId}'.\n");
                    }
                }
            }
            if (resourceClaim.AuthStrategyOverridesForCRUD != null && resourceClaim.AuthStrategyOverridesForCRUD.Any())
            {
                foreach (var authStrategyOverride in resourceClaim.AuthStrategyOverridesForCRUD.Where(x => x != null))
                {
                    if (!dbAuthStrategies.Contains(authStrategyOverride.AuthStrategyId))
                    {
                        context.AddFailure("ResourceClaims", $"This resource claim contains a authorization strategy id which is not in the system. Claimset Name: {claimSetName} Resource name: '{resourceClaim.Name} Authorization strategy id: {authStrategyOverride.AuthStrategyId}'.\n");
                    }
                }
            }

            if (resourceClaim.Children != null && resourceClaim.Children.Any())
            {
                foreach (var child in resourceClaim.Children)
                {
                    Validate(dbResourceClaims, dbAuthStrategies, child, context, claimSetName);
                }
            }
        }
    }
}
