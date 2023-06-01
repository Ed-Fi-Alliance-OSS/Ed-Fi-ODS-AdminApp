// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Microsoft.AspNetCore.Mvc.Filters;
using System.Linq;
using EdFi.Ods.AdminApp.Management.Database;
using EdFi.Ods.AdminApp.Web.Controllers;
using EdFi.Ods.AdminApp.Web.Helpers;

namespace EdFi.Ods.AdminApp.Web.ActionFilters
{
    public class SetupRequiredFilter : ActionFilterAttribute
    {
        private readonly AdminAppDbContext _database;

        public SetupRequiredFilter(AdminAppDbContext database)
        {
            _database = database;
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (ShouldBypassThisFilter(filterContext))
                return;

            filterContext.Result = RouteHelpers.RedirectToActionRoute<SetupController>(x => x.PostUpdateSetup());
        }

        private bool ShouldBypassThisFilter(ActionExecutingContext filterContext)
        {
            return filterContext.Controller.GetType().GetAttribute<BypassSetupRequiredFilterAttribute>() != null
                || GeneralFirstTimeSetUpCompleted();
        }

        private bool GeneralFirstTimeSetUpCompleted()
        {
            {
                var generalFirstTimeSetUpCompleted = _database
                                                         .ApplicationConfigurations
                                                         .SingleOrDefault()?
                                                         .FirstTimeSetUpCompleted ?? false;

                return generalFirstTimeSetUpCompleted;
            }
        }
    }
}
