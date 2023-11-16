// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using Microsoft.AspNetCore.Mvc;
using EdFi.Ods.AdminApp.Management.Instances;
using EdFi.Ods.AdminApp.Web.ActionFilters;
using EdFi.Ods.AdminApp.Management;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.OdsInstances;
using EdFi.Ods.AdminApp.Management.Database.Ods.SchoolYears;
using Microsoft.AspNetCore.Http;

namespace EdFi.Ods.AdminApp.Web.Controllers
{
    [BypassInstanceContextFilter]
    public class OdsInstancesController : ControllerBase
    {
        private readonly IGetOdsInstanceRegistrationsQuery _getOdsInstanceRegistrationsQuery;
        private readonly AdminAppUserContext _userContext;
        private readonly GetCurrentSchoolYearQuery _getCurrentSchoolYear;

        public OdsInstancesController(
            IGetOdsInstanceRegistrationsQuery getOdsInstanceRegistrationsQuery
            , AdminAppUserContext userContext
            , GetCurrentSchoolYearQuery getCurrentSchoolYear)
        {
            _getOdsInstanceRegistrationsQuery = getOdsInstanceRegistrationsQuery;
            _userContext = userContext;
            _getCurrentSchoolYear = getCurrentSchoolYear;
        }

        public ViewResult Index()
        {
            var currentUserId = _userContext.User.Id;
            var instances = _getOdsInstanceRegistrationsQuery.Execute();

            var model = new IndexModel
            {
                UserContext = _userContext,
                OdsInstances =
                    instances.Select(
                        x => new OdsInstanceModel
                        {
                            Id = x.Id,
                            Name = x.Name,
                            DatabaseName = x.DatabaseName,
                            Description = x.Description,
                            SchoolYearDescription =
                                _getCurrentSchoolYear
                                    .Execute()
                                    ?.SchoolYearDescription ?? "Not Set"
                        }).ToList()
            };

            return View(model);
        }

        public ActionResult ActivateOdsInstance(string instanceId)
        {
            Response.Cookies.Append("Instance", instanceId, new CookieOptions());

            return RedirectToAction("Index", "Application");
        }      
    }
}
