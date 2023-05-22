// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.AdminApp.Management.Database.Ods;

namespace EdFi.Ods.AdminApp.Management.OdsInstanceServices
{
    public interface IInferInstanceService
    {
        string DatabaseName();
    }

    public class InferInstanceService : IInferInstanceService
    {
        private readonly IDatabaseConnectionProvider _connectionProvider;

        public InferInstanceService(IDatabaseConnectionProvider connectionProvider)
        {
            _connectionProvider = connectionProvider;
        }


        // TODO: ODS API 7 specific implementation
        public string DatabaseName()
        {
            using var connection = _connectionProvider.CreateNewConnection();

            return connection.Database;
        }
    }
}
