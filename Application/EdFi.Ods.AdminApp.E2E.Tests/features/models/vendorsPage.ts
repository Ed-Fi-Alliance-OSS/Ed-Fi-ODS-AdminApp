import { context } from "../management/setup";
import { AdminAppPage } from "./adminAppPage";

export class VendorsPage extends AdminAppPage {
    titleMsg = "div > h7";
    helpSection = "#security-hint.collapse.in";
    activeTab = "ul.nav-tabs li.active";
    collapseSectionBtn = "#security-hint a#hide-security-hint-link";
    expandSectionBtn = "#show-security-hint-link a";

    path(): string {
        return `${this.url}/GlobalSettings/Vendors`;
    }

    async hasPageTitle(): Promise<boolean> {
        return await this.hasText({
            text: "Vendors",
            selector: this.titleMsg,
        });
    }

    async hasHelpSection(): Promise<boolean> {
        return await this.elementExists(this.helpSection);
    }

    async collapseHelpSection() {
        await this.page.locator(this.collapseSectionBtn).click();
    }

    async hasTabSelected(): Promise<boolean> {
        return await this.hasText({
            text: "Vendors",
            selector: this.activeTab,
        });
    }

    async helpSectionFlag(): Promise<boolean> {
        return (
            (await context.storageState()).origins
                .find((o) => this.url.includes(o.origin))
                ?.localStorage?.find((l) => l.name === "HideSecurityHelpfulHint")?.value === "true"
        );
    }

    async showHelpSection(): Promise<void> {
        await this.page.locator(this.expandSectionBtn).click();
    }
}
