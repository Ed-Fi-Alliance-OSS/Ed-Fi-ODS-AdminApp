import { Given, Then, When } from "@cucumber/cucumber";
import { strictEqual, ok } from "assert";
import { takeScreenshot } from "../management/functions";
import { models } from "../management/setup";

Given("there's a Local Education Agency added", async () => {
    await models.edOrgsPage.navigate();
    if (await models.edOrgsPage.isLEAPresentOnPage()) {
        return Promise.resolve("LEA is already present");
    }
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

When("clicking save Local Education Agency with errors", async () => {
    await models.edOrgsPage.saveLEAForm({ expectErrors: true });
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

When("entering Local Education Agency form {string}", async (scenario: string) => {
    switch (scenario) {
        case "wrong id":
            await models.edOrgsPage.fillLEAForm();
            await models.edOrgsPage.fillInvalidId();
            break;
        case "no data":
        default:
            break;
    }
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

Then("Local Education Agency validation for {string} appears", async (scenario: string) => {
    const errors = await models.edOrgsPage.getErrorMessages();

    switch (scenario) {
        case "no data":
            ok(
                errors?.includes(models.edOrgsPage.errorMessages.noData),
                `Error message failed. Actual message: ${errors}`
            );
            break;
        case "wrong id":
            ok(
                errors?.includes(models.edOrgsPage.errorMessages.invalidID),
                `ID error message failed. Actual message: ${errors}`
            );
            break;
        case "duplicated id":
            ok(
                errors?.includes(models.edOrgsPage.errorMessages.duplicatedID),
                `Error message failed. Actual message: ${errors}`
            );
            break;
        default:
            break;
    }
});

Then("field with errors for {string} are highlighted", async (scenario: string) => {
    switch (scenario) {
        case "wrong id":
        case "duplicated id":
            ok(await models.edOrgsPage.idFieldHasError());
            break;
        case "no data":
            ok(await models.edOrgsPage.allFieldsHaveError());
            break;
        default:
            break;
    }
    await takeScreenshot("Validation errors");
});

Then("modal is dismissed", async () => {
    await models.edOrgsPage.dismissModal();
});
