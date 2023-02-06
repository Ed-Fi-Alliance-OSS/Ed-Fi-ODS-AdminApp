-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DECLARE @enableProdImpConstrain NVARCHAR(MAX)

SELECT TOP 1 @enableProdImpConstrain = dc.NAME
from sys.default_constraints dc
JOIN sys.columns c ON c.default_object_id = dc.object_id
WHERE dc.parent_object_id = OBJECT_ID('[adminapp].[ApplicationConfigurations]')
AND c.name = N'EnableProductImprovement'

EXEC (N'alter table [adminapp].[ApplicationConfigurations] drop constraint ['+@enableProdImpConstrain+N']')

DECLARE @productRegIdConstrain NVARCHAR(MAX)

SELECT TOP 1 @productRegIdConstrain = dc.NAME
from sys.default_constraints dc
JOIN sys.columns c ON c.default_object_id = dc.object_id
WHERE dc.parent_object_id = OBJECT_ID('[adminapp].[ApplicationConfigurations]')
AND c.name = N'ProductRegistrationId'

EXEC (N'alter table [adminapp].[ApplicationConfigurations] drop constraint ['+@productRegIdConstrain+N']')


ALTER TABLE adminapp.ApplicationConfigurations
DROP COLUMN EnableProductImprovement, ProductRegistrationId;
