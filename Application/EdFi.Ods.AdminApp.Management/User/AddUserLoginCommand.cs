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
            var userId = await GetOrAddUser(userLoginModel);

            var newUserLogin = new IdentityUserLogin
            {
                LoginProvider = userLoginModel.LoginProvider,
                ProviderDisplayName = userLoginModel.ProviderDisplayName,
                ProviderKey = userLoginModel.ProviderKey,
                UserId = userId,
            };
            await _identity.UserLogins.AddAsync(newUserLogin);

            await _identity.SaveChangesAsync();

            return userId;
        }

        private async Task<string> GetOrAddUser(IAddUserLoginModel userLoginModel)
        {
            var user = _identity.Users.AsEnumerable().FirstOrDefault(u => u.UserName == userLoginModel.UserEmail);

            if (user != null) { return user.Id; }

            var newUser = new AdminAppUser { UserName = userLoginModel.UserEmail, Email = userLoginModel.UserEmail, RequirePasswordChange = false };
            await _identity.Users.AddAsync(newUser);
            return newUser.Id;
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
