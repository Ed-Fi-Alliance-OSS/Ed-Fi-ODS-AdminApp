// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Ods.AdminApp.Management.Database;

namespace EdFi.Ods.AdminApp.Management.User
{
    public class DeleteUserCommand
    {
        private readonly AdminAppIdentityDbContext _identity;

        public DeleteUserCommand(AdminAppIdentityDbContext identity)
        {
            _identity = identity;
        }

        public void Execute(IDeleteUserModel userModel)
        {
            RemoveExistingUserRoles(userModel.UserId);

            RemoveExistingUserOdsInstances(userModel.UserId);

            _identity.Users.Remove(_identity.Users.Single(x => x.Id == userModel.UserId));

            _identity.SaveChanges();
        }

        private void RemoveExistingUserOdsInstances(string userId)
        {
            var existingUserOdsInstances =
                _identity.UserOdsInstances.Where(x => x.UserId == userId);

            if (existingUserOdsInstances.Any())
            {
                _identity.UserOdsInstances.RemoveRange(existingUserOdsInstances);
            }

            _identity.SaveChanges();
        }

        private void RemoveExistingUserRoles(string userId)
        {
            var existingUserRoles =
                _identity.UserRoles.Where(x => x.UserId == userId);

            if (existingUserRoles.Any())
            {
                _identity.UserRoles.RemoveRange(existingUserRoles);
            }

            _identity.SaveChanges();
        }
    }

    public interface IDeleteUserModel
    {
        string UserId { get; }
    }
}
