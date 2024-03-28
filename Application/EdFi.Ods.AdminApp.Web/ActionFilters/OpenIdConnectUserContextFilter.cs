// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using EdFi.Ods.AdminApp.Management;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;
using EdFi.Ods.AdminApp.Management.Helpers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Options;

namespace EdFi.Ods.AdminApp.Web.ActionFilters
{
    public class OpenIdConnectUserContextFilter : IAuthorizationFilter
    {
        private readonly AdminAppUserContext _userContext;
        private readonly AdminAppIdentityDbContext _identity;
        private readonly IdentitySettings _identitySettings;

        public OpenIdConnectUserContextFilter(AdminAppUserContext userContext, AdminAppIdentityDbContext identity, IOptions<IdentitySettings> identitySettings)
        {
            _userContext = userContext;
            _identity = identity;
            _identitySettings = identitySettings.Value;
        }

        public void OnAuthorization(AuthorizationFilterContext filterContext)
        {
            var providerId = filterContext.HttpContext.User.FindFirstValue(ClaimTypes.NameIdentifier);
            var userLogin = _identity.UserLogins.AsEnumerable().FirstOrDefault(
                x => x.LoginProvider == _identitySettings.OpenIdSettings.LoginProvider &&
                     x.ProviderKey == providerId);

            if (providerId == null || userLogin == null)
            {
                return;
            }

            var user = _identity.Users.AsEnumerable().FirstOrDefault(x => x.Id == userLogin.UserId);

            if (user == null)
            {
                return;
            }

            _userContext.User = user;
            var userRoles = _identity.UserRoles.Where(x => x.UserId == user.Id).ToArray();
            _userContext.Permissions = PopulatePermissions(userRoles);
        }

        private static Permission[] PopulatePermissions(IEnumerable<IdentityUserRole<string>> userRoles)
        {
            IEnumerable<Permission> permissions = new Permission[] { };
            permissions = userRoles.Aggregate(permissions, (current, userRole) => current.Union(RolePermission.GetPermissions(userRole.RoleId)));
            return permissions.ToArray();
        }
    }
}
