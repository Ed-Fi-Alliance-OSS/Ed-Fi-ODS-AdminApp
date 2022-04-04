import { Given, Then, When } from "@cucumber/cucumber";
import { models } from "../management/setup";
import { ok, strictEqual } from "assert";

Given("there's a vendor added", async () => {
    await models.vendorsPage.navigate();
    if (await models.vendorsPage.isVendorPresentOnPage()) {
        return Promise.resolve("Vendor is already added");
    }
    await models.vendorsPage.addVendorFullSteps();
});

Given("vendor page has loaded", async () => {
    ok(await models.vendorsPage.hasTabSelected(), "Vendors tab not selected.");
    ok(await models.vendorsPage.hasPageTitle(), "Page title not found.");
});

Given("there are no vendors", async () => {
    ok(await models.vendorsPage.noVendorsMessageVisible(), "There are vendors on the page");
});

When("clicking add vendor", async () => {
    await models.vendorsPage.addVendor();
});

When("clicking delete vendor", async () => {
    await models.vendorsPage.clickDelete();
});

When("validation message has vendor name", async () => {
    ok(
        (await models.vendorsPage.getDeleteVendorMessage())?.includes(
            models.vendorsPage.deleteVendorConfirmationMessage
        ),
        "Validation message not correct"
    );
});

When("confirming delete vendor", async () => {
    await models.vendorsPage.deleteVendor();
});

When("filling vendor form", async () => {
    strictEqual(
        await models.vendorsPage.modalTitle(),
        models.vendorsPage.modalTitleMessages.addVendor,
        "Modal not found."
    );

    await models.vendorsPage.fillVendorForm();
});

When("adding vendor namespace prefix", async () => {
    await models.vendorsPage.addNamespacePrefix();
    ok(await models.vendorsPage.hasPrefixAdded(), "Namespace prefix not found.");
});

When("clicking save vendor", async () => {
    await models.vendorsPage.saveVendorForm();
});

When("help section is present", async () => {
    ok(await models.vendorsPage.hasHelpSection(), "Help section not found");
});

Then("vendor is added", async () => {
    strictEqual(
        await models.vendorsPage.getToastMessage(),
        models.vendorsPage.confirmationMessages.added,
        "Confirmation message not found"
    );
});

Then("vendor is deleted", async () => {
    strictEqual(
        await models.vendorsPage.getToastMessage(),
        models.vendorsPage.confirmationMessages.deleted,
        "Confirmation message not found"
    );
});

Then("vendor appears on list", async () => {
    ok(await models.vendorsPage.isVendorPresentOnPage(), "Vendor not found in page");
});

Then("help section can be collapsed", async () => {
    await models.vendorsPage.collapseHelpSection();
    ok(await models.vendorsPage.helpSectionFlag(), "Hide help not set");
});

Then("help section can be expanded", async () => {
    await models.vendorsPage.showHelpSection();
    ok(!(await models.vendorsPage.helpSectionFlag()), "Hide help set");
});
