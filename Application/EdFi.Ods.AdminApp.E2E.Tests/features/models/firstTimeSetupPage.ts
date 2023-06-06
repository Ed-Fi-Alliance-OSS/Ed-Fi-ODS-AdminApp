// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

import { AdminAppPage } from "./adminAppPage";

export class FirstTimeSetupPage extends AdminAppPage {
    continueBtn = "a#finish-setup-link";
    edfiODS = "text=EdFi ODS";
    odsInstances = "text=Ods Instances";

    path(): string {
        return `${this.url}/Setup/FirstTimeSetup`;
    }

    //Override
    get isOnPage(): boolean {
        const currentURL = this.page.url();
        const baseURL = currentURL.substring(0, currentURL.indexOf("?"));
        const URL = baseURL === "" ? currentURL : baseURL;
        return URL === this.path() || URL === this.firstTimePath();
    }

    hasTitle(): Promise<boolean> {
        return this.hasText({ text: "Additional Setup Required" });
    }

    async continue(url: string): Promise<void> {
        await Promise.all([this.clickContinue(), this.page.waitForNavigation({ url })]);
    }

    private async clickContinue(): Promise<void> {
        await this.page.locator(this.continueBtn).click();
    }

    async clickODSInstances() {
        await this.page.locator(this.odsInstances).click();
    }

    async clickOnDefaultODSInstances() {
        await this.page.locator(this.edfiODS).click();
    }

    firstTimePath(): string {
        return `${this.url}/Setup/PostUpdateSetup`
    }

    async hasPageTitle(): Promise<boolean> {
        return await this.hasText({ text: "Additional Setup Required", selector: "h5" });
    }

}
