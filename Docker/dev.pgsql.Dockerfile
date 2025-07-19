# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#tag 8.0.18-alpine3.22
FROM mcr.microsoft.com/dotnet/sdk@sha256:071ec6075f01f91ceaef8f1eaed5d43873635d46441f99221473c456f37f8c20 AS build
WORKDIR /source

# From parentdir is defined in docker compose as additional context
COPY --from=parentdir Application/NuGet.Config NuGet.Config
COPY --from=parentdir Application/EdFi.Ods.AdminApp.Web EdFi.Ods.AdminApp.Web/
COPY --from=parentdir Application/EdFi.Ods.AdminApp.Management EdFi.Ods.AdminApp.Management/
COPY --from=parentdir Application/EdFi.Ods.AdminApp.Management.OnPrem EdFi.Ods.AdminApp.Management.OnPrem/

WORKDIR /source/EdFi.Ods.AdminApp.Web
RUN dotnet restore && dotnet build -c Release

FROM build AS publish
RUN dotnet publish -c Release --no-build -o /app/EdFi.Ods.AdminApp.Web

#tag 8.0.18-alpine3.22
FROM mcr.microsoft.com/dotnet/aspnet@sha256:724275ef1d9fe87eab6e1c45e4cf9cca2c1751dccfbf93a182fc82fd42278ce0 as base

# Use a build argument for the CA certificate file, defaulting to a non-existent
# file This allows the Dockerfile to be built without a specific CA certificate,
# but it can be overridden at build time by passing a different value for
# CA_CERTIFICATE_FILE. If used, the actual file must be in the local
# `custom_cert/` directory.
ARG CA_CERTIFICATE_FILE=does-not-exist.crt
COPY custom_cert/ /tmp/custom_cert/

ENV ALPINE_PACKAGES="bash=~5 openssl=3.5.1-r0 gettext=~0 icu=76.1-r1 curl=~8 ca-certificates=~20250619-r0 postgresql16-client=~16"
RUN if [ -f /tmp/custom_cert/${CA_CERTIFICATE_FILE} ]; then cat /tmp/custom_cert/${CA_CERTIFICATE_FILE} >> /etc/ssl/certs/ca-certificates.crt; fi && \
    apk --upgrade --no-cache add ${ALPINE_PACKAGES}

FROM base AS setup
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_HTTP_PORTS=80

COPY --from=publish /app/EdFi.Ods.AdminApp.Web /app

COPY Settings/pgsql/appsettings.template.json Settings/pgsql/run.sh Settings/pgsql/log4net.config /app/

RUN chmod 700 /app/*.sh && \
    rm -f /app/*.exe

EXPOSE ${ASPNETCORE_HTTP_PORTS}

ENTRYPOINT ["/app/run.sh"]
