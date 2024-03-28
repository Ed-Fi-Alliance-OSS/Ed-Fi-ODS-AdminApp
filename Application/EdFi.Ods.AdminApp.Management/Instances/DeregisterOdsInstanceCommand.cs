// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Ods.AdminApp.Management.Database;
using Microsoft.EntityFrameworkCore;

namespace EdFi.Ods.AdminApp.Management.Instances
{
    public class DeregisterOdsInstanceCommand
    {
        private readonly AdminAppDbContext _database;
        private readonly IUsersContext _usersContext;
        private readonly AdminAppIdentityDbContext _identity;

        public DeregisterOdsInstanceCommand(AdminAppDbContext database, IUsersContext usersContext, AdminAppIdentityDbContext identity)
        {
            _database = database;
            _usersContext = usersContext;
            _identity = identity;
        }

        public void Execute(IDeregisterOdsInstanceModel userModel)
        {
            var odsInstance = _database.OdsInstanceRegistrations.Single(x => x.Id == userModel.OdsInstanceId);

            RemoveInstanceSetupConfigurations(odsInstance.Name);

            RemoveExistingSecretConfigurations(userModel.OdsInstanceId);

            RemoveExistingUserOdsInstanceRegistrations(userModel.OdsInstanceId);

            _database.OdsInstanceRegistrations.Remove(odsInstance);

            _database.SaveChanges();
        }

        private void RemoveInstanceSetupConfigurations(string odsInstanceName)
        {
            var applicationName = odsInstanceName.GetAdminApplicationName();
            var odsToken = odsInstanceName.ExtractNumericInstanceSuffix();

            var application = _usersContext.Applications
                .Include(x => x.OdsInstance)
                .Include(x => x.ApiClients)
                .Include(x => x.ApplicationEducationOrganizations)
                .AsEnumerable().FirstOrDefault(x => x.ApplicationName == applicationName);

            var apiClient = _usersContext.Clients
                .Include(x => x.ApplicationEducationOrganizations)
                .Include(x => x.ClientAccessTokens)
                .AsEnumerable().FirstOrDefault(x => x.Application.ApplicationId == application.ApplicationId);

            if (apiClient != null)
            {
                var clientAccessTokens = _usersContext.ClientAccessTokens
                    .Where(x => x.ApiClient.ApiClientId == apiClient.ApiClientId);

                foreach (var clientAccessToken in clientAccessTokens)
                {
                    _usersContext.ClientAccessTokens.Remove(clientAccessToken);
                }

                _usersContext.Clients.Remove(apiClient);
            }

            if (application != null)
            {
                if (application.ApplicationEducationOrganizations.Any())
                {
                    var applicationEducationOrganization =
                        _usersContext.ApplicationEducationOrganizations.AsEnumerable().FirstOrDefault(x =>
                            x.Application.ApplicationId == application.ApplicationId);
                    if (applicationEducationOrganization != null)
                        _usersContext.ApplicationEducationOrganizations.Remove(applicationEducationOrganization);
                }

                _usersContext.Applications.Remove(application);
            }

            _usersContext.SaveChanges();
        }

        private void RemoveExistingSecretConfigurations(int odsInstanceId)
        {
            var existingOdsInstanceSecretConfigurations =
                _database.SecretConfigurations.Where(x => x.OdsInstanceRegistrationId == odsInstanceId);

            if (existingOdsInstanceSecretConfigurations.Any())
            {
                _database.SecretConfigurations.RemoveRange(existingOdsInstanceSecretConfigurations);
            }

            _database.SaveChanges();
        }

        private void RemoveExistingUserOdsInstanceRegistrations(int odsInstanceId)
        {
            var existingUserOdsInstanceRegistrations =
                _identity.UserOdsInstanceRegistrations.Where(x => x.OdsInstanceRegistrationId == odsInstanceId);

            if (existingUserOdsInstanceRegistrations.Any())
            {
                _identity.UserOdsInstanceRegistrations.RemoveRange(existingUserOdsInstanceRegistrations);
            }

            _identity.SaveChanges();
        }
    }

    public interface IDeregisterOdsInstanceModel
    {
        int OdsInstanceId { get; }
    }
}
