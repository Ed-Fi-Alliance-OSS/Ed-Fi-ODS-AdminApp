-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TABLE adminapp.UserOdsInstances (
    UserId NVARCHAR(225) NOT NULL,
    OdsInstanceId INT NOT NULL,
    CONSTRAINT PK_UserOdsInstances PRIMARY KEY CLUSTERED (UserId, OdsInstanceId),
    CONSTRAINT FK_UserOdsInstances_OdsInstances_Id FOREIGN KEY (OdsInstanceId) REFERENCES dbo.OdsInstances (OdsInstanceId) ON DELETE CASCADE,
    CONSTRAINT FK_UserOdsInstances_Users_Id FOREIGN KEY (UserId) REFERENCES adminapp.Users (Id) ON DELETE CASCADE
);
