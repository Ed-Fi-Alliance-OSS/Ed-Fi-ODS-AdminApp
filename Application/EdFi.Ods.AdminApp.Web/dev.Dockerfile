# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#tag sdk:6.0-alpine
FROM mcr.microsoft.com/dotnet/sdk@sha256:c1a73b72c02e7b837e9a93030d545bc4181193e1bab1033364ed2d00986d78ff AS build
WORKDIR /source

COPY ./Application/NuGet.Config ./
COPY ./Application/EdFi.Ods.AdminApp.Web/*.csproj EdFi.Ods.AdminApp.Web/
COPY ./Application/EdFi.Ods.AdminApp.Management/*.csproj EdFi.Ods.AdminApp.Management/
COPY ./Application/EdFi.Ods.AdminApp.Management.OnPrem/*.csproj EdFi.Ods.AdminApp.Management.OnPrem/
RUN dotnet restore EdFi.Ods.AdminApp.Web/EdFi.Ods.AdminApp.Web.csproj

COPY ./Application/EdFi.Ods.AdminApp.Web EdFi.Ods.AdminApp.Web/
COPY ./Application/EdFi.Ods.AdminApp.Management EdFi.Ods.AdminApp.Management/
COPY ./Application/EdFi.Ods.AdminApp.Management.OnPrem EdFi.Ods.AdminApp.Management.OnPrem/

WORKDIR /source/EdFi.Ods.AdminApp.Web
RUN dotnet build -c Release
FROM build AS publish
RUN dotnet publish -c Release /p:EnvironmentName=Production --no-build -o /app/EdFi.Ods.AdminApp.Web

#tag aspnet:6.0-alpine
FROM mcr.microsoft.com/dotnet/aspnet@sha256:5d7911e8485a58ac50eefa09e2cea8f3d59268fd7f1501f72324e37e29d9d6ee
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"
# Alpine image does not contain Globalization Cultures library so we need to install ICU library to get for LINQ expression to work
# Disable the globaliztion invariant mode (set in base image)
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false  
ENV ASPNETCORE_ENVIRONMENT Production

WORKDIR /app
COPY --from=publish /app/EdFi.Ods.AdminApp.Web .

COPY ./Application/EdFi.Ods.AdminApp.Web/Docker/run.sh /app/run.sh
COPY ./Application/EdFi.Ods.AdminApp.Web/Docker/log4net.config /app/log4net.txt

RUN apk --no-cache add curl dos2unix=~7.4 bash=~5.1 gettext=~0.21 icu=~67.1 gcompat && \
    cp /app/log4net.txt /app/log4net.config && \
    dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    dos2unix /app/log4net.config && \
    chmod 700 /app/*.sh -- **
    
EXPOSE 443
WORKDIR /app

ENTRYPOINT ["/app/run.sh"]