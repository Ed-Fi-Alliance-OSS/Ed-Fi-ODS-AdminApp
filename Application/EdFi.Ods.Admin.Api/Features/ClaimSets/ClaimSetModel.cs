// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Swashbuckle.AspNetCore.Annotations;

namespace EdFi.Ods.Admin.Api.Features.ClaimSets
{
    [SwaggerSchema(Title = "ClaimSet")]
    public class ClaimSetModel
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public bool IsSystemReserved { get; set; }
        public List<ResourceClaimModel>? ResourceClaims { get; set; }
    }

    public interface IAddClaimSetModel
    {
        string? Name { get; set; }
        List<ResourceClaimModel>? ResourceClaims { set; get; }
    }

    [SwaggerSchema(Title = "ResourceClaim")]
    public class ResourceClaimModel
    {
        public string? Name { get; set; }
        public bool Read { get; set; }
        public bool Create { get; set; }
        public bool Update { get; set; }
        public bool Delete { get; set; }
        public AuthorizationStrategyModel[]? DefaultAuthStrategiesForCRUD { get; set; }
        public AuthorizationStrategyModel[]? AuthStrategyOverridesForCRUD { get; set; }
        public List<ResourceClaimModel>? Children { get; set; }

        public ResourceClaimModel()
        {
            Children = new List<ResourceClaimModel>();
        }
    }

    [SwaggerSchema(Title = "AuthorizationStrategy")]
    public class AuthorizationStrategyModel
    {
        public int AuthStrategyId { get; set; }
        public string? AuthStrategyName { get; set; }
        public string? DisplayName { get; set; }
        public bool IsInheritedFromParent { get; set; }
    }
}
