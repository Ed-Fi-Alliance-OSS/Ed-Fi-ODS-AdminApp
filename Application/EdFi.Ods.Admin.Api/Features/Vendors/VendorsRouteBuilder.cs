// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.AdminApp.Management.Database;

namespace EdFi.Ods.Admin.Api.Features.Vendors
{
    public class VendorsRouteBuilder : IRouteBuilderBase
    {
        public void AddEndPoints(IEndpointRouteBuilder endpoints)
        {
            endpoints.MapGet("/vendors", GetVendors);
            endpoints.MapPost("/vendors/add", AddVendor);
            endpoints.MapPut("/vendors/update", UpdateVendor);
            endpoints.MapDelete("/vendors/delete/{id}", DeleteVendor);
            endpoints.MapGet("/vendors/{id}", GetVendor);
        }

        internal Task<IResult> GetVendors(AdminAppDbContext dbContext)
        {
            var vendorsList = new[] { "Vendor1", "Vendor2" };
            return Task.FromResult(AdminApiResponse<string[]>.Ok(vendorsList));
        }

        internal Task<IResult> GetVendor(AdminAppDbContext dbContext, int id)
        {
            return Task.FromResult(AdminApiResponse<VendorModel>.Ok(new VendorModel { Id = id, Name = $"Vendor {id}", Description = "A vendor"}));
        }

        internal async Task<IResult> AddVendor(AdminAppDbContext dbContext, VendorModelValidator validator, VendorModel vendor)
        {
            await validator.GuardAsync(vendor);
            return AdminApiResponse<VendorModel>.Created(vendor, "Vendor", "/Vendors/1");
        }

        internal async Task<IResult> UpdateVendor(AdminAppDbContext dbContext, VendorModelValidator validator, VendorModel vendor)
        {
            await validator.GuardAsync(vendor);
            return AdminApiResponse<VendorModel>.Updated(vendor, "Vendor");
        }

        internal Task<IResult> DeleteVendor(AdminAppDbContext dbContext, int id)
        {
            return  Task.FromResult(AdminApiResponse.Deleted("Vendor"));
        }
    }
}
