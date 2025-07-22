// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using EdFi.Ods.AdminApp.Management.Api.Models;
using FluentValidation;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels.EducationOrganizations
{
    public class AddPsiSchoolModel: AddSchoolModel
    {
        public int? PostSecondaryInstitutionId { get; set; }
        public string AccreditationStatus { get; set; }
        public List<SelectOptionModel> AccreditationStatusOptions { get; set; }
        public string FederalLocaleCode { get; set; }
        public List<SelectOptionModel> FederalLocaleCodeOptions { get; set; }
    }

    public class AddPsiSchoolModelValidator : AddSchoolModelValidatorBase<AddPsiSchoolModel>
    {
        public AddPsiSchoolModelValidator()
        {
            RuleFor(m => m.Name).NotEmpty();
            RuleFor(m => m.Name)
                .MaximumLength(75)
                .WithMessage("The School Name would be too long for Admin App. The maximum length is 75 characters.")
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
        }
    }
}
