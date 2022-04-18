import { Page, Locator } from "playwright";

export abstract class AdminAppPage {
    page: Page;

    title = ".container h2";
    toast = "#toast-container";
    mainSelector = "div.container";
    loadingSelector = ".footable-loader";
    validationErrors = "div#validationSummary:not(.hidden)";
    openModal = "div.modal.fade.in";
    modalTitleSelector = "h4.modal-title";

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

    get modalSelector(): Locator {
        return this.page.locator(this.openModal);
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
        await this.page.waitForResponse((response) => {
            if (response.url().includes(url) && response.status() !== status) {
                return Promise.reject(new Error(`Expected status ${status}, got ${response.status()}`));
            }
            return response.url().includes(url) && response.status() === status;
        });
    }

    async getToastMessage(): Promise<string | null> {
        return await this.getText(this.toast);
    }

    async modalTitle(): Promise<string> {
        const content = await this.modalSelector.locator(this.modalTitleSelector).textContent();
        return content ? content : "";
    }

    async hasModalOpen(): Promise<boolean> {
        return this.elementExists(this.openModal);
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
        return await this.elementExists(`${this.mainSelector} ${selector}:has-text("${text}")`);
    }

    protected async elementExists(selector: string): Promise<boolean> {
        return (await this.page.locator(selector).count()) > 0;
    }
}
