#! /bin/bash

NUGET_URL="https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json"

WEB="EdFi.Suite3.ODS.AdminApp.Web"
WEB_PACKAGE=$(nuget list $WEB -Source $NUGET_URL)
WEB_VERSION=$(echo $WEB_PACKAGE| cut -d' ' -f 2)
echo "Using $WEB Version: $WEB_VERSION"

DB="EdFi.Suite3.ODS.AdminApp.Database"
DB_PACKAGE=$(nuget list $DB -Source $NUGET_URL)
DB_VERSION=$(echo $DB_PACKAGE| cut -d' ' -f 2)
echo "Using $DB Version: $DB_VERSION"

sed -i "s/ENV VERSION=\"[0-9].[0-9].[0-9]\"/ENV VERSION=\"$WEB_VERSION\"/g" ods-docker/Web-Ods-AdminApp/Alpine/pgsql/Dockerfile

sed -i "s/ENV ADMINAPP_DATABASE_VERSION=\"[0-9].[0-9].[0-9]\"/ENV ADMINAPP_DATABASE_VERSION=\"$DB_VERSION\"/g" ods-docker/DB-Admin/Alpine/pgsql/Dockerfile
