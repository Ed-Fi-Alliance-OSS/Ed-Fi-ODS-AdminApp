// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Security.DataAccess.Contexts;
using static EdFi.Ods.AdminApp.Management.ClaimSetEditor.GetClaimSetsByApplicationNameQuery;

namespace EdFi.Ods.AdminApp.Management.ClaimSetEditor
{
    public class GetClaimSetByNameQuery : IGetClaimSetByNameQuery
    {
        private readonly ISecurityContext _securityContext;

        public GetClaimSetByNameQuery(ISecurityContext securityContext)
        {
            _securityContext = securityContext;
        }

        public ClaimSet Execute(string claimSetName)
        {
            var securityContextClaimSet = _securityContext.ClaimSets
                .Single(x => x.ClaimSetName.Equals(claimSetName, System.StringComparison.InvariantCultureIgnoreCase));

            if(securityContextClaimSet == null)
                return null;

            return new ClaimSet
            {
                Id = securityContextClaimSet.ClaimSetId,
                Name = securityContextClaimSet.ClaimSetName,
                IsEditable = !DefaultClaimSets.Contains(securityContextClaimSet.ClaimSetName)
            };
        }
    }

    public interface IGetClaimSetByNameQuery
    {
        ClaimSet Execute(string claimSetName);
    }
}
