import { Before, BeforeAll, setDefaultTimeout } from "@cucumber/cucumber";
import { chromium, Browser, BrowserContext, Page } from "playwright";
import { ModelResolver } from "../models/modelResolver";

import dotenv = require("dotenv");

dotenv.config();
setDefaultTimeout(60 * 1000);

export let browser: Browser;
export let page: Page;
export let context: BrowserContext;
export let models: ModelResolver;
export let currentScenarioName: string;

Before(async (scenario) => {
    context = await browser.newContext({ acceptDownloads: true, ignoreHTTPSErrors: true });

    if (process.env.TRACE) {
        await context.tracing.start({ screenshots: true, snapshots: true });
    }

    page = await context.newPage();
    models = new ModelResolver(page);
    setScenarioName(scenario.pickle.name);
});

BeforeAll(async () => {
    browser =
        process.env.GITHUB_ACTIONS || process.env.HEADLESS === "true"
            ? await chromium.launch()
            : await chromium.launch({ headless: false });
});

function setScenarioName(scenarioName: string) {
    currentScenarioName =
        scenarioName.indexOf("Outline") > -1
            ? scenarioName.substr(scenarioName.indexOf(":") + 1, scenarioName.length)
            : scenarioName;
}
