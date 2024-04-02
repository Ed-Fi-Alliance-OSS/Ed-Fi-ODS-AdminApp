# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#tag 8.0-alpine
FROM mcr.microsoft.com/dotnet/aspnet@sha256:646b1c5ff36375f35f6149b0ce19ca095f97b4b882b90652801e9fbe82bcfa8a
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"
ARG VERSION=latest

ENV PGBOUNCER_LISTEN_PORT=6432
ENV ADMINAPP_VIRTUAL_NAME=adminapp
ENV API_MODE=SharedInstance

# Alpine image does not contain Globalization Cultures library so we need to install ICU library to get fopr LINQ expression to work
# Disable the globalization invariant mode (set in base image)
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

WORKDIR /app
COPY Settings/mssql/appsettings.template.json /app/appsettings.template.json
COPY Settings/mssql/run.sh /app/run.sh
COPY Settings/mssql/log4net.config /app/log4net.txt

RUN apk --no-cache add unzip=~6 dos2unix=~7 bash=~5 gettext=~0 jq=~1 icu=~74 curl=~8 && \
    wget -nv -O /app/AdminApp.zip "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.ODS.AdminApp.Web/versions/${VERSION}/content" && \
    unzip /app/AdminApp.zip AdminApp/* -d /app/ && \
    cp -r /app/AdminApp/. /app/ && \
    rm -f /app/AdminApp.zip && \
    rm -r /app/AdminApp && \
    cp /app/log4net.txt /app/log4net.config && \
    dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    dos2unix /app/log4net.config && \
    chmod 700 /app/*.sh -- ** && \
    rm -f /app/*.exe

EXPOSE 80

ENTRYPOINT [ "/app/run.sh" ]
