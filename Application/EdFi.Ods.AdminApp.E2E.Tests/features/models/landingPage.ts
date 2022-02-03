import { AdminAppPage } from "./adminAppPage";

export class LandingPage extends AdminAppPage {
    path(): string {
        return this.url;
    }

    hasPageTitle(): Promise<boolean> {
        return this.hasText({ text: "Ed-Fi ODS Admin App for Suite 3" });
    }
}
