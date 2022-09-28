// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using EdFi.Security.DataAccess.Contexts;
using EdFi.Admin.DataAccess.Contexts;
using static EdFi.Ods.AdminApp.Management.ClaimSetEditor.GetClaimSetsByApplicationNameQuery;

namespace EdFi.Ods.AdminApp.Management.ClaimSetEditor
{
    public class EditClaimSetCommand
    {
        private readonly ISecurityContext _context;
        private readonly IUsersContext _usersContext;

        public EditClaimSetCommand(ISecurityContext context, IUsersContext usersContext)
        {
            _context = context;
            _usersContext = usersContext;
        }

        public int Execute(IEditClaimSetModel claimSet)
        {
            var existingClaimSet = _context.ClaimSets.SingleOrDefault(x => x.ClaimSetId == claimSet.ClaimSetId);

            if (DefaultClaimSets.Contains(existingClaimSet.ClaimSetName) ||
                        CloudOdsAdminApp.SystemReservedClaimSets.Contains(existingClaimSet.ClaimSetName))
            {
                throw new Exception($"Claim set ({existingClaimSet.ClaimSetName}) is system reserved.May not be modified.");
            }
            if(!claimSet.ClaimSetName.Equals(existingClaimSet.ClaimSetName, StringComparison.InvariantCultureIgnoreCase))
            {
                var applications = _usersContext.Applications.Where(x => x.ClaimSetName.Equals(existingClaimSet.ClaimSetName, StringComparison.InvariantCultureIgnoreCase));
                foreach (var application in applications)
                {
                    application.ClaimSetName = claimSet.ClaimSetName;
                }
            }

            existingClaimSet.ClaimSetName = claimSet.ClaimSetName;

            _context.SaveChanges();
            _usersContext.SaveChanges();

            return existingClaimSet.ClaimSetId;
        }
    }

    public interface IEditClaimSetModel
    {
        string ClaimSetName { get; }
        int ClaimSetId { get; }
    }
}
