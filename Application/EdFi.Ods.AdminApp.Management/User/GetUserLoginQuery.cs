// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;

namespace EdFi.Ods.AdminApp.Management.User
{
    public class GetUserLoginQuery
    {
        private readonly AdminAppIdentityDbContext _identity;

        public GetUserLoginQuery(AdminAppIdentityDbContext identity)
        {
            _identity = identity;
        }

        public IdentityUserLogin Execute(IGetUserLoginModel userLoginModel)
        {
            var userLogin = _identity.UserLogins.AsEnumerable().FirstOrDefault(
                x => x.LoginProvider == userLoginModel.LoginProvider &&
                     x.ProviderKey == userLoginModel.ProviderKey);

            if (userLogin != null)
            {
                return new IdentityUserLogin
                {
                    LoginProvider = userLogin.LoginProvider,
                    ProviderKey = userLogin.ProviderKey,
                    UserId = userLogin.UserId,
                    ProviderDisplayName = userLogin.ProviderDisplayName
                };
            }

            return null;
        }
    }

    public interface IGetUserLoginModel
    {
        public string LoginProvider { get; }
        public string ProviderKey { get; }
    }
}
