import { After, AfterAll } from "@cucumber/cucumber";
import { saveTrace } from "./functions";
import { page, browser, currentScenarioName, models } from "./setup";

After(async () => {
    await cleanup();
    await saveTrace();
});

AfterAll(() => {
    if (!page?.isClosed()) {
        browser.close();
    }
});

async function cleanup(): Promise<void> {
    if (currentScenarioName.match(".*(Add|Edit|Collapse) Local Education Agency.*")) {
        await models.edOrgsPage.navigate();
        await models.edOrgsPage.deleteLEAFullSteps();
    }
}
