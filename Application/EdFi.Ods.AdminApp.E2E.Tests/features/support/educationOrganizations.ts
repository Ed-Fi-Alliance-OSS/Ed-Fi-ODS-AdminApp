import { Given, Then, When } from "@cucumber/cucumber";
import { strictEqual, ok } from "assert";
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

When("modifying added Local Education Agency", async () => {
    ok(await models.edOrgsPage.hasEditLEAModalTitle(), "Modal title not found");

    await models.edOrgsPage.editLEAForm();
});

When("clicking save Local Education Agency", async () => {
    await models.edOrgsPage.saveLEAForm();
});

When("clicking save edited Local Education Agency", async () => {
    await models.edOrgsPage.saveEditedLEAForm();
});

When("clicking edit Local Education Agency", async () => {
    await models.edOrgsPage.clickEdit();
});

When("clicking delete Local Education Agency", async () => {
    await models.edOrgsPage.clickDelete();
});

When("confirming delete Local Education Agency", async () => {
    await models.edOrgsPage.hasDeleteLEAModalTitle();
    await models.edOrgsPage.hasDeleteModalConfirmationMessage();
    await models.edOrgsPage.deleteLEA();
});

When("clicking collapse Local Education Agency section", async () => {
    await models.edOrgsPage.clickCollapse();
});

Then("Local Education Agency section is collapsed", async () => {
    ok(await models.edOrgsPage.isSectionCollapsed(), "Section is not collapsed");
    await takeScreenshot("Section collapsed");
});

Then("Local Education Agency is added", async () => {
    strictEqual(
        await models.edOrgsPage.getToastMessage(),
        models.edOrgsPage.confirmationMessages.leaAdded,
        "Confirmation message not found"
    );
});

Then("Local Education Agency is edited", async () => {
    strictEqual(
        await models.edOrgsPage.getToastMessage(),
        models.edOrgsPage.confirmationMessages.leaEdited,
        "Confirmation message not found"
    );
});

Then("Local Education Agency appears on list", async () => {
    await models.edOrgsPage.waitForListLoad();
    ok(await models.edOrgsPage.isLEAPresentOnPage(), "Local Education Agency not found in page");
    await takeScreenshot("New Education Agency Added");
});

Then("edited Local Education Agency appears on list", async () => {
    await models.edOrgsPage.waitForListLoad();
    ok(await models.edOrgsPage.isEditedLEAPresentOnPage(), "Local Education Agency not found in page");
    await takeScreenshot("Education Agency Edited");
});

Then("Local Education Agency is deleted", async () => {
    strictEqual(
        await models.edOrgsPage.getToastMessage(),
        models.edOrgsPage.confirmationMessages.leaDeleted,
        "Confirmation message not found"
    );
    await takeScreenshot("Local Education Agency Deleted");
});
