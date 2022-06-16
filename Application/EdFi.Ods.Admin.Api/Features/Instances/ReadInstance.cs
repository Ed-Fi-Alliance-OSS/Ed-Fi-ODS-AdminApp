// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using EdFi.Ods.Admin.Api.Infrastructure;
using EdFi.Ods.AdminApp.Management.ErrorHandling;
using EdFi.Ods.AdminApp.Management.Instances;

namespace EdFi.Ods.Admin.Api.Features.Instances;

public class ReadInstance : IFeature
{
    public void MapEndpoints(IEndpointRouteBuilder endpoints)
    {
        endpoints.MapGetWithDefaultOptions($"/admin/{FeatureConstants.Instances}", GetInstances, FeatureConstants.Instances);
        endpoints.MapGetByIdWithDefaultOptions($"/admin/{FeatureConstants.Instances}" + "/{id}", GetInstance, FeatureConstants.Instances);
    }

    internal Task<IResult> GetInstances(IGetOdsInstanceRegistrationsQuery getInstancesQuery, IMapper mapper)
    {
        var instancesList = mapper.Map<List<OdsInstanceModel>>(getInstancesQuery.Execute());
        return Task.FromResult(AdminApiResponse<List<OdsInstanceModel>>.Ok(instancesList));
    }

    internal Task<IResult> GetInstance(IGetOdsInstanceRegistrationsQuery getInstancesQuery, IMapper mapper, int id)
    {
        var instance = getInstancesQuery.Execute(id);
        if (instance == null)
        {
            throw new NotFoundException<int>("instance", id);
        }
        var model = mapper.Map<OdsInstanceModel>(instance);
        return Task.FromResult(AdminApiResponse<OdsInstanceModel>.Ok(model));
    }
}
