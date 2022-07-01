﻿# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -version 5
param (
    [string]
    [Parameter(Mandatory=$true)]
    $PackageDirectory,

    [string]
    $AppCommonVersion = "2.0.0",

    [string]
    $PackageSource = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json"
)
$ErrorActionPreference = "Stop"
$PackageDefinitionFile = Resolve-Path "$PSScriptRoot/Installer.DataImport.nuspec"
$Downloads = "$PSScriptRoot/downloads"

function Add-AppCommon {

    if(-not(Test-Path -Path $Downloads )){
        $createDir = mkdir $Downloads
    }

    $PackageName = "EdFi.Installer.AppCommon"

    $parameters = @(
        "install", $PackageName,
        "-source", $PackageSource,
        "-outputDirectory", $Downloads
        "-version", $AppCommonVersion
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

Add-AppCommon
