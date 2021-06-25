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
    public class EditSchoolModel
    {
        public string Id { get; set; }
        public int SchoolId { get; set; }
        public int LocalEducationAgencyId { get; set; }
        [Display(Name = "Name of Institution")]
        public string Name { get; set; }
        [Display(Name = "Address")]
        public string StreetNumberName { get; set; }
        [Display(Name = "Suite")]
        public string ApartmentRoomSuiteNumber { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }

        public List<string> GradeLevels { get; set; }
        public List<SelectOptionModel> GradeLevelOptions { get; set; }
        public List<SelectOptionModel> StateOptions { get; set; }

        public string AccreditationStatus { get; set; }
        public List<SelectOptionModel> AccreditationStatusOptions { get; set; }
        public string FederalLocaleCode { get; set; }
        public List<SelectOptionModel> FederalLocaleCodeOptions { get; set; }
        public bool ImprovingSchool { get; set; }
    }

    public class EditSchoolModelValidator : AbstractValidator<EditSchoolModel>
    {
        public EditSchoolModelValidator()
        {
            RuleFor(x => x.Name).NotEmpty();
            RuleFor(x => x.StreetNumberName).NotEmpty();
            RuleFor(x => x.City).NotEmpty();
            RuleFor(x => x.State).NotEmpty();
            RuleFor(x => x.ZipCode).NotEmpty();
            RuleFor(x => x.GradeLevels).Must(x => x != null && x.Count > 0).WithMessage("You must choose at least one grade level");
        }
    }
}