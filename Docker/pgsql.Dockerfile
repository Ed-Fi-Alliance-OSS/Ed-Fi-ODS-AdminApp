# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#tag 8.0.18-alpine3.22
FROM mcr.microsoft.com/dotnet/aspnet@sha256:724275ef1d9fe87eab6e1c45e4cf9cca2c1751dccfbf93a182fc82fd42278ce0
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

ARG ADMINAPP_PACKAGE_VERSION=3.3.1

ENV POSTGRES_PORT=5432
ENV ADMINAPP_VIRTUAL_NAME=adminapp
ENV API_MODE=SharedInstance
ENV ADMINAPP_PACKAGE="https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.ODS.AdminApp.Web/versions/${ADMINAPP_PACKAGE_VERSION}/content"

# Disable the globalization invariant mode
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

WORKDIR /app
COPY Settings/pgsql/appsettings.template.json Settings/pgsql/run.sh Settings/pgsql/log4net.config /app/

ENV ALPINE_PACKAGES="unzip=~6 dos2unix=~7 bash=~5 gettext=~0 postgresql16-client=~16 jq=~1 curl=~8 icu ca-certificates"
RUN apk --upgrade --no-cache add ${ALPINE_PACKAGES} && \
    wget -nv -O /app/AdminApp.zip ${ADMINAPP_PACKAGE}  && \
    unzip /app/AdminApp.zip AdminApp/* -d /app/ && \
    cp -r /app/AdminApp/. /app/ && \
    rm -f /app/AdminApp.zip && \
    rm -r /app/AdminApp && \
    dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    dos2unix /app/log4net.config && \
    chmod 700 /app/*.sh -- ** && \
    rm -f /app/*.exe

EXPOSE 80

ENTRYPOINT [ "/app/run.sh" ]
