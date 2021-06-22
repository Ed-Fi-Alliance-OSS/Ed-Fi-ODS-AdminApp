// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using EdFi.Ods.AdminApp.Management.Api.DomainModels;
using EdFi.Ods.AdminApp.Management.Api.Models;

namespace EdFi.Ods.AdminApp.Management.Api.Automapper
{
    public class LeaStateEducationAgencyReferenceResolver : IValueResolver<LocalEducationAgency, EdFiLocalEducationAgency, EdFiStateEducationAgencyReference>
    {
        public EdFiStateEducationAgencyReference Resolve(LocalEducationAgency source,
            EdFiLocalEducationAgency destination, EdFiStateEducationAgencyReference destMember,
            ResolutionContext context)
        {
            return StateEducationAgencyReferenceResolver.GetStateOrganizationReference(source.StateOrganizationId, destination.StateEducationAgencyReference);
        }
    }

    public class PsiStateEducationAgencyReferenceResolver : IValueResolver<PostSecondaryInstitution, EdFiPostSecondaryInstitution, EdFiStateEducationAgencyReference>
    {
        public EdFiStateEducationAgencyReference Resolve(PostSecondaryInstitution source,
            EdFiPostSecondaryInstitution destination, EdFiStateEducationAgencyReference destMember,
            ResolutionContext context)
        {
            return StateEducationAgencyReferenceResolver.GetStateOrganizationReference(source.StateOrganizationId, destination.StateEducationAgencyReference);
        }
    }

    public static class StateEducationAgencyReferenceResolver
    {
        public static EdFiStateEducationAgencyReference GetStateOrganizationReference(int? sourceStateOrganizationId,
            EdFiStateEducationAgencyReference destinationStateEducationAgencyReference)
        {
            var id = sourceStateOrganizationId ?? destinationStateEducationAgencyReference?.StateEducationAgencyId;

            return id != null ? new EdFiStateEducationAgencyReference(id) : null;
        }
    }
}
