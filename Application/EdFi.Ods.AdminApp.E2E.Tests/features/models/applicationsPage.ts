// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

import { apiContext } from "../management/setup";
import { AdminAppPage } from "./adminAppPage";

export class ApplicationsPage extends AdminAppPage {
    activeTabSelector = "ul.nav li.active";
    apiURLSelector = "a.copy-to-clipboard";

    path(): string {
        return `${this.url}/Application`;
    }

    async applicationListHasLoaded(): Promise<void> {
        await this.waitForResponse({ url: "/Application/ApplicationList" });
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
}
