// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Security.DataAccess.Contexts;

namespace EdFi.Ods.AdminApp.Management.ClaimSetEditor
{
    public class EditClaimSetCommand
    {
        private readonly ISecurityContext _securityContext;
        private readonly IUsersContext _usersContext;

        public EditClaimSetCommand(ISecurityContext securityContext, IUsersContext usersContext)
        {
            _securityContext = securityContext;
            _usersContext = usersContext;
        }

        public int Execute(IEditClaimSetModel claimSet)
        {
            var existingClaimSet = _securityContext.ClaimSets.Single(x => x.ClaimSetId == claimSet.ClaimSetId);

            ReAssociateApplicationsToRenamedClaimSet(existingClaimSet.ClaimSetName, claimSet.ClaimSetName);
            existingClaimSet.ClaimSetName = claimSet.ClaimSetName;

            _securityContext.SaveChanges();
            _usersContext.SaveChanges();

            return existingClaimSet.ClaimSetId;

            void ReAssociateApplicationsToRenamedClaimSet(string existingClaimSetName, string newClaimSetName)
            {
                var associatedApplications = _usersContext.Applications
                    .Where(x => x.ClaimSetName == existingClaimSetName);

                foreach (var application in associatedApplications)
                {
                    application.ClaimSetName = newClaimSetName;
                }
            }
        }
    }

    public interface IEditClaimSetModel
    {
        string ClaimSetName { get; }
        int ClaimSetId { get; }
    }
}
