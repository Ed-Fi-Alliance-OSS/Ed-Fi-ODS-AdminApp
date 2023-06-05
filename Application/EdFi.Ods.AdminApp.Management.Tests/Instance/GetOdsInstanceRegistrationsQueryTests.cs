// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Ods.AdminApp.Management.Instances;
using NUnit.Framework;
using Shouldly;
using static EdFi.Ods.AdminApp.Management.Tests.Instance.InstanceTestSetup;

namespace EdFi.Ods.AdminApp.Management.Tests.Instance
{
    [TestFixture]
    public class GetOdsInstanceRegistrationsQueryTests: PlatformUsersContextTestBase
    {
        [TestCase(1)]
        [TestCase(5)]
        public void ShouldGetAdminAppOdsInstancesSortedByName(int instanceCount)
        {
            ResetOdsInstanceRegistrations();

            var testInstances = SetupOdsInstances(instanceCount).OrderBy(x => x.Name).ToList();

            var results = Transaction(database =>
            {
                var command = new GetOdsInstancesQuery(database);

                return command.Execute().ToList();
            });

            results.Count.ShouldBe(testInstances.Count);
            results.Select(x => x.Name).ShouldBe(testInstances.Select(x => x.Name));
        }

        [TestCase(1)]
        [TestCase(5)]
        public void ShouldGetAdminAppOdsInstanceCount(int instanceCount)
        {
            ResetOdsInstanceRegistrations();

            _ = SetupOdsInstances(instanceCount).OrderBy(x => x.Name).ToList();

            var result = Transaction(database =>
            {
                var command = new GetOdsInstancesQuery(database);

                return command.ExecuteCount();
            });

            result.ShouldBe(instanceCount);
        }

        [Test]
        public void ShouldGetAdminAppOdsInstanceById()
        {
            var testInstance = SetupOdsInstances(1).Single();

            var result = Transaction(database =>
            {
                var command = new GetOdsInstancesQuery(database);

                return command.Execute(testInstance.OdsInstanceId);
            });

            result.OdsInstanceId.ShouldBe(testInstance.OdsInstanceId);
            result.Name.ShouldBe(testInstance.Name);
        }

        [Test]
        public void ShouldGetAdminAppOdsInstanceByName()
        {
            var testInstance = SetupOdsInstances(1).Single();

            var result = Transaction(database =>
            {
                var command = new GetOdsInstancesQuery(database);

                return command.Execute(testInstance.Name);
            });

            result.OdsInstanceId.ShouldBe(testInstance.OdsInstanceId);
            result.Name.ShouldBe(testInstance.Name);
        }
    }
}
