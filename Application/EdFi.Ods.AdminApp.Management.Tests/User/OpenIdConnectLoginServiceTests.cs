// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;
using EdFi.Ods.AdminApp.Management.User;
using EdFi.Ods.AdminApp.Web.Helpers;
using NUnit.Framework;
using Shouldly;
using static EdFi.Ods.AdminApp.Management.Tests.Testing;
using static EdFi.Ods.AdminApp.Management.Tests.User.UserTestSetup;

namespace EdFi.Ods.AdminApp.Management.Tests.User
{
    public class OpenIdConnectLoginServiceTests : AdminAppDataTestBase
    {
        private const string OidcUserId = "testUserId";
        private const string OidcUserEmail = "test@test.com";
        private const string LoginProvider = "oidc";
        private const string ProviderDisplayName = "oidc";

        [SetUp]
        public void Init()
        {
            EnsureZeroUsers();
            EnsureZeroUserLogins();
            EnsureDefaultRoles();
        }

        [Test]
        public async Task ShouldAddUserAndUserLoginOnFirstTimeLogin()
        {
            var userId = await AddUserLogin(OidcUserId, OidcUserEmail, LoginProvider, ProviderDisplayName, new []{Role.SuperAdmin.OidcClaimValue});

            var addedUser = Query(userId);
            addedUser.Email.ShouldBe(OidcUserEmail);
            addedUser.UserName.ShouldBe(OidcUserEmail);
            addedUser.PasswordHash.ShouldBeNull();
            addedUser.RequirePasswordChange.ShouldBe(false);

            Scoped<AdminAppIdentityDbContext>(context =>
            {
                var addedUserLogin = context.UserLogins.AsEnumerable().FirstOrDefault(x => x.UserId == userId);
                addedUserLogin.ShouldNotBeNull();
                addedUserLogin.ProviderKey.ShouldBe(OidcUserId);
                addedUserLogin.LoginProvider.ShouldBe(LoginProvider);
                addedUserLogin.ProviderDisplayName.ShouldBe(ProviderDisplayName);

                var role = context.UserRoles.AsEnumerable().FirstOrDefault(x => x.UserId == userId);
                role.ShouldNotBeNull();
                role.RoleId.ShouldBe(Role.SuperAdmin.Value.ToString());
            });
        }

        [Test]
        public void ShouldGetIdentityUserIdForExistingUser()
        {
            EnsureOneUserAndUserLogin(LoginProvider, ProviderDisplayName, OidcUserId, OidcUserEmail);

            Scoped<AdminAppIdentityDbContext>(identity =>
            {
                var addUserLoginCommand = new AddUserLoginCommand(identity);
                var editUserRoleCommand = new EditUserRoleCommand(identity);
                var getUserLoginQuery = new GetUserLoginQuery(identity);

                var openIdConnectLoginService = new OpenIdConnectLoginService(addUserLoginCommand, editUserRoleCommand, getUserLoginQuery, identity);

                var identityUserId = openIdConnectLoginService.GetIdentityUserIdForOpenIdConnectUser(OidcUserId, LoginProvider);

                var user = identity.Users.AsEnumerable().FirstOrDefault(x => x.Id == identityUserId);
                user.ShouldNotBeNull();
                user.Email.ShouldBe(OidcUserEmail);
            });
        }

        [Test]
        public async Task ShouldAssignRoleFromPassedInClaim()
        {
            var userId = await AddUserLogin(OidcUserId, OidcUserEmail, LoginProvider, ProviderDisplayName, new []{Role.Admin.OidcClaimValue});
            Scoped<AdminAppIdentityDbContext>(context =>
            {
                context.UserRoles.AsEnumerable().FirstOrDefault(x => x.UserId == userId)?.RoleId.ShouldBe(Role.Admin.Value.ToString());
            });
        }

        [Test]
        public async Task ShouldPrioritizeHigherRoleWhenBothAreAssigned()
        {
            var userId = await AddUserLogin(OidcUserId, OidcUserEmail, LoginProvider, ProviderDisplayName,
                new []{Role.SuperAdmin.OidcClaimValue, Role.Admin.OidcClaimValue});
            Scoped<AdminAppIdentityDbContext>(context =>
            {
                context.UserRoles.AsEnumerable().FirstOrDefault(x => x.UserId == userId)?.RoleId.ShouldBe(Role.SuperAdmin.Value.ToString());
            });
        }

        [Test]
        public async Task ShouldSetRoleWhichHasAlreadyBeenMapped()
        {
            var userId = await AddUserLogin(OidcUserId, OidcUserEmail, LoginProvider, ProviderDisplayName,
                new []{ Role.SuperAdmin.DisplayName});
            Scoped<AdminAppIdentityDbContext>(context =>
            {
                context.UserRoles.AsEnumerable().FirstOrDefault(x => x.UserId == userId)?.RoleId.ShouldBe(Role.SuperAdmin.Value.ToString());
            });
        }

        [Test]
        public async Task ShouldNotCreateUserRolesWithNoRoleClaims()
        {
            var userId = await AddUserLogin(OidcUserId, OidcUserEmail, LoginProvider, ProviderDisplayName, Array.Empty<string>());
            Scoped<AdminAppIdentityDbContext>(context =>
            {
                context.UserRoles.AsEnumerable().FirstOrDefault(x => x.UserId == userId).ShouldBeNull();
            });
        }

        [Test]
        public async Task ShouldNotCreateUserWithNoValidRoleClaims()
        {
            var userId = await AddUserLogin(OidcUserId, OidcUserEmail, LoginProvider, ProviderDisplayName, new[] {"Not an admin app role"});
            Scoped<AdminAppIdentityDbContext>(context =>
            {
                context.UserRoles.AsEnumerable().FirstOrDefault(x => x.UserId == userId).ShouldBeNull();
            });
        }

        public async Task ShouldNotCreateUserWithNoProviderKey()
        {
            var user = await AddUserLogin(null, OidcUserEmail, LoginProvider, ProviderDisplayName, new[] {Role.Admin.OidcClaimValue});
            user.ShouldBeNull();
        }

        public async Task ShouldNotCreateIfUserHasNoEmail()
        {
            var user = await AddUserLogin(OidcUserId, null, LoginProvider, ProviderDisplayName, new[] {Role.Admin.OidcClaimValue});
            user.ShouldBeNull();
        }

        public async Task ShouldNotCreateIfProviderIsNotSet()
        {
            var user = await AddUserLogin(OidcUserId, OidcUserEmail, null, null, new[] {"Role.Admin.OidcClaimValue"});
            user.ShouldBeNull();
        }

        private static async Task<string> AddUserLogin(string oidcUserId, string oidcUserEmail, string loginProvider, string providerDisplayName, string[] roleValues)
        {
            string identityUserId = null;
            await ScopedAsync<AdminAppIdentityDbContext>(
                async identity =>
                {
                    var addUserLoginCommand = new AddUserLoginCommand(identity);
                    var editUserRoleCommand = new EditUserRoleCommand(identity);
                    var getUserLoginQuery = new GetUserLoginQuery(identity);

                    var openIdConnectLoginService = new OpenIdConnectLoginService(
                        addUserLoginCommand, editUserRoleCommand, getUserLoginQuery, identity);

                    identityUserId = await openIdConnectLoginService.AddUserLoginForOpenIdConnect(
                        oidcUserId, oidcUserEmail, loginProvider, providerDisplayName);

                    openIdConnectLoginService.UpdateUserRolesFromIncomingClaim(identityUserId, roleValues);
                });
            return identityUserId;
        }
    }
}
