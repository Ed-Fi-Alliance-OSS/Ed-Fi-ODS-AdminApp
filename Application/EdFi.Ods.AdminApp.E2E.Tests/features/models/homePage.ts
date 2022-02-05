import { AdminAppPage } from "./adminAppPage";

export class HomePage extends AdminAppPage {
    logoutBtn = "li a:text('Log Out')";

    path(): string {
        return `${this.url}/`;
    }

    async hasSettingsOption(): Promise<boolean> {
        return await this.hasText({ text: "Settings" });
    }

    async hasGlobalOption(): Promise<boolean> {
        return await this.hasText({ text: "Global" });
    }

    async logout() {
        await Promise.all([this.clickLogout(), this.page.waitForNavigation()]);
    }

    private async clickLogout() {
        await this.page.click(this.logoutBtn);
    }
}
