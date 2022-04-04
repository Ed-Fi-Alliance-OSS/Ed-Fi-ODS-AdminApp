import { context } from "../management/setup";
import { AdminAppPage } from "./adminAppPage";

export class VendorsPage extends AdminAppPage {
    titleMsg = "div > h7";
    tableBody = "table#vendors-table tbody";
    helpSection = "#security-hint.collapse.in";
    activeTab = "ul.nav-tabs li.active";
    collapseSectionBtn = "#security-hint a#hide-security-hint-link";
    expandSectionBtn = "#show-security-hint-link a";
    addVendorBtn = 'button[data-target=".add-vendor-modal"]';
    saveChangesBtn = 'button[type="submit"]';
    deleteVendorBtn = "a.delete-vendor-link";
    vendorOnList = `${this.tableBody} .tr-custom th`;
    deleteConfirmSelector = "div.alert:not(.hidden)";

    vendorFormSelectors = {
        name: 'input[name="Company"]',
        namespacePrefix: 'textarea[name="NamespacePrefixes"]',
        addNamespacePrefix: "input#add-namespace-prefix-input",
        addNamespacePrefixBtn: "button#add-namespace-prefix",
        contact: 'input[name="ContactName"]',
        email: 'input[name="ContactEmailAddress"]',
    };

    vendorFormValues = {
        name: "Test Vendor",
        initialNamespacePrefix: "uri://ed-fi.org",
        addedNamespacePrefix: "uri://added.ed-fi.org",
        email: "test@ed-fi.org",
        contact: "Test Contact",
    };

    confirmationMessages = {
        added: "Vendor added successfully",
        deleted: "Vendor removed successfully",
    };

    modalTitleMessages = {
        addVendor: "Add Vendor",
    };

    deleteVendorConfirmationMessage = `Are you sure you want to permanently delete vendor ${this.vendorFormValues.name}?`;

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

    async addVendor(): Promise<void> {
        await this.page.locator(this.addVendorBtn).click();
    }

    async fillVendorForm(): Promise<void> {
        await this.fillVendorName();
        await this.fillNamespacePrefix();
        await this.fillContactName();
        await this.fillContactEmail();
    }

    async addNamespacePrefix(): Promise<void> {
        await this.modalSelector
            .locator(this.vendorFormSelectors.addNamespacePrefix)
            .fill(this.vendorFormValues.addedNamespacePrefix);
        await this.modalSelector.locator(this.vendorFormSelectors.addNamespacePrefixBtn).click();
    }

    async hasPrefixAdded(): Promise<boolean> {
        return (
            await this.modalSelector.locator(this.vendorFormSelectors.namespacePrefix).inputValue()
        ).includes(this.vendorFormValues.addedNamespacePrefix);
    }

    async saveVendorForm() {
        await Promise.all([
            this.waitForResponse({
                url: "/GlobalSettings/AddVendor",
            }),
            this.saveForm(),
        ]);
    }

    async isVendorPresentOnPage(): Promise<boolean> {
        return await this.hasText({ text: this.vendorFormValues.name, selector: this.vendorOnList });
    }

    async noVendorsMessageVisible(): Promise<boolean> {
        return this.hasText({ text: "Added vendors will appear here" });
    }

    async clickDelete(): Promise<void> {
        await this.page.locator(this.deleteVendorBtn).click();
    }

    async clickConfirmDelete(): Promise<void> {
        await this.modalSelector.locator(this.saveChangesBtn).click();
    }

    async deleteVendor(): Promise<void> {
        await Promise.all([
            this.clickConfirmDelete(),
            this.waitForResponse({ url: "GlobalSettings/DeleteVendor" }),
        ]);
    }

    async addVendorFullSteps(): Promise<void> {
        await this.navigate();
        await this.addVendor();
        await this.fillVendorForm();
        await this.saveVendorForm();
        if ((await this.getToastMessage()) !== this.confirmationMessages.added) {
            throw "confirmation of vendor added not found";
        }
        await this.isVendorPresentOnPage();
    }

    async deleteVendorFullSteps(): Promise<void> {
        await this.hasPageTitle();
        await this.clickDelete();
        await this.deleteVendor();
    }

    async getDeleteVendorMessage(): Promise<string | null> {
        return await this.modalSelector.locator(this.deleteConfirmSelector).textContent();
    }

    private async fillVendorName(value = this.vendorFormValues.name): Promise<void> {
        await this.modalSelector.locator(this.vendorFormSelectors.name).fill(value);
    }

    private async fillNamespacePrefix(): Promise<void> {
        await this.modalSelector
            .locator(this.vendorFormSelectors.namespacePrefix)
            .fill(this.vendorFormValues.initialNamespacePrefix);
    }

    private async fillContactName(): Promise<void> {
        await this.modalSelector
            .locator(this.vendorFormSelectors.contact)
            .fill(this.vendorFormValues.contact);
    }

    private async fillContactEmail(): Promise<void> {
        await this.modalSelector.locator(this.vendorFormSelectors.email).fill(this.vendorFormValues.email);
    }

    private async saveForm(): Promise<void> {
        await this.modalSelector.locator(this.saveChangesBtn).click();
    }
}
