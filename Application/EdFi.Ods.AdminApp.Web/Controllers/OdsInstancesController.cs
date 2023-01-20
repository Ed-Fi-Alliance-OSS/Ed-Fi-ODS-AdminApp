// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using Microsoft.AspNetCore.Mvc;
using EdFi.Ods.AdminApp.Management.Instances;
using EdFi.Ods.AdminApp.Management.User;
using EdFi.Ods.AdminApp.Web.ActionFilters;
using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management;
using EdFi.Ods.AdminApp.Management.Database.Models;
using EdFi.Ods.AdminApp.Web.Infrastructure;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.OdsInstances;
using System.Security.Claims;
using EdFi.Ods.AdminApp.Management.Database.Ods.SchoolYears;
using Microsoft.AspNetCore.Http;

namespace EdFi.Ods.AdminApp.Web.Controllers
{
    [BypassInstanceContextFilter]
    public class OdsInstancesController : ControllerBase
    {
        private readonly RegisterOdsInstanceCommand _registerOdsInstanceCommand;
        private readonly DeregisterOdsInstanceCommand _deregisterOdsInstanceCommand;
        private readonly IGetOdsInstanceRegistrationsByUserIdQuery _getOdsInstanceRegistrationsByUserIdQuery;
        private readonly IGetOdsInstanceRegistrationsQuery _getOdsInstanceRegistrationsQuery;
        private readonly AdminAppUserContext _userContext;
        private readonly BulkRegisterOdsInstancesCommand _bulkRegisterOdsInstancesCommand;
        private readonly GetCurrentSchoolYearQuery _getCurrentSchoolYear;

        public OdsInstancesController(
              RegisterOdsInstanceCommand registerOdsInstanceCommand
            , DeregisterOdsInstanceCommand deregisterOdsInstanceCommand
            , IGetOdsInstanceRegistrationsByUserIdQuery getOdsInstanceRegistrationsByUserIdQuery
            , IGetOdsInstanceRegistrationsQuery getOdsInstanceRegistrationsQuery
            , AdminAppUserContext userContext
            , BulkRegisterOdsInstancesCommand bulkRegisterOdsInstancesCommand
            , GetCurrentSchoolYearQuery getCurrentSchoolYear)
        {
            _registerOdsInstanceCommand = registerOdsInstanceCommand;
            _deregisterOdsInstanceCommand = deregisterOdsInstanceCommand;
            _getOdsInstanceRegistrationsByUserIdQuery = getOdsInstanceRegistrationsByUserIdQuery;
            _getOdsInstanceRegistrationsQuery = getOdsInstanceRegistrationsQuery;
            _userContext = userContext;
            _bulkRegisterOdsInstancesCommand = bulkRegisterOdsInstancesCommand;
            _getCurrentSchoolYear = getCurrentSchoolYear;
        }

        [AddTelemetry("Ods Instances Index", TelemetryType.View)]
        public ViewResult Index()
        {
            var currentUserId = _userContext.User.Id;
            var instances = _getOdsInstanceRegistrationsByUserIdQuery.Execute(currentUserId);

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
                                    .Execute(x.Name, CloudOdsAdminAppSettings.Instance.Mode)
                                    ?.SchoolYearDescription ?? "Not Set"
                        }).ToList()
            };

            return View(model);
        }

        [PermissionRequired(Permission.AccessGlobalSettings)]
        public ViewResult RegisterOdsInstance()
        {
            return View(new RegisterOdsInstanceModel());
        }

        [HttpPost]
        [PermissionRequired(Permission.AccessGlobalSettings)]
        [AddTelemetry("Register ODS Instance")]
        public async Task<ActionResult> RegisterOdsInstance(RegisterOdsInstanceModel model)
        {
            var currentUserId = _userContext.User.Id;

            await _registerOdsInstanceCommand.Execute(model,
                CloudOdsAdminAppSettings.Instance.Mode, currentUserId, CloudOdsAdminAppClaimSetConfiguration.Default);

            return RedirectToAction("Index", "OdsInstances");
        }

        [PermissionRequired(Permission.AccessGlobalSettings)]
        public ViewResult BulkRegisterOdsInstances()
        {
            return View(new BulkRegisterOdsInstancesModel());
        }

        [HttpPost]
        [PermissionRequired(Permission.AccessGlobalSettings)]
        [AddTelemetry("Bulk Register ODS Instances")]
        public async Task<ActionResult> BulkRegisterOdsInstances(BulkRegisterOdsInstancesModel model)
        {
            var currentUserId = _userContext.User.Id;
            var results = await _bulkRegisterOdsInstancesCommand.Execute(
                model.DataRecords(), model.FilteredDataRecords,
                CloudOdsAdminAppSettings.Instance.Mode, currentUserId,
                CloudOdsAdminAppClaimSetConfiguration.Default);

            var bulkRegisterOdsInstancesResults = results.ToList();
            var successCount = bulkRegisterOdsInstancesResults.Count(x => x.IndividualInstanceResult == IndividualInstanceResult.Succeded);
            var failCount = bulkRegisterOdsInstancesResults.Count(x => x.IndividualInstanceResult == IndividualInstanceResult.Failed);
            var skippedCount = bulkRegisterOdsInstancesResults.Count(x => x.IndividualInstanceResult == IndividualInstanceResult.Skipped);
            return JsonSuccess(
                $"Successful instance registrations: {successCount}. Failed instance registrations: {failCount}. Skipped instance registrations: {skippedCount}. Please refer to log file for further details.");
        }

        [AddTelemetry("Activate ODS Instance")]
        public ActionResult ActivateOdsInstance(string instanceId)
        {
            Response.Cookies.Append("Instance", instanceId, new CookieOptions());

            return RedirectToAction("Index", "Application");
        }

        [PermissionRequired(Permission.AccessGlobalSettings)]
        public ActionResult DeregisterOdsInstance(int instanceId)
        {
            var odsInstance = _getOdsInstanceRegistrationsQuery.Execute(instanceId);

            return PartialView("_DeregisterOdsInstanceModal", new DeregisterOdsInstanceModel
            {
                OdsInstanceId = odsInstance.Id,
                Name = odsInstance.Name,
                Description = odsInstance.Description
            });
        }

        [HttpPost]
        [PermissionRequired(Permission.AccessGlobalSettings)]
        [AddTelemetry("Deregister ODS Instance")]
        public ActionResult DeregisterOdsInstance(DeregisterOdsInstanceModel model)
        {
            _deregisterOdsInstanceCommand.Execute(model);

            Response.Cookies.Delete("Instance");

            return RedirectToActionJson<OdsInstancesController>(x => x.Index(), "Ods Instance deregistered successfully.");
        }
    }
}
