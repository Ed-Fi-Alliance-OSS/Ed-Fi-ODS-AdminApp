﻿// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;

namespace EdFi.Ods.AdminApp.Management.Api.Models
{
    public class School : EducationOrganization
    {
        public string EducationOrganizationCategory { get; set; }
        public List<string> GradeLevels { get; set; }
        public string AccreditationStatus { get; set; }
        public string FederalLocaleCode { get; set; }
        public bool? ImprovingSchool { get; set; }
    }
}
