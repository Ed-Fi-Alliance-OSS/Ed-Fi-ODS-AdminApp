// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.User;
using FluentValidation;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels.User
{
    public class AddUserLoginModel: IAddUserLoginModel
    {
        public string LoginProvider { get; set; }
        public string ProviderKey { get; set; }
        public string ProviderDisplayName { get; set; }
        public string UserEmail { get; set; }
    }

    public class AddUserLoginModelValidator : AbstractValidator<AddUserLoginModel>
    {
        private readonly AdminAppIdentityDbContext _identity;

        public AddUserLoginModelValidator(AdminAppIdentityDbContext identity)
        {
            _identity = identity;
            RuleFor(m => m.UserEmail).NotEmpty().EmailAddress().Must(BeAUniqueEmail).WithMessage("A user with this email address already exists in the database."); ;
            RuleFor(x => x.LoginProvider).NotEmpty();
            RuleFor(x => x.ProviderKey).NotEmpty();
            RuleFor(m => m)
                .Must(m => NotExistInTheSystem(m.LoginProvider, m.ProviderKey))
                .When(x => x.LoginProvider != null && x.ProviderKey != null);
        }

        private bool BeAUniqueEmail(string newEmail)
        {
            return _identity.Users.ToList().All(x => x.Email != newEmail);
        }

        private bool NotExistInTheSystem(string loginProvider, string providerKey)
        {
            return !_identity.UserLogins.Any(x =>
                x.LoginProvider == loginProvider && x.ProviderKey == providerKey);
        }
    }
}
