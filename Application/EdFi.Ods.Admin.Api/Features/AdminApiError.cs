﻿// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using FluentValidation.Results;

namespace EdFi.Ods.Admin.Api.Features;

public class AdminApiError
{
    protected AdminApiError(int status, string title, IEnumerable<string> errors)
    {
        Status = status;
        Title = title;
        Errors = errors;
    }

    public int Status { get; }
    public string Title { get; }
    public IEnumerable<string> Errors { get; }

    public static IResult Validation(IEnumerable<ValidationFailure> errors)
        => Results.ValidationProblem(errors
            .GroupBy(e => e.PropertyName).ToDictionary(g => g.Key, g => g.Select(f => f.ErrorMessage).ToArray()));

    public static IResult Unexpected(string message)
        => Results.Problem(statusCode: 500, title: message);

    public static IResult Unexpected(string message, IEnumerable<string> errors)
        => Results.Problem(statusCode: 500, title: message, extensions: new Dictionary<string, object?> { { "errors", errors } });

    public static IResult Unexpected(Exception exception)
        => Results.Problem(statusCode: 500, title: exception.Message, extensions: new Dictionary<string, object?> { { "stacktrace", exception.StackTrace } });
}
