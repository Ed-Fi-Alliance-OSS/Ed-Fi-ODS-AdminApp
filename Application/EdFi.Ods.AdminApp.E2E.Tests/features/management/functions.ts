import { mkdir } from "fs/promises";
import { context, currentTest, page } from "./setup";

export async function saveTrace(): Promise<void> {
    if (process.env.TRACE) {
        const traceFolder = "./traces";
        mkdir(traceFolder).catch(() => {});
        const path = `${traceFolder}/${currentTest.feature}/${currentTest.scenario}/trace.zip`;

        await context.tracing.stop({ path });
    }
}

export async function takeScreenshot(name: string): Promise<void> {
    await page.screenshot({
        path: `./screenshots/${currentTest.feature}/${currentTest.scenario}/${name}.png`,
    });
}
