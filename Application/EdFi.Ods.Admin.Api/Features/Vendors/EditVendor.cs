// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using EdFi.Ods.Admin.Api.ActionFilters;
using EdFi.Ods.Admin.Api.Infrastructure;
using EdFi.Ods.AdminApp.Management.Database.Commands;
using EdFi.Ods.AdminApp.Management.Database.Queries;
using FluentValidation;
using Swashbuckle.AspNetCore.Annotations;

namespace EdFi.Ods.Admin.Api.Features.Vendors
{
    public class EditVendor : IFeature
    {
        public void MapEndpoints(IEndpointRouteBuilder endpoints)
        {
            endpoints.MapPutWithDefaultOptions($"/{FeatureConstants.Vendors}" + "/{id}", Handle, FeatureConstants.Vendors)
                .MapApiVersion(AdminApiVersions.v1);
        }

        public async Task<IResult> Handle(EditVendorCommand editVendorCommand, IMapper mapper,
                           Validator validator, Request request, int id)
        {
            request.VendorId = id;
            await validator.GuardAsync(request);
            var updatedVendor = editVendorCommand.Execute(request);
            var model = mapper.Map<VendorModel>(updatedVendor);
            return AdminApiResponse<VendorModel>.Updated(model, "Vendor");
        }

        [DisplaySchemaName(FeatureConstants.EditVendorDisplayName)]
        public class Request : IEditVendor
        {
            [SwaggerSchema(Description = FeatureConstants.VedorIdDescription, Nullable = false)]
            public int VendorId { get; set; }

            [SwaggerRequired]
            [SwaggerSchema(Description = FeatureConstants.VendorNameDescription, Nullable = false)]
            public string? Company { get; set; }

            [SwaggerRequired]
            [SwaggerSchema(Description = FeatureConstants.VendorNamespaceDescription, Nullable = false)]
            public string? NamespacePrefixes { get; set; }

            [SwaggerRequired]
            [SwaggerSchema(Description = FeatureConstants.VendorContactDescription, Nullable = false)]
            public string? ContactName { get; set; }

            [SwaggerRequired]
            [SwaggerSchema(Description = FeatureConstants.VendorContactEmailDescription, Nullable = false)]
            public string? ContactEmailAddress { get; set; }
        }

        public class Validator : AbstractValidator<Request>
        {
            public Validator()
            {
                RuleFor(m => m.VendorId).Must(id => id > 0).WithMessage("Please provide valid Vendor Id.");
                RuleFor(m => m.Company).NotEmpty();
                RuleFor(m => m.Company)
                    .Must(name => !VendorExtensions.IsSystemReservedVendorName(name))
                    .WithMessage(p => $"'{p.Company}' is a reserved name and may not be used. Please choose another name.");

                RuleFor(m => m.ContactName).NotEmpty();
                RuleFor(m => m.ContactEmailAddress).NotEmpty().EmailAddress();
            }
        }
    }
}
