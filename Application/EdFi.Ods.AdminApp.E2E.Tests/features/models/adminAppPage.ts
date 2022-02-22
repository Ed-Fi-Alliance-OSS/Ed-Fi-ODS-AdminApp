import { Page } from "playwright";

export abstract class AdminAppPage {
    page: Page;

    title = ".container h2";
    toast = "#toast-container";
    loadingSelector = ".footable-loader";
    validationErrors = "div#validationSummary:not(.hidden)";

    protected get url(): string {
        if (!process.env.URL) {
            throw "URL not found. Verify that URL is set in .env file";
        }
        return process.env.URL;
    }

    get isOnPage(): boolean {
        const currentURL = this.page.url();
        const baseURL = currentURL.substring(0, currentURL.indexOf("?"));
        const URL = baseURL === "" ? currentURL : baseURL;
        return URL === this.path();
    }

    constructor(page: Page) {
        this.page = page;
    }

    abstract path(): string;

    async navigate(): Promise<void> {
        if (!this.isOnPage) {
            await this.page.goto(this.path(), { waitUntil: "networkidle" });
        }
    }

    async waitForResponse({ url, status = 200 }: { url: string; status?: number }): Promise<void> {
        await this.page.waitForResponse(
            (response) => response.url().includes(url) && response.status() === status
        );
    }

    async getToastMessage(): Promise<string | null> {
        return await this.getText(this.toast);
    }

    protected async getText(text: string): Promise<string | null> {
        return this.page.textContent(text);
    }

    protected async hasText({
        text,
        selector = "div",
    }: {
        text: string;
        selector?: string;
    }): Promise<boolean> {
        return await this.elementExists(`div.container ${selector}:has-text("${text}")`);
    }

    protected async elementExists(selector: string): Promise<boolean> {
        return (await this.page.locator(selector).count()) > 0;
    }
}
