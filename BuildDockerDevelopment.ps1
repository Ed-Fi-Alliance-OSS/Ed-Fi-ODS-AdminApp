# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

<#
    .SYNOPSIS
        Script for running the build operation and copy over the latest files to an existing AdminApp docker container for testing.

    .DESCRIPTION
        Script for facilitating the local docker testing with latest changes. Developer can set the required appsettings values and trigger 
        the build. Once the build done, the apsettings.json will be updated with values provided and 
        latest files will be copied over to an existing AdminApp docker container folder.

    .EXAMPLE
        .\BuildDockerDevelopment.ps1
#>

$p = @{}
$p["ProductionApiUrl"] = "http://api"
$p["AppStartup"] = "OnPrem"
$p["XsdFolder"] = "/app/Schema"
$p["ApiStartupType"] = "SharedInstance"
$p["DatabaseEngine"] = "PostgreSql"
$p["DbSetupEnabled"] = "false"
$p["BulkUploadHashCache"] = "/app/BulkUploadHashCache/"
$p["EncryptionProtocol"] = "AES"
$p["EncryptionKey"] = "<Generated encryption key>"
$p["AdminDB"] = "host=db-admin;port=5432;username=username;password=password;database=EdFi_Admin;Application Name=EdFi.Ods.AdminApp;"
$p["SecurityDB"] = "host=db-admin;port=5432;username=username;password=password;database=EdFi_Security;Application Name=EdFi.Ods.AdminApp;"
$p["ProductionOdsDB"] = "host=db-ods;port=5432;username=username;password=password;database=EdFi_Ods;Application Name=EdFi.Ods.AdminApp;"

.\build.ps1 -Version 2.1.0 -Configuration Release -DockerEnvValues $p -Command BuildAndDeployToDockerContainer
