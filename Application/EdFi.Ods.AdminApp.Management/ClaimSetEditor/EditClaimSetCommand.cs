// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using EdFi.Ods.AdminApp.Management.ErrorHandling;
using EdFi.Security.DataAccess.Contexts;
using static EdFi.Ods.AdminApp.Management.ClaimSetEditor.GetClaimSetsByApplicationNameQuery;

namespace EdFi.Ods.AdminApp.Management.ClaimSetEditor
{
    public class EditClaimSetCommand
    {
        private readonly ISecurityContext _context;

        public EditClaimSetCommand(ISecurityContext context)
        {
            _context = context;
        }

        public int Execute(IEditClaimSetModel claimSet)
        {
            var existingClaimSet = _context.ClaimSets.SingleOrDefault(x => x.ClaimSetId == claimSet.ClaimSetId);

            if (DefaultClaimSets.Contains(existingClaimSet.ClaimSetName) ||
                        CloudOdsAdminApp.SystemReservedClaimSets.Contains(existingClaimSet.ClaimSetName))
            {
                throw new Exception($"Claim set ({existingClaimSet.ClaimSetName}) is system reserved.May not be modified.");
            }

            existingClaimSet.ClaimSetName = claimSet.ClaimSetName;

            _context.SaveChanges();

            return existingClaimSet.ClaimSetId;
        }
    }

    public interface IEditClaimSetModel
    {
        string ClaimSetName { get; }
        int ClaimSetId { get; }
    }
}
