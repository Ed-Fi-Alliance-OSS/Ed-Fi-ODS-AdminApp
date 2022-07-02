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

    [string]
    $NuGetFeed,

    [string]
    $NuGetApiKey
)

$ErrorActionPreference = "Stop"
$OutputDirectory = Resolve-Path $PSScriptRoot
$PackageDefinitionFile = Resolve-Path "$PSScriptRoot/EdFi.Suite3.Installer.AdminApp.nuspec"
$Downloads = "$PSScriptRoot/downloads"
$Version = "$SemanticVersion.$BuildCounter"

function Add-AppCommon {

    if(-not(Test-Path -Path $Downloads )){
        $createDir = mkdir $Downloads
    }

    $PackageName = "EdFi.Installer.AppCommon"
    $PackageVersion = "2.0.0"

    $parameters = @(
        "install", $PackageName,
        "-source", $NuGetFeed,
        "-outputDirectory", $Downloads
        "-version", $PackageVersion
    )

    Write-Host "Downloading AppCommon"
    Write-Host -ForegroundColor Magenta "Executing nuget: $parameters"
    nuget $parameters

    $appCommonDirectory = Resolve-Path $Downloads/$PackageName.$PackageVersion* | Select-Object -Last 1

    # Move AppCommon's modules to a local AppCommon directory
    @(
        "Application"
        "Environment"
        "IIS"
        "Utility"
    ) | ForEach-Object {
        $parameters = @{
            Recurse = $true
            Force = $true
            Path = "$appCommonDirectory/$_"
            Destination = "$PSScriptRoot/AppCommon/$_"
        }
        Copy-Item @parameters
    }
}

function Build-Package {

    $parameters = @(
        "pack", $PackageDefinitionFile,
        "-Version", $Version,
        "-OutputDirectory", $OutputDirectory,
        "-Verbosity", "detailed"
    )

    Write-Host @parameters -ForegroundColor Magenta
    nuget @parameters
}

Add-AppCommon

Write-Host "Building package"
Build-Package
