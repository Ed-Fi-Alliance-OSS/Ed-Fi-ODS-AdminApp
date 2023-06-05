// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;
using EdFi.Ods.AdminApp.Management.User;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.User;
using NUnit.Framework;
using Shouldly;
using static EdFi.Ods.AdminApp.Management.Tests.Testing;
using static EdFi.Ods.AdminApp.Management.Tests.User.UserTestSetup;
using static EdFi.Ods.AdminApp.Management.Tests.Instance.InstanceTestSetup;

namespace EdFi.Ods.AdminApp.Management.Tests.User
{
    [TestFixture]
    public class EditOdsInstanceRegistrationForUserCommandTests: AdminAppDataTestBase
    {
        [Test]
        public void ShouldAddOdsInstanceRegistrationsForUser()
        {
            var existingUser = SetupUsers(1).Single();

            var alreadyAddedInstances = SetupOdsInstances(useGuidName:true).OrderBy(x => x.Name).ToList();

            SetupUserWithOdsInstances(existingUser.Id, alreadyAddedInstances);

            var newInstancesToAdd = SetupOdsInstances(useGuidName: true).OrderBy(x => x.Name).ToList();

            var updateModel = new EditOdsInstanceRegistrationForUserModel
            {
                UserId = existingUser.Id,
                OdsInstanceRegistrations = newInstancesToAdd.Select(x => new OdsInstanceRegistrationSelection
                {
                    Name = x.Name,
                    OdsInstanceRegistrationId = x.OdsInstanceId,
                    Selected = true
                }).ToList()
            };

            Scoped<AdminAppIdentityDbContext>(identity =>
            {
                var command = new EditOdsInstanceRegistrationForUserCommand(identity);

                command.Execute(updateModel);
            });

        }

        [Test]
        public void ShouldRemoveOdsInstanceRegistrationsForUser()
        {
            var existingUser = SetupUsers(1).Single();

            var alreadyAddedInstances = SetupOdsInstances(5).OrderBy(x => x.Name).ToList();

            SetupUserWithOdsInstances(existingUser.Id, alreadyAddedInstances);

            // Select only the first 3 instances

            var instancesToKeep = alreadyAddedInstances.Take(3).ToList();            

            var updateModel = new EditOdsInstanceRegistrationForUserModel
            {
                UserId = existingUser.Id,
                OdsInstanceRegistrations = instancesToKeep.Select(x => new OdsInstanceRegistrationSelection
                {
                    Name = x.Name,
                    OdsInstanceRegistrationId = x.OdsInstanceId,
                    Selected = true
                }).ToList()
            };

            Scoped<AdminAppIdentityDbContext>(identity =>
            {
                var command = new EditOdsInstanceRegistrationForUserCommand(identity);

                command.Execute(updateModel);
            });

        }

        [Test]
        public void ShouldNotEditIfRequiredFieldsEmpty()
        {
            var updateModel = new EditOdsInstanceRegistrationForUserModel();

            Scoped<EditOdsInstanceRegistrationForUserModelValidator>(validator =>
            {
                var validationResults = validator.Validate(updateModel);
                validationResults.IsValid.ShouldBe(false);
                validationResults.Errors.Select(x => x.ErrorMessage).ShouldBe(new List<string>
                {
                    "'User Id' must not be empty."
                    , "The user you are trying to edit does not exist in the database."
                    , "'Email' must not be empty."
                    , "'Selected ODS Instances' must not be empty."
                }, false);
            });
        }

        [Test]
        public void ShouldNotEditIfUserDoesNotExists()
        {
            var testUserNotInSystem = new AdminAppUser
            {
                Email = $"testuser{Guid.NewGuid():N}@test.com",
                UserName = $"testuser{Guid.NewGuid():N}@test.com"
            };

            var testInstances = SetupOdsInstances(5).OrderBy(x => x.Name).ToList();

            var updateModel = new EditOdsInstanceRegistrationForUserModel
            {
                UserId = testUserNotInSystem.Id,
                OdsInstanceRegistrations = testInstances.Select(x => new OdsInstanceRegistrationSelection
                {
                    Name = x.Name,
                    OdsInstanceRegistrationId = x.OdsInstanceId,
                    Selected = true
                }).ToList()
            };

            Scoped<EditOdsInstanceRegistrationForUserModelValidator>(validator =>
            {
                var validationResults = validator.Validate(updateModel);
                validationResults.IsValid.ShouldBe(false);
                validationResults.Errors.Select(x => x.ErrorMessage).ShouldContain("The user you are trying to edit does not exist in the database.");
            });
        }

        [Test]
        public void ShouldNotEditIfInstancesDoesNotExist()
        {
            var existingUser = SetupUsers(1).Single();

            var testInstanceInSystem = SetupOdsInstances(1).Single();

            var testInstanceNotInSystem = new OdsInstanceRegistration
            {
                Name = $"TestInstance{Guid.NewGuid():N}",
                Description = "Test Description"
            };

            var updateModel = new EditOdsInstanceRegistrationForUserModel
            {
                UserId = existingUser.Id,
                OdsInstanceRegistrations = new List<OdsInstanceRegistrationSelection>
                {
                    new OdsInstanceRegistrationSelection
                    {
                        Name = testInstanceInSystem.Name,
                        OdsInstanceRegistrationId = testInstanceInSystem.OdsInstanceId,
                        Selected = true
                    },
                    new OdsInstanceRegistrationSelection
                    {
                        Name = testInstanceNotInSystem.Name,
                        OdsInstanceRegistrationId = testInstanceNotInSystem.Id,
                        Selected = true
                    }
                }
            };

            Scoped<EditOdsInstanceRegistrationForUserModelValidator>(validator =>
            {
                var validationResults = validator.Validate(updateModel);
                validationResults.IsValid.ShouldBe(false);
                validationResults.Errors.Select(x => x.ErrorMessage).ShouldContain("A selected instance does not exist in the database.");
            });
        }
    }
}
