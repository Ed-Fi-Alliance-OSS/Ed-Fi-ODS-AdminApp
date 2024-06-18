# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

import-module -force "$PSScriptRoot/Install-EdFiOdsAdminApp.psm1"

<#
Review and edit the following connection information for your database server

.EXAMPLE
Installs and connects the applications to the database using SQL Authentication

    $dbConnectionInfo = @{
        Server = "(local)"
        Engine = "SqlServer"
        UseIntegratedSecurity = $false
        Username = "exampleAdmin"
        Password = "examplePassword"
    }

Installs and connects the applications to the database using PostgreSQL Authentication

    $dbConnectionInfo = @{
        Server = "localhost"
        Engine = "PostgreSQL"
        UseIntegratedSecurity = $false
        Username = "postgres"
        Password = "examplePassword"
    }
#>

$dbConnectionInfo = @{
    Server = "(local)"
    Engine = "SqlServer"
    UseIntegratedSecurity=$true
}

<#
Review and edit the following application settings and connection information for Admin App

.EXAMPLE
Configure Admin App to manage an API with url "https://localhost:54746"

    $p = @{
        ToolsPath = "C:/temp/tools"
        DbConnectionInfo = $dbConnectionInfo
        OdsApiUrl = "https://localhost:54746"
        PackageVersion = '3.3.1.0'
    }

.EXAMPLE
Deploy Admin App for use with a "District Specific" ODS API

    $adminAppFeatures = @{
        ApiMode = "districtspecifc"
    }

    $p = @{
        ToolsPath = "C:/temp/tools"
        DbConnectionInfo = $dbConnectionInfo
        OdsApiUrl = "http://web-api.example.com/WebApi"
        PackageVersion = '3.3.1.0'
        AdminAppFeatures = $adminAppFeatures
    }
#>

$adminAppFeatures = @{
    ApiMode = "sharedinstance"
}

$packageSource = Split-Path $PSScriptRoot -Parent
$adminAppSource = "$packageSource/AdminApp"

$p = @{
    ToolsPath = "C:/temp/tools"
    DbConnectionInfo = $dbConnectionInfo
    OdsApiUrl = ""
    PackageVersion = '3.3.1.0'
    PackageSource = $adminAppSource
    AdminAppFeatures = $adminAppFeatures
}

if ([string]::IsNullOrWhiteSpace($p.OdsApiUrl)) {
    Write-Warning "ODS API URL has not been provided. Please make sure to update appsetings.json with a valid url for the ODS API, before using Admin App."
}

    Install-EdFiOdsAdminApp @p

