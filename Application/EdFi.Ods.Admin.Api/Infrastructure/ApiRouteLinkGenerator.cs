// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.Admin.Api.Infrastructure
{
    public class ApiRouteLinkGenerator : LinkGenerator
    {
        public ApiRouteLinkGenerator(LinkGenerator linkGenerator) => LinkGenerator = linkGenerator;

        protected LinkGenerator LinkGenerator { get; }

        public override string? GetPathByAddress<TAddress>(HttpContext httpContext, TAddress address, RouteValueDictionary values,
            RouteValueDictionary? ambientValues = null, PathString? pathBase = null,
            FragmentString fragment = new FragmentString(), LinkOptions? options = null)
        {
            AddApiVersionRouteValueIfNecessary(httpContext, values);
            return LinkGenerator.GetPathByAddress(httpContext, address, values, ambientValues, pathBase, fragment, options);
        }

        public override string? GetPathByAddress<TAddress>(TAddress address, RouteValueDictionary values,
            PathString pathBase = new PathString(), FragmentString fragment = new FragmentString(),
            LinkOptions? options = null)
            => LinkGenerator.GetPathByAddress(address, values, pathBase, fragment, options);

        public override string? GetUriByAddress<TAddress>(HttpContext httpContext, TAddress address, RouteValueDictionary values,
            RouteValueDictionary? ambientValues = null, string? scheme = null,
            HostString? host = null, PathString? pathBase = null, FragmentString fragment = new FragmentString(),
            LinkOptions? options = null)
        {
            AddApiVersionRouteValueIfNecessary(httpContext, values);
            return LinkGenerator.GetUriByAddress(httpContext, address, values, ambientValues, scheme, host, pathBase, fragment, options);
        }

        public override string? GetUriByAddress<TAddress>(TAddress address, RouteValueDictionary values, string? scheme,
            HostString host, PathString pathBase = new PathString(),
            FragmentString fragment = new FragmentString(), LinkOptions? options = null)
            => LinkGenerator.GetUriByAddress(address, values, scheme, host, pathBase, fragment, options);

        static void AddApiVersionRouteValueIfNecessary(HttpContext httpContext, RouteValueDictionary values)
        {
            if (httpContext == null)
            {
                throw new ArgumentNullException(nameof(httpContext));
            }

            if (values == null)
            {
                throw new ArgumentNullException(nameof(values));
            }

            var feature = httpContext.ApiVersioningFeature();
            var key = feature.RouteParameter;

            if (string.IsNullOrEmpty(key))
            {
                return;
            }

            var value = feature.RawRequestedApiVersion;

            if (!string.IsNullOrEmpty(value) && !values.ContainsKey(key))
            {
                values.Add(key, value);
            }
        }
    }

    public sealed class ApiRouteLinkGenerator<T> : ApiRouteLinkGenerator where T : LinkGenerator
    {
        public ApiRouteLinkGenerator(T linkGenerator) : base(linkGenerator) { }
    }
}
