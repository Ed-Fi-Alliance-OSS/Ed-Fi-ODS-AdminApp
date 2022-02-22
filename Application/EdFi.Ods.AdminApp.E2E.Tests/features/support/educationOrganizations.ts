import { Given, Then, When } from "@cucumber/cucumber";
import { ok } from "assert";
import { takeScreenshot } from "../management/functions";
import { models } from "../management/setup";

Given("Education Organization list has loaded", async () => {
    ok(await models.edOrgsPage.hasPageTitle(), "Page title not found");
});

When("adding new Local Education Agency", async () => {
    await models.edOrgsPage.addNewLEA();
});

When("filling Local Education Agency form", async () => {
    ok(await models.edOrgsPage.hasLEAModalTitle(), "Modal title not found");

    await models.edOrgsPage.fillLEAForm();
});

When("clicking save Local Education Agency", async () => {
    await models.edOrgsPage.saveLEAForm();
});

Then("Local Education Agency is saved", async () => {
    ok(await models.edOrgsPage.confirmationAppears(), "Confirmation message not found");
});

Then("Local Education Agency appears on list", async () => {
    await models.edOrgsPage.waitForListLoad();
    ok(await models.edOrgsPage.isLEAPresentOnPage(), "Local Education Agency not found in page");
    await takeScreenshot("New Education Agency Added");
});
