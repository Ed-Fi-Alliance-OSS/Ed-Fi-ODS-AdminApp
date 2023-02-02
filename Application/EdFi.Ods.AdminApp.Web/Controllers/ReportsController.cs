// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using EdFi.Ods.AdminApp.Management;
using EdFi.Ods.AdminApp.Management.Database.Ods;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.Reports;
using System.Linq;
using EdFi.Ods.AdminApp.Management.ErrorHandling;
using EdFi.Ods.AdminApp.Web.ActionFilters;
using EdFi.Ods.AdminApp.Web.Display.TabEnumeration;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using EdFi.Ods.AdminApp.Web.Infrastructure;

namespace EdFi.Ods.AdminApp.Web.Controllers
{
    public class ReportsController : ControllerBase
    {
        private readonly GetAllLocalEducationAgenciesQuery _getAllLocalEducationAgenciesQuery;
        private readonly StudentsByProgramQuery _studentsByProgramQuery;
        private readonly StudentEconomicSituationReportQuery _studentEconomicSituationReportQuery;
        private readonly TotalEnrollmentQuery _totalEnrollmentQuery;
        private readonly GetSchoolsBySchoolTypeQuery _getSchoolsBySchoolTypeQuery;
        private readonly StudentEnrollmentByGenderQuery _studentEnrollmentByGenderQuery;
        private readonly StudentEnrollmentByRaceQuery _studentEnrollmentByRaceQuery;
        private readonly StudentEnrollmentByEthnicityQuery _studentEnrollmentByEthnicityQuery;
        private readonly InstanceContext _instanceContext;
        private readonly ITabDisplayService _tabDisplayService;

        public ReportsController(GetAllLocalEducationAgenciesQuery getAllLocalEducationAgenciesQuery
            , StudentsByProgramQuery studentsByProgramQuery
            , StudentEconomicSituationReportQuery studentEconomicSituationReportQuery
            , TotalEnrollmentQuery totalEnrollmentQuery
            , GetSchoolsBySchoolTypeQuery getSchoolsBySchoolTypeQuery
            , StudentEnrollmentByGenderQuery studentEnrollmentByGenderQuery
            , StudentEnrollmentByRaceQuery studentEnrollmentByRaceQuery
            , StudentEnrollmentByEthnicityQuery studentEnrollmentByEthnicityQuery
            , InstanceContext instanceContext
            , ITabDisplayService tabDisplayService)
        {
            _getAllLocalEducationAgenciesQuery = getAllLocalEducationAgenciesQuery;
            _studentsByProgramQuery = studentsByProgramQuery;
            _studentEconomicSituationReportQuery = studentEconomicSituationReportQuery;
            _totalEnrollmentQuery = totalEnrollmentQuery;
            _getSchoolsBySchoolTypeQuery = getSchoolsBySchoolTypeQuery;
            _studentEnrollmentByGenderQuery = studentEnrollmentByGenderQuery;
            _studentEnrollmentByRaceQuery = studentEnrollmentByRaceQuery;
            _studentEnrollmentByEthnicityQuery = studentEnrollmentByEthnicityQuery;
            _instanceContext = instanceContext;
            _tabDisplayService = tabDisplayService;
        }

        public ActionResult SelectDistrict(int id = 0)
        {
            var districtOptions = CatchSqlFailures(() => _getAllLocalEducationAgenciesQuery
                .Execute(_instanceContext.Name, CloudOdsAdminAppSettings.Instance.Mode)
                .Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.LocalEducationAgencyId.ToString(),
                    Selected = x.LocalEducationAgencyId == id
                }).ToArray());

            var reportsModel = GetReportModel();
            reportsModel.SelectDistrictModel = new SelectDistrictModel
            {
                LocalEducationAgencyId = id,
                DistrictOptions = districtOptions
            };

            return PartialView("_SelectDistrict", reportsModel);
        }

        public ActionResult TotalEnrollment(int id)
        {
            var reportsModel = GetReportModel();
            reportsModel.TotalEnrollmentReport =
                CatchSqlFailures(() => _totalEnrollmentQuery.Execute(_instanceContext.Name, CloudOdsAdminAppSettings.Instance.Mode, id));

            return PartialView("_TotalEnrollment", reportsModel);
        }

        public ActionResult SchoolsBySchoolType(int id)
        {
            var reportsModel = GetReportModel();
            reportsModel.SchoolTypeReport=
                CatchSqlFailures(() => _getSchoolsBySchoolTypeQuery.Execute(_instanceContext.Name, CloudOdsAdminAppSettings.Instance.Mode, id));

            return PartialView("_SchoolsBySchoolType", reportsModel);
        }

        public ActionResult EnrollmentByGender(int id)
        {
            var reportsModel = GetReportModel();
            reportsModel.StudentGenderReport =
                CatchSqlFailures(() => _studentEnrollmentByGenderQuery.Execute(_instanceContext.Name, CloudOdsAdminAppSettings.Instance.Mode, id));

            return PartialView("_EnrollmentByGender", reportsModel);
        }

        public ActionResult EnrollmentByRace(int id)
        {
            var reportsModel = GetReportModel();
            reportsModel.StudentRaceReport =
                CatchSqlFailures(() => _studentEnrollmentByRaceQuery.Execute(_instanceContext.Name, CloudOdsAdminAppSettings.Instance.Mode, id));

            return PartialView("_EnrollmentByRace", reportsModel);
        }

        public ActionResult EnrollmentByEthnicity(int id)
        {
            var reportsModel = GetReportModel();
            reportsModel.StudentEthnicityReport =
                CatchSqlFailures(() => _studentEnrollmentByEthnicityQuery.Execute(_instanceContext.Name, CloudOdsAdminAppSettings.Instance.Mode, id));

            return PartialView("_EnrollmentByEthnicity", reportsModel);
        }

        public ActionResult StudentsByProgram(int id)
        {
            var reportsModel = GetReportModel();
            reportsModel.StudentsByProgramReport =
                CatchSqlFailures(() => _studentsByProgramQuery.Execute(_instanceContext.Name, CloudOdsAdminAppSettings.Instance.Mode, id));

            return PartialView("_StudentsByProgram", reportsModel);
        }

        public ActionResult StudentsByAttribute(int id)
        {
            var reportsModel = GetReportModel();
            reportsModel.StudentEconomicSituationReport =
                CatchSqlFailures(() => _studentEconomicSituationReportQuery.Execute(_instanceContext.Name, CloudOdsAdminAppSettings.Instance.Mode, id));

            return PartialView("_StudentsByAttribute", reportsModel);
        }

        private T CatchSqlFailures<T>(Func<T> query)
        {
            try
            {
                return query.Invoke();
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                throw new AdminAppException("An error occurred trying to access the SQL views for reports.", e);
            }
            catch (Microsoft.Data.SqlClient.SqlException e)
            {
                throw new AdminAppException("An error occurred trying to access the SQL views for reports.", e);
            }
        }

        private ReportsIndexModel GetReportModel()
        {
            return new ReportsIndexModel
            {
                OdsInstanceSettingsTabEnumerations =
                    _tabDisplayService.GetOdsInstanceSettingsTabDisplay(OdsInstanceSettingsTabEnumeration.Reports),
                OdsInstance = _instanceContext
            };
        }
    }
}
