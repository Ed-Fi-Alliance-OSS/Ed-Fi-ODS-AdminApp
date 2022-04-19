import { Then, When } from "@cucumber/cucumber";
import { ok } from "assert";
import { models } from "../management/setup";
import { takeScreenshot } from "../management/functions";

When("clicking Continue", async () => {
    await models.firstTimeSetupPage.continue(models.productImprovementPage.firstTimePath());
});

Then("first time setup is successful", async () => {
    ok(
        models.productImprovementPage.isOnFirstTimeProductImprovementPage(),
        `Page not expected. Current page is ${models.homePage.page.url()}`
    );
    ok(await models.productImprovementPage.hasPageTitle(), "Title not found");

    await takeScreenshot("first time setup successful");
});
