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
            context.MessageFormatter.AppendArgument("ClaimSetName", claimSetName);
            context.MessageFormatter.AppendArgument("ResourceClaimName", resourceClaim.Name);

            if(!(resourceClaim.Create || resourceClaim.Delete || resourceClaim.Read || resourceClaim.Update))
            {
                context.AddFailure("ResourceClaims", FeatureConstants.ClaimSetResourceClaimWithNoActionMessage);
            }

            if (!dbResourceClaims.Contains(resourceClaim.Name))
            {
                context.AddFailure("ResourceClaims", FeatureConstants.ClaimsetResourceNotFoundMessage);
            }
            if (resourceClaim.DefaultAuthStrategiesForCRUD != null && resourceClaim.DefaultAuthStrategiesForCRUD.Any())
            {
                foreach (var defaultAS in resourceClaim.DefaultAuthStrategiesForCRUD.Where(x => x != null))
                {
                    if (!dbAuthStrategies.Contains(defaultAS.AuthStrategyId))
                    {
                        context.MessageFormatter.AppendArgument("AuthStrategyId", defaultAS.AuthStrategyId);
                        context.AddFailure("ResourceClaims", FeatureConstants.ClaimsetAuthStrategyNotFoundMessage);
                    }
                }
            }
            if (resourceClaim.AuthStrategyOverridesForCRUD != null && resourceClaim.AuthStrategyOverridesForCRUD.Any())
            {
                foreach (var authStrategyOverride in resourceClaim.AuthStrategyOverridesForCRUD.Where(x => x != null))
                {
                    if (!dbAuthStrategies.Contains(authStrategyOverride.AuthStrategyId))
                    {
                        context.MessageFormatter.AppendArgument("AuthStrategyId", authStrategyOverride.AuthStrategyId);
                        context.AddFailure("ResourceClaims", FeatureConstants.ClaimsetAuthStrategyNotFoundMessage);
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
