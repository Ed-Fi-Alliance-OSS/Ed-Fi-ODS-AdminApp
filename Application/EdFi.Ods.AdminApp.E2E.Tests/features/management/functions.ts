// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

import { mkdir } from "fs/promises";
import {request} from "playwright";
import { apiContext, context, currentTest, page } from "./setup";

export async function saveTrace(): Promise<void> {
    if (process.env.TRACE) {
        const traceFolder = "./traces";
        mkdir(traceFolder).catch(() => {});
        const path = `${traceFolder}/${currentTest.feature}/${currentTest.scenario}/trace.zip`;

        await context.tracing.stop({ path });
    }
}

export async function takeScreenshot(name: string): Promise<void> {
    await page.screenshot({
        path: `./screenshots/${currentTest.feature}/${currentTest.scenario}/${name}.png`,
    });
}

export async function getAccessToken({clientKey, clientSecret}: {clientKey: string; clientSecret: string;}) {
    const api = process.env.API_URL;
    let tokenURL = `${api}/oauth/token`;

    var credentials = encodeURI(clientKey + ":" + clientSecret);

    let context = await request.newContext({ ignoreHTTPSErrors: true, extraHTTPHeaders: { 'Authorization': `Basic ${credentials}`, 'Content-Type': 'application/x-www-form-urlencoded' } });
    var data = "grant_type=client_credentials";

    var response = await context.post(tokenURL, { data });

    console.log(response);

    if(response.ok()){

    let responseText = response.body.toString();
    console.log(responseText);

    var json = JSON.parse(responseText);
    var token = json.access_token;
    return token;
    }
  }
