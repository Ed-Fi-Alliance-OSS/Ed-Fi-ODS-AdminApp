import { mkdir } from "fs/promises";
import { context, currentScenarioName, page } from "./setup";

export async function saveTrace() {
    const traceFolder = "./traces";
    mkdir(traceFolder).catch(() => {});
    if (process.env.TRACE) {
        await context.tracing.stop({ path: `./traces/${currentScenarioName} - trace.zip` });
    }
}

export async function takeScreenshot(name: string): Promise<void> {
    await page.screenshot({
        path: `./screenshots/${currentScenarioName} - ${name}.png`,
    });
}
