// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Net;
using EdFi.Ods.AdminApp.Management.ErrorHandling;
using Newtonsoft.Json;
using RestSharp;

namespace EdFi.Ods.AdminApp.Management.AdminApi
{
    public interface IAdminApiTokenRetriever
    {
        string ObtainNewBearerToken();
    }

    public class AdminApiTokenRetriever : IAdminApiTokenRetriever
    {
        private readonly AdminApiConnectionInformation _connectionInformation;
      
        public AdminApiTokenRetriever(AdminApiConnectionInformation connectionInformation)
        {
            _connectionInformation = connectionInformation;
        }

        public string ObtainNewBearerToken()
        {
            var oauthClient = new RestClient(_connectionInformation.OAuthUrl);

            try
            {
                return GetBearerToken(oauthClient);
            }
            catch (OdsApiConnectionException)
            {
                throw;
            }
            catch (JsonException exception)
            {
                throw new AdminAppException($"Unexpected response format from API. Please verify the address ({_connectionInformation.OAuthUrl}) is configured correctly.", exception) { AllowFeedback = false, };
            }
            catch (Exception exception)
            {
                throw new AdminAppException($"Unexpected error while connecting to API: {exception.Message}", exception);
            }
        }

        private string GetBearerToken(IRestClient oauthClient)
        {
            var bearerTokenRequest = new RestRequest("connect/token", Method.POST);
            bearerTokenRequest.AddParameter("client_id", _connectionInformation.ClientKey);
            bearerTokenRequest.AddParameter("client_secret", _connectionInformation.ClientSecret);
            bearerTokenRequest.AddParameter("grant_type", "client_credentials");
            bearerTokenRequest.AddParameter("scope", "edfi_admin_api/full_access");

            var bearerTokenResponse = oauthClient.Execute<BearerTokenResponse>(bearerTokenRequest);

            var additionalErrorMessage = "<br/> Please verify the configuration and try restarting the ODS / API. Then, reload this to see if this same error occurs.";

            switch (bearerTokenResponse.StatusCode)
            {
                case HttpStatusCode.OK:
                    break;
                case 0:
                    throw new OdsApiConnectionException(HttpStatusCode.NotFound, bearerTokenResponse.ErrorMessage,
                        $"No response from AdminAPI. Please verify the AdminAPI ({_connectionInformation.ApiServerUrl})) is running. {additionalErrorMessage}"){ AllowFeedback = false, };
                case HttpStatusCode.NotFound:
                    throw new OdsApiConnectionException(HttpStatusCode.NotFound, bearerTokenResponse.ErrorMessage,
                        $"AdminAPI not found. Please verify the address ({_connectionInformation.ApiServerUrl})) is configured correctly."){ AllowFeedback = false, };
                case HttpStatusCode.ServiceUnavailable:
                    throw new OdsApiConnectionException(HttpStatusCode.ServiceUnavailable, bearerTokenResponse.ErrorMessage,
                        "AdminAPI service is unavailable. Please verify the API hosting configuration is correct."){ AllowFeedback = false, };
                default:
                    throw new OdsApiConnectionException(HttpStatusCode.ServiceUnavailable, bearerTokenResponse.ErrorMessage,
                        $"Unexpected response from AdminAPI: {bearerTokenResponse.ErrorMessage}. {additionalErrorMessage}"){ AllowFeedback = true, };
            }

            if (bearerTokenResponse.Data.Error != null || bearerTokenResponse.Data.TokenType != "Bearer")
            {
                throw new OdsApiConnectionException(HttpStatusCode.OK, bearerTokenResponse.ErrorMessage,
                    "Unable to retrieve an access token. Please verify that your application secret is correct.") { AllowFeedback = false, };
            }

            return bearerTokenResponse.Data.AccessToken;
        }
    }

    internal class BearerTokenResponse
    {
        public string AccessToken { get; set; }
        public string ExpiresIn { get; set; }
        public string TokenType { get; set; }
        public string Error { get; set; }
    }
}
