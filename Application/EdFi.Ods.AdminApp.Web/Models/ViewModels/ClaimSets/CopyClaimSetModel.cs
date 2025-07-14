// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using EdFi.Ods.AdminApp.Management.Database.Queries;
using FluentValidation;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels.ClaimSets
{
    public class CopyClaimSetModel : ICopyClaimSetModel
    {
        private string _name;
        
        public string Name 
        { 
            get => _name; 
            set => _name = value?.Trim(); 
        }
        public int OriginalId { get; set; }
        public string OriginalName { get; set; }
    }

    public class CopyClaimSetModelValidator : AbstractValidator<CopyClaimSetModel>
    {
        private IGetAllClaimSetsQuery _getAllClaimSetsQuery;

        public CopyClaimSetModelValidator(IGetAllClaimSetsQuery getAllClaimSetsQuery)
        {
            _getAllClaimSetsQuery = getAllClaimSetsQuery;

            RuleFor(m => m.Name).NotEmpty().Must(BeAUniqueName).WithMessage("The new claim set must have a unique name");

            RuleFor(m => m.Name)
                .MaximumLength(255)
                .WithMessage("The claim set name must be less than 255 characters.");
        }

        private bool BeAUniqueName(string newName)
        {
            var trimmedName = newName?.Trim();
            return _getAllClaimSetsQuery.Execute().All(x => x.Name?.Trim() != trimmedName);
        }
    }
}
