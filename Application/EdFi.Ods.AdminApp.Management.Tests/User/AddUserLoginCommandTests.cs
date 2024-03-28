// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management.User;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.User;
using NUnit.Framework;
using Shouldly;
using static EdFi.Ods.AdminApp.Management.Tests.Testing;
using static EdFi.Ods.AdminApp.Management.Tests.User.UserTestSetup;

namespace EdFi.Ods.AdminApp.Management.Tests.User
{
    [TestFixture]
    public class AddUserLoginCommandTests
    {
        [Test]
        public async Task ShouldAddUserAndLogin()
        {
            ResetUsers();

            var newUserLogin = new AddUserLoginModel
            {
                UserEmail = "test@test.com",
                LoginProvider = "test_oidc",
                ProviderDisplayName = "test_oidc",
                ProviderKey = "test_provider_key"
            };

            await ScopedAsync<AdminAppIdentityDbContext>(async context =>
            {
                var command = new AddUserLoginCommand(context);

                var identityUserId = await command.Execute(newUserLogin);

                var addedUserLogin = context.UserLogins.AsEnumerable().FirstOrDefault(x => x.UserId == identityUserId);
                addedUserLogin.ShouldNotBeNull();
                addedUserLogin.ProviderKey.ShouldBe(newUserLogin.ProviderKey);
                addedUserLogin.LoginProvider.ShouldBe(newUserLogin.LoginProvider);
                addedUserLogin.ProviderDisplayName.ShouldBe(newUserLogin.ProviderDisplayName);
            });
        }

        [Test]
        public async Task ShouldAddNewLoginForExistingUser()
        {
            ResetUsers();

            var existingUser = SetupUsers(1).Single();

            var newUserLogin = new AddUserLoginModel
            {
                UserEmail = existingUser.Email,
                LoginProvider = "test_oidc",
                ProviderKey = "test_provider_key"
            };

            await ScopedAsync<AdminAppIdentityDbContext>(async context =>
            {
                var command = new AddUserLoginCommand(context);

                var identityUserId = await command.Execute(newUserLogin);

                var addedUserLogin = context.UserLogins.AsEnumerable().FirstOrDefault(x => x.UserId == identityUserId);
                addedUserLogin.ShouldNotBeNull();
                addedUserLogin.ProviderKey.ShouldBe(newUserLogin.ProviderKey);
                addedUserLogin.LoginProvider.ShouldBe(newUserLogin.LoginProvider);
                addedUserLogin.ProviderDisplayName.ShouldBe(newUserLogin.ProviderDisplayName);
            });
        }

        [Test]
        public void ShouldNotAddUserLoginIfRequiredFieldsEmpty()
        {
            var newUserLogin = new AddUserLoginModel();

            Scoped<AdminAppIdentityDbContext>(identity =>
            {
                var validator = new AddUserLoginModelValidator(identity);
                var validationResults = validator.Validate(newUserLogin);
                validationResults.IsValid.ShouldBe(false);
                validationResults.Errors.Select(x => x.ErrorMessage).ShouldBe(new List<string>
                {
                    "'User Email' must not be empty.",
                    "'Login Provider' must not be empty.",
                    "'Provider Key' must not be empty."
                });
            });
        }

        [Test]
        public void ShouldNotAddUserLoginIfEmailNotValid()
        {
            var newUserLogin = new AddUserLoginModel
            {
                UserEmail = "not-a-valid-email",
                LoginProvider = "test_oidc",
                ProviderKey = "test_provider_key"
            };

            Scoped<AdminAppIdentityDbContext>(identity =>
            {
                var validator = new AddUserLoginModelValidator(identity);
                var validationResults = validator.Validate(newUserLogin);
                validationResults.IsValid.ShouldBe(false);
                validationResults.Errors.Select(x => x.ErrorMessage).ShouldContain("'User Email' is not a valid email address.");
            });
        }

        [Test]
        public async Task ShouldNotAddUserLoginIfItAlreadyExists()
        {
            ResetUsers();

            var existingUserLogin = new AddUserLoginModel
            {
                UserEmail = "test@test.com",
                LoginProvider = "test_oidc",
                ProviderDisplayName = "test_oidc",
                ProviderKey = "test_provider_key"
            };

            await ScopedAsync<AdminAppIdentityDbContext>(async context =>
            {
                var command = new AddUserLoginCommand(context);

                var identityUserId = await command.Execute(existingUserLogin);
            });

            var newUserLogin = new AddUserLoginModel
            {
                UserEmail = "test123@test.com",
                LoginProvider = "test_oidc",
                ProviderDisplayName = "test_oidc",
                ProviderKey = "test_provider_key"
            };

            Scoped<AdminAppIdentityDbContext>(identity =>
            {
                var validator = new AddUserLoginModelValidator(identity);
                var validationResults = validator.Validate(newUserLogin);
                validationResults.IsValid.ShouldBe(false);
                validationResults.Errors.Select(x => x.ErrorMessage).ShouldContain("A user with the given LoginProvider and ProviderKey already exists in the system.");
            });
        }
    }
}
