// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Management.Database.Models;

namespace EdFi.Ods.AdminApp.Management.User
{
    public class EditOdsInstanceForUserCommand
    {
        private readonly AdminAppIdentityDbContext _identity;

        public EditOdsInstanceForUserCommand(AdminAppIdentityDbContext identity)
        {
            _identity = identity;
        }

        public void Execute(IEditOdsInstanceForUserModel model)
        {
            var preexistingAssociations = _identity.UserOdsInstances.Where(x => x.UserId == model.UserId).ToList();

            var selectedOdsInstanceIds =
                model.OdsInstances.Where(x => x.Selected).Select(x => x.OdsInstanceId).ToList();

            var recordsToAdd = NewAssignments(model.UserId, selectedOdsInstanceIds, preexistingAssociations);

            if (recordsToAdd.Any())
                _identity.UserOdsInstances.AddRange(recordsToAdd);

            var recordsToRemove = AssignmentsToRemove(selectedOdsInstanceIds, preexistingAssociations);

            if (recordsToRemove.Any())
                _identity.UserOdsInstances.RemoveRange(recordsToRemove);

            _identity.SaveChanges();
        }

        private static List<UserOdsInstance> AssignmentsToRemove(List<int> requestedOdsInstanceIds, List<UserOdsInstance> preexistingAssociations)
        {
            return preexistingAssociations
                .Where(record => !requestedOdsInstanceIds.Contains(record.OdsInstanceId))
                .ToList();
        }

        private static List<UserOdsInstance> NewAssignments(string userId, List<int> requestedOdsInstanceIds, List<UserOdsInstance> preexistingAssociations)
        {
            var missingOdsInstanceIds =
                requestedOdsInstanceIds.Except(
                    preexistingAssociations.Select(x => x.OdsInstanceId));

            return missingOdsInstanceIds
                .Select(x => new UserOdsInstance
                {
                    UserId = userId,
                    OdsInstanceId = x
                }).ToList();
        }
    }

    public interface IEditOdsInstanceForUserModel
    {
        string UserId  { get; }
        List<OdsInstanceSelection> OdsInstances { get; }
    }

    public class OdsInstanceSelection
    {
        public int OdsInstanceId { get; set; }
        public string Name { get; set; }
        public bool Selected { get; set; }
    }
}
