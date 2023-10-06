// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Admin.DataAccess.Models;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;
using Microsoft.EntityFrameworkCore;
using static EdFi.Ods.AdminApp.Management.Tests.Testing;
using static EdFi.Ods.AdminApp.Management.Tests.TestingHelper;

namespace EdFi.Ods.AdminApp.Management.Tests.Instance
{
    public static class InstanceTestSetup
    {
        public static void ResetOdsInstances()
        {
            Scoped<IUsersContext>(usersContext =>
            {
                var context = (SqlServerUsersContext)usersContext;
                context.Database.ExecuteSqlCommand("DELETE FROM [dbo].[OdsInstances]");
            });
        }

        public static IEnumerable<OdsInstance> SetupOdsInstances(int instanceCount = 5, bool useGuidName = false)
        {
            var testInstances = Enumerable.Range(1, instanceCount)
                .Select((x, index) => new OdsInstance
                {
                    Name = useGuidName ? $"Ods{Guid.NewGuid():N}_{index:D4}" : $"Ods_{index:D4}",
                    InstanceType = "OdsInstance",
                    ConnectionString= "Data Source=.\\;Initial Catalog=EdFi_Ods;Integrated Security=True;Encrypt=False"

                })
                .ToList();

            Scoped<IUsersContext>(database =>
            {
                foreach (var instance in testInstances)
                {
                    database.OdsInstances.Add(instance);
                }
                database.SaveChanges();
            });

            SetupOdsInstanceSecretConfigurations(testInstances);

            return testInstances;
        }

        private static void SetupOdsInstanceSecretConfigurations(IEnumerable<OdsInstance> testInstances)
        {
            var secretConfigurations = new List<SecretConfiguration>();
            foreach (var testInstance in testInstances)
            {
                secretConfigurations.Add(new SecretConfiguration
                {
                    OdsInstanceId = testInstance.OdsInstanceId,
                    EncryptedData = Sample("EncryptedData")
                });
            }

            SaveToAdminAppDb(secretConfigurations);
        }

        public static IEnumerable<UserOdsInstance> SetupUserWithOdsInstances(string userId, List<OdsInstance> instances)
        {
            var userOdsInstances = new List<UserOdsInstance>();

            foreach (var instance in instances)
            {
                userOdsInstances.Add(new UserOdsInstance()
                {
                    OdsInstanceId = instance.OdsInstanceId,
                    UserId = userId
                });
            }

            Scoped<AdminAppIdentityDbContext>(database =>
            {
                database.UserOdsInstances.AddRange(userOdsInstances);
                database.SaveChanges();
            });

            return userOdsInstances;
        }
    }
}
