// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Admin.Api.Infrastructure;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;

namespace EdFi.Ods.Admin.Api.Features.ClaimSets
{
    public class DeleteClaimSet : IFeature
    {
        public void MapEndpoints(IEndpointRouteBuilder endpoints)
        {
            AdminApiEndpointBuilder.MapDelete(endpoints, "/claimsets/{id}", Handle)
                .WithDefaultDescription()
                .WithRouteOptions(b => b.WithResponseCode(200, FeatureConstants.DeletedSuccessResponseDescription))
                .BuildForVersions(AdminApiVersions.V1);
        }

        public Task<IResult> Handle(DeleteClaimSetCommand deleteClaimSetCommand, int id)
        {
            deleteClaimSetCommand.Execute(new DeleteClaimSetModel { Id = id});
            return Task.FromResult(AdminApiResponse.Deleted("ClaimSet"));
        }
    }
}
