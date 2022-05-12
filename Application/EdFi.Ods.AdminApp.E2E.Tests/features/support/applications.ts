// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

import { Given, Then, When } from "@cucumber/cucumber";
import { ok, strictEqual } from "assert";
import { models } from "../management/setup";

Given("there's an application added", async () => {
    await models.applicationsPage.navigate();
    if (await models.applicationsPage.isApplicationPresentOnPage()) {
        return Promise.resolve("Application is already added");
    }
    await models.applicationsPage.addApplicationFullSteps();
});

Given("applications page has loaded", async () => {
    ok(await models.applicationsPage.hasTabSelected(), "Applications tab not selected");
});

When("clicking API URL", async () => {
    await models.applicationsPage.clickURL();
});

When("adding new application", async () => {
    await models.applicationsPage.addApplication();
});

When("filling application form", async () => {
    strictEqual(
        await models.applicationsPage.modalTitle(),
        models.applicationsPage.modalTitleMessages.addApplication,
        "Modal title not found"
    );
    await models.applicationsPage.fillApplicationForm();
});

When("clicking save application", async () => {
    await models.applicationsPage.saveApplicationForm();
});

When("clicking delete application", async () => {
    await models.applicationsPage.clickDelete();
});

When("key-secret modal appears", async () => {
    strictEqual(
        await models.applicationsPage.modalTitle(),
        models.applicationsPage.modalTitleMessages.addedSecret,
        "Modal title not found"
    );

    ok(await models.applicationsPage.hasKey(), "Key not found in modal");
    ok(await models.applicationsPage.hasSecret(), "Secret not found in modal");

    await models.applicationsPage.saveKeyAndSecret();
});

When("delete application modal is open", async () => {
    strictEqual(
        await models.applicationsPage.modalTitle(),
        models.applicationsPage.modalTitleMessages.deleteApplication,
        "Delete modal title not found"
    );

    ok(
        (await models.applicationsPage.getDeleteApplicationMessage())?.includes(
            models.applicationsPage.deleteApplicationConfirmationMessage
        ),
        "Validation message not correct"
    );
});

When("confirming delete application", async () => {
    await models.applicationsPage.deleteApplication();
});

When("clicking modal message", async () => {
    await models.applicationsPage.clickKeySecretCopied();
});

Then("copied URL message appears", async () => {
    ok(await models.applicationsPage.hasCopiedURLMessage(), "Message not found");
});

Then("copied URL is valid", async () => {
    ok(await models.applicationsPage.apiURLIsValid(), "API URL is valid");
});

Then("application appears on list", async () => {
    ok(await models.applicationsPage.isApplicationPresentOnPage(), "Application not found");
});

Then("generated key-secret is valid", async () => {
    ok(await models.applicationsPage.isKeyAndSecretValid(), "Credentials not valid");
});

Then("generated key-secret is not valid", async () => {
    ok(!await models.applicationsPage.isKeyAndSecretValid(), "Credentials are still valid");
});

Then("application is deleted", async () => {
    strictEqual(
        await models.applicationsPage.getToastMessage(),
        models.applicationsPage.confirmationMessages.deleted,
        "Confirmation message not found"
    );
});
