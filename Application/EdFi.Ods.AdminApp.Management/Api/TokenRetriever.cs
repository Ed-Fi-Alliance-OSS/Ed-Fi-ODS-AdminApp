// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Net;
using System.Text.Json;
using System.Text.Json.Serialization;
using EdFi.Ods.AdminApp.Management.ErrorHandling;
using Newtonsoft.Json;
using RestSharp;
using RestSharp.Serializers.Json;

namespace EdFi.Ods.AdminApp.Management.Api
{
    public interface ITokenRetriever
    {
        string ObtainNewBearerToken();
    }

    public class TokenRetriever : ITokenRetriever
    {
        private readonly OdsApiConnectionInformation _connectionInformation;

        /// <summary>
        /// </summary>
        /// <param name="connectionInformation"></param>
        public TokenRetriever(OdsApiConnectionInformation connectionInformation)
        {
            _connectionInformation = connectionInformation;
        }

        public string ObtainNewBearerToken()
        {
            //var oauthClient = new RestClient(_connectionInformation.OAuthUrl);
            var restOptions = new RestClientOptions(_connectionInformation.OAuthUrl)
            {
#if DEBUG
                RemoteCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true,
#endif
            };
            var oauthClient = new RestClient(
                restOptions,
                configureSerialization: s =>
                    s.UseSystemTextJson(new JsonSerializerOptions
                    {
                        PropertyNamingPolicy = JsonNamingPolicy.SnakeCaseLower
                    })
                );
            try
            {
                return GetBearerToken(oauthClient);
            }
            catch (OdsApiConnectionException)
            {
                throw;
            }
            catch (System.Text.Json.JsonException exception)
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
            var bearerTokenRequest = new RestRequest("oauth/token", Method.Post);
            bearerTokenRequest.AddParameter("Client_id", _connectionInformation.ClientKey);
            bearerTokenRequest.AddParameter("Client_secret", _connectionInformation.ClientSecret);
            bearerTokenRequest.AddParameter("Grant_type", "client_credentials");

            var bearerTokenResponse = oauthClient.Execute<BearerTokenResponse>(bearerTokenRequest);

            var additionalErrorMessage = "<br/> Please verify the configuration and try restarting the ODS / API. Then, reload this to see if this same error occurs.";

            switch (bearerTokenResponse.StatusCode)
            {
                case HttpStatusCode.OK:
                    break;
                case 0:
                    throw new OdsApiConnectionException(HttpStatusCode.NotFound, bearerTokenResponse.ErrorMessage,
                        $"No response from API. Please verify the API ({_connectionInformation.ApiServerUrl})) is running. {additionalErrorMessage}"){ AllowFeedback = false, };
                case HttpStatusCode.NotFound:
                    throw new OdsApiConnectionException(HttpStatusCode.NotFound, bearerTokenResponse.ErrorMessage,
                        $"API not found. Please verify the address ({_connectionInformation.ApiServerUrl})) is configured correctly."){ AllowFeedback = false, };
                case HttpStatusCode.ServiceUnavailable:
                    throw new OdsApiConnectionException(HttpStatusCode.ServiceUnavailable, bearerTokenResponse.ErrorMessage,
                        "API service is unavailable. Please verify the API hosting configuration is correct."){ AllowFeedback = false, };
                default:
                    throw new OdsApiConnectionException(HttpStatusCode.ServiceUnavailable, bearerTokenResponse.ErrorMessage,
                        $"Unexpected response from API: {bearerTokenResponse.ErrorMessage}. {additionalErrorMessage}"){ AllowFeedback = true, };
            }

            if (bearerTokenResponse.Data.Error != null || bearerTokenResponse.Data.TokenType != "bearer")
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
        public int ExpiresIn { get; set; }
        public string TokenType { get; set; }
        public string Error { get; set; }
    }
}
