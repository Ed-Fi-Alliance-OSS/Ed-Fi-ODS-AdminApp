﻿// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using FluentValidation;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using EdFi.Ods.AdminApp.Management.Api.Models;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels.EducationOrganizations
{
    public class EditLocalEducationAgencyModel
    {
        public string Id { get; set; }
        public int LocalEducationAgencyId { get; set; }
        [Display(Name = "State Organization ID")]
        public int? StateOrganizationId { get; set; }
        [Display(Name = "Name of Institution")]
        public string Name { get; set; }
        [Display(Name = "Address")]
        public string StreetNumberName { get; set; }
        [Display(Name = "Suite")]
        public string ApartmentRoomSuiteNumber { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }

        public string LocalEducationAgencyCategoryType { get; set; }
        public List<SelectOptionModel> LocalEducationAgencyCategoryTypeOptions { get; set; }
        public List<SelectOptionModel> StateOptions { get; set; }
    }

    public class EditLocalEducationAgencyModelValidator : AbstractValidator<EditLocalEducationAgencyModel>
    {
        public EditLocalEducationAgencyModelValidator()
        {
            RuleFor(m => m.Name).NotEmpty();
            RuleFor(m => m.Name)
                .MaximumLength(75)
                .WithMessage("The Name of Institution would be too long for Admin App. The maximum length is 75 characters.")
                .When(x => x.Name != null);

            RuleFor(m => m.StreetNumberName).NotEmpty();
            RuleFor(m => m.StreetNumberName)
                .MaximumLength(150)
                .WithMessage("The Address would be too long for Admin App. The maximum length is 150 characters.")
                .When(x => x.StreetNumberName != null);

            RuleFor(m => m.State).NotEmpty();
            RuleFor(m => m.City).NotEmpty();
            RuleFor(m => m.City)
                .MaximumLength(30)
                .WithMessage("The City would be too long for Admin App. The maximum length is 30 characters.")
                .When(x => x.City != null);

            RuleFor(m => m.ZipCode).NotEmpty();
            RuleFor(m => m.ZipCode)
                .MaximumLength(17)
                .WithMessage("The Zip Code would be too long for Admin App. The maximum length is 17 characters.")
                .When(x => x.ZipCode != null);

            RuleFor(m => m.ApartmentRoomSuiteNumber)
                .MaximumLength(50)
                .WithMessage("The Suite would be too long for Admin App. The maximum length is 50 characters.")
                .When(x => x.ApartmentRoomSuiteNumber != null);
        }
    }
}