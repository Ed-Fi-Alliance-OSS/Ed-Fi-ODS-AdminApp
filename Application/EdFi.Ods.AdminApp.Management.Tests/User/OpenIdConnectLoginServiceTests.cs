// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

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
            var userId = await AddUserLogin(OidcUserId, OidcUserEmail, LoginProvider, ProviderDisplayName);

            var addedUser = Query(userId);
            addedUser.Email.ShouldBe(OidcUserEmail);
            addedUser.UserName.ShouldBe(OidcUserEmail);
            addedUser.PasswordHash.ShouldBeNull();
            addedUser.RequirePasswordChange.ShouldBe(false);

            Scoped<AdminAppIdentityDbContext>(context =>
            {
                var addedUserLogin = context.UserLogins.SingleOrDefault(x => x.UserId == userId);
                addedUserLogin.ShouldNotBeNull();
                addedUserLogin.ProviderKey.ShouldBe(OidcUserId);
                addedUserLogin.LoginProvider.ShouldBe(LoginProvider);
                addedUserLogin.ProviderDisplayName.ShouldBe(ProviderDisplayName);
            });
        }

        [Test]
        public async Task ShouldAssignSuperAdminRole()
        {
            var userId = await AddUserLogin(OidcUserId, OidcUserEmail, LoginProvider, ProviderDisplayName);

            Scoped<AdminAppIdentityDbContext>(context =>
            {
                var addedUserRole = context.UserRoles.SingleOrDefault(x => x.UserId == userId);
                addedUserRole.ShouldNotBeNull();
                addedUserRole.RoleId.ShouldBe(Role.SuperAdmin.Value.ToString());
            });
        }

        private static async Task<string> AddUserLogin(string oidcUserId, string oidcUserEmail, string loginProvider, string providerDisplayName)
        {
            string identityUserId = null;
            await ScopedAsync<AdminAppIdentityDbContext>(
                async identity =>
                {
                    var addUserLoginCommand = new AddUserLoginCommand(identity);
                    var editUserRoleCommand = new EditUserRoleCommand(identity);

                    var openIdConnectLoginService = new OpenIdConnectLoginService(
                        addUserLoginCommand, editUserRoleCommand, identity);

                    identityUserId = await openIdConnectLoginService.AddUserLoginForOpenIdConnect(
                        oidcUserId, oidcUserEmail, loginProvider, providerDisplayName);

                    openIdConnectLoginService.AddSuperAdminRoleToUser(identityUserId);
                });
            return identityUserId;
        }
    }
}
