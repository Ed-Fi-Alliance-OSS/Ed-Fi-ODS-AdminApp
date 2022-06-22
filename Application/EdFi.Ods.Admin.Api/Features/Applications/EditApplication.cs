// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using EdFi.Ods.Admin.Api.ActionFilters;
using EdFi.Ods.Admin.Api.Infrastructure;
using EdFi.Ods.AdminApp.Management.Database.Commands;
using FluentValidation;
using Swashbuckle.AspNetCore.Annotations;

namespace EdFi.Ods.Admin.Api.Features.Applications
{
    public class EditApplication : IFeature
    {
        public void MapEndpoints(IEndpointRouteBuilder endpoints)
        {
            endpoints.MapPutWithDefaultOptions($"/{FeatureConstants.Applications}" + "/{id}", Handle, FeatureConstants.Applications);
            endpoints.MapPutWithDefaultOptions($"/{FeatureConstants.Applications}" + "/{id}/reset-credential", HandleResetCredentials, FeatureConstants.Applications);
        }

        public async Task<IResult> Handle(IEditApplicationCommand editApplicationCommand, IMapper mapper,
                           Validator validator, Request request, int id)
        {
            request.ApplicationId = id;
            await validator.GuardAsync(request);
            var updatedApplication = editApplicationCommand.Execute(request);
            var model = mapper.Map<ApplicationModel>(updatedApplication);
            return AdminApiResponse<ApplicationModel>.Updated(model, "Application");
        }

        public async Task<IResult> HandleResetCredentials(RegenerateApiClientSecretCommand resetSecretCommand, IMapper mapper, int id)
        {
            var resetApplicationSecret = await Task.Run(() => resetSecretCommand.Execute(id));
            var model = mapper.Map<ApplicationResult>(resetApplicationSecret);
            return AdminApiResponse<ApplicationResult>.Updated(model, "Application secret");
        }

        [DisplaySchemaName(FeatureConstants.EditApplicationDisplayName)]
        public class Request : IEditApplicationModel
        {
            [SwaggerSchema(Description = FeatureConstants.ApplicationIdDescription, Nullable = false)]
            public int ApplicationId { get; set; }

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
                RuleFor(m => m.ApplicationId).NotEmpty();
                RuleFor(m => m.ApplicationName).NotEmpty();
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
