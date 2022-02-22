import { AdminAppPage } from "./adminAppPage";

export class ProductImprovementPage extends AdminAppPage {

    //Override
    get isOnPage(): boolean {
        const currentURL = this.page.url();
        const baseURL = currentURL.substring(0, currentURL.indexOf("?"));
        const URL = baseURL === "" ? currentURL : baseURL;
        return URL === this.path() || URL === this.firstTimePath();
    }

    path(): string {
        return `${this.url}/ProductImprovement/EnableProductImprovement`;
    }

    firstTimePath(): string {
        return `${this.url}/ProductImprovement/EnableProductImprovementFirstTimeSetup`;
    }

    async hasPageTitle(): Promise<boolean> {
        return await this.hasText({ text: "Enable Product Improvement", selector: "h2" });
    }
}
