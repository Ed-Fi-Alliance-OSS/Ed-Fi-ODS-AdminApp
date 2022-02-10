# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

[CmdLetBinding()]
<#
    .SYNOPSIS
        Publish JUnit test result to Zephyr for Jira

    .DESCRIPTION
        Publishes a JUnit test result fila to Zephyr for Jira. If the test case already exists, it will add the execution to the test, if not, it
        will create a new test case.
        If a cycle and folder id is specified, it will add the execution to the existing data, if not, it will create a new cycle or folder.


    .EXAMPLE
        $parameters = @{
            projectId = 11900
            versionId = -1
            cycleId = 39
            taskName = "Automation Task 1"
            cycleName = "Test Cycle 1"
            folderName = "New Folder"
        }

        .\SendTestResults.ps1 -JiraURL https://tracker-stage.ed-fi.org -PersonalAccessToken ** -ProjectId 1 -ResultsFile "C:/results.xml" -ConfigParams $parameters

        Sends the results to the staging Jira server
    .EXAMPLE
        $parameters = @{
            versionId = -1
            cycleId = 39
            folderId = 1
            taskName = "Automation Task 1"
            cycleName = "Test Cycle 1"
            folderName = "New Folder"
        }

        .\SendTestResults.ps1 -PersonalAccessToken ** -ProjectId 1 -ResultsFile "C:/results.xml" -ConfigParams $parameters

        Sends the results to the main Jira server
#>
param(

    # Ed-Fi's Jira URL
    [string]
    $JiraURL = "https://tracker.ed-fi.org",

    # Access Token to upload the results
    [string]
    $PersonalAccessToken,

    # Id of the project in Jira https://support.smartbear.com/zephyr-squad-server/docs/api/how-to/get-ids.html
    [string]
    $ProjectId,

    # Full path of an XML file with JUnit format to upload the results
    [string]
    $ResultsFilePath,

    # Configuration parameters. See examples
    [hashtable]
    $ConfigParams
)

function CreateAutomationJob {

    $headers = @{Authorization = "Bearer $PersonalAccessToken"}
    $createJobURL = "$JiraURL/rest/zapi/latest/automation/job/create"

    $ConfigParams.Add("projectId", $ProjectId)
    $ConfigParams.Add("automationType", "UPLOAD")
    $ConfigParams.Add("automationTool", "JUnit")

    $body = $ConfigParams | ConvertTo-Json

    try {
        $response = Invoke-RestMethod -Method 'Post' -Uri $createJobURL -Headers $headers -Body $body -ContentType "application/json"
    } catch {
        Write-Host "Error: $_"
    }

    if($response.status -eq 200) {
        Write-Host $response.message
        return $response.JOB_ID
    }
}

function UploadResultsFile {
    param (
        [string]
        $JobId
    )

    $headers = @{Authorization = "Bearer $PersonalAccessToken"}
    $uploadJobUrl = "$JiraURL/rest/zapi/latest/automation/upload/$JobId"

    Write-Host $ResultsFilePath
    Write-Host $uploadJobUrl
    $fileBytes = [System.IO.File]::ReadAllBytes($ResultsFilePath);
    $fileEnc = [System.Text.Encoding]::GetEncoding('UTF-8').GetString($fileBytes);
    $boundary = [System.Guid]::NewGuid().ToString();
    $LF = "`r`n";
    $filename = Split-Path $ResultsFilePath -leaf;

    $bodyLines = (
        "--$boundary",
        "Content-Disposition: form-data; name=`"file`"; filename=`"$filename`"",
        "Content-Type: application/octet-stream$LF",
        $fileEnc,
        "--$boundary--$LF"
    ) -join $LF

    try {
        $response = Invoke-RestMethod -Uri $uploadJobUrl -Method Post -Headers $headers -ContentType "multipart/form-data; boundary=`"$boundary`"" -Body $bodyLines
    } catch {
        Write-Host "Error: $_"
    }

    if($response.status -eq 200) {
        Write-Host $response.message
    }
}

function ExecuteJob {
    param (
        [string]
        $JobId
    )

    $headers = @{Authorization = "Bearer $PersonalAccessToken"}
    $executeJobUrl = "$JiraURL/rest/zapi/latest/automation/job/execute/$JobId"

    try {
        $response = Invoke-RestMethod -Uri $executeJobUrl -Method Post -Headers $headers -ContentType "application/json"
    } catch {
        Write-Host "Error: $_"
    }

    if($response.status -eq 200) {
        Write-Host $response.message
    }
}

function GetJobStatus {
    param (
        [string]
        $JobId
    )
    $headers = @{Authorization = "Bearer $PersonalAccessToken"}
    $jobStatusUrl = "$JiraURL/rest/zapi/latest/automation/job/status/$JobId"

    try {
        $response = Invoke-RestMethod -Uri $jobStatusUrl -Headers $headers
    } catch {
        Write-Host "Error: $_"
    }

    Write-Host $response.Status
}


$jobId = CreateAutomationJob
UploadResultsFile -JobId $jobId
# ExecuteJob -JobId $jobId
GetJobStatus -JobId $jobId
