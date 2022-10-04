// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using VendorApplication = EdFi.Ods.AdminApp.Management.ClaimSetEditor.Application;
using EdFi.Security.DataAccess.Contexts;
using FluentValidation;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels.ClaimSets
{
    public class EditClaimSetModel: IEditClaimSetModel
    {
        public string ClaimSetName { get; set; }
        public int ClaimSetId { get; set; }
        public IEnumerable<VendorApplication> Applications { get; set; }
        public IEnumerable<ResourceClaim> ResourceClaims { get; set; }
        public List<SelectListItem> AllResourceClaims { get; set; }
    }

    public class EditClaimSetModelValidator : AbstractValidator<EditClaimSetModel>
    {
        private readonly ISecurityContext _securityContext;

        public EditClaimSetModelValidator(ISecurityContext securityContext)
        {
            _securityContext = securityContext;

            RuleFor(m => m.ClaimSetName)
                .NotEmpty()
                .Must(BeAUniqueName)
                .WithMessage("A claim set with this name already exists in the database. Please enter a unique name.")
                .When(m => BeAnExistingClaimSet(m.ClaimSetId) && NameIsChanged(m));

            RuleFor(m => m.ClaimSetName)
                .MaximumLength(255)
                .WithMessage("The claim set name must be less than 255 characters.");

            RuleFor(m => m.ClaimSetId).NotEmpty()
                .Must(BeAnExistingClaimSet)
                .WithMessage("No such claim set exists in the database");

            RuleFor(m => m.ClaimSetId)
                .Must(BeAnEditableClaimSet)
                .WithMessage("Only user created claim sets can be edited")
                .When(m => BeAnExistingClaimSet(m.ClaimSetId));
        }

        private bool NameIsChanged(EditClaimSetModel model)
        {
            return _securityContext.ClaimSets.Single(x => x.ClaimSetId == model.ClaimSetId).ClaimSetName != model.ClaimSetName;
        }

        private bool BeAUniqueName(string newName)
        {
            return !_securityContext.ClaimSets.Any(x => x.ClaimSetName == newName);
        }

        private bool BeAnExistingClaimSet(int id)
        {
            return _securityContext.ClaimSets.SingleOrDefault(x => x.ClaimSetId == id) != null;
        }

        private bool BeAnEditableClaimSet(int id)
        {
            var claimSet = _securityContext.ClaimSets.Single(x => x.ClaimSetId == id);
            return !claimSet.ForApplicationUseOnly && !claimSet.IsEdfiPreset;
        }
    }
}
