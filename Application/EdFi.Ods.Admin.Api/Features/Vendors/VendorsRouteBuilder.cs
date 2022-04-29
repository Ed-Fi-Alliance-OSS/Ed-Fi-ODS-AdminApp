// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Admin.Api.Features.Vendors;
using EdFi.Ods.AdminApp.Management.Database;

namespace EdFi.Ods.Admin.Api.Features
{
    public class VendorsRouteBuilder : IRouteBuilderBase
    {      
        public void AddEndPoints(IEndpointRouteBuilder endpoints)
        {
            endpoints.MapGet("/Vendors", GetVendors);
            endpoints.MapPost("/Vendors/add", AddVendor);
            endpoints.MapPut("/Vendors/update", UpdateVendor);
            endpoints.MapDelete("/Vendors/delete", DeleteVendor);
        }

        internal Task<string[]> GetVendors(AdminAppDbContext dbContext)
        {
            var vendorsList = new string[] { "Vendor1", "Vendor2" };
            return Task.FromResult(vendorsList);
        }

        internal async Task<IResult> AddVendor(AdminAppDbContext dbContext, VendorModelValidator validator, VendorModel vendor)
        {
            await validator.GuardAsync(vendor);
            return Results.Ok();
        }

        internal async Task<IResult> UpdateVendor(AdminAppDbContext dbContext, VendorModelValidator validator, VendorModel vendor)
        {
            await validator.GuardAsync(vendor);
            return Results.Ok();
        }

        internal Task<IResult> DeleteVendor(AdminAppDbContext dbContext, int Id)
        {
            return Task.FromResult(Results.NoContent());
        }
    }
}
