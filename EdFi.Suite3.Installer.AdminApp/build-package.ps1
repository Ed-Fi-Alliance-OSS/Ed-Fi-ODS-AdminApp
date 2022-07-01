# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5
param (
    [string]
    [Parameter(Mandatory=$true)]
    $SemanticVersion,

    [string]
    [Parameter(Mandatory=$true)]
    $BuildCounter,

    [switch]
    $Publish = $True,

    [string]
    $NuGetFeed,

    [string]
    $NuGetApiKey,

    [string]
    $ToolsPath = "C:/temp/tools"
)

$ErrorActionPreference = "Stop"

$prepParams = @{
    PackageDirectory = $PSScriptRoot
    ToolsPath = $ToolsPath
}

Invoke-Expression "$PSScriptRoot/prep-installer-package.ps1 @prepParams"

$verbose = $PSCmdlet.MyInvocation.BoundParameters["Verbose"]

$appCommonUtilityDirectory = "$PSScriptRoot/AppCommon/Utility"

Import-Module "$appCommonUtilityDirectory/create-package.psm1" -Force

$parameters = @{
    PackageDefinitionFile = Resolve-Path "$PSScriptRoot/EdFi.Suite3.Installer.AdminApp.nuspec"
    Version = "$SemanticVersion.$BuildCounter"
    OutputDirectory = Resolve-Path $PSScriptRoot
    Publish = $Publish
    Source = $NuGetFeed
    ApiKey = $NuGetApiKey
    ToolsPath = $ToolsPath
}

Write-Host @parameters

Write-Host "About to build package $PSScriptRoot"
Write-Host "Tools path $ToolsPath"


Invoke-CreatePackage @parameters -Verbose:$verbose
