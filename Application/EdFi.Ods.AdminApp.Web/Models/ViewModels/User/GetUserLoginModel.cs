// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.AdminApp.Management.User;
using FluentValidation;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels.User
{
    public class GetUserLoginModel: IGetUserLoginModel
    {
        public string LoginProvider { get; set; }
        public string ProviderKey { get; set; }
    }

    public class GetUserLoginModelValidator : AbstractValidator<GetUserLoginModel>
    {
        public GetUserLoginModelValidator()
        {
            RuleFor(x => x.LoginProvider).NotEmpty();
            RuleFor(x => x.ProviderKey).NotEmpty();
        }
    }
}
