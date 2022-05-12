// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

import { Credentials } from "../interfaces";
import { getAccessToken, isTokenValid, testURL } from "../management/functions";
import { AdminAppPage } from "./adminAppPage";

export class ApplicationsPage extends AdminAppPage {
    activeTabSelector = "ul.nav li.active";
    apiURLSelector = "a.copy-to-clipboard";
    errorMsgSection = "div.validationSummary";
    addApplicationBtn = 'button[type="submit"]';
    addNewApplicationBtn = "button.loads-ajax-modal";
    applicationOnListSelector = ".vendor-application h8";
    keySecretCopiedBtn = "#key-and-secret-dismiss-button";
    deleteApplicationBtn = "a.delete-application-link";
    deleteConfirmSelector = "div.alert:not(.hidden)";
    confirmDeleteBtn = 'button[type="submit"]';

    credentials!: Credentials;

    credentialsSelector(text: string): string {
        return `.key-text div:has-text('${text}') .key-generated`;
    }

    get keySelector(): string {
        return this.credentialsSelector("Key");
    }

    get secretSelector(): string {
        return this.credentialsSelector("Secret");
    }

    get odsURLSelector(): string {
        return this.credentialsSelector("API URL");
    }

    get deleteApplicationConfirmationMessage(): string {
        return `Are you sure you want to permanently delete ${this.applicationFormValues.name}?`;
    }

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

    confirmationMessages = {
        deleted: "Application deleted successfully",
    };

    modalTitleMessages = {
        addApplication: "Add Application to Vendor",
        addedSecret: "Add Application",
        deleteApplication: "Delete Application",
    };

    path(): string {
        return `${this.url}/Application`;
    }

    async waitForListLoad(): Promise<void> {
        await this.waitForResponse({ url: "/Application/ApplicationList" });
    }

    async addApplication(): Promise<void> {
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
        return await this.hasText({
            text: this.applicationFormValues.name,
            selector: this.applicationOnListSelector,
        });
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
        return await testURL(apiURL);
    }

    async getErrorMessages(): Promise<string | null> {
        return await this.getText({ section: this.modalSelector, selector: this.errorMsgSection });
    }

    async hasKey(): Promise<boolean> {
        return await this.elementExists(this.keySelector);
    }

    async hasSecret(): Promise<boolean> {
        return await this.elementExists(this.secretSelector);
    }

    async saveKeyAndSecret(): Promise<void> {
        this.credentials = {
            Key: await this.getText({ section: this.modalSelector, selector: this.keySelector }),
            Secret: await this.getText({ section: this.modalSelector, selector: this.secretSelector }),
            URL: await this.getText({ section: this.modalSelector, selector: this.odsURLSelector }),
        };
    }

    async isKeyAndSecretValid(): Promise<boolean> {
        const token = await getAccessToken(this.credentials);

        if (!token) {
            return false;
        }

        return isTokenValid({ token, api: this.credentials.URL });
    }

    async clickKeySecretCopied(): Promise<void> {
        await this.modalSelector.locator(this.keySecretCopiedBtn).click();
    }

    async clickDelete(): Promise<void> {
        await this.page.locator(this.deleteApplicationBtn).click();
    }

    async deleteApplication(): Promise<void> {
        await Promise.all([this.clickConfirmDelete(), this.waitForResponse({ url: "Application/Delete" })]);
    }

    async getDeleteApplicationMessage(): Promise<string | null> {
        return await this.getText({ section: this.modalSelector, selector: this.deleteConfirmSelector });
    }

    async addApplicationFullSteps(): Promise<void> {
        await this.navigate();
        await this.addApplication();
        await this.fillApplicationForm();
        await this.saveApplicationForm();
        await this.saveKeyAndSecret();
        await this.clickKeySecretCopied();
        if (!(await this.isKeyAndSecretValid())) {
            throw "Key and secret not valid";
        }
        await this.isApplicationPresentOnPage();
    }

    private async fillApplicationName(): Promise<void> {
        await this.modalSelector
            .locator(this.applicationFormSelectors.name)
            .fill(this.applicationFormValues.name);
    }

    private async selectLEA(): Promise<void> {
        await this.modalSelector.locator(this.applicationFormSelectors.lea).click();
    }

    private async selectOrganizationId(): Promise<void> {
        await this.modalSelector.locator(this.applicationFormSelectors.leaSelectBtn).click();
        await this.modalSelector
            .locator(this.applicationFormSelectors.leaSelect)
            .selectOption({ label: this.applicationFormValues.lea });
    }

    private async selectClaimSet(claimSetName: string): Promise<void> {
        await this.modalSelector
            .locator(this.applicationFormSelectors.claimSetSelect)
            .selectOption({ label: claimSetName });
    }

    private async saveForm(): Promise<void> {
        await this.modalSelector.locator(this.addApplicationBtn).click();
    }

    private async clickConfirmDelete(): Promise<void> {
        await this.modalSelector.locator(this.confirmDeleteBtn).click();
    }
}
