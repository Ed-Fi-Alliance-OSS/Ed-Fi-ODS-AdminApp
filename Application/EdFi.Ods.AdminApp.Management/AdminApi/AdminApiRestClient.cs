// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using Azure;
using EdFi.Ods.AdminApp.Management.ErrorHandling;
using log4net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace EdFi.Ods.AdminApp.Management.AdminApi
{
    public class AdminApiRestClient : IAdminApiRestClient
    {       
        private readonly IAdminApiTokenRetriever _tokenRetriever;
        private string _bearerToken;
        private readonly IRestClient _restClient;
        private static ILog _logger;

        public AdminApiRestClient(IRestClient restClient, IAdminApiTokenRetriever tokenRetriever)
        {
            _tokenRetriever = tokenRetriever;
            _restClient = restClient;
            _logger = LogManager.GetLogger(typeof(AdminApiRestClient));
        }

        private string GetAuthHeaderValue(bool refreshToken = false)
        {
            if (_bearerToken == null || refreshToken)
            {
                _bearerToken = _tokenRetriever.ObtainNewBearerToken();
            }

            return "Bearer " + _bearerToken;
        }

        private RestRequest AdminApiRequest(string resource)
        {
            var request = new RestRequest(resource) {RequestFormat = DataFormat.Json};
            request.AddHeader("Accept", "application/json");
            request.AddHeader("Authorization", GetAuthHeaderValue());
            return request;
        }

        private AdminApiResult ExecuteWithDefaultResponse(IRestRequest request)
        {
            try
            {
                ExecuteRequestAndHandleErrors(request);
                return new AdminApiResult();
            }
            catch (Exception e)
            {
                return new AdminApiResult { ErrorMessage = e.Message };
            }
        }

        private IRestResponse ExecuteRequestAndHandleErrors(IRestRequest request)
        {
            IRestResponse response;
            try
            {
                response = _restClient.Execute(request);
            }
            catch (Exception ex)
            {
                throw new AdminAppException($"Unexpected ODS API failure: {ex.Message}", ex);
            }

            if (response.IsSuccessful)                              
                return response;

            _logger.Debug("*** Status:");
            _logger.Debug(response.StatusCode);

            _logger.Debug("*** Content:");
            _logger.Debug(response.Content);

            _logger.Debug("*** ErrorException:");
            _logger.Debug(response.ErrorException);

            var embeddedError = response.ErrorException?.Message ?? response.ErrorMessage;
            var contentObj = JsonConvert.DeserializeObject<JObject>(response.Content) ?? new JObject();
            contentObj.TryGetValue("message", out var contentMessage);

            var errorMesssage = !string.IsNullOrEmpty(embeddedError)
                ? embeddedError
                : contentMessage?.ToString() ?? $"ODS API failure with no message. Status Code: {response.StatusCode}";

            throw new OdsApiConnectionException(response.StatusCode, embeddedError, errorMesssage);
        }      

        public IReadOnlyList<T> GetAll<T>(string elementPath) where T : class
        {       
            var request = AdminApiRequest(elementPath);          

            var responseList = new List<T>();
            List<T> pageItems;
          
            var restResponse = ExecuteRequestAndHandleErrors(request);

            dynamic responseContent = JsonConvert.DeserializeObject<JObject>(restResponse.Content);
            var jsonResponse = JsonConvert.SerializeObject(responseContent.result);
            pageItems = JsonConvert.DeserializeObject<List<T>>(jsonResponse);
            responseList.AddRange(pageItems);          
          
            return responseList;
        }      

        public T GetById<T>(string elementPath, string id) where T : class
        {
            var request = AdminApiRequest(elementPath);
            request.AddUrlSegment("id", id);
            var response = ExecuteRequestAndHandleErrors(request);
            return JsonConvert.DeserializeObject<T>(response.Content);
        }

        public AdminApiResult PostResource<T>(T resource, string elementPath, bool refreshToken = false)
        {
            var request = AdminApiRequest(elementPath);
            request.Method = Method.POST;

            try
            {
                var jsonInput = JsonConvert.SerializeObject(resource);
                request.AddParameter("application/json; charset=utf-8", jsonInput, ParameterType.RequestBody);
            }
            catch (Exception ex)
            {
                throw new AdminAppException("Failed to serialize resource", ex);
            }
            return ExecuteWithDefaultResponse(request);
        }

        public AdminApiResult PutResource<T>(T resource, string elementPath, string id, bool refreshToken = false)
        {
            var request = AdminApiRequest($"{elementPath}/{id}");
            request.Method = Method.PUT;

            try
            {
                var jsonInput = JsonConvert.SerializeObject(resource);
                request.AddParameter("application/json; charset=utf-8", jsonInput, ParameterType.RequestBody);
            }
            catch (Exception ex)
            {
                throw new AdminAppException("Failed to serialize resource", ex);
            }

            return ExecuteWithDefaultResponse(request);
        }
       
        public AdminApiResult DeleteResource(string elementPath, string id, bool refreshToken = false)
        {
            var request = AdminApiRequest(elementPath);
            request.Method = Method.DELETE;
            request.AddUrlSegment("id", id);
            return ExecuteWithDefaultResponse(request);
        }
    }
}
