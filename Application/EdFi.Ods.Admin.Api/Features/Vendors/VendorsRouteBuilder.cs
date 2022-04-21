// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Admin.Api.Features.Vendors;
using EdFi.Ods.AdminApp.Management.Database;
using log4net;

namespace EdFi.Ods.Admin.Api.Features
{
    public class VendorsRouteBuilder : IRouteBuilderBase
    {      
        public void AddEndPoints(IEndpointRouteBuilder endpoints)
        {
            endpoints.MapGet("/Vendors", async () =>
            {
                var vendorsList = new string[] { "Vendor1", "Vendor2" };
                return vendorsList;
            }).WithName("GetVendors");

            endpoints.MapPost("/Vendors/add",
            async (AdminAppDbContext dbContext, VendorModelValidator validator, VendorModel vendor) =>
            {
                var context = dbContext.Database;
                var result = validator.Validate(vendor);

                if (result.IsValid)
                {
                    return Results.Ok();
                }
                return Results.ValidationProblem(result.Errors.ToDictionary());

            }).WithName("AddVendor").ProducesValidationProblem(400).Produces(201);
        }
    }
}
