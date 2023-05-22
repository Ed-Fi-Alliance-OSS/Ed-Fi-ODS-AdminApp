// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.AdminApp.Management.Helpers;
using Microsoft.Extensions.Options;

namespace EdFi.Ods.AdminApp.Management.Services
{
    public class ConnectionStringService: IConnectionStringService
    {
        private readonly ConnectionStrings _connectionStrings;

        private readonly IConnectionStringBuilderAdapterFactory _connectionStringBuilderAdapterFactory;

        public ConnectionStringService(IOptions<ConnectionStrings> connectionStrings,
            IConnectionStringBuilderAdapterFactory connectionStringBuilderAdapterFactory)
        {
            _connectionStrings = connectionStrings.Value;
            _connectionStringBuilderAdapterFactory = connectionStringBuilderAdapterFactory;
        }

        public string GetConnectionString()
        {
            var connectionStringBuilder = _connectionStringBuilderAdapterFactory.Get();
            connectionStringBuilder.ConnectionString = _connectionStrings.ProductionOds;   

            return connectionStringBuilder.ConnectionString;
         
        }
    }  
}
