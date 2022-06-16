// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using EdFi.Ods.Admin.Api.Infrastructure;
using FluentValidation;
using Swashbuckle.AspNetCore.Annotations;
using EdFi.Ods.Admin.Api.ActionFilters;
using EdFi.Ods.AdminApp.Management.Instances;
using EdFi.Ods.AdminApp.Management.Database;
using Microsoft.Extensions.Options;
using EdFi.Ods.AdminApp.Management.Helpers;
using EdFi.Ods.AdminApp.Management.OdsInstanceServices;

namespace EdFi.Ods.Admin.Api.Features.Instances
{
    public class AddInstance : IFeature
    {
        public void MapEndpoints(IEndpointRouteBuilder endpoints)
        {
            endpoints.MapPostWithDefaultOptions($"/admin/{FeatureConstants.Instances}", Handle, FeatureConstants.Instances);
        }

        public async Task<IResult> Handle(Validator validator, RegisterOdsInstanceCommand registerInstanceCommand, IMapper mapper,
            IOptions<AppSettings> appSettings, Request request)
        {
            await validator.GuardAsync(request);
            ApiMode.TryParse(appSettings.Value.AppStartup, out var _mode);
            var addedInstance = await registerInstanceCommand.Execute(request, _mode, null, AdminApiClaimSetConfiguration.Default);
            var model = mapper.Map<OdsInstanceModel>(addedInstance);
            return AdminApiResponse<OdsInstanceModel>.Created(model, "Instance", $"/admin/{FeatureConstants.Instances}/{model.Id}");
        }

        //[DisplaySchemaName(FeatureConstants)]
        public class Request : IRegisterOdsInstanceModel
        {
            [SwaggerRequired]
            [SwaggerSchema(Description = FeatureConstants.InstanceNumericSuffix, Nullable = false)]
            public int? NumericSuffix { get; set; }

            [SwaggerRequired]
            [SwaggerSchema(Description = FeatureConstants.Description, Nullable = false)]
            public string? Description { get; set; }
        }

        public class Validator : AbstractValidator<Request>
        {
            private static AdminAppDbContext _database;
            private readonly IOptions<AppSettings> _appSettings;
            private static IDatabaseValidationService _databaseValidationService;
            private static ApiMode _mode;

            public Validator(AdminAppDbContext database
                , IOptions<AppSettings> appSettings
                , IDatabaseValidationService databaseValidationService
                , bool validationMessageWithDetails = false)
            {
                _database = database;
                _appSettings = appSettings;
                _databaseValidationService = databaseValidationService;
                var requiredNumericSuffixMessage = "'ODS Instance District / EdOrg Id' must not be empty.";
                var inRangeMessage = "'ODS Instance District / EdOrg Id' must be a valid positive integer.";
                var maxValue = int.MaxValue;
                var minValue = 1;
                var beUniqueValidationMsg = "Education Organization / District Id";
                ApiMode.TryParse(_appSettings.Value.AppStartup, out _mode);

                if (_mode != null && _mode == ApiMode.YearSpecific)
                {
                    requiredNumericSuffixMessage = "'ODS Instance School Year' must not be empty.";
                    maxValue = 2099;
                    inRangeMessage = "'ODS Instance School Year' must be between 1900 and 2099.";
                    beUniqueValidationMsg = "school year";
                    minValue = 1900;
                }

                RuleFor(m => m.NumericSuffix).NotEmpty().WithMessage(requiredNumericSuffixMessage);

                RuleFor(m => m.NumericSuffix)
                    .Must(x => x <= maxValue && x >= minValue)
                    .When(x => x.NumericSuffix != null)
                    .WithMessage(inRangeMessage);

                RuleFor(m => m.NumericSuffix)
                    .Must(BeAUniqueInstanceName)
                    .When(x => x.NumericSuffix != null)
                    .WithMessage(
                        x => $"An instance for this {beUniqueValidationMsg}{(validationMessageWithDetails ? $" ({x.NumericSuffix})" : "")} already exists.");

                RuleFor(m => m.NumericSuffix)
                    .Must(BeValidOdsInstanceDatabase)
                    .When(x => x.NumericSuffix != null)
                    .WithMessage(
                        x => $"Could not connect to an ODS instance database for this {beUniqueValidationMsg}{(validationMessageWithDetails ? $" ({x.NumericSuffix})" : "")}.");

                RuleFor(m => m.Description).NotEmpty();

                RuleFor(m => m.Description)
                    .Must(BeAUniqueInstanceDescription)
                    .When(x => x.Description != null)
                    .WithMessage(
                        x => $"An instance with this description{(validationMessageWithDetails ? $" ({beUniqueValidationMsg}: {x.NumericSuffix}, Description: {x.Description})" : "")} already exists.");
            }

            private static bool BeValidOdsInstanceDatabase(int? newInstanceNumericSuffix)
            {
                return _databaseValidationService.IsValidDatabase(newInstanceNumericSuffix.Value, _mode);
            }

            private static bool BeAUniqueInstanceName(int? newInstanceNumericSuffix)
            {
                var newInstanceName = newInstanceNumericSuffix.ToString();
                return newInstanceName != "" && !_database.OdsInstanceRegistrations.Any(x => x.Name == newInstanceName);
            }

            private static bool BeAUniqueInstanceDescription(string newInstanceDescription)
            {
                var trim = newInstanceDescription.Trim();

                return !_database.OdsInstanceRegistrations.Any(x => x.Description == trim);
            }
        }
    }
}
