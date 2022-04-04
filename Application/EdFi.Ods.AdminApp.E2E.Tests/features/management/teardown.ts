import { After, AfterAll } from "@cucumber/cucumber";
import { TestStepResultStatus } from "@cucumber/messages";
import { saveTrace, takeScreenshot } from "./functions";
import { page, browser, models, currentTest } from "./setup";

After(async (scenario) => {
    if (scenario.result?.status === TestStepResultStatus.PASSED) {
        await takeScreenshot("SUCCESS");
        const steps = scenario.pickle.steps.map((step) => step.text);
        await cleanup(steps);
    } else if (scenario.result?.status === TestStepResultStatus.FAILED) {
        await takeScreenshot("FAIL");
    }

    await saveTrace();
});

AfterAll(() => {
    if (!page?.isClosed()) {
        browser.close();
    }
});

async function cleanup(steps: string[]): Promise<void> {
    try {
        if (
            currentTest.scenario.match(".*Add local education agency$") ||
            (steps.includes("there's a local education agency added") &&
                !currentTest.scenario.match(".*Delete local education agency$"))
        ) {
            await models.edOrgsPage.navigate();
            await models.edOrgsPage.deleteLEAFullSteps();
        }

        if (currentTest.scenario.match(".*Add vendor$")) {
            await models.vendorsPage.navigate();
            await models.vendorsPage.deleteVendorFullSteps();
        }
    } catch (error) {
        console.info(`Item to delete for scenario ${currentTest.scenario} not found\n${error}`);
    }
}
