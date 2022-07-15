using EdFi.Ods.Admin.Api.ActionFilters;
using EdFi.Ods.Admin.Api.Infrastructure.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace EdFi.Ods.Admin.Api.Infrastructure
{
    public static class EndpointRouteBuilderExtensions
    {
        internal static RouteHandlerBuilder MapGetWithDefaultOptions(this IEndpointRouteBuilder builder,
           string route, Delegate handler, string tag)
        {
            var routeHandler = builder.MapGet(route, handler);
            SetDefaultOptions(routeHandler, $"Retrieves all {tag}.", tag);
            return routeHandler;
        }

        internal static RouteHandlerBuilder MapGetByIdWithDefaultOptions(this IEndpointRouteBuilder builder,
          string route, Delegate handler, string tag)
        {
            var routeHandler = builder.MapGet(route, handler);
            SetDefaultOptions(routeHandler, $"Retrieves a specific {tag.ToSingleEntity()} based on the resource identifier.", tag);
            return routeHandler;
        }

        internal static RouteHandlerBuilder MapPostWithDefaultOptions(this IEndpointRouteBuilder builder,
           string route, Delegate handler, string tag)
        {
            var routeHandler = builder.MapPost(route, handler);
            SetDefaultOptions(routeHandler, $"Creates {tag.ToSingleEntity()} based on the supplied values.", tag);
            return routeHandler;
        }

        internal static RouteHandlerBuilder MapPutWithDefaultOptions(this IEndpointRouteBuilder builder,
           string route, Delegate handler, string tag)
        {
            var routeHandler = builder.MapPut(route, handler);
            SetDefaultOptions(routeHandler, $"Updates {tag.ToSingleEntity()} based on the resource identifier.", tag);
            return routeHandler;
        }

        internal static RouteHandlerBuilder MapDeleteWithDefaultOptions(this IEndpointRouteBuilder builder,
           string route, Delegate handler, string tag)
        {
            var routeHandler = builder.MapDelete(route, handler);
            SetDefaultOptions(routeHandler, $"Deletes an existing {tag.ToSingleEntity()} using the resource identifier.", tag);
            return routeHandler;
        }

        private static void SetDefaultOptions(RouteHandlerBuilder routeHandlerBuilder, string operationSummary, string tag)
        {
            routeHandlerBuilder.WithMetadata(new OperationDescriptionAttribute(operationSummary, null));
            routeHandlerBuilder.WithTags(tag);
            routeHandlerBuilder.RequireAuthorization();
        }

        internal static RouteHandlerBuilder MapApiVersion(this RouteHandlerBuilder builder, string version)
        {
            builder.WithMetadata(new ApiVersionAttribute("1.0"));
            builder.WithMetadata(new EndpointGroupNameAttribute(version));
            return builder;
        }
    }
}
