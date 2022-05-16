// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

import { Response } from "playwright";
import { page } from "./setup";

export class Network {
    expectedURL: string;
    previousCallFound: boolean;

    public constructor() {
        this.expectedURL = "";
        this.previousCallFound = false;
    }

    tracker = (response: Response) => {
        if (!this.previousCallFound && response.url().includes(this.expectedURL)) {
            this.previousCallFound = true;
        }
    };

    startResponseTracking(url: string) {
        this.expectedURL = url;
        page.on("response", this.tracker);
    }

    stopResponseTracking() {
        this.expectedURL = "";
        this.previousCallFound = false;
        page.removeListener("response", this.tracker);
    }

    isExpectingPath(): boolean {
        return this.expectedURL !== "";
    }

    async waitForResponse({ url, status = 200 }: { url: string; status?: number }): Promise<void> {
        if (this.isExpectingPath()) {
            if (this.expectedURL === url && this.previousCallFound) {
                this.stopResponseTracking();
                return Promise.resolve();
            }
        }

        await page.waitForResponse((response) => {
            const hasURL = response.url().includes(url);
            if (hasURL && response.status() !== status) {
                this.stopResponseTracking();
                return Promise.reject(new Error(`Expected status ${status}, got ${response.status()}`));
            }
            const found = hasURL && response.status() === status;
            if (found) {
                this.stopResponseTracking();
            }
            return found;
        });
    }
}
