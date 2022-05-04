// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

import { apiContext, setApiContext } from "../management/setup";
import { AdminAppPage } from "./adminAppPage";

interface Credentials {
    Key: string;
    Secret: string;
    ODS_URL: string;
}

export class ApplicationsPage extends AdminAppPage {
    activeTabSelector = "ul.nav li.active";
    apiURLSelector = "a.copy-to-clipboard";
    errorMsgSection = "div.validationSummary";
    addApplicationBtn = 'button[type="submit"]';
    addNewApplicationBtn = "button.loads-ajax-modal";
    keySelector = ".key-generated:has-text('Key')";
    secretSelector = ".key-generated:has-text('Secret')";
    odsURLSelector = ".key-generated:has-text('API URL')";
    credentials!: Credentials;

    applicationFormSelectors = {
        name: 'input[name="ApplicationName"]',
        lea: 'span label:text("Local Education Agency")',
        leaSelectBtn: 'div[data-edorg-type="1"] button.dropdown-toggle',
        leaSelect: 'div[data-edorg-type="1"] select',
        claimSetSelect: 'select[name="ClaimSetName"]',
    };

    applicationFormValues = {
        name: "Automated Application",
        lea: "Automated LEA",
    };

    confirmationMessages = {};

    modalTitleMessages = {
        addApplication: "Add Application to Vendor",
        addedSecret: "Add Application",
    };

    path(): string {
        return `${this.url}/Application`;
    }

    async waitForListLoad(): Promise<void> {
        await this.waitForResponse({ url: "/Application/ApplicationList" });
    }

    async addNewApplication(): Promise<void> {
        await this.page.locator(this.addNewApplicationBtn).click();
    }

    async fillApplicationForm(): Promise<void> {
        await this.fillApplicationName();
        await this.selectLEA();
        await this.selectOrganizationId();
        await this.selectClaimSet("Ed-Fi Sandbox");
    }

    async saveApplicationForm({ expectErrors = false }: { expectErrors?: boolean } = {}): Promise<void> {
        try {
            await Promise.all([
                this.waitForResponse({
                    url: "/Application/Add",
                    status: expectErrors ? 400 : 200,
                }),
                this.saveForm(),
            ]);
        } catch (error) {
            throw `${error}\nErrors saving form:\n${await this.getErrorMessages()}`;
        }
    }

    async isApplicationPresentOnPage(): Promise<boolean> {
        throw new Error("Method not implemented.");
    }

    async hasTabSelected(): Promise<boolean> {
        return await this.hasText({
            text: "Applications",
            selector: this.activeTabSelector,
        });
    }

    async clickURL(): Promise<void> {
        await this.page.locator(this.apiURLSelector).click();
    }

    async hasCopiedURLMessage(): Promise<boolean> {
        return await this.elementExists(`${this.apiURLSelector} span:has-text("${"Copied to clipboard!"}")`);
    }

    async apiURLIsValid(): Promise<boolean> {
        const apiURL = await this.page.locator(this.apiURLSelector).getAttribute("data-clipboard-text");
        if (!apiURL) {
            return false;
        }
        const getAPI = await apiContext.get(apiURL);
        return getAPI.ok();
    }

    async getErrorMessages(): Promise<string | null> {
        return await this.getText({ section: this.modalSelector, selector: this.errorMsgSection });
    }

    async hasKey() {
        return await this.elementExists(this.keySelector);
    }

    async hasSecret() {
        return await this.elementExists(this.secretSelector);
    }

    async saveKeyAndSecret() {
        this.credentials = {
            Key: await this.getText({ section: this.modalSelector, selector: this.keySelector  }),
            Secret: await this.getText({ section: this.modalSelector, selector: this.secretSelector }),
            ODS_URL: await this.getText({ section: this.modalSelector, selector: this.odsURLSelector }),
        };
    }

    async isKeyAndSecretValid() {
        setApiContext()
        const testAPI = await apiContext.get(this.credentials.ODS_URL);
        testAPI.()
        return testAPI.ok();
    }

    private async fillApplicationName() {
        await this.modalSelector
            .locator(this.applicationFormSelectors.name)
            .fill(this.applicationFormValues.name);
    }

    private async selectLEA() {
        await this.modalSelector.locator(this.applicationFormSelectors.lea).click();
    }

    private async selectOrganizationId() {
        await this.modalSelector.locator(this.applicationFormSelectors.leaSelectBtn).click();
        await this.modalSelector
            .locator(this.applicationFormSelectors.leaSelect)
            .selectOption({ label: this.applicationFormValues.lea });
    }

    private async selectClaimSet(claimSetName: string) {
        await this.modalSelector
            .locator(this.applicationFormSelectors.claimSetSelect)
            .selectOption({ label: claimSetName });
    }

    private async saveForm() {
        await this.modalSelector.locator(this.addApplicationBtn).click();
    }
}
