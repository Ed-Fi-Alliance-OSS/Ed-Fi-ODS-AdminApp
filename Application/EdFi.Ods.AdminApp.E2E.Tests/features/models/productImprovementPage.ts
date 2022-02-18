import { AdminAppPage } from "./adminAppPage";

export class ProductImprovementPage extends AdminAppPage {
    path(): string {
        return `${this.url}/ProductImprovement/EnableProductImprovement`;
    }

    firstTimePath(): string {
        return `${this.url}/ProductImprovement/EnableProductImprovementFirstTimeSetup`;
    }

    async hasPageTitle(): Promise<boolean> {
        return await this.hasText({ text: "Enable Product Improvement", selector: "h2" });
    }

    isOnFirstTimeProductImprovementPage(): boolean {
        return this.page.url() === this.firstTimePath();
    }
}
