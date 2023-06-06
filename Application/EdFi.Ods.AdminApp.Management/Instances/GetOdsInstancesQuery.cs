// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using EdFi.Admin.DataAccess.Contexts;
using EdFi.Admin.DataAccess.Models;

namespace EdFi.Ods.AdminApp.Management.Instances
{
    public class GetOdsInstancesQuery : IGetOdsInstancesQuery
    {
        private readonly IUsersContext _database;

        public GetOdsInstancesQuery(IUsersContext database)
        {
            _database = database;
        }

        public IEnumerable<OdsInstance> Execute()
        {
            var instances = _database.OdsInstances.OrderBy(x => x.Name);

            return instances;
        }

        public int ExecuteCount()
        {
            return _database.OdsInstances.Count();
        }

        public OdsInstance Execute(string odsInstanceName)
        {
            return _database.OdsInstances.SingleOrDefault(x => x.Name == odsInstanceName);
        }

        public OdsInstance Execute(int odsInstanceId)
        {
            return _database.OdsInstances.SingleOrDefault(x => x.OdsInstanceId == odsInstanceId);
        }
    }

    public interface IGetOdsInstancesQuery
    {
        IEnumerable<OdsInstance> Execute();
        int ExecuteCount();
        OdsInstance Execute(string odsInstanceName);
        OdsInstance Execute(int odsInstanceId);
    }
}
