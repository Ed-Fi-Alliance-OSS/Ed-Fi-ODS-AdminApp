using EdFi.Ods.Admin.Api.Features.Error;
using log4net;
using Microsoft.AspNetCore.Diagnostics;

namespace EdFi.Ods.Admin.Api.Extensions
{
    public static class ExceptionHandler
    {
        public static async Task ExecuteAsync(HttpContext context, ILog _logger)
        { 
            var exceptionHandlerFeature = context.Features.Get<IExceptionHandlerPathFeature>();
            var exception = exceptionHandlerFeature?.Error ?? new Exception();
            _logger.Error(exception);
            var errorModel = new ErrorModel(exception);
            await context.Response.WriteAsJsonAsync(errorModel);            
        }
    }
}
