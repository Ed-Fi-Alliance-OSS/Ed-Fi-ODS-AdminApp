// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using Microsoft.Data.SqlClient;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using EdFi.Ods.AdminApp.Management;
using EdFi.Ods.AdminApp.Management.Configuration.Application;
using EdFi.Ods.AdminApp.Management.Helpers;
using EdFi.Ods.AdminApp.Web.ActionFilters;
using EdFi.Ods.AdminApp.Web.Infrastructure;
using EdFi.Ods.AdminApp.Web.Models.ViewModels;
using log4net;
using Microsoft.Extensions.Options;

namespace EdFi.Ods.AdminApp.Web.Controllers
{
    [BypassSetupRequiredFilter, BypassInstanceContextFilter]
    public class SetupController : ControllerBase
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(SetupController));

        private readonly ICompleteOdsFirstTimeSetupCommand _completeOdsFirstTimeSetupCommand;
        private readonly ApplicationConfigurationService _applicationConfigurationService;
        private readonly AppSettings _appSettings;

        public SetupController(ICompleteOdsFirstTimeSetupCommand completeOdsFirstTimeSetupCommand
            , ApplicationConfigurationService applicationConfigurationService
            , IOptions<AppSettings> appSettingsAccessor)
        {
            _completeOdsFirstTimeSetupCommand = completeOdsFirstTimeSetupCommand;
            _applicationConfigurationService = applicationConfigurationService;
            _appSettings = appSettingsAccessor.Value;
        }

        [HttpPost]
        public async Task<JsonResult> CompleteFirstTimeSetup()
        {
            _logger.Info("User intiated First Time Setup");
            return await RunSetup(async () =>
            {
                var restartRequired = await _completeOdsFirstTimeSetupCommand.Execute(CloudOdsAdminAppClaimSetConfiguration.Default);

                Response.Cookies.Append("RestartRequired", restartRequired.ToString());
            });
        }

        public ActionResult PostUpdateSetup()
        {
            return View();
        }

        private async Task<JsonResult> RunSetup(Func<Task> setupAction)
        {
            try
            {
                _logger.Info("Beginning setup process");
                await setupAction();
                _applicationConfigurationService.UpdateFirstTimeSetUpStatus(true);
                _logger.Info("Setup process completed");
                return SetupSucess();
            }
            catch (Exception e)
            {
                _logger.Error("Setup failed", e);
                return SetupFailure(e);
            }
        }

        private JsonResult SetupFailure(Exception e)
        {
            Response.StatusCode = (int)HttpStatusCode.InternalServerError;

            return Json(new { success = false, message = $"Failed to complete setup: {e.Message}", isTransientError = IsTransientError(e) });
        }

        private JsonResult SetupSucess()
        {
            Response.StatusCode = (int)HttpStatusCode.OK;
            return Json(new { success = true, message = "Setup complete" });
        }

        private bool IsTransientError(Exception e)
        {
            return e is SqlException;
        }
    }
}
