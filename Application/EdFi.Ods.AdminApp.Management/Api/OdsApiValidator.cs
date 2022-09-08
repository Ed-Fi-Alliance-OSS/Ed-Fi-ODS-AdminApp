// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using EdFi.Ods.AdminApp.Management.ErrorHandling;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace EdFi.Ods.AdminApp.Management.Api
{
    public interface IOdsApiValidator
    {
        Task<OdsApiValidatorResult> Validate(string apiServerUrl);
    }

    public class OdsApiValidatorResult
    {
        public bool IsValidOdsApi { get; set; }

        public Exception Exception { get; set; }
    }

    public class OdsApiValidator : IOdsApiValidator
    {
        private readonly IHttpClientFactory _clientFactory;

        public OdsApiValidator(IHttpClientFactory clientFactory)
        {
            _clientFactory = clientFactory;
        }

        public async Task<OdsApiValidatorResult> Validate(string apiServerUrl)
        {
            var httpClient = _clientFactory.CreateClient();

            try
            {
                using (var response = await httpClient.GetAsync(apiServerUrl))
                {
                    using (var content = response.Content)
                    {
                        var contentAsString = await content.ReadAsStringAsync();

                        var schemaJson = GetSchemaJson();

                        var schema = await NJsonSchema.JsonSchema.FromJsonAsync(schemaJson);

                        var parsedContent = TryParseJson(contentAsString);

                        if (parsedContent == null)
                        {
                            return InvalidOdsApiValidatorResult();
                        }

                        var errors = schema.Validate(parsedContent);
                        if (errors.Count == 0)
                            return new OdsApiValidatorResult
                            {
                                IsValidOdsApi = true
                            };
                    }
                }

                return InvalidOdsApiValidatorResult();
            }
            catch (Exception)
            {
                return InvalidOdsApiValidatorResult();
            }

            string GetSchemaJson() => @"{
                              ""type"": ""object"",
                              ""properties"": {
                                ""version"": {
                                  ""type"": ""string""
                                },
                                ""informationalVersion"": {
                                  ""type"": ""string""
                                },
                                ""suite"": {
                                  ""type"": ""string""
                                },
                                ""build"": {
                                  ""type"": ""string""
                                },
                                ""apiMode"": {
                                  ""type"": ""string""
                                },
                                ""dataModels"": {
                                  ""type"": ""array"",
                                  ""items"": [
                                    {
                                      ""type"": ""object"",
                                      ""properties"": {
                                        ""name"": {
                                          ""type"": ""string""
                                        },
                                        ""version"": {
                                          ""type"": ""string""
                                        },
                                        ""informationalVersion"": {
                                          ""type"": ""string""
                                        }
                                      },
                                      ""required"": [
                                        ""name"",
                                        ""version""
                                      ]
                                    },
                                    {
                                      ""type"": ""object"",
                                      ""properties"": {
                                        ""name"": {
                                          ""type"": ""string""
                                        },
                                        ""version"": {
                                          ""type"": ""string""
                                        },
                                        ""informationalVersion"": {
                                          ""type"": ""string""
                                        }
                                      },
                                      ""required"": [
                                        ""name"",
                                        ""version""
                                      ]
                                    }
                                  ]
                                },
                                ""urls"": {
                                  ""type"": ""object"",
                                  ""properties"": {
                                    ""dependencies"": {
                                      ""type"": ""string""
                                    },
                                    ""openApiMetadata"": {
                                      ""type"": ""string""
                                    },
                                    ""oauth"": {
                                      ""type"": ""string""
                                    },
                                    ""dataManagementApi"": {
                                      ""type"": ""string""
                                    },
                                    ""xsdMetadata"": {
                                      ""type"": ""string""
                                    }
                                  },
                                  ""required"": [
                                    ""dependencies"",
                                    ""openApiMetadata"",
                                    ""oauth"",
                                    ""dataManagementApi"",
                                    ""xsdMetadata""
                                  ]
                                }
                              },
                              ""required"": [
                                ""version"",
                                ""informationalVersion"",
                                ""build"",
                                ""apiMode""
                              ]
                         }";

            OdsApiValidatorResult InvalidOdsApiValidatorResult() => new()
            {
                IsValidOdsApi = false,
                Exception = new OdsApiConnectionException(
                        HttpStatusCode.BadRequest, "Invalid ODS API configured.",
                        $"Invalid ODS API configured. Please verify that the Production ODS API Url ({apiServerUrl})) is configured correctly.")
                { AllowFeedback = false }
            };
        }

        private static JObject TryParseJson(string contentAsString)
        {
            if (string.IsNullOrEmpty(contentAsString))
                return null;

            try
            {
                return JObject.Parse(contentAsString);
            }
            catch (JsonException)
            {
                return null;
            }
        }
    }
}
