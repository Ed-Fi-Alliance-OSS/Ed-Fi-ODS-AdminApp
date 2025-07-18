// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using EdFi.Ods.AdminApp.Management.ErrorHandling;
using log4net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace EdFi.Ods.AdminApp.Management.Api
{
    public class OdsRestClient : IOdsRestClient
    {
        private readonly OdsApiConnectionInformation _connectionInformation;
        private readonly ITokenRetriever _tokenRetriever;
        private string _bearerToken;
        private IRestClient _restClient;
        public virtual IRestClient RestClient { get { return _restClient; } }
        private static ILog _logger;

        public OdsRestClient(OdsApiConnectionInformation connectionInformation, IRestClient restClient, ITokenRetriever tokenRetriever)
        {
            _connectionInformation = connectionInformation;
            _tokenRetriever = tokenRetriever;
            _restClient = restClient;
            _logger = LogManager.GetLogger(typeof(OdsRestClient));
        }

        private string GetAuthHeaderValue(bool refreshToken = false)
        {
            if (_bearerToken == null || refreshToken)
            {
                _bearerToken = _tokenRetriever.ObtainNewBearerToken();
            }

            return "Bearer " + _bearerToken;
        }

        private RestRequest OdsRequest(string resource)
        {
            var request = new RestRequest(resource) {RequestFormat = DataFormat.Json};
            request.AddHeader("Accept", "application/json");
            request.AddHeader("Authorization", GetAuthHeaderValue());
            return request;
        }

        private OdsApiResult ExecuteWithDefaultResponse(RestRequest request)
        {
            try
            {
                ExecuteRequestAndHandleErrors(request);
                return new OdsApiResult();
            }
            catch (Exception e)
            {
                return new OdsApiResult { ErrorMessage = e.Message };
            }
        }

        private RestResponse ExecuteRequestAndHandleErrors(RestRequest request)
        {
            RestResponse response;
            try
            {
                response = RestClient.Execute(request);
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

        public IReadOnlyList<T> GetAll<T>(string elementPath, int offset, int limit = 50) where T : class
        {
            var request = OdsRequest(elementPath);
            request.Method = Method.Get;
            request.AddParameter("offset", offset);
            request.AddParameter("limit", limit);

            var responseList = new List<T>();
            List<T> pageItems;

            var restResponse = ExecuteRequestAndHandleErrors(request);

            pageItems = JsonConvert.DeserializeObject<List<T>>(restResponse.Content);
            responseList.AddRange(pageItems);

            return responseList;
        }

        public IReadOnlyList<T> GetAll<T>(string elementPath) where T : class
        {
            var offset = 0;
            const int limit = 50;

            var request = OdsRequest(elementPath);
            request.Method = Method.Get;
            request.AddParameter("offset", offset);
            request.AddParameter("limit", limit);

            var responseList = new List<T>();
            List<T> pageItems;

            do
            {
                var restResponse = ExecuteRequestAndHandleErrors(request);

                pageItems = JsonConvert.DeserializeObject<List<T>>(restResponse.Content);
                responseList.AddRange(pageItems);

                offset += limit;
                request.AddOrUpdateParameter("offset", offset);
            }
            while (pageItems.Count >= limit);

            return responseList;
        }

        public IReadOnlyList<T> GetAll<T>(string elementPath, Dictionary<string, object> filters) where T : class
        {
            var offset = 0;
            const int limit = 50;

            var request = OdsRequest(elementPath);
            request.Method = Method.Get;
            request.AddParameter("offset", offset, ParameterType.QueryString);
            request.AddParameter("limit", limit, ParameterType.QueryString);

            foreach (var (key, value) in filters)
            {
                request.AddParameter(key, value, ParameterType.QueryString);
            }

            var responseList = new List<T>();
            List<T> pageItems;

            do
            {
                var restResponse = ExecuteRequestAndHandleErrors(request);

                pageItems = JsonConvert.DeserializeObject<List<T>>(restResponse.Content);
                responseList.AddRange(pageItems);

                offset += limit;
                request.AddOrUpdateParameter("offset", offset);
            }
            while (pageItems.Count >= limit);

            return responseList;
        }

        public IReadOnlyList<T> GetAll<T>(string elementPath, Dictionary<string, object> filters, int offset, int limit) where T : class
        {
            var request = OdsRequest(elementPath);
            request.Method = Method.Get;
            request.AddParameter("offset", offset, ParameterType.QueryString);
            request.AddParameter("limit", limit, ParameterType.QueryString);
            if (filters != null)
            {
                foreach (var (key, value) in filters)
                {
                    request.AddParameter(key, value, ParameterType.QueryString);
                }
            }
            var restResponse = ExecuteRequestAndHandleErrors(request);
            var items = JsonConvert.DeserializeObject<List<T>>(restResponse.Content);
            return items;
        }

        public (IReadOnlyList<T> Items, int? TotalCount) GetAllWithTotalCount<T>(string elementPath, Dictionary<string, object> filters, int offset, int limit, bool totalCount = false) where T : class
        {
            var request = OdsRequest(elementPath);
            request.Method = Method.Get;
            request.AddParameter("offset", offset, ParameterType.QueryString);
            request.AddParameter("limit", limit, ParameterType.QueryString);
            if (totalCount)
            {
                request.AddParameter("totalCount", true, ParameterType.QueryString);
            }
            if (filters != null)
            {
                foreach (var (key, value) in filters)
                {
                    request.AddParameter(key, value, ParameterType.QueryString);
                }
            }
            var restResponse = ExecuteRequestAndHandleErrors(request);
            var items = JsonConvert.DeserializeObject<List<T>>(restResponse.Content);
            int? total = null;
            if (restResponse.Headers != null)
            {
                var totalHeader = restResponse.Headers.FirstOrDefault(h => string.Equals(h.Name, "total-count", StringComparison.OrdinalIgnoreCase));
                if (totalHeader != null && int.TryParse(totalHeader.Value?.ToString(), out var parsed))
                {
                    total = parsed;
                }
            }
            return (items, total);
        }

        public T GetById<T>(string elementPath, string id) where T : class
        {
            var request = OdsRequest(elementPath);
            request.AddUrlSegment("id", id);
            var response = ExecuteRequestAndHandleErrors(request);
            return JsonConvert.DeserializeObject<T>(response.Content);
        }

        public OdsApiResult PostResource<T>(T resource, string elementPath, bool refreshToken = false)
        {
            var request = OdsRequest(elementPath);
            request.Method = Method.Post;

            try
            {
                var jsonInput = JsonConvert.SerializeObject(resource);
                request.AddJsonBody(jsonInput);
            }
            catch (Exception ex)
            {
                throw new AdminAppException("Failed to serialize resource", ex);
            }
            return ExecuteWithDefaultResponse(request);
        }

        public OdsApiResult PutResource<T>(T resource, string elementPath, string id, bool refreshToken = false)
        {
            var request = OdsRequest($"{elementPath}/{id}");
            request.Method = Method.Put;

            try
            {
                var jsonInput = JsonConvert.SerializeObject(resource);
                request.AddJsonBody(jsonInput);
            }
            catch (Exception ex)
            {
                throw new AdminAppException("Failed to serialize resource", ex);
            }

            return ExecuteWithDefaultResponse(request);
        }
        public IRestClient CreateRestClient(string url) {
            return new RestClient(url);
        }
        public IReadOnlyList<string> GetAllDescriptors()
        {
            RestClientOptions options = new RestClientOptions();
            options.BaseUrl = new Uri(_connectionInformation.DescriptorsUrl);
            _restClient = new RestClient(_connectionInformation.DescriptorsUrl);
            var request = OdsRequest("swagger.json");
            var response = ExecuteRequestAndHandleErrors(request);
            var swaggerDocument = JsonConvert.DeserializeObject<JObject>(response.Content);
            var descriptorPaths = swaggerDocument["paths"].ToObject<Dictionary<string, JObject>>();

            var descriptorsList = new SortedSet<string>();

            if (descriptorPaths != null)
            {
                foreach (var descriptorPath in descriptorPaths.Keys)
                {
                    //Paths take the form /extension/name, /extension/name/{id}, /extension/name/deletes, etc.
                    //Here we extract distinct /extension/name.
                    var resourceParts = descriptorPath.TrimStart('/').Split('/').Take(2).ToArray();

                    if (resourceParts.Length >= 2)
                        descriptorsList.Add($"/{resourceParts[0]}/{resourceParts[1]}");
                }
            }

            return descriptorsList.ToList();
        }

        public OdsApiResult DeleteResource(string elementPath, string id, bool refreshToken = false)
        {
            var request = OdsRequest(elementPath);
            request.Method = Method.Delete;
            request.AddUrlSegment("id", id);
            return ExecuteWithDefaultResponse(request);
        }
    }
}
