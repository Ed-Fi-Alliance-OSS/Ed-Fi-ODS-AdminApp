// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.AdminApp.Management.Api;
using NUnit.Framework;
using Shouldly;

namespace EdFi.Ods.AdminApp.Management.UnitTests.Api
{

    [TestFixture]
    public class WhenGettingTheApiBaseUrl
    {
        [Test]
        public void GivenNotUsingYearSpecificMode_ThenReturnApiServerUrlPlusDataPlusVersionString()
        {
            const string serverUrl = "http://example.com";
            const string expected = "http://example.com/data/v3";

            new OdsApiConnectionInformation() { ApiServerUrl = serverUrl }
                .ApiBaseUrl
                .ShouldBe(expected);
        }

        [Test]
        public void GivenUsingYearSpecificMode_ThenReturnApiServerUrlPlusDataPlusVersionStringPlusYear()
        {
            const string serverUrl = "http://example.com";
            const string expected = "http://example.com/data/v3";

            new OdsApiConnectionInformation () { ApiServerUrl = serverUrl}
                .ApiBaseUrl
                .ShouldBe(expected);
        }



        [Test]
        public void GivenConnectionInfoNotUsingYearSpecificMode_ThenMetadataUrlShouldBeBaseUrlPlusMetadataRoute()
        {
            const string apiServerUrl = "http://abc";
            const string expected = "http://abc/metadata";

            var connectionInfo = new OdsApiConnectionInformation () { ApiServerUrl = apiServerUrl };

            connectionInfo
                .MetadataUrl
                .ShouldBe(expected);
        }

        [Test]
        public void GivenConnectionInfoIsUsingYearSpecificMode_ThenMetadataUrlShouldBeBaseUrlPlusMetadataRoutePlusYear()
        {
            const string apiServerUrl = "http://abc";
            const string expected = "http://abc/metadata";

            var connectionInfo = new OdsApiConnectionInformation() { ApiServerUrl = apiServerUrl };

            connectionInfo
                .MetadataUrl
                .ShouldBe(expected);
        }
    }
}
