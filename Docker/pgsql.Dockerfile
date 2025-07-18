# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#tag 8.0.18-alpine3.22
FROM mcr.microsoft.com/dotnet/aspnet@sha256:724275ef1d9fe87eab6e1c45e4cf9cca2c1751dccfbf93a182fc82fd42278ce0
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

ARG ADMINAPP_PACKAGE_VERSION=3.3.1

# Use a build argument for the CA certificate file, defaulting to a non-existent
# file This allows the Dockerfile to be built without a specific CA certificate,
# but it can be overridden at build time by passing a different value for
# CA_CERTIFICATE_FILE. If used, the actual file must be in the local
# `custom_cert/` directory.
ARG CA_CERTIFICATE_FILE=does-not-exist.crt

COPY custom_cert/ /tmp/custom_cert/

ENV POSTGRES_PORT=5432
ENV ADMINAPP_VIRTUAL_NAME=adminapp
ENV API_MODE=SharedInstance
ENV ADMINAPP_PACKAGE="https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.ODS.AdminApp.Web/versions/${ADMINAPP_PACKAGE_VERSION}/content"

# Disable the globalization invariant mode
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_HTTP_PORTS=80

WORKDIR /app
COPY Settings/pgsql/appsettings.template.json Settings/pgsql/run.sh Settings/pgsql/log4net.config /app/

ENV ALPINE_PACKAGES="unzip=~6 bash=~5 gettext=~0 postgresql16-client=~16 jq=~1 curl=~8 icu=~76 ca-certificates=~20250619-r0"
RUN if [ -f /tmp/custom_cert/${CA_CERTIFICATE_FILE} ]; then cat /tmp/custom_cert/${CA_CERTIFICATE_FILE} >> /etc/ssl/certs/ca-certificates.crt; fi && \
    apk --upgrade --no-cache add ${ALPINE_PACKAGES} && \
    wget -nv -O /app/AdminApp.zip ${ADMINAPP_PACKAGE}  && \
    unzip /app/AdminApp.zip AdminApp/* -d /app/ && \
    cp -r /app/AdminApp/. /app/ && \
    rm -f /app/AdminApp.zip && \
    rm -r /app/AdminApp && \
    chmod 700 /app/*.sh -- ** && \
    rm -f /app/*.exe && \
    apk del --no-cache unzip

EXPOSE ${ASPNETCORE_HTTP_PORTS}

ENTRYPOINT [ "/app/run.sh" ]
