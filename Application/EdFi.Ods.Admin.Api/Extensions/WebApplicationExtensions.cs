// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Admin.Api.Features;
using System.Reflection;

namespace EdFi.Ods.Admin.Api.Extensions
{
    public static class WebApplicationExtensions
    {
        public static void UseRouteBuilders(this WebApplication application)
        {
            var type = typeof(IRouteBuilderBase);
            var routeBuilderTypes = Assembly.GetExecutingAssembly().GetTypes()
                .Where(p => type.IsAssignableFrom(p) && p.IsClass);

            var routeBuilders = new List<IRouteBuilderBase>();

            foreach (var routeBuilderType in routeBuilderTypes)
            {
                var routeBuilder = Activator.CreateInstance(routeBuilderType) as IRouteBuilderBase;
                if(routeBuilder != null)
                  routeBuilders.Add(routeBuilder);
            }

            application.UseEndpoints(endpoints => {

                foreach (var routeBuilder in routeBuilders)
                {
                    routeBuilder.AddEndPoints(endpoints);
                }
            });
        }
    }
}
