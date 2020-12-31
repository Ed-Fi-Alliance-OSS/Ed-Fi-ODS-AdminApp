# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$p = @{}
$p["ProductionApiUrl"] = "https://localhost:5001"
$p["AppStartup"] = "OnPrem"
$p["ApiStartupType"] = "SharedInstance"
$p["DatabaseEngine"] = "PostgreSql"
$p["DbSetupEnabled"] = "false"
$p["EncryptionProtocol"] = "AES"
$p["EncryptionKey"] = "<Generated encryption key>"
$p["AdminDB"] = "host=db-admin;port=5432;username=username;password=password;database=EdFi_Admin;Application Name=EdFi.Ods.AdminApp;"
$p["SecurityDB"] = "host=db-admin;port=5432;username=username;password=password;database=EdFi_Security;Application Name=EdFi.Ods.AdminApp;"
$p["ProductionOdsDB"] = "host=db-ods;port=5432;username=username;password=password;database=EdFi_Ods;Application Name=EdFi.Ods.AdminApp;"

.\build.ps1 -Version 2.1.0 -Configuration Release -DockerEnvValues $p -Command BuildAndDeployToDockerContainer
