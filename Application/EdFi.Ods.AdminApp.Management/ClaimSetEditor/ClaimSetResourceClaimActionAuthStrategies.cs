// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;

namespace EdFi.Ods.AdminApp.Management.ClaimSetEditor;

public interface IClaimSetResourceClaimActionAuthStrategies
{
    IList<AuthorizationStrategy> AuthorizationStrategies { get; }
}

public class ClaimSetResourceClaimActionAuthStrategies : IClaimSetResourceClaimActionAuthStrategies
{
    public IList<AuthorizationStrategy> AuthorizationStrategies { get; set; } = new List<AuthorizationStrategy>();
}
