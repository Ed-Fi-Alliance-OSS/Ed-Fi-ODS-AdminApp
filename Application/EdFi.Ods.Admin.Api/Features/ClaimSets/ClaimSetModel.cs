// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.AdminApp.Management.ClaimSetEditor;

namespace EdFi.Ods.Admin.Api.Features.ClaimSets
{
    public class ClaimSetModel
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public bool IsEditable { get; set; }
        public int ApplicationsCount { get; set; }
        public ClaimSetContent? ClaimSetContent { get; set; }
    }

    public interface IClaimSetContent
    {
        string? Name { get; set; }
        List<ResourceClaimModel>? ResourceClaims { set; get; }
    }

    public class ClaimSetContent
    {
        public string? Name { get; set; }
        public List<ResourceClaimModel>? ResourceClaims { get; set; }
    }

    public class ResourceClaimModel
    {
        public string? Name { get; set; }
        public bool Read { get; set; }
        public bool Create { get; set; }
        public bool Update { get; set; }
        public bool Delete { get; set; }
        public AuthorizationStrategy[]? DefaultAuthStrategiesForCRUD { get; set; }
        public AuthorizationStrategy[]? AuthStrategyOverridesForCRUD { get; set; }
        public List<ResourceClaimModel>? Children { get; set; }
    }
}
