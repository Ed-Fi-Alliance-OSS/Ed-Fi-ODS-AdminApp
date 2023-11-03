// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using System.Runtime.Caching;
using System.Threading.Tasks;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Admin.DataAccess.Models;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using Shouldly;
using static EdFi.Ods.AdminApp.Management.Tests.Testing;
using static EdFi.Ods.AdminApp.Management.Tests.TestingHelper;

namespace EdFi.Ods.AdminApp.Management.Tests.Configuration.Configuration
{
    public class OdsSecretConfigurationProviderTests : AdminAppDataTestBase
    {
        private static async Task<OdsSecretConfiguration> GetSecretConfiguration(int? instanceRegistrationId = null)
        {
            return await ScopedAsync<IOdsSecretConfigurationProvider, OdsSecretConfiguration>(
                async provider => await provider.GetSecretConfiguration(instanceRegistrationId));
        }

        private static async Task SetSecretConfiguration(OdsSecretConfiguration configuration, int? instanceRegistrationId = null)
        {
            await ScopedAsync<IOdsSecretConfigurationProvider>(
                async provider => await provider.SetSecretConfiguration(configuration, instanceRegistrationId));
        }

        private readonly ObjectCache _cache = MemoryCache.Default;

        [Test]
        public async Task ShouldReturnNullWhenThereAreZeroSecretConfigurations()
        {
            ClearSecretConfigurationCache();
            EnsureZeroSecretConfigurations();

            var secretConfiguration = await GetSecretConfiguration();

            secretConfiguration.ShouldBe(null);
        }

        [Test]
        public async Task ShouldRetrieveUnencryptedSecretConfiguration_SingleInstance()
        {
            const string JsonConfiguration =
                "{\"ProductionApiKeyAndSecret\":{\"Key\":\"productionKey\",\"Secret\":\"productionSecret\"}}";



            ClearSecretConfigurationCache();

            var odsInstance = CreateOdsInstance("SingleInstance_" + Guid.NewGuid());

            odsInstance.ShouldNotBeNull();

            AddSecretConfiguration(JsonConfiguration, odsInstance.OdsInstanceId);

            var secretConfiguration = await GetSecretConfiguration(odsInstance.OdsInstanceId);

            var record = GetSecretConfigurationRecord(odsInstance.OdsInstanceId);
            record.IsEncrypted.ShouldBe(false);
            record.EncryptedData.ShouldBe(JsonConfiguration);

            secretConfiguration.ProductionApiKeyAndSecret.Key.ShouldBe("productionKey");
            secretConfiguration.ProductionApiKeyAndSecret.Secret.ShouldBe("productionSecret");
        }

        [Test]
        public async Task ShouldRetrieveUnencryptedSecretConfiguration_MultiInstance()
        {
            const string JsonConfiguration1 =

                "{\"ProductionApiKeyAndSecret\":{\"Key\":\"productionKey1\",\"Secret\":\"productionSecret1\"}}";
            const string JsonConfiguration2 =
                "{\"ProductionApiKeyAndSecret\":{\"Key\":\"productionKey2\",\"Secret\":\"productionSecret2\"}}";

            var odsInstance1 = CreateOdsInstance("MultiInstance1_" + Guid.NewGuid());
            var odsInstance2 = CreateOdsInstance("MultiInstance2_" + Guid.NewGuid());

            ClearSecretConfigurationCache();

            odsInstance1.ShouldNotBeNull();
            odsInstance2.ShouldNotBeNull();

            AddSecretConfiguration(JsonConfiguration1, odsInstance1.OdsInstanceId);

            var secretConfigurationForInstance1 =
                await GetSecretConfiguration(odsInstance1.OdsInstanceId);

            var record = GetSecretConfigurationRecord(odsInstance1.OdsInstanceId);
            record.IsEncrypted.ShouldBe(false);
            record.EncryptedData.ShouldBe(JsonConfiguration1);

            secretConfigurationForInstance1.ProductionApiKeyAndSecret.Key.ShouldBe("productionKey1");
            secretConfigurationForInstance1.ProductionApiKeyAndSecret.Secret.ShouldBe("productionSecret1");

            AddSecretConfiguration(JsonConfiguration2, odsInstance2.OdsInstanceId);
            var secretConfigurationForInstance2 =
                await GetSecretConfiguration(odsInstance2.OdsInstanceId);

            record = GetSecretConfigurationRecord(odsInstance2.OdsInstanceId);
            record.IsEncrypted.ShouldBe(false);
            record.EncryptedData.ShouldBe(JsonConfiguration2);

            secretConfigurationForInstance2.ProductionApiKeyAndSecret.Key.ShouldBe("productionKey2");
            secretConfigurationForInstance2.ProductionApiKeyAndSecret.Secret.ShouldBe("productionSecret2");
        }

        [Test]
        public async Task ShouldEditSecretConfiguration_SingleInstance()
        {
            ClearSecretConfigurationCache();

            var productionApiKey = Guid.NewGuid().ToString();
            var productionApiSecret = Guid.NewGuid().ToString();

            var newProductionApiKey = Guid.NewGuid().ToString();
            var newProductionApiSecret = Guid.NewGuid().ToString();

            var secretConfiguration = new OdsSecretConfiguration
            {
                ProductionApiKeyAndSecret = new OdsApiCredential
                {
                    Key = productionApiKey,
                    Secret = productionApiSecret
                }
            };

            var editSecretConfiguration = new OdsSecretConfiguration
            {
                ProductionApiKeyAndSecret = new OdsApiCredential
                {
                    Key = newProductionApiKey,
                    Secret = newProductionApiSecret
                }
            };

            var odsInstance = CreateOdsInstance("SingleInstance-EditConfig_" + Guid.NewGuid());

            odsInstance.ShouldNotBeNull();
            
            await SetSecretConfiguration(secretConfiguration, odsInstance.OdsInstanceId);
            var createdSecretConfiguration = await GetSecretConfiguration(odsInstance.OdsInstanceId);

            var record = GetSecretConfigurationRecord(odsInstance.OdsInstanceId);
            record.IsEncrypted.ShouldBe(true);
            record.EncryptedData.ShouldEndWith("=");

            createdSecretConfiguration.ProductionApiKeyAndSecret.Key.ShouldBe(productionApiKey);
            createdSecretConfiguration.ProductionApiKeyAndSecret.Secret.ShouldBe(productionApiSecret);


            await SetSecretConfiguration(editSecretConfiguration, odsInstance.OdsInstanceId);

            var editedSecretConfiguration = await GetSecretConfiguration(odsInstance.OdsInstanceId);

            record = GetSecretConfigurationRecord(odsInstance.OdsInstanceId);
            record.IsEncrypted.ShouldBe(true);
            record.EncryptedData.ShouldEndWith("=");

            editedSecretConfiguration.ProductionApiKeyAndSecret.Key.ShouldBe(newProductionApiKey);
            editedSecretConfiguration.ProductionApiKeyAndSecret.Secret.ShouldBe(newProductionApiSecret);
        }

        [Test]
        public async Task ShouldEditSecretConfiguration_MultiInstance()
        {
            ClearSecretConfigurationCache();

            var productionApiKey = Guid.NewGuid().ToString();
            var productionApiSecret = Guid.NewGuid().ToString();

            var newProductionApiKey = Guid.NewGuid().ToString();
            var newProductionApiSecret = Guid.NewGuid().ToString();

            var secretConfiguration = new OdsSecretConfiguration
            {
                ProductionApiKeyAndSecret = new OdsApiCredential
                {
                    Key = productionApiKey,
                    Secret = productionApiSecret
                }
            };

            var editSecretConfiguration = new OdsSecretConfiguration
            {
                ProductionApiKeyAndSecret = new OdsApiCredential
                {
                    Key = newProductionApiKey,
                    Secret = newProductionApiSecret
                }
            };

            var odsInstance1 = CreateOdsInstance("MultiInstance1-EditConfig_" + Guid.NewGuid());
            var odsInstance2 = CreateOdsInstance("MultiInstance2-EditConfig_" + Guid.NewGuid());

            odsInstance1.ShouldNotBeNull();
            odsInstance2.ShouldNotBeNull();

            // Set secret configuration for instance 1
            await SetSecretConfiguration(secretConfiguration, odsInstance1.OdsInstanceId);

            // Set secret configuration for instance 2
            await SetSecretConfiguration(secretConfiguration, odsInstance2.OdsInstanceId);

            // Edit the secret configuration for instance 1
            await SetSecretConfiguration(editSecretConfiguration, odsInstance1.OdsInstanceId);

            // Verify the secret configuration for instance 2
            var createdSecretConfigurationForInstance2 = await GetSecretConfiguration(odsInstance2.OdsInstanceId);
            var record = GetSecretConfigurationRecord(odsInstance2.OdsInstanceId);
            record.IsEncrypted.ShouldBe(true);
            record.EncryptedData.ShouldEndWith("=");
            createdSecretConfigurationForInstance2.ProductionApiKeyAndSecret.Key.ShouldBe(productionApiKey);
            createdSecretConfigurationForInstance2.ProductionApiKeyAndSecret.Secret.ShouldBe(productionApiSecret);

            // Verify the edited secret configuration for instance 1
            var editedSecretConfigurationForInstance1 = await GetSecretConfiguration(odsInstance1.OdsInstanceId);
            record = GetSecretConfigurationRecord(odsInstance1.OdsInstanceId);
            record.IsEncrypted.ShouldBe(true);
            record.EncryptedData.ShouldEndWith("=");
            editedSecretConfigurationForInstance1.ProductionApiKeyAndSecret.Key.ShouldBe(newProductionApiKey);
            editedSecretConfigurationForInstance1.ProductionApiKeyAndSecret.Secret.ShouldBe(newProductionApiSecret);
        }

        private void EnsureZeroSecretConfigurations()
        {
            Scoped<AdminAppDbContext>(database =>
            {
                foreach (var entity in database.SecretConfigurations)
                    database.SecretConfigurations.Remove(entity);

                database.SaveChanges();
            });
        }

        private void AddSecretConfiguration(string jsonConfigurationPlainText, int odsInstanceId)
        {
            Scoped<AdminAppDbContext>(database =>
            {
                database.SecretConfigurations.Add(
                    new SecretConfiguration
                    {
                        EncryptedData = jsonConfigurationPlainText,
                        OdsInstanceId = odsInstanceId,
                        IsEncrypted = false
                    });

                database.SaveChanges();
            });
        }

        private OdsInstance CreateOdsInstance(string instanceName)
        {
            OdsInstance createdOdsInstance = null;
            Scoped<IUsersContext>(database =>
            {
                var dbContext = (SqlServerUsersContext)database;
                dbContext.OdsInstances.Add(new OdsInstance {
                    Name = instanceName,
                    InstanceType = "OdsInstance",
                    Status = "OK",
                    Version = "1.0.0"
                });
                dbContext.SaveChanges();

                createdOdsInstance =
                    dbContext.OdsInstances.FirstOrDefault(x => x.Name == instanceName);
            });

            return createdOdsInstance;
        }

        private void ClearSecretConfigurationCache()
        {
            var cacheKeys = _cache.Select(k => k.Key).ToList();
            foreach (var cacheKey in cacheKeys)
            {
                _cache.Remove(cacheKey);
            }
        }

        private static SecretConfiguration GetSecretConfigurationRecord(int odsInstanceId)
            => Query(db => db.SecretConfigurations.Single(x => x.OdsInstanceId == odsInstanceId));
    }
}
