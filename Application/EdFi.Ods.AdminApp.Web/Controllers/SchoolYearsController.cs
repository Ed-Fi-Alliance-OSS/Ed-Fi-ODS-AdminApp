// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Ods.AdminApp.Management.Database.Ods.SchoolYears;
using EdFi.Ods.AdminApp.Management.Instances;
using EdFi.Ods.AdminApp.Web.ActionFilters;
using EdFi.Ods.AdminApp.Web.Infrastructure;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.SchoolYears;
using Microsoft.AspNetCore.Mvc;

namespace EdFi.Ods.AdminApp.Web.Controllers
{
    [BypassInstanceContextFilter]
    public class SchoolYearsController : ControllerBase
    {
        private readonly GetSchoolYearsQuery _getSchoolYears;
        private readonly GetCurrentSchoolYearQuery _getCurrentSchoolYear;
        private readonly ISetCurrentSchoolYearCommand _setCurrentSchoolYear;

        public SchoolYearsController(
            GetSchoolYearsQuery getSchoolYears,
            GetCurrentSchoolYearQuery getCurrentSchoolYear,
            ISetCurrentSchoolYearCommand setCurrentSchoolYear)
        {
            _getSchoolYears = getSchoolYears;
            _getCurrentSchoolYear = getCurrentSchoolYear;
            _setCurrentSchoolYear = setCurrentSchoolYear;
        }

        public ActionResult Edit(string instanceName)
        {
            var currentSchoolYear = _getCurrentSchoolYear.Execute()?.SchoolYear;
            var schoolYears = _getSchoolYears.Execute();

            string warning = null;

            return PartialView(
                new EditSchoolYearModel
                {
                    Warning = warning,
                    InstanceName = instanceName,
                    SchoolYear = currentSchoolYear,
                    SchoolYears = schoolYears
                        .ToSelectListItems(
                            "Select School Year",
                            x => x.SchoolYear.ToString(),
                            x => x.SchoolYearDescription)
                });
        }

        [HttpPost]
        public ActionResult Edit(EditSchoolYearModel model)
        {
            _setCurrentSchoolYear.Execute(model.SchoolYear.Value);

            return JsonSuccess("School Year Saved");
        }
    }
}
