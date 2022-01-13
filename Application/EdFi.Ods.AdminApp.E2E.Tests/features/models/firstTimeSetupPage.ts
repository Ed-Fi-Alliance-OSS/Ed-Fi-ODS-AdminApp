import { AdminAppPage } from "./adminAppPage";

export class FirstTimeSetupPage extends AdminAppPage {
    path(): string {
        return `${this.url}/Setup/FirstTimeSetup`;
    }

    hasTitle() {
        return this.hasText('Additional Setup Required');
    }

}
