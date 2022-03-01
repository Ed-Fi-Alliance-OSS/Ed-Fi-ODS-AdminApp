import { After, AfterAll } from "@cucumber/cucumber";
import { TestStepResultStatus } from "@cucumber/messages";
import { saveTrace } from "./functions";
import { page, browser, models, currentScenarioName } from "./setup";

After(async (scenario) => {
    if (scenario.result?.status === TestStepResultStatus.PASSED) {
        const steps = scenario.pickle.steps.map((step) => step.text);
        await cleanup(steps);
    }
    await saveTrace();
});

AfterAll(() => {
    if (!page?.isClosed()) {
        browser.close();
    }
});

async function cleanup(steps: string[]): Promise<void> {
    if (
        currentScenarioName.match(".*Add Local Education Agency$") ||
        (steps.includes("there's a Local Education Agency added") &&
            !currentScenarioName.match(".*Delete Local Education Agency$"))
    ) {
        try {
            await models.edOrgsPage.navigate();
            await models.edOrgsPage.deleteLEAFullSteps();
        } catch (error) {
            console.info(`Item to delete not found\n${error}`);
        }
    }
}
