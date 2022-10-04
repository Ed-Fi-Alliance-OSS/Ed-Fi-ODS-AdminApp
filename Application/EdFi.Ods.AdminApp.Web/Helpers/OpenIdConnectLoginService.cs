// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;
using EdFi.Ods.AdminApp.Management.ErrorHandling;
using EdFi.Ods.AdminApp.Management.User;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.User;
using log4net;

namespace EdFi.Ods.AdminApp.Web.Helpers
{
    public interface IOpenIdConnectLoginService
    {
        Task<string> AddUserLoginForOpenIdConnect(string oidcUserId, string oidcUserEmail, string loginProvider, string providerDisplayName);

        string GetIdentityUserIdForOpenIdConnectUser(string oidcUserId, string loginProvider);

        Role UpdateUserRolesFromOidcClaim(string identityUserId, IEnumerable<string> roleValues);
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

            if (userLoginModelValidationResults.IsValid)
            {
                return await _addUserLoginCommand.Execute(addUserLoginModel);
            }

            foreach (var error in userLoginModelValidationResults.Errors)
            {
                _logger.Warn(error.ErrorMessage);
            }

            _logger.Error(
                "To use Admin App, users must have an ID and Email Address set in their login provider system." +
                " Contact your administrator to resolve this issue.");

            return null;
        }

        public string GetIdentityUserIdForOpenIdConnectUser(string oidcUserId, string loginProvider)
        {
            var getUserLoginModel = new GetUserLoginModel
            {
                LoginProvider = loginProvider,
                ProviderKey = oidcUserId
            };

            var userLoginModelValidator = new GetUserLoginModelValidator();
            var userLoginModelValidationResults = userLoginModelValidator.Validate(getUserLoginModel);

            string identityUserId = null;
            if (userLoginModelValidationResults.IsValid)
            {
                var identityUserLogin = _getUserLoginQuery.Execute(getUserLoginModel);
                identityUserId = identityUserLogin?.UserId;
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

        public Role UpdateUserRolesFromOidcClaim(string identityUserId, IEnumerable<string> roleValues)
        {
            if (identityUserId == null)
                throw new ArgumentNullException(nameof(identityUserId));

            var role = Role.FromOidcClaims(roleValues);

            if (role != null)
            {
                _editUserRoleCommand.Execute(
                    new EditUserRoleModel
                    {
                        UserId = identityUserId,
                        RoleId = role.Value.ToString()
                    });

                return role;
            }

            var logMessage = !roleValues.Any()
                ? $"User {identityUserId} has no role claims set"
                : $"User {identityUserId} is missing an Admin App role claim. Found roles: {string.Join(", ", roleValues)}";
            _logger.Error(logMessage);

            return null;
        }
    }
}
