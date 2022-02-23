import { AdminAppPage } from "./adminAppPage";

export class EducationOrganizationsPage extends AdminAppPage {
    titleMsg = "h6";
    addNewLeaBtn = 'button[data-target="#add-lea-modal"]';
    openModal = "div.container div.modal.fade.in";
    modalTitleSection = `${this.openModal} h4.modal-title`;
    confirmBtn = `${this.openModal} button[type="submit"]`;
    nameOnList = ".panel-section h8";
    deleteLEABtn = "a.delete-lea-link";

    leaFormSelectors = {
        ID: `${this.openModal} input[name="LocalEducationAgencyId"]`,
        name: `${this.openModal} input[name="Name"]`,
        address: `${this.openModal} input[name="StreetNumberName"]`,
        city: `${this.openModal} input[name="City"]`,
        state: `${this.openModal} select[name="State"]`,
        zip: `${this.openModal} input[name="ZipCode"]`,
    };

    leaFormValues = {
        ID: "1",
        name: "LEA Test",
        address: "123 street",
        city: "Austin",
        state: "TX",
        zip: "11208",
    };

    confirmationMessages = {
        leaAdded: "Organization Added",
        leaDeleted: "Organization Removed",
    };

    modalTitleMessages = {
        AddLEA: "Add Local Education Agency",
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

    async waitForListLoad() {
        await this.waitForResponse({ url: "/EducationOrganizations/LocalEducationAgency" });
    }

    async addNewLEA(): Promise<void> {
        await this.page.click(this.addNewLeaBtn);
    }

    async hasAddLEAModalTitle(): Promise<boolean> {
        return (
            (await this.page.locator(this.modalTitleSection).textContent()) === this.modalTitleMessages.AddLEA
        );
    }

    async hasDeleteLEAModalTitle(): Promise<boolean> {
        return (
            (await this.page.locator(this.modalTitleSection).textContent()) ===
            this.modalTitleMessages.DeleteLEA
        );
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
        await this.selectState(), await this.fillZipCode();
    }

    async saveLEAForm(): Promise<void> {
        await Promise.all([
            this.waitForResponse({ url: "/EducationOrganizations/AddLocalEducationAgency" }),
            this.saveForm(),
        ]);
    }

    async isLEAPresentOnPage(): Promise<boolean> {
        return this.hasText({ text: this.leaFormValues.name, selector: this.nameOnList });
    }

    async addedConfirmationAppears(): Promise<boolean> {
        return (await this.getToastMessage()) === this.confirmationMessages.leaAdded;
    }

    async deletedConfirmationAppears(): Promise<boolean> {
        return (await this.getToastMessage()) === this.confirmationMessages.leaDeleted;
    }

    async clickDelete(): Promise<void> {
        await this.page.click(this.deleteLEABtn);
    }

    async deleteLEA() {
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
        await this.addedConfirmationAppears();
        await this.waitForListLoad();
    }

    private async clickConfirmDelete(): Promise<void> {
        await this.page.click(this.confirmBtn);
    }

    private async fillLEAId(): Promise<void> {
        await this.page.fill(this.leaFormSelectors.ID, this.leaFormValues.ID);
    }

    private async fillLEAName(): Promise<void> {
        await this.page.fill(this.leaFormSelectors.name, this.leaFormValues.name);
    }

    private async fillAddress(): Promise<void> {
        await this.page.fill(this.leaFormSelectors.address, this.leaFormValues.address);
    }

    private async fillCity(): Promise<void> {
        await this.page.fill(this.leaFormSelectors.city, this.leaFormValues.city);
    }

    private async selectState(): Promise<void> {
        await this.page.selectOption(this.leaFormSelectors.state, { label: this.leaFormValues.state });
    }

    private async fillZipCode(): Promise<void> {
        await this.page.fill(this.leaFormSelectors.zip, this.leaFormValues.zip);
    }

    private async saveForm(): Promise<void> {
        this.page.locator(this.confirmBtn).click();
    }
}
