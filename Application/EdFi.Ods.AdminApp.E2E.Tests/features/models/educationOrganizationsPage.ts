import { Locator } from "playwright";
import { AdminAppPage } from "./adminAppPage";

export class EducationOrganizationsPage extends AdminAppPage {
    titleMsg = "div > h6";
    openModal = "div.modal.fade.in";
    addNewLeaBtn = 'button[data-target="#add-lea-modal"]';
    modalTitleSection = "h4.modal-title";
    confirmBtn = 'button[type="submit"]';
    nameOnList = ".panel-section h8";
    deleteLEABtn = "a.delete-lea-link";
    editLEABtn = ".row.heading a:has(.fa-pencil)";

    leaFormSelectors = {
        ID: 'input[name="LocalEducationAgencyId"]',
        name: 'input[name="Name"]',
        address: 'input[name="StreetNumberName"]',
        city: 'input[name="City"]',
        state: 'select[name="State"]',
        zip: 'input[name="ZipCode"]',
    };

    get modalSelector(): Locator {
        return this.page.locator(this.openModal);
    }

    leaFormValues = {
        ID: "1",
        name: "LEA Test",
        address: "123 street",
        city: "Austin",
        state: "TX",
        zip: "11208",
    };

    get editedFormValueName(): string {
        return `${this.leaFormValues.name} - Edited`;
    }

    confirmationMessages = {
        leaAdded: "Organization Added",
        leaEdited: "Organization Updated",
        leaDeleted: "Organization Removed",
    };

    modalTitleMessages = {
        AddLEA: "Add Local Education Agency",
        EditLEA: "Edit Local Education Agency",
        DeleteLEA: "Delete Local Education Agency",
    };

    path(): string {
        return `${this.url}/EducationOrganizations/LocalEducationAgencies`;
    }

    async hasPageTitle(): Promise<boolean> {
        return await this.hasText({
            text: "Education Organizations",
            selector: this.titleMsg,
        });
    }

    async waitForListLoad(): Promise<void> {
        await this.waitForResponse({ url: "/EducationOrganizations/LocalEducationAgency" });
    }

    async addNewLEA(): Promise<void> {
        await this.page.locator(this.addNewLeaBtn).click();
    }

    async hasAddLEAModalTitle(): Promise<boolean> {
        return (await this.getModalTitle()) === this.modalTitleMessages.AddLEA;
    }

    async hasEditLEAModalTitle(): Promise<boolean> {
        return (await this.getModalTitle()) === this.modalTitleMessages.EditLEA;
    }

    async hasDeleteLEAModalTitle(): Promise<boolean> {
        return (await this.getModalTitle()) === this.modalTitleMessages.DeleteLEA;
    }

    async hasDeleteModalConfirmationMessage(): Promise<boolean> {
        return this.hasText({
            text: `Are you sure you want to permanently delete ${this.leaFormValues.name}`,
            selector: ".modal.fade.in .modal-body",
        });
    }

    async fillLEAForm(): Promise<void> {
        await this.fillLEAId();
        await this.fillLEAName();
        await this.fillAddress();
        await this.fillCity();
        await this.selectState();
        await this.fillZipCode();
    }

    async editLEAForm(): Promise<void> {
        await this.fillLEAName(this.editedFormValueName);
    }

    async saveLEAForm(): Promise<void> {
        await Promise.all([
            this.waitForResponse({ url: "/EducationOrganizations/AddLocalEducationAgency" }),
            this.saveForm(),
        ]);
    }

    async saveEditedLEAForm(): Promise<void> {
        await Promise.all([
            this.waitForResponse({ url: "/EducationOrganizations/EditLocalEducationAgency" }),
            this.saveForm(),
        ]);
    }

    async isLEAPresentOnPage(): Promise<boolean> {
        return this.hasText({ text: this.leaFormValues.name, selector: this.nameOnList });
    }

    async isEditedLEAPresentOnPage(): Promise<boolean> {
        return this.hasText({ text: this.editedFormValueName, selector: this.nameOnList });
    }

    async clickEdit(): Promise<void> {
        await this.page.locator(this.editLEABtn).click();
    }

    async clickDelete(): Promise<void> {
        await this.page.locator(this.deleteLEABtn).click();
    }

    async deleteLEA(): Promise<void> {
        await Promise.all([
            this.clickConfirmDelete(),
            this.waitForResponse({ url: "/EducationOrganizations/DeleteLocalEducationAgency" }),
        ]);
    }

    async deleteLEAFullSteps(): Promise<void> {
        await this.hasPageTitle();
        await this.clickDelete();
        await this.deleteLEA();
    }

    async addLocalEducationAgencyFullSteps(): Promise<void> {
        await this.navigate();
        await this.addNewLEA();
        await this.fillLEAForm();
        await this.saveLEAForm();
        await this.waitForListLoad();
    }

    private async getModalTitle(): Promise<string> {
        const content = await this.modalSelector.locator(this.modalTitleSection).textContent();
        return content ? content : "";
    }

    private async clickConfirmDelete(): Promise<void> {
        await this.modalSelector.locator(this.confirmBtn).click();
    }

    private async fillLEAId(): Promise<void> {
        await this.modalSelector.locator(this.leaFormSelectors.ID).fill(this.leaFormValues.ID);
    }

    private async fillLEAName(value = this.leaFormValues.name): Promise<void> {
        await this.modalSelector.locator(this.leaFormSelectors.name).fill(value);
    }

    private async fillAddress(): Promise<void> {
        await this.modalSelector.locator(this.leaFormSelectors.address).fill(this.leaFormValues.address);
    }

    private async fillCity(): Promise<void> {
        await this.modalSelector.locator(this.leaFormSelectors.city).fill(this.leaFormValues.city);
    }

    private async selectState(): Promise<void> {
        await this.modalSelector
            .locator(this.leaFormSelectors.state)
            .selectOption({ label: this.leaFormValues.state });
    }

    private async fillZipCode(): Promise<void> {
        await this.modalSelector.locator(this.leaFormSelectors.zip).fill(this.leaFormValues.zip);
    }

    private async saveForm(): Promise<void> {
        await this.modalSelector.locator(this.confirmBtn).click();
    }
}
