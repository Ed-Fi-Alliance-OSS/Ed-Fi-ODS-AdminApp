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
ENV ALPINE_PACKAGES="unzip=~6 dos2unix=~7 bash=~5 openssl=3.5.1-r0 gettext=~0 icu=76.1-r1 curl=~8 ca-certificates=~20250619-r0"
RUN apk --upgrade --no-cache add ${ALPINE_PACKAGES}

FROM base AS setup
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_HTTP_PORTS=80

# COPY --chmod=500 Settings/pgsql/run.sh /app/run.sh 

WORKDIR /app
COPY --from=publish /app/EdFi.Ods.AdminApp.Web .

# From settings is defined in docker compose as additional context
COPY --from=settings --chmod=600 Settings/pgsql/appsettings.template.json /app/
COPY --from=settings --chmod=700 Settings/pgsql/run.sh /app/run.sh
COPY --from=settings Settings/pgsql/log4net.config /app/log4net.config

RUN dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    dos2unix /app/log4net.config && \
    chmod 700 /app/*.sh -- ** && \
    rm -f /app/*.exe

EXPOSE ${ASPNETCORE_HTTP_PORTS}

ENTRYPOINT ["/app/run.sh"]