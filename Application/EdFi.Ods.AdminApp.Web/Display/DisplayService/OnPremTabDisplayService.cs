// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.AdminApp.Web.Display.TabEnumeration;
using EdFi.Common.Utils.Extensions;
using EdFi.Ods.AdminApp.Management.Helpers;
using Microsoft.Extensions.Options;

namespace EdFi.Ods.AdminApp.Web.Display.DisplayService
{
    public class OnPremTabDisplayService : BaseTabDisplayService, ITabDisplayService
    {
        private readonly IdentitySettings _identitySettings;

        public OnPremTabDisplayService(IOptions<IdentitySettings> identitySettings)
        {
            _identitySettings = identitySettings.Value;
        }

        public override List<TabDisplay<GlobalSettingsTabEnumeration>>
            GetGlobalSettingsTabDisplay(GlobalSettingsTabEnumeration selectedTab)
        {
            var globalSettingsTabs = base.GetGlobalSettingsTabDisplay(selectedTab);


            var disabledTabs = new List<GlobalSettingsTabEnumeration>
            {
                GlobalSettingsTabEnumeration.AdvancedSettings
            };

            if (_identitySettings.Type == IdentitySettingsConstants.OpenIdIdentityType)
            {
                disabledTabs.Add(GlobalSettingsTabEnumeration.Users);
            }

            var tabsToDisable = globalSettingsTabs.Where(x =>
                disabledTabs.Contains(x.Tab));


            tabsToDisable.ForEach(tab =>
            {
                tab.IsEnabled = false;
                tab.IsVisible = false;
            });

            return globalSettingsTabs;
        }

        public override List<TabDisplay<OdsInstanceSettingsTabEnumeration>> GetOdsInstanceSettingsTabDisplay(
            OdsInstanceSettingsTabEnumeration selectedTab)
        {
            var instanceSettings = base.GetOdsInstanceSettingsTabDisplay(selectedTab);

            var tabsToDisable = instanceSettings.Where(x =>
                x.Tab == OdsInstanceSettingsTabEnumeration.Logging).ToList();

            tabsToDisable.ForEach(tab =>
            {
                tab.IsEnabled = false;
                tab.IsVisible = false;
            });

            return instanceSettings;
        }
    }
}
