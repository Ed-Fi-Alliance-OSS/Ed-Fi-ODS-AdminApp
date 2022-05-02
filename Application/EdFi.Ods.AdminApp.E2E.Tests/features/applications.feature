# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

Feature: Applications
    Background:
        Given user is registered
        And user is logged in
        And setup is complete
        And has API context

    #AA-868
    Scenario: Copy API URL
        Given it's on the "Applications" page
        And applications page has loaded
        When clicking API URL
        Then copied URL message appears
        And copied URL is valid
