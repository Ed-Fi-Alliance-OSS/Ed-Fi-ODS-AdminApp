// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using FluentValidation;
using FluentValidation.Results;

namespace EdFi.Ods.Admin.Api.Features.Vendors;

public class SamplesRouteBuilder : IFeature
{
    public void MapEndpoints(IEndpointRouteBuilder endpoints)
    {
        endpoints.MapGet("/samples/success", OK);
        endpoints.MapPost("/samples/success", Created);
        endpoints.MapPut("/samples/success", Updated);
        endpoints.MapDelete("/samples/success", Deleted);

        endpoints.MapPost("/samples/badrequest", BadRequest);
        endpoints.MapPut("/samples/badrequest", BadRequest);
        endpoints.MapDelete("/samples/badrequest", BadRequest);

        endpoints.MapGet("/samples/notfound", NotFound);
        endpoints.MapPut("/samples/notfound", NotFound);
        endpoints.MapDelete("/samples/notfound", NotFound);

        endpoints.MapGet("/samples/error", Error);
        endpoints.MapPost("/samples/error", Error);
        endpoints.MapPut("/samples/error", Error);
        endpoints.MapDelete("/samples/error", Error);
    }

    internal IResult OK(HttpContext context) => AdminApiResponse<SampleObject>.Ok(new SampleObject());

    internal IResult Created(HttpContext context) => AdminApiResponse<SampleObject>.Created(new SampleObject(), "Sample", "samples/success/1");

    internal IResult Updated(HttpContext context) => AdminApiResponse<SampleObject>.Updated(new SampleObject(), "Sample");

    internal IResult Deleted(HttpContext context) => AdminApiResponse.Deleted("Sample");

    internal IResult BadRequest(HttpContext context) => throw new ValidationException(
        new[] {new ValidationFailure("Prop1", "Error 1"), new ValidationFailure("Prop2", "Error 2")});

    internal IResult NotFound(HttpContext context) => throw new NotFoundException<int>("Sample", 2);

    internal IResult Error(HttpContext context) => throw new Exception("This is the exception message");

    internal class SampleObject
    {
        public string SampleProp { get; } = "Sample";
    }
}
