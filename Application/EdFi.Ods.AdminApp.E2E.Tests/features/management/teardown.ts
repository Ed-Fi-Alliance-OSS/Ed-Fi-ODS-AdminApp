import { After, AfterAll } from "@cucumber/cucumber";
import { TestStepResultStatus } from "@cucumber/messages";
import { saveTrace } from "./functions";
import { page, browser, models, currentScenarioName } from "./setup";

After(async (scenario) => {
    if (scenario.result?.status === TestStepResultStatus.PASSED) {
        await cleanup();
    }
    await saveTrace();
});

AfterAll(() => {
    if (!page?.isClosed()) {
        browser.close();
    }
});

async function cleanup(): Promise<void> {
    if (currentScenarioName.match(".*(Add|Edit|Collapse) Local Education Agency( Section)?$")) {
        try {
            await models.edOrgsPage.navigate();
            await models.edOrgsPage.deleteLEAFullSteps();
        } catch (error) {
            console.info(`Item to delete not found\n${error}`);
        }
    }
}
