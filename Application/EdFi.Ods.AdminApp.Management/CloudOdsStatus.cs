// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.AdminApp.Management
{
    public class CloudOdsStatus : Enumeration<CloudOdsStatus>
    {

        public static readonly CloudOdsStatus Ok = new CloudOdsStatus(100, "OK");

        protected CloudOdsStatus(int value, string displayName) : base(value, displayName)
        {
        }
    }
}
