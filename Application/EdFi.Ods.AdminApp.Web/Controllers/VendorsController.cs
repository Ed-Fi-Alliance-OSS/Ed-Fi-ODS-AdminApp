// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using EdFi.Admin.DataAccess.Models;
using EdFi.Ods.AdminApp.Management.Database.Commands;
using EdFi.Ods.AdminApp.Management.Database.Models;
using EdFi.Ods.AdminApp.Management.Database.Queries;
using EdFi.Ods.AdminApp.Web.ActionFilters;
using EdFi.Ods.AdminApp.Web.Models.ViewModels;
using EdFi.Ods.AdminApp.Web.Models.ViewModels.Global;
using Microsoft.AspNetCore.JsonPatch;
using System.Text.Json;

namespace EdFi.Ods.AdminApp.Web.Controllers
{
    [BypassInstanceContextFilter]
    [ApiController]
    [Route("adminappapi/[controller]")]
    [PermissionRequired(Permission.AccessGlobalSettings)]
    public class VendorsController: ControllerBase
    {
        private readonly AddVendorCommand _addVendorCommand;
        private readonly DeleteVendorCommand _deleteVendorCommand;
        private readonly EditVendorCommand _editVendorCommand;
        private readonly IGetVendorByIdQuery _getVendorByIdQuery;
        private readonly IGetVendorsQuery _getVendorsQuery;

        public VendorsController(IGetVendorsQuery getVendorsQuery
            , AddVendorCommand addVendorCommand
            , DeleteVendorCommand deleteVendorCommand
            , IGetVendorByIdQuery getVendorByIdQuery
            , EditVendorCommand editVendorCommand)
        {
            _getVendorsQuery = getVendorsQuery;
            _addVendorCommand = addVendorCommand;
            _deleteVendorCommand = deleteVendorCommand;
            _getVendorByIdQuery = getVendorByIdQuery;
            _editVendorCommand = editVendorCommand;
        }

        [HttpGet]
        [AddTelemetry("Global Settings > Vendors", TelemetryType.View)]
        public ActionResult Get()
        {
            var vendors = _getVendorsQuery.Execute();
            return Ok(vendors); 
        }

        [HttpGet]
        [Route("{id:int}")]
        [AddTelemetry("Global Settings > Vendors", TelemetryType.View)]
        public ActionResult Get(int id)
        {
            if (id == 0)
                return BadRequest("Value must be passed in the request body.");
            var vendor = _getVendorsQuery.Execute().SingleOrDefault(x => x.VendorId == id);

            if (vendor == null)
            {
                return NotFound();
            }

            return Ok(vendor);
        }

        [HttpPost]
        [AddTelemetry("Add Vendor")]
        public ActionResult Post([FromBody] AddVendorModel model)
        {
            if (model == null)
            {
                return NotFound();
            }
            _addVendorCommand.Execute(model);
            return JsonSuccess("Vendor added successfully");
        }
        
        [HttpDelete]
        [Route("{id:int}")]
        [AddTelemetry("Delete Vendor")]
        public ActionResult Delete(int id)
        {
            var vendor = _getVendorByIdQuery.Execute(id);

            if (vendor == null)
            {
                return NotFound();
            }
        
            if (vendor.IsSystemReservedVendor())
            {
                return JsonError("This Vendor is required for proper system function and may not be deleted");
            }

            _deleteVendorCommand.Execute(id);
            return JsonSuccess("Vendor removed successfully");
        }
        
        [HttpPut]
        [Route("{id:int}")]
        [AddTelemetry("Edit Vendor")]
        public ActionResult EditVendor(int id, [FromBody] EditVendorModel model)
        {
            if (model == null)
            {
                return BadRequest();
            }

            var vendor = _getVendorByIdQuery.Execute(id);
        
            if (vendor == null)
            {
                return JsonError("This vendor no longer exists.  It may have been recently deleted.");
            }
        
            if (vendor.IsSystemReservedVendor())
            {
                return JsonError("This vendor is required for proper system function and may not be modified.");
            }
        
            _editVendorCommand.Execute(model);
            return JsonSuccess("Vendor updated successfully");
        }
    }
}
