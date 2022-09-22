// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using EdFi.Ods.AdminApp.Web.ActionFilters;
using EdFi.Ods.AdminApp.Management.Helpers;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Options;

namespace EdFi.Ods.AdminApp.Web.Controllers
{
    [BypassSetupRequiredFilter, BypassInstanceContextFilter]
    public class OpenIdConnectController : ControllerBase
    {
        private readonly IdentitySettings _identitySettings;

        public OpenIdConnectController(IOptions<IdentitySettings> identitySettings)
        {
            _identitySettings = identitySettings.Value;
        }

        [HttpGet]
        public IActionResult Login(string returnUrl)
        {
            returnUrl ??= Url.Content("~/");

            if (HttpContext.User.Identity != null && !HttpContext.User.Identity.IsAuthenticated)
            {
                return new ChallengeResult(_identitySettings.OpenIdSettings.AuthenticationScheme, new AuthenticationProperties
                {
                    RedirectUri = returnUrl
                });
            }
            
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public IActionResult ChangePassword()
        {
            return Redirect(_identitySettings.OpenIdSettings.UserProfileUri);
        }

        [HttpPost]
        public async Task<IActionResult> LogOut()
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }
    }
}
