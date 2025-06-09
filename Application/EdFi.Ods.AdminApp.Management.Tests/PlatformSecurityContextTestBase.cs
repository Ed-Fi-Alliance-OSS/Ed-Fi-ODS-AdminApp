// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Threading.Tasks;
using System.Xml.Linq;
using EdFi.Security.DataAccess.Contexts;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using Polly;
using Respawn;
using Respawn.Graph;

namespace EdFi.Ods.AdminApp.Management.Tests
{
    [TestFixture]
    public abstract class PlatformSecurityContextTestBase
    {
        protected SqlServerSecurityContext TestContext { get; private set; }

        protected enum CheckpointPolicyOptions
        {
            BeforeEachTest,
            BeforeAnyTest
        }

        protected CheckpointPolicyOptions CheckpointPolicy { get; set; } = CheckpointPolicyOptions.BeforeEachTest;        private Respawner _respawner;

        protected virtual string ConnectionString => TestContext.Database.GetConnectionString();

        protected virtual void AdditionalFixtureSetup()
        {
        }

        protected abstract SqlServerSecurityContext CreateDbContext();

        [OneTimeSetUp]
        public virtual async Task FixtureSetup()
        {
            _respawner = await Respawner.CreateAsync(ConnectionString, new RespawnerOptions
            {
                TablesToIgnore = new[]
                {
                    new Table("__MigrationHistory"),
                    new Table("DeployJournal"),
                    new Table("AdminAppDeployJournal")
                }
                // Note: SchemasToExclude temporarily removed due to Respawn 6.x API changes
                // Original schemas: "HangFire", "adminapp_HangFire"
            });

            TestContext = CreateDbContext();
            if (CheckpointPolicy == CheckpointPolicyOptions.BeforeAnyTest)
            {
                await _respawner.ResetAsync(ConnectionString);
            }

            AdditionalFixtureSetup();
        }        [OneTimeTearDown]
        public async Task FixtureTearDown()
        {
            await _respawner.ResetAsync(ConnectionString);
        }

        [SetUp]
        public async Task SetUp()
        {
            TestContext = CreateDbContext();

            if (CheckpointPolicy == CheckpointPolicyOptions.BeforeEachTest)
            {
                await _respawner.ResetAsync(ConnectionString);
            }
        }

        [TearDown]
        public void TearDown()
        {
            TestContext.Dispose();
        }

        protected void Save(params object[] entities)
        {
            foreach (var entity in entities)
            {
                TestContext.Add(entity);
            }

            TestContext.SaveChanges();
        }
    }
}
