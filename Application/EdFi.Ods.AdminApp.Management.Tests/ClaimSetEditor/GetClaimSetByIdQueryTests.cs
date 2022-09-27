// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using NUnit.Framework;
using Shouldly;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using ClaimSet = EdFi.Security.DataAccess.Models.ClaimSet;
using Application = EdFi.Security.DataAccess.Models.Application;
using static EdFi.Ods.AdminApp.Management.Tests.Testing;

namespace EdFi.Ods.AdminApp.Management.Tests.ClaimSetEditor
{
    [TestFixture]
    public class GetClaimSetByIdQueryTests : SecurityDataTestBase
    {
        [Test]
        public void ShouldGetClaimSetById()
        {
            var testApplication = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(testApplication);

            var testClaimSet = new ClaimSet
            {
                ClaimSetName = "TestClaimSet",
                Application = testApplication,
                ForApplicationUseOnly = false,
                IsEdfiPreset = false
            };
            Save(testClaimSet);

            Scoped<IGetClaimSetByIdQuery>(query =>
            {
                var result = query.Execute(testClaimSet.ClaimSetId);

                result.Name.ShouldBe(testClaimSet.ClaimSetName);
                result.Id.ShouldBe(testClaimSet.ClaimSetId);
                result.IsEditable.ShouldBe(true);
            });
        }

        [Test]
        public void ShouldGetNonEditableClaimSetById()
        {
            var testApplication = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(testApplication);

            var systemReservedClaimSet = new ClaimSet
            {
                ClaimSetName = "SystemReservedClaimSet",
                Application = testApplication,
                ForApplicationUseOnly = true
            };
            Save(systemReservedClaimSet);

            var edfiPresetClaimSet = new ClaimSet
            {
                ClaimSetName = "EdfiPresetClaimSet",
                Application = testApplication,
                ForApplicationUseOnly = false,
                IsEdfiPreset = true
            };
            Save(edfiPresetClaimSet);

            Scoped<IGetClaimSetByIdQuery>(query =>
            {
                var result = query.Execute(systemReservedClaimSet.ClaimSetId);

                result.Name.ShouldBe(systemReservedClaimSet.ClaimSetName);
                result.Id.ShouldBe(systemReservedClaimSet.ClaimSetId);
                result.IsEditable.ShouldBe(false);

                result = query.Execute(edfiPresetClaimSet.ClaimSetId);

                result.Name.ShouldBe(edfiPresetClaimSet.ClaimSetName);
                result.Id.ShouldBe(edfiPresetClaimSet.ClaimSetId);
                result.IsEditable.ShouldBe(false);
            });
        }
    }
}
