-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

Declare @DropConstraint_EnableProductImprovement NVARCHAR(256)
SET @DropConstraint_EnableProductImprovement = (
              SELECT TOP 1 'ALTER TABLE' + '[adminapp].[ApplicationConfigurations]' +' DROP CONSTRAINT '+name
              FROM Sys.default_constraints A
              JOIN sysconstraints B on A.parent_object_id = B.id
              WHERE id = OBJECT_ID('[adminapp].[ApplicationConfigurations]')
              AND COL_NAME(id, colid)='EnableProductImprovement'
              AND OBJECTPROPERTY(constid,'IsDefaultCnst')=1
            )
EXEC(@DropConstraint_EnableProductImprovement);
ALTER TABLE adminapp.ApplicationConfigurations
DROP COLUMN EnableProductImprovement;

Declare @DropConstraint_ProductRegistrationId NVARCHAR(256)
SET @DropConstraint_ProductRegistrationId = (
              SELECT TOP 1 'ALTER TABLE' + '[adminapp].[ApplicationConfigurations]' +' DROP CONSTRAINT '+name
              FROM Sys.default_constraints A
              JOIN sysconstraints B on A.parent_object_id = B.id
              WHERE id = OBJECT_ID('[adminapp].[ApplicationConfigurations]')
              AND COL_NAME(id, colid)='ProductRegistrationId'
              AND OBJECTPROPERTY(constid,'IsDefaultCnst')=1
            )
EXEC(@DropConstraint_ProductRegistrationId);
ALTER TABLE adminapp.ApplicationConfigurations
DROP COLUMN ProductRegistrationId;
