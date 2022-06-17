// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using EdFi.Ods.Admin.Api.Infrastructure;
using EdFi.Ods.AdminApp.Management.Database.Commands;
using FluentValidation;
using EdFi.Ods.Admin.Api.ActionFilters;
using Swashbuckle.AspNetCore.Annotations;

namespace EdFi.Ods.Admin.Api.Features.Applications
{
    public class AddApplication : IFeature
    {
        public void MapEndpoints(IEndpointRouteBuilder endpoints)
        {
            endpoints.MapPostWithDefaultOptions($"/{FeatureConstants.Applications}", Handle, FeatureConstants.Applications);
        }

        public async Task<IResult> Handle(Validator validator, IAddApplicationCommand addApplicationCommand, IMapper mapper, Request request)
        {
            await validator.GuardAsync(request);
            var addedApplicationResult = addApplicationCommand.Execute(request);
            var model = mapper.Map<ApplicationResult>(addedApplicationResult);
            return AdminApiResponse<ApplicationResult>.Created(model, "Application", $"/{FeatureConstants.Applications}/{model.ApplicationId}");
        }

        [DisplaySchemaName(FeatureConstants.AddApplicationDisplayName)]
        public class Request : IAddApplicationModel
        {
            [SwaggerRequired]
            [SwaggerSchema(Description = FeatureConstants.ApplicationNameDescription, Nullable = false)]
            public string? ApplicationName { get; set; }

            [SwaggerRequired]
            [SwaggerSchema(Description = FeatureConstants.VedorIdDescription, Nullable = false)]
            public int VendorId { get; set; }

            [SwaggerRequired]
            [SwaggerSchema(Description = FeatureConstants.ClaimSetNameDescription, Nullable = false)]
            public string? ClaimSetName { get; set; }

            [SwaggerSchema(Description = FeatureConstants.ProfileIdDescription)]
            public int? ProfileId { get; set; }

            [SwaggerRequired]
            [SwaggerSchema(Description = FeatureConstants.EducationOrganizationIdsDescription, Nullable = false)]
            public IEnumerable<int>? EducationOrganizationIds { get; set; }
        }

        public class Validator : AbstractValidator<Request>
        {
            public Validator()
            {
                RuleFor(m => m.ApplicationName)
                 .NotEmpty();

                RuleFor(m => m.ClaimSetName)
                    .NotEmpty()
                    .WithMessage("You must provide a Claim Set name");

                RuleFor(m => m.EducationOrganizationIds)
                    .NotEmpty()
                    .WithMessage("You must provide at least one Education Organization id");

                RuleFor(m => m.VendorId).NotEmpty();
            }
        }
    }
}
