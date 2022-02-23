import { Given, Then, When } from "@cucumber/cucumber";
import { ok } from "assert";
import { takeScreenshot } from "../management/functions";
import { models } from "../management/setup";

Given("there's a Local Education Agency added", async () => {
    await models.edOrgsPage.addLocalEducationAgencyFullSteps();
});

Given("Education Organization list has loaded", async () => {
    ok(await models.edOrgsPage.hasPageTitle(), "Page title not found");
});

When("adding new Local Education Agency", async () => {
    await models.edOrgsPage.addNewLEA();
});

When("filling Local Education Agency form", async () => {
    ok(await models.edOrgsPage.hasAddLEAModalTitle(), "Modal title not found");

    await models.edOrgsPage.fillLEAForm();
});

When("clicking save Local Education Agency", async () => {
    await models.edOrgsPage.saveLEAForm();
});

When("clicking delete Local Education Agency", async () => {
    await models.edOrgsPage.clickDelete();
});

When("confirming delete Local Education Agency", async () => {
    await models.edOrgsPage.hasDeleteLEAModalTitle();
    await models.edOrgsPage.hasDeleteModalConfirmationMessage();
    await models.edOrgsPage.deleteLEA();
});

Then("Local Education Agency is saved", async () => {
    ok(await models.edOrgsPage.addedConfirmationAppears(), "Confirmation message not found");
});

Then("Local Education Agency appears on list", async () => {
    await models.edOrgsPage.waitForListLoad();
    ok(await models.edOrgsPage.isLEAPresentOnPage(), "Local Education Agency not found in page");
    await takeScreenshot("New Education Agency Added");
});

Then("Local Education Agency is deleted", async () => {
    ok(await models.edOrgsPage.deletedConfirmationAppears(), "Confirmation message not found");
    await takeScreenshot("Local Education Agency Deleted");
});
