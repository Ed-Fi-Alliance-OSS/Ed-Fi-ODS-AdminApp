// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;

namespace EdFi.Ods.AdminApp.Management.User
{
    public class AddUserLoginCommand
    {
        private readonly AdminAppIdentityDbContext _identity;

        public AddUserLoginCommand(AdminAppIdentityDbContext identity)
        {
            _identity = identity;
        }

        public async Task<string> Execute(IAddUserLoginModel userLoginModel)
        {
            var userLogin = _identity.UserLogins.SingleOrDefault(
                x => x.LoginProvider == userLoginModel.LoginProvider &&
                     x.ProviderKey == userLoginModel.ProviderKey);

            if (userLogin == null)
            {
                var user = new AdminAppUser { UserName = userLoginModel.UserEmail, Email = userLoginModel.UserEmail, RequirePasswordChange = false };
                await _identity.Users.AddAsync(user);

                var newUserLogin = new IdentityUserLogin
                {
                    LoginProvider = userLoginModel.LoginProvider,
                    ProviderDisplayName = userLoginModel.ProviderDisplayName,
                    ProviderKey = userLoginModel.ProviderKey,
                    UserId = user.Id
                };
                await _identity.UserLogins.AddAsync(newUserLogin);

                await _identity.SaveChangesAsync();

                return user.Id;
            }

            return userLogin.UserId;
        }
    }

    public interface IAddUserLoginModel
    {
        public string LoginProvider { get; }
        public string ProviderKey { get; }
        public string ProviderDisplayName { get; }
        public string UserEmail { get; }
    }
}
