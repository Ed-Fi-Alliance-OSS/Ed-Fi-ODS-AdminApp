import { Given, Then, When } from "@cucumber/cucumber";
import { ok } from "assert";
import { takeScreenshot } from "../management/functions";
import { models } from "../management/setup";
import { validatePath } from "../management/validators";

Given("register button is present", async () => {
    ok(models.loginPage.hasRegisterButton());
});

When("clicking on register as a new user", async() => {
    await models.loginPage.startRegistration();
});

When("user enters valid email and password", async () => {
    await models.loginPage.fillForm(process.env.email, process.env.password);
});

When("password confirmation", async () => {
    await models.loginPage.fillPasswordConfirm(process.env.password);
});

When("clicks Log in", async () => {
    await models.loginPage.login();
});

When("clicks Register", async () => {
    await models.loginPage.register();
});

Then("login is successful", async () => {
    validatePath(models.homePage.path(), true);
    ok(await models.homePage.hasGlobalOption());
    ok(await models.homePage.hasSettingsOption());
    await takeScreenshot("login successful");
});

Then("registration is successful", async () => {
    validatePath(models.firstTimeSetupPage.path(), true);
    ok(await models.firstTimeSetupPage.hasTitle());
    await takeScreenshot("registration successful");
});
