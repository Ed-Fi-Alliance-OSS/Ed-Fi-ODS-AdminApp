// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using NUnit.Framework;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using Shouldly;
using ClaimSet = EdFi.Security.DataAccess.Models.ClaimSet;
using Application = EdFi.Security.DataAccess.Models.Application;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.ClaimSets;
using EdFi.Security.DataAccess.Contexts;
using static EdFi.Ods.AdminApp.Management.Tests.Testing;
using EdFi.Admin.DataAccess.Contexts;

namespace EdFi.Ods.AdminApp.Management.Tests.ClaimSetEditor
{
    [TestFixture]
    public class EditClaimSetCommandTests : SecurityDataTestBase
    {
        [Test]
        public void ShouldEditClaimSet()
        {
            var testApplication = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(testApplication);

            var alreadyExistingClaimSet = new ClaimSet { ClaimSetName = "TestClaimSet", Application = testApplication };
            Save(alreadyExistingClaimSet);

            var editModel = new EditClaimSetModel {ClaimSetName = "TestClaimSetEdited", ClaimSetId = alreadyExistingClaimSet.ClaimSetId};

            Scoped<ISecurityContext, IUsersContext>((securityContext, usersContext) =>
            {
                var command = new EditClaimSetCommand(securityContext, usersContext);
                command.Execute(editModel);
            });

            var editedClaimSet = Transaction(securityContext => securityContext.ClaimSets.Single(x => x.ClaimSetId == alreadyExistingClaimSet.ClaimSetId));
            editedClaimSet.ClaimSetName.ShouldBe(editModel.ClaimSetName);
        }

        [Test]
        public void ShouldThrowExceptionOnEditSystemReservedClaimSet()
        {
            var testApplication = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(testApplication);

            var systemReservedClaimSet = new ClaimSet { ClaimSetName = "Ed-Fi Sandbox", Application = testApplication };
            Save(systemReservedClaimSet);

            var editModel = new EditClaimSetModel { ClaimSetName = "TestClaimSetEdited", ClaimSetId = systemReservedClaimSet.ClaimSetId };

            Scoped<ISecurityContext, IUsersContext > ((securityContext, usersContext) =>
            {
                try
                {
                    var command = new EditClaimSetCommand(securityContext, usersContext);
                    command.Execute(editModel);
                }
                catch (Exception ex)
                {
                    ex.Message.ShouldBe($"Claim set ({systemReservedClaimSet.ClaimSetName}) is system reserved.May not be modified.");
                }
            });
        }

        [Test]
        public void ShouldUpdateClaimSetNameOnAssociatedApplicationsWhenClaimSetRenamed()
        {
            var testApplication = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(testApplication);

            var claimSetName = "TestClaimSetWithApplication";
            var systemReservedClaimSet = new ClaimSet { ClaimSetName = claimSetName, Application = testApplication };
            Save(systemReservedClaimSet);

            var claimSetNameEdited = "TestClaimSetEdited";
            var editModel = new EditClaimSetModel { ClaimSetName = claimSetNameEdited, ClaimSetId = systemReservedClaimSet.ClaimSetId };

            Scoped<ISecurityContext, IUsersContext>((securityContext, usersContext) =>
            {
                usersContext.Applications.Add(new Admin.DataAccess.Models.Application {
                    ApplicationName = "TestApplication",
                    ClaimSetName = claimSetName,
                    OperationalContextUri = "uri://ed-fi-api-host.org"
                });
                usersContext.SaveChanges();
                var addedApplication = usersContext.Applications.Where(x => x.ClaimSetName == claimSetName).FirstOrDefault();
                addedApplication.ShouldNotBeNull();
                addedApplication.ClaimSetName.ShouldBe(claimSetName);

                var command = new EditClaimSetCommand(securityContext, usersContext);
                command.Execute(editModel);
                var updatedApplication = usersContext.Applications.Where(x => x.ApplicationId == addedApplication.ApplicationId).FirstOrDefault();
                updatedApplication.ShouldNotBeNull();
                updatedApplication.ClaimSetName.ShouldBe(claimSetNameEdited);
            });
        }

        [Test]
        public void ShouldNotEditClaimSetIfNameNotUnique()
        {
            var testApplication = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(testApplication);

            var alreadyExistingClaimSet = new ClaimSet { ClaimSetName = "TestClaimSet1", Application = testApplication };
            Save(alreadyExistingClaimSet);

            var testClaimSet = new ClaimSet { ClaimSetName = "TestClaimSet2", Application = testApplication };
            Save(testClaimSet);

            var editModel = new EditClaimSetModel { ClaimSetName = "TestClaimSet1", ClaimSetId = testClaimSet.ClaimSetId };

            Scoped<ISecurityContext>(securityContext =>
            {
                var validator = new EditClaimSetModelValidator(securityContext);
                var validationResults = validator.Validate(editModel);
                validationResults.IsValid.ShouldBe(false);
                validationResults.Errors.Single().ErrorMessage.ShouldBe("A claim set with this name already exists in the database. Please enter a unique name.");
            });
        }

        [Test]
        public void ShouldNotEditClaimSetIfNameEmpty()
        {
            var testApplication = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(testApplication);

            var testClaimSet = new ClaimSet { ClaimSetName = "TestClaimSet1", Application = testApplication };
            Save(testClaimSet);

            var editModel = new EditClaimSetModel { ClaimSetName = "", ClaimSetId = testClaimSet.ClaimSetId };

            Scoped<ISecurityContext>(securityContext =>
            {
                var validator = new EditClaimSetModelValidator(securityContext);
                var validationResults = validator.Validate(editModel);
                validationResults.IsValid.ShouldBe(false);
                validationResults.Errors.Single().ErrorMessage.ShouldBe("'Claim Set Name' must not be empty.");
            });
        }

        [Test]
        public void ShouldNotEditClaimSetIfNameLengthGreaterThan255Characters()
        {
            var testApplication = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(testApplication);

            var testClaimSet = new ClaimSet { ClaimSetName = "TestClaimSet1", Application = testApplication };
            Save(testClaimSet);

            var editModel = new EditClaimSetModel { ClaimSetName = "ThisIsAClaimSetWithNameLengthGreaterThan255CharactersThisIsAClaimSetWithNameLengthGreaterThan255CharactersThisIsAClaimSetWithNameLengthGreaterThan255CharactersThisIsAClaimSetWithNameLengthGreaterThan255CharactersThisIsAClaimSetWithNameLengthGreaterThan255CharactersThisIsAClaimSetWithNameLengthGreaterThan255Characters", ClaimSetId = testClaimSet.ClaimSetId };

            Scoped<ISecurityContext>(securityContext =>
            {
                var validator = new EditClaimSetModelValidator(securityContext);
                var validationResults = validator.Validate(editModel);
                validationResults.IsValid.ShouldBe(false);
                validationResults.Errors.Single().ErrorMessage.ShouldBe("The claim set name must be less than 255 characters.");
            });
        }

    }
}
