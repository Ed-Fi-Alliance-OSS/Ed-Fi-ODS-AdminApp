// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.AdminApp.Management.Database.Queries;
using EdFi.Security.DataAccess.Contexts;
using EdFi.Security.DataAccess.Models;
using NUnit.Framework;
using Shouldly;
using static EdFi.Ods.AdminApp.Management.Tests.Testing;

namespace EdFi.Ods.AdminApp.Management.Tests.Database.Queries
{
    [TestFixture]
    public class GetClaimSetNamesQueryTests : SecurityDataTestBase
    {
        public GetClaimSetNamesQueryTests()
        {
            SeedSecurityContextOnFixtureSetup = true;
        }

        [Test]
        public void Should_Retreive_ClaimSetNames()
        {
            var application = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(application);

            var claimSet1 = GetClaimSet(application);
            var claimSet2 = GetClaimSet(application);
            Save(claimSet1, claimSet2);

            var claimSetNames = Scoped<ISecurityContext, string[]>(securityContext =>
            {
                var query = new GetClaimSetNamesQuery(securityContext);
                return query.Execute().ToArray();
            });

            claimSetNames.ShouldContain(claimSet1.ClaimSetName);
            claimSetNames.ShouldContain(claimSet2.ClaimSetName);
        }

        [Test]
        public void Should_Retreive_ClaimSetNames_Excluding_SystemReserved_ClaimSets()
        {
            var application = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(application);

            var systemReservedClaimSet = GetClaimSet(application, systemReserved:true);
            var nonSystemReservedClaimSet = GetClaimSet(application, systemReserved:false);
            Save(systemReservedClaimSet, nonSystemReservedClaimSet);

            var claimSetNames = Scoped<ISecurityContext, string[]>(securityContext =>
            {
                var query = new GetClaimSetNamesQuery(securityContext);
                return query.Execute(excludeSystemReservedClaimSets:true).ToArray();
            });

            claimSetNames.ShouldNotContain(systemReservedClaimSet.ClaimSetName);
            claimSetNames.ShouldContain(nonSystemReservedClaimSet.ClaimSetName);
        }

        [Test]
        public void Should_Retreive_ClaimSetNames_Excluding_Preset_ClaimSets()
        {
            var application = new Application
            {
                ApplicationName = $"Test Application {DateTime.Now:O}"
            };
            Save(application);

            var edfiPresetClaimSet = GetClaimSet(application, edfiPreset:true);
            var nonEdfiPresetClaimSet = GetClaimSet(application, edfiPreset:false);
            Save(edfiPresetClaimSet, nonEdfiPresetClaimSet);

            var claimSetNames = Scoped<ISecurityContext, string[]>(securityContext =>
            {
                var query = new GetClaimSetNamesQuery(securityContext);
                return query.Execute(excludeEdFiPresetClaimSets:true).ToArray();
            });

            claimSetNames.ShouldNotContain(edfiPresetClaimSet.ClaimSetName);
            claimSetNames.ShouldContain(nonEdfiPresetClaimSet.ClaimSetName);
        }

        private static int _claimSetId = 0;
        private ClaimSet GetClaimSet(Application application, bool systemReserved = false, bool edfiPreset = false)
        {
            return new ClaimSet
            {
                Application = application,
                ClaimSetName = $"Test Claim Set {_claimSetId++} - {DateTime.Now:O}",
                ForApplicationUseOnly = systemReserved,
                IsEdfiPreset = edfiPreset
            };
        }
    }
}
