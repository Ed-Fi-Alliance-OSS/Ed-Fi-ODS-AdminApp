// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Admin.Api.ActionFilters;
using EdFi.Ods.AdminApp.Management.Database.Commands;

namespace EdFi.Ods.Admin.Api.Features.Vendors
{
    public class DeleteVendor : IFeature
    {
        public void MapEndpoints(IEndpointRouteBuilder endpoints)
        {
            endpoints.MapDelete($"/{FeatureConstants.Vendors}"+"/{id}", Handle).RequireAuthorization()
                .WithTags(FeatureConstants.Vendors)
                .WithMetadata(new OperationOrderAttribute(5));
        }

        public Task<IResult> Handle(DeleteVendorCommand deleteVendorCommand, int id)
        {
            deleteVendorCommand.Execute(id);
            return Task.FromResult(AdminApiResponse.Deleted("Vendor"));
        }
    }
}
