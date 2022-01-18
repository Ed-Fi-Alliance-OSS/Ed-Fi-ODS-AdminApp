import { AdminAppPage } from "./adminAppPage";

export class HomePage extends AdminAppPage {
    path(): string {
        return `${this.url}/`;
    }

    async hasSettingsOption(): Promise<boolean> {
        return await this.hasText({ text: "Settings" });
    }

    async hasGlobalOption(): Promise<boolean> {
        return await this.hasText({ text: "Global" });
    }
}
