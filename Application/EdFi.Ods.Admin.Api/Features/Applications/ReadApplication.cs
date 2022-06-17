// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using EdFi.Ods.Admin.Api.Infrastructure;
using EdFi.Ods.AdminApp.Management.Database.Queries;
using EdFi.Ods.AdminApp.Management.ErrorHandling;

namespace EdFi.Ods.Admin.Api.Features.Applications;

public class ReadApplication : IFeature
{
    public void MapEndpoints(IEndpointRouteBuilder endpoints)
    {
        endpoints.MapGetWithDefaultOptions($"/{FeatureConstants.Applications}", GetApplications, FeatureConstants.Applications);
        endpoints.MapGetByIdWithDefaultOptions("/{vendorId}" + $"/{FeatureConstants.Applications}" , GetVendorApplications, FeatureConstants.Applications);
        endpoints.MapGetByIdWithDefaultOptions($"/{FeatureConstants.Applications}" + "/{id}", GetApplication, FeatureConstants.Applications);
        endpoints.MapGetWithDefaultOptions($"/{FeatureConstants.ClaimSets}", GetClaimSets, FeatureConstants.Applications);
    }

    internal Task<IResult> GetApplications(IGetVendorsQuery getVendorsAndApplicationsQuery, IMapper mapper)
    {
        var vendors = getVendorsAndApplicationsQuery.Execute();
        var applications = new List<ApplicationModel>();
        foreach (var vendor in vendors)
        {
            applications.AddRange(mapper.Map<List<ApplicationModel>>(vendor.Applications));
        }
        return Task.FromResult(AdminApiResponse<List<ApplicationModel>>.Ok(applications));
    }

    internal Task<IResult> GetClaimSets(GetClaimSetNamesQuery getClaimSetsQuery)
    {
        var calimSets = getClaimSetsQuery.Execute().ToList();
        return Task.FromResult(AdminApiResponse<List<string>>.Ok(calimSets));
    }

    internal Task<IResult> GetVendorApplications(GetApplicationsByVendorIdQuery getApplicationByVendorIdQuery, IMapper mapper, int vendorId)
    {
        var vendorApplications = mapper.Map<List<ApplicationModel>>(getApplicationByVendorIdQuery.Execute(vendorId));
        return Task.FromResult(AdminApiResponse<List<ApplicationModel>>.Ok(vendorApplications));
    }

    internal Task<IResult> GetApplication(GetApplicationByIdQuery getApplicationByIdQuery, IMapper mapper, int id)
    {
        var application = getApplicationByIdQuery.Execute(id);
        if (application == null)
        {
            throw new NotFoundException<int>("application", id);
        }
        var model = mapper.Map<ApplicationModel>(application);
        return Task.FromResult(AdminApiResponse<ApplicationModel>.Ok(model));
    }
}
