import { AdminAppPage } from "./adminAppPage";

export class FirstTimeSetupPage extends AdminAppPage {
    continueBtn = "a#finish-setup-link";

    path(): string {
        return `${this.url}/Setup/FirstTimeSetup`;
    }

    hasTitle() {
        return this.hasText({ text: "Additional Setup Required" });
    }

    async continue(url: string): Promise<void> {
        await Promise.all([this.clickContinue(), this.page.waitForNavigation({ url })]);
    }

    private async clickContinue(): Promise<void> {
        await this.page.click(this.continueBtn);
    }
}
