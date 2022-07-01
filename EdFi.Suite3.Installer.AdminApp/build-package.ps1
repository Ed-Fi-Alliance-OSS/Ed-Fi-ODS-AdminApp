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
    $PublishPackage = $true,

    [string]
    $NuGetFeed,

    [string]
    $NuGetApiKey
)

$ErrorActionPreference = "Stop"
$OutputDirectory = Resolve-Path $PSScriptRoot
$PackageDefinitionFile = Resolve-Path "$PSScriptRoot/EdFi.Suite3.Installer.AdminApp.nuspec"
$Downloads = "$PSScriptRoot/downloads"

function Add-AppCommon{

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

function New-Package {
    param (
        [string]
        $Suffix
     )

    $parameters = @(
        "pack", $PackageDefinitionFile,
        "-Version", $SemanticVersion,
        "-OutputDirectory", $OutputDirectory,
        "-Verbosity", "detailed"
    )
    if ($Suffix) {
        $parameters += "-Suffix"
        $parameters += $Suffix
    }

    Write-Host @parameters -ForegroundColor Magenta
    nuget @parameters
}

function Get-PackageId
{
    [ xml ] $fileContents = Get-Content -Path  $PackageDefinitionFile
    return $fileContents.package.metadata.id
}

function Publish-Package{
    param (
        [string]
        $Version = $SemanticVersion
    )

    $packageId = Get-PackageId
    $packageName = "$packageId.$Version.nupkg"

    $parameters = @(
        "push", (Get-ChildItem "$OutputDirectory/$packageName").FullName,
        "-Source", $NuGetFeed,
        "-ApiKey", $NuGetApiKey,
        "-Verbosity", "detailed"
    )

    Write-Host "Pushing $packageName to azure artifacts"
    nuget @parameters
}

#Add AppCommon
Add-AppCommon

# Build release
Write-Host "Building Release package"
New-Package


if($PublishPackage)
{
    Write-Host "Publishing release package"
    Publish-Package
}

