// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using EdFi.Ods.Admin.Api.Infrastructure;
using EdFi.Ods.AdminApp.Management;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using EdFi.Ods.AdminApp.Management.Database.Queries;
using static EdFi.Ods.AdminApp.Management.ClaimSetEditor.GetClaimSetsByApplicationNameQuery;

namespace EdFi.Ods.Admin.Api.Features.ClaimSets;

public class ReadClaimSets : IFeature
{
    public void MapEndpoints(IEndpointRouteBuilder endpoints)
    {
        AdminApiEndpointBuilder.MapGet(endpoints, "/claimsets", GetClaimSets)
            .WithDefaultDescription()
            .WithRouteOptions(b => b.WithResponse<List<ClaimSetModel>>(200))
            .BuildForVersions(AdminApiVersions.V1);

        AdminApiEndpointBuilder.MapGet(endpoints, "/claimsets/{id}", GetClaimset)
            .WithDefaultDescription()
            .WithRouteOptions(b => b.WithResponse<ClaimSetDetailsModel>(200))
            .BuildForVersions(AdminApiVersions.V1);
    }

    internal Task<IResult> GetClaimSets(GetAllClaimSetsQuery getClaimSetsQuery, IGetApplicationsByClaimSetIdQuery getApplications, IMapper mapper)
    {
        var calimSets = getClaimSetsQuery.Execute().Where(x => !CloudOdsAdminApp.SystemReservedClaimSets.Contains(x.ClaimSetName)).ToList();
        var model = mapper.Map<List<ClaimSetModel>>(calimSets);
        foreach(var claimset in model)
        {
            claimset.ApplicationsCount = getApplications.ExecuteCount(claimset.Id);
            claimset.IsSystemReserved = DefaultClaimSets.Contains(claimset.Name);
        }
        return Task.FromResult(AdminApiResponse<List<ClaimSetModel>>.Ok(model));
    }

    internal Task<IResult> GetClaimset(IGetClaimSetByIdQuery getClaimSetByIdQuery,
        IGetResourcesByClaimSetIdQuery getResourcesByClaimSetIdQuery,
        IGetApplicationsByClaimSetIdQuery getApplications, IMapper mapper, int id)
    {
        var calimSet = getClaimSetByIdQuery.Execute(id);

        var allResources = getResourcesByClaimSetIdQuery.AllResources(id);
        var claimSetData = mapper.Map<ClaimSetDetailsModel>(calimSet);
        claimSetData.ApplicationsCount = getApplications.ExecuteCount(id);
        claimSetData.ResourceClaims = mapper.Map<List<ResourceClaimModel>>(allResources.ToList());

        return Task.FromResult(AdminApiResponse<ClaimSetDetailsModel>.Ok(claimSetData));
    }
}
