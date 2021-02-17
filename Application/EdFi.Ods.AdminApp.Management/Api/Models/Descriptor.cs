// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.AdminApp.Management.Api.Models
{
    public class Descriptor
    {
        public string Id { get; set; }
        public string Namespace { get; set; }
        public string Description { get; set; }
    }

    public class DescriptorCategory
    {
        public string Name { get; set; }
        public string Namespace { get; set; }
    }
}
