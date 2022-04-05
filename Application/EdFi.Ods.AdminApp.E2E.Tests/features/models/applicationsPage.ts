import { AdminAppPage } from "./adminAppPage";

export class ApplicationsPage extends AdminAppPage {
    path(): string {
        return `${this.url}/Application`;
    }

    async applicationListHasLoaded(): Promise<void> {
        await this.waitForResponse({ url: "/Application/ApplicationList" });
    }
}
