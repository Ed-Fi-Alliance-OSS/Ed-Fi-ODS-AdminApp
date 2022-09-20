// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using EdFi.Ods.Admin.Api.Infrastructure;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using EdFi.Ods.AdminApp.Management.Database.Queries;
using EdFi.Ods.AdminApp.Management.ErrorHandling;

namespace EdFi.Ods.Admin.Api.Features.ClaimSets;

public class ReadClaimSets : IFeature
{
    public void MapEndpoints(IEndpointRouteBuilder endpoints)
    {
        AdminApiEndpointBuilder.MapGet(endpoints, "/claimsets", GetClaimSets)
            .WithDefaultDescription()
            .WithRouteOptions(b => b.WithResponse<string[]>(200))
            .BuildForVersions(AdminApiVersions.V1);

        AdminApiEndpointBuilder.MapGet(endpoints, "/claimsets/{id}", GetClaimset)
            .WithDefaultDescription()
            .WithRouteOptions(b => b.WithResponse<ClaimSet>(200))
            .BuildForVersions(AdminApiVersions.V1);
    }

    internal Task<IResult> GetClaimSets(GetClaimSetNamesQuery getClaimSetsQuery)
    {
        var calimSets = getClaimSetsQuery.Execute().ToList();
        return Task.FromResult(AdminApiResponse<List<string>>.Ok(calimSets));
    }

    internal Task<IResult> GetClaimset(IGetClaimSetByIdQuery getClaimSetByIdQuery,
        IGetResourcesByClaimSetIdQuery getResourcesByClaimSetIdQuery, IMapper mapper, int id)
    {
        var calimSet = getClaimSetByIdQuery.Execute(id);
        if (calimSet == null)
        {
            throw new NotFoundException<int>("claimset", id);
        }
        var allResources = getResourcesByClaimSetIdQuery.AllResources(id);
        var claimSetData = mapper.Map<ClaimSetModel>(calimSet);
        claimSetData.ClaimSetContent = new ClaimSetContent
        {
            Name = calimSet.Name,
            ResourceClaims = mapper.Map<List<ResourceClaimModel>>(allResources.ToList()) 
        };
        return Task.FromResult(AdminApiResponse<ClaimSetModel>.Ok(claimSetData));
    }
}
