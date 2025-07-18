// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.AdminApp.Management.Database.Commands;
using EdFi.Ods.AdminApp.Management.Database.Queries;
using FluentValidation;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels.Global
{
    public class EditVendorModel : IEditVendor
    {
        public int VendorId { get; set; }
        public string Company { get; set; }
        public string NamespacePrefixes { get; set; }
        public string ContactName { get; set; }
        public string ContactEmailAddress { get; set; }
    }

    public class EditVendorModelValidator : AbstractValidator<EditVendorModel>
    {
        public EditVendorModelValidator()
        {
            RuleFor(m => m.Company).NotEmpty();
            RuleFor(m => m.Company)
                .Must(name => !VendorExtensions.IsSystemReservedVendorName(name))
                .WithMessage(p => $"'{p.Company}' is a reserved name and may not be used. Please choose another name.");

            RuleFor(m => m.ContactName).NotEmpty();
            RuleFor(m => m.ContactEmailAddress)
                .NotEmpty()
                .Matches(@"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                .WithMessage("'Contact Email Address' is not a valid email address.");
        }
    }
}
