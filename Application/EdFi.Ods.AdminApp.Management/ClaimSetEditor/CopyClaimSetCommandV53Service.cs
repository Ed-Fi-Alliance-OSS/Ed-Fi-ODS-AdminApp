// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
extern alias SecurityCompatiblity53;

using System.Linq;
using Microsoft.EntityFrameworkCore;
using SecurityCompatiblity53::EdFi.SecurityCompatiblity53.DataAccess.Contexts;
using SecurityCompatiblity53::EdFi.SecurityCompatiblity53.DataAccess.Models;

using SecurityClaimSet = SecurityCompatiblity53::EdFi.SecurityCompatiblity53.DataAccess.Models.ClaimSet;

namespace EdFi.Ods.AdminApp.Management.ClaimSetEditor
{
    public class CopyClaimSetCommandV53Service
    {
        private readonly ISecurityContext _context;

        public CopyClaimSetCommandV53Service(ISecurityContext context)
        {
            _context = context;
        }

        public int Execute(ICopyClaimSetModel claimSet)
        {
            var newClaimSet = new SecurityClaimSet
            {
                ClaimSetName = claimSet.Name,
                Application = _context.Applications.AsEnumerable().First()
            };

            var originalResourceClaims =
                _context.ClaimSetResourceClaims
                    .Include(x => x.ResourceClaim)
                    .Include(x => x.Action)
                    .Include(x => x.AuthorizationStrategyOverride)
                    .Where(x => x.ClaimSet.ClaimSetId == claimSet.OriginalId)
                    .ToList();
            _context.ClaimSets.Add(newClaimSet);

            foreach (var resourceClaim in originalResourceClaims)
            {
                var copyResourceClaim = new ClaimSetResourceClaim
                {
                    ClaimSet = newClaimSet,
                    Action = resourceClaim.Action,
                    AuthorizationStrategyOverride = resourceClaim.AuthorizationStrategyOverride,
                    ResourceClaim = resourceClaim.ResourceClaim
                };
                _context.ClaimSetResourceClaims.Add(copyResourceClaim);
            }
            _context.SaveChanges();

            return newClaimSet.ClaimSetId;
        }
    }
}
