// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Threading.Tasks;
using EdFi.Admin.DataAccess.Contexts;
using NUnit.Framework;
using Respawn;
using Respawn.Graph;
using static EdFi.Ods.AdminApp.Management.Tests.Testing;
using EdFi.Ods.AdminApp.Web;

namespace EdFi.Ods.AdminApp.Management.Tests
{
    [TestFixture]
    public abstract class PlatformUsersContextTestBase
    {
        private Respawner _respawner;

        protected string ConnectionString
        {
            get
            {
                return Startup.ConfigurationConnectionStrings.Admin;
            }
        }

        [OneTimeSetUp]
        public async Task FixtureSetUp()
        {
            _respawner = await Respawner.CreateAsync(ConnectionString, new RespawnerOptions
            {
                TablesToIgnore = new[]
                {
                    new Table("__MigrationHistory"),
                    new Table("DeployJournal"),
                    new Table("AdminAppDeployJournal")
                }
            });
        }

        [OneTimeTearDown]
        public async Task FixtureTearDown()
        {
            await _respawner.ResetAsync(ConnectionString);
        }

        [SetUp]
        public async Task SetUp()
        {
            await _respawner.ResetAsync(ConnectionString);
        }

        protected void Save(params object[] entities)
        {
            Transaction(usersContext =>
            {
                foreach (var entity in entities)
                    ((SqlServerUsersContext)usersContext).Add(entity);
            });
        }

        protected void Transaction(Action<IUsersContext> action)
        {
            Scoped<IUsersContext>(usersContext =>
            {
                using (var transaction = ((SqlServerUsersContext)usersContext).Database.BeginTransaction())
                {
                    action(usersContext);
                    usersContext.SaveChanges();
                    transaction.Commit();
                }
            });
        }

        protected TResult Transaction<TResult>(Func<IUsersContext, TResult> query)
        {
            var result = default(TResult);

            Transaction(database =>
            {
                result = query(database);
            });

            return result;
        }
    }
}
