// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.User;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.User;
using NUnit.Framework;
using Shouldly;
using static EdFi.Ods.AdminApp.Management.Tests.Testing;
using static EdFi.Ods.AdminApp.Management.Tests.User.UserTestSetup;

namespace EdFi.Ods.AdminApp.Management.Tests.User
{
    [TestFixture]
    public class GetUserLoginQueryTests
    {
        private const string OidcUserId = "testUserId";
        private const string OidcUserEmail = "test@test.com";
        private const string LoginProvider = "oidc";
        private const string ProviderDisplayName = "oidc";

        [Test]
        public void ShouldGetRoleForUserById()
        {
            var userId = EnsureOneUserAndUserLogin(LoginProvider, ProviderDisplayName, OidcUserId, OidcUserEmail);

            Scoped<AdminAppIdentityDbContext>(identity =>
            {
                var query = new GetUserLoginQuery(identity);
                var queryModel = new GetUserLoginModel
                {
                    LoginProvider = LoginProvider,
                    ProviderKey = OidcUserId
                };

                var result = query.Execute(queryModel);
                result.ShouldNotBeNull();
                result.LoginProvider.ShouldBe(LoginProvider);
                result.ProviderDisplayName.ShouldBe(ProviderDisplayName);
                result.ProviderKey.ShouldBe(OidcUserId);
                result.UserId.ShouldBe(userId);
            });
        }

        [Test]
        public void ShouldNotGetUserLoginIfRequiredFieldsEmpty()
        {
            var queryModel = new GetUserLoginModel();

            Scoped<AdminAppIdentityDbContext>(identity =>
            {
                var validator = new GetUserLoginModelValidator(identity);
                var validationResults = validator.Validate(queryModel);
                validationResults.IsValid.ShouldBe(false);
                validationResults.Errors.Select(x => x.ErrorMessage).ShouldBe(new List<string>
                {
                    "'Login Provider' must not be empty.",
                    "'Provider Key' must not be empty."
                });
            });
        }
    }
}
