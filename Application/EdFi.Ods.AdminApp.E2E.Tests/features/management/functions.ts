// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

import { mkdir } from "fs/promises";
import { request } from "playwright";
import { Credentials } from "../interfaces";
import { context, currentTest, page } from "./setup";

export async function saveTrace(): Promise<void> {
    if (process.env.TRACE) {
        const traceFolder = "./traces";
        mkdir(traceFolder).catch(() => {});
        const path = `${traceFolder}/${currentTest.Feature}/${currentTest.Scenario}/trace.zip`;

        await context.tracing.stop({ path });
    }
}

export async function takeScreenshot(name: string): Promise<void> {
    await page.screenshot({
        path: `./screenshots/${currentTest.Feature}/${currentTest.Scenario}/${name}.png`,
    });
}

export async function getAccessToken(credentials: Credentials): Promise<string> {
    //May need to refactor for year specific mode
    const apiURL = credentials.URL.substring(0, credentials.URL.indexOf("data") - 1);
    const tokenURL = `${apiURL}/oauth/token`;
    const encryptedCredentials = Buffer.from(credentials.Key + ":" + credentials.Secret).toString("base64");

    const context = await request.newContext({
        ignoreHTTPSErrors: true,
        extraHTTPHeaders: {
            Authorization: `Basic ${encryptedCredentials}`,
            "Content-Type": "application/x-www-form-urlencoded",
        },
    });
    const data = "grant_type=client_credentials";

    const response = await context.post(tokenURL, { data });

    if (response.ok()) {
        const jsonResponse = await response.json();
        const token = jsonResponse.access_token;
        return token;
    } else {
        throw `Unable to get Access Token. Response: ${response.status}`;
    }
}

export async function isTokenValid({ api, token }: { api: string; token: string }): Promise<boolean> {
    const context = await request.newContext({
        ignoreHTTPSErrors: true,
        extraHTTPHeaders: {
            Authorization: `Bearer ${token}`,
        },
    });
    const response = await context.get(`${api}/ed-fi/academicWeeks`);

    return response.status() !== 401 && response.status() !== 404;
}
