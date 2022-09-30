// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;
using EdFi.Ods.AdminApp.Management.User;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.User;
using log4net;

namespace EdFi.Ods.AdminApp.Web.Helpers
{
    public interface IOpenIdConnectLoginService
    {
        Task<string> AddUserLoginForOpenIdConnect(string oidcUserId, string oidcUserEmail, string loginProvider, string providerDisplayName);

        string GetIdentityUserIdForOpenIdConnectUser(string oidcUserId, string loginProvider);

        void AddSuperAdminRoleToUser(string identityUserId);
    }

    public class OpenIdConnectLoginService : IOpenIdConnectLoginService
    {
        private readonly AddUserLoginCommand _addUserLoginCommand;
        private readonly EditUserRoleCommand _editUserRoleCommand;
        private readonly GetUserLoginQuery _getUserLoginQuery;
        private readonly AdminAppIdentityDbContext _identity;
        private readonly ILog _logger = LogManager.GetLogger(typeof(OpenIdConnectLoginService));

        public OpenIdConnectLoginService(AddUserLoginCommand addUserLoginCommand, EditUserRoleCommand editUserRoleCommand, GetUserLoginQuery getUserLoginQuery, AdminAppIdentityDbContext identity)
        {
            _addUserLoginCommand = addUserLoginCommand;
            _editUserRoleCommand = editUserRoleCommand;
            _getUserLoginQuery = getUserLoginQuery;
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
            var userLoginModelValidationResults = (await userLoginModelValidator.ValidateAsync(addUserLoginModel));

            string identityUserId = null;
            if (userLoginModelValidationResults.IsValid)
            {
                identityUserId = await _addUserLoginCommand.Execute(addUserLoginModel);
            }
            else
            {
                foreach (var error in userLoginModelValidationResults.Errors)
                {
                    _logger.Warn(error.ErrorMessage);
                }
            }

            return identityUserId;
        }

        public string GetIdentityUserIdForOpenIdConnectUser(string oidcUserId, string loginProvider)
        {
            var getUserLoginModel = new GetUserLoginModel
            {
                LoginProvider = loginProvider,
                ProviderKey = oidcUserId
            };

            var userLoginModelValidator = new GetUserLoginModelValidator(_identity);
            var userLoginModelValidationResults = userLoginModelValidator.Validate(getUserLoginModel);

            string identityUserId = null;
            if (userLoginModelValidationResults.IsValid)
            {
                var identityUserLogin = _getUserLoginQuery.Execute(getUserLoginModel);
                identityUserId = identityUserLogin.UserId;
            }
            else
            {
                foreach (var error in userLoginModelValidationResults.Errors)
                {
                    _logger.Warn(error.ErrorMessage);
                }
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
