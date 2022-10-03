// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.User;
using FluentValidation;
using System.Linq;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels.User
{
    public class GetUserLoginModel: IGetUserLoginModel
    {
        public string LoginProvider { get; set; }
        public string ProviderKey { get; set; }
    }

    public class GetUserLoginModelValidator : AbstractValidator<GetUserLoginModel>
    {
        private readonly AdminAppIdentityDbContext _identity;

        public GetUserLoginModelValidator(AdminAppIdentityDbContext identity)
        {
            _identity = identity;
            RuleFor(x => x.LoginProvider).NotEmpty();
            RuleFor(x => x.ProviderKey).NotEmpty();
            RuleFor(m => m)
                .Must(m => ExistInTheSystem(m.LoginProvider, m.ProviderKey))
                .When(x => x.LoginProvider != null && x.ProviderKey != null)
                .WithMessage("A user with the given LoginProvider and ProviderKey does not exist in the system.");
        }

        private bool ExistInTheSystem(string loginProvider, string providerKey)
        {
            return _identity.UserLogins.Any(x =>
                x.LoginProvider == loginProvider && x.ProviderKey == providerKey);
        }
    }
}
