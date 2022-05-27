// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using EdFi.Ods.AdminApp.Management.Database.Commands;
using EdFi.Ods.AdminApp.Management.Database.Queries;

namespace EdFi.Ods.Admin.Api.Features.Vendors;

public class VendorFeatures : IFeature
{
    public void MapEndpoints(IEndpointRouteBuilder endpoints)
    {
        endpoints.MapGet("/vendors", GetVendors).RequireAuthorization();
        endpoints.MapGet("/vendors/{id}", GetVendor).RequireAuthorization();
        endpoints.MapPost("/vendors", AddVendor).RequireAuthorization();
        endpoints.MapPut("/vendors", UpdateVendor).RequireAuthorization();
        endpoints.MapDelete("/vendors/{id}", DeleteVendor).RequireAuthorization();
    }

    public void DefineFeatureSpecificServices(IServiceCollection services)
    {
        services.AddTransient<IGetVendorsQuery, GetVendorsQuery>();
        services.AddTransient<IGetVendorByIdQuery, GetVendorByIdQuery>();
        services.AddTransient(typeof(EditVendorCommand));
        services.AddTransient(typeof(AddVendorCommand));
        services.AddTransient<IDeleteApplicationCommand, DeleteApplicationCommand>();
        services.AddTransient(typeof(DeleteVendorCommand));
    }

    internal Task<IResult> GetVendors(IGetVendorsQuery getVendorsQuery, IMapper mapper)
    {
        var vendorList = mapper.Map<List<VendorModel>>(getVendorsQuery.Execute());
        return Task.FromResult(AdminApiResponse<List<VendorModel>>.Ok(vendorList));
    }

    internal Task<IResult> GetVendor(IGetVendorByIdQuery getVendorByIdQuery, IMapper mapper, int id)
    {
        var vendor = getVendorByIdQuery.Execute(id);
        if (vendor == null)
        {
            throw new NotFoundException<int>("This vendor no longer exists.It may have been recently deleted.", id);
        }
        var model = mapper.Map<VendorModel>(vendor);
        return Task.FromResult(AdminApiResponse<VendorModel>.Ok(model));
    }

    internal async Task<IResult> AddVendor(AddVendorCommand addVendorCommand, IMapper mapper,
        AddVendorModelValidator validator, AddVendorModel vendor)
    {
        await validator.GuardAsync(vendor);
        var addedVendorId = addVendorCommand.Execute(vendor);
        return AdminApiResponse<AddVendorModel>.Created(vendor, "Vendor", $"/Vendors/{addedVendorId}");
    }

    internal async Task<IResult> UpdateVendor(EditVendorCommand editVendorCommand, IGetVendorByIdQuery getVendorByIdQuery, IMapper mapper,
        EditVendorModelValidator validator, EditVendorModel vendorModel)
    {
        var vendor = getVendorByIdQuery.Execute(vendorModel.VendorId);
        if (vendor == null)
        {
            throw new NotFoundException<int>("This vendor no longer exists.It may have been recently deleted.", vendorModel.VendorId);
        }
        await validator.GuardAsync(vendorModel);
        editVendorCommand.Execute(vendorModel);
        var model = mapper.Map<VendorModel>(vendor);
        return AdminApiResponse<VendorModel>.Updated(model, "Vendor");
    }

    internal Task<IResult> DeleteVendor(DeleteVendorCommand deleteVendorCommand,
        IGetVendorByIdQuery getVendorByIdQuery, int id)
    {
        var vendor = getVendorByIdQuery.Execute(id);
        if (vendor.IsSystemReservedVendor())
        {
            throw new Exception("This Vendor is required for proper system function and may not be deleted");
        }
        deleteVendorCommand.Execute(id);
        return  Task.FromResult(AdminApiResponse.Deleted("Vendor"));
    }
}
