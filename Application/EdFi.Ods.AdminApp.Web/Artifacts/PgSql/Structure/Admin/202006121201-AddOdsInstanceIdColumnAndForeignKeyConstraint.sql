-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE adminapp.SecretConfigurations ADD OdsInstanceId INT NULL;
ALTER TABLE adminapp.SecretConfigurations ADD CONSTRAINT FK_SecretConfigurations_OdsInstance_Id FOREIGN KEY (OdsInstanceId) REFERENCES dbo.OdsInstances (OdsInstanceId);
