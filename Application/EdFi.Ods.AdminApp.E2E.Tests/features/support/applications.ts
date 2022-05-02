// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

import { Given, Then, When } from "@cucumber/cucumber";
import { ok } from "assert";
import { models } from "../management/setup";

Given("applications page has loaded", async () => {
    ok(await models.applicationsPage.hasTabSelected(), "Applications tab not selected");
});

When("clicking API URL", async () => {
    await models.applicationsPage.clickURL();
});

Then("copied URL message appears", async () => {
    ok(await models.applicationsPage.hasCopiedURLMessage(), "Message not found");
});

Then("copied URL is valid", async () => {
    ok(await models.applicationsPage.apiURLIsValid(), "API URL is valid");
});
