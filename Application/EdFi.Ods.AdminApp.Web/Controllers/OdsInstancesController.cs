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
using EdFi.Ods.AdminApp.Management.OdsInstanceServices;
using EdFi.Ods.AdminApp.Web.Infrastructure;
using System.Threading.Tasks;

namespace EdFi.Ods.AdminApp.Web.Controllers
{
    [BypassInstanceContextFilter]
    public class OdsInstancesController : ControllerBase
    {
        private readonly IGetOdsInstancesQuery _getOdsInstancesQuery;
        private readonly AdminAppUserContext _userContext;
        private readonly GetCurrentSchoolYearQuery _getCurrentSchoolYear;
        private readonly IOdsInstanceFirstTimeSetupService _odsInstanceFirstTimeSetupService;

        public OdsInstancesController(
            IGetOdsInstancesQuery getOdsInstancesQuery
            , AdminAppUserContext userContext
            , GetCurrentSchoolYearQuery getCurrentSchoolYear
            , IOdsInstanceFirstTimeSetupService odsInstanceFirstTimeSetupService)
        {
            _getOdsInstancesQuery = getOdsInstancesQuery;
            _userContext = userContext;
            _getCurrentSchoolYear = getCurrentSchoolYear;
            _odsInstanceFirstTimeSetupService = odsInstanceFirstTimeSetupService;
        }

        public ViewResult Index()
        {
            var currentUserId = _userContext.User.Id;
            var instances = _getOdsInstancesQuery.Execute();

            var model = new IndexModel
            {
                UserContext = _userContext,
                OdsInstances =
                    instances.Select(
                        x => new OdsInstanceModel
                        {
                            Id = x.OdsInstanceId,
                            Name = x.Name,
                            DatabaseName = x.Name,
                            Description = x.Name,
                            SchoolYearDescription =
                                _getCurrentSchoolYear
                                    .Execute()
                                    ?.SchoolYearDescription ?? "Not Set"
                        }).ToList()
            };

            return View(model);
        }

        public async Task<ActionResult> ActivateOdsInstance(string instanceId)
        {
            Response.Cookies.Append("Instance", instanceId, new CookieOptions());
            var existingOdsInstance = _getOdsInstancesQuery.Execute(int.Parse(instanceId));
            await _odsInstanceFirstTimeSetupService.CompleteSetup(existingOdsInstance, CloudOdsAdminAppClaimSetConfiguration.Default);

            return RedirectToAction("Index", "Application");
        }      
    }
}
