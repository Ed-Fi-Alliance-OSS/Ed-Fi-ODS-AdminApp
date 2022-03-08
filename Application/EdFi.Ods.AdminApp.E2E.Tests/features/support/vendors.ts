import { Given, Then, When } from "@cucumber/cucumber";
import { models } from "../management/setup";
import { ok } from "assert";

Given("Vendor page has loaded", async () => {
    ok(await models.vendorsPage.hasTabSelected(), "Vendors tab not selected");
    ok(await models.vendorsPage.hasPageTitle(), "Page title not found");
});

When("help section is present", async () => {
    ok(await models.vendorsPage.hasHelpSection(), "Help section not found");
});

Then("help section can be collapsed", async () => {
    await models.vendorsPage.collapseHelpSection();
    ok(await models.vendorsPage.helpSectionFlag(), "Hide help not set");
});

Then("help section can be expanded", async () => {
    await models.vendorsPage.showHelpSection();
    ok(!(await models.vendorsPage.helpSectionFlag()), "Hide help set");
});
