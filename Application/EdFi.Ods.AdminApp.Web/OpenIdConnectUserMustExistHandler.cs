// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using System.Net;
using System.Security.Claims;
using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.ErrorHandling;
using EdFi.Ods.AdminApp.Management.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Options;

namespace EdFi.Ods.AdminApp.Web
{
    public class OpenIdConnectUserMustExistHandler : AuthorizationHandler<UserMustExistRequirement>
    {
        private readonly AdminAppIdentityDbContext _identity;
        private readonly IdentitySettings _identitySettings;

        public OpenIdConnectUserMustExistHandler(AdminAppIdentityDbContext identity, IOptions<IdentitySettings> identitySettings)
        {
            _identity = identity;
            _identitySettings = identitySettings.Value;
        }

        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, UserMustExistRequirement requirement)
        {
            var userId = context.User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (userId != null)
            {
                var userLogin = _identity.UserLogins.SingleOrDefault(
                    x => x.LoginProvider == _identitySettings.OpenIdSettings.LoginProvider &&
                         x.ProviderKey == userId);

                if (userLogin != null)
                {
                    context.Succeed(requirement);
                }
                else
                {
                    context.Fail();
                    throw new Exception("No associated User Login record found in the database for the user.");
                }
            }

            return Task.CompletedTask;
        }
    }
}
