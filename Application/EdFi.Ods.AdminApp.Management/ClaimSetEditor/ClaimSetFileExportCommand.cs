// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json.Linq;

namespace EdFi.Ods.AdminApp.Management.ClaimSetEditor
{
    public class ClaimSetFileExportCommand
    {
        private readonly IGetClaimSetByIdQuery _getClaimSetByIdQuery;
        private readonly IGetResourcesByClaimSetIdQuery _getResourcesByClaimSetIdQuery;
        private readonly IOdsSecurityModelVersionResolver _odsSecurityModelVersionResolver;

        public ClaimSetFileExportCommand(IGetClaimSetByIdQuery getClaimSetByIdQuery,
            IGetResourcesByClaimSetIdQuery getResourcesByClaimSetIdQuery,
            IOdsSecurityModelVersionResolver odsSecurityModelVersionResolver)
        {
            _getClaimSetByIdQuery = getClaimSetByIdQuery;
            _getResourcesByClaimSetIdQuery = getResourcesByClaimSetIdQuery;
            _odsSecurityModelVersionResolver = odsSecurityModelVersionResolver;
        }

        public SharingModel Execute(IClaimSetFileExportModel model)
        {
            var sharingClaimSets = ClaimSetExports(model.SelectedForExport.ToArray());
            var sharingTemplate = new SharingTemplate
            {
                ClaimSets = sharingClaimSets.ToArray()
            };

            return new SharingModel
            {
                Title = model.Title,
                Template = sharingTemplate
            };
        }

        private List<SharingClaimSet> ClaimSetExports(int[] selectedIds)
        {
            if (!selectedIds.Any())
                return new List<SharingClaimSet>();
            var sharingClaimSets = new List<SharingClaimSet>();
            var securityModel = _odsSecurityModelVersionResolver.DetermineSecurityModel();
            var propertiesToRemove = new List<string>
            {
                 "ParentId",
                 "Id"
            };
            if (securityModel == EdFiOdsSecurityModelCompatibility.ThreeThroughFive)
            {
                propertiesToRemove.Add("ReadChanges");
            }
            foreach (var claimSetId in selectedIds)
            {
                var sharingClaimSet = new SharingClaimSet();
                var claimSet = _getClaimSetByIdQuery.Execute(claimSetId);
                sharingClaimSet.Name = claimSet.Name;

                var resources = _getResourcesByClaimSetIdQuery.AllResources(claimSetId);
                sharingClaimSet.ResourceClaims =
                    resources.Select(x =>
                    {
                        var jsonObject = JObject.FromObject(x);
                        jsonObject = JsonObjectManipulation.RemoveProperties(jsonObject, propertiesToRemove);
                        return jsonObject;
                    }).ToList();
                sharingClaimSets.Add(sharingClaimSet);
            }

            return sharingClaimSets;
        }
    }

    public interface IClaimSetFileExportModel
    {
        string Title { get; set; }
        IList<int> SelectedForExport { get; }
    }
}
