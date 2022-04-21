// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using FluentValidation.Results;

public static class ValidatorExtensions
{
    public static Dictionary<string, string[]> ToDictionary(this List<ValidationFailure> errors)
    {
        var result = new Dictionary<string, string[]>();
        foreach (var error in errors)
        {
            result.Add(error.PropertyName, new string[] { error.ErrorMessage });
        }
        return result;
    }
}
