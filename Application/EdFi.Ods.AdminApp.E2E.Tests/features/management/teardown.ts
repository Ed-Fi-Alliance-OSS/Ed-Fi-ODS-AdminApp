import { After, AfterAll } from "@cucumber/cucumber";
import { saveTrace } from "./functions";
import { page, browser } from "./setup";

After(async () => {
    await saveTrace();
});

AfterAll(() => {
    if (!page?.isClosed()) {
        browser.close();
    }
});
