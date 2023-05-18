// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using AutoMapper;
using System.Collections.Generic;
using EdFi.Admin.DataAccess.Models;

namespace EdFi.Ods.AdminApp.Management.AdminApi
{
    public class AdminApiFacade : IAdminApiFacade
    {
        private readonly IMapper _mapper;
        private readonly IAdminApiRestClient _restClient;

        public AdminApiFacade(IMapper mapper, IAdminApiRestClient restClient)
        {
            _mapper = mapper;
            _restClient = restClient;
        }       

        public List<Vendor> GetAllVendors()
        {
            var response = _restClient.GetAll<Vendor>("vendors");
            return new List<Vendor>();// _mapper.Map<List<Models.School>>(response);
        }

        public Vendor GetVEndorsById(string id)
        {
            throw new System.NotImplementedException();
        }

        public AdminApiResult DeleteVendor(string id)
        {
            throw new System.NotImplementedException();
        }

        public AdminApiResult AddVendor(Vendor newSchool)
        {
            throw new System.NotImplementedException();
        }

        public AdminApiResult EditVendor(Vendor editedVendor)
        {
            throw new System.NotImplementedException();
        }
    }
}
