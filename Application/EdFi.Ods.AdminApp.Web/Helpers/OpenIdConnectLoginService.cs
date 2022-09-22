// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;
using EdFi.Ods.AdminApp.Management.User;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.User;

namespace EdFi.Ods.AdminApp.Web.Helpers
{
    public interface IOpenIdConnectLoginService
    {
        Task<string> AddUserLoginForOpenIdConnect(string oidcUserId, string oidcUserEmail, string loginProvider, string providerDisplayName);

        void AddSuperAdminRoleToUser(string identityUserId);
    }

    public class OpenIdConnectLoginService : IOpenIdConnectLoginService
    {
        private readonly AddUserLoginCommand _addUserLoginCommand;
        private readonly EditUserRoleCommand _editUserRoleCommand;
        private readonly AdminAppIdentityDbContext _identity;

        public OpenIdConnectLoginService(AddUserLoginCommand addUserLoginCommand, EditUserRoleCommand editUserRoleCommand, AdminAppIdentityDbContext identity)
        {
            _addUserLoginCommand = addUserLoginCommand;
            _editUserRoleCommand = editUserRoleCommand;
            _identity = identity;
        }

        public async Task<string> AddUserLoginForOpenIdConnect(string oidcUserId, string oidcUserEmail, string loginProvider, string providerDisplayName)
        {
            var addUserLoginModel = new AddUserLoginModel
            {
                UserEmail = oidcUserEmail,
                LoginProvider = loginProvider,
                ProviderDisplayName = providerDisplayName,
                ProviderKey = oidcUserId
            };

            var userLoginModelValidator = new AddUserLoginModelValidator(_identity);
            var userLoginModelIsValid = (await userLoginModelValidator.ValidateAsync(addUserLoginModel)).IsValid;

            string identityUserId = null;
            if (userLoginModelIsValid)
            {
                identityUserId = await _addUserLoginCommand.Execute(addUserLoginModel);
            }
            return identityUserId;
        }

        public void AddSuperAdminRoleToUser(string identityUserId)
        {
            if (identityUserId != null)
            {
                _editUserRoleCommand.Execute(new EditUserRoleModel
                {
                    UserId = identityUserId,
                    RoleId = Role.SuperAdmin.Value.ToString()
                });
            }
        }
    }
}
