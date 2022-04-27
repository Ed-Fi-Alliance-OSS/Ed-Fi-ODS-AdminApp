using System.Net;

namespace EdFi.Ods.Admin.Api.Features.Error
{
    public class ErrorModel
    {
        public IList<string> ErrorMessages { get; }
        public string? StackTrace { get; }
        public HttpStatusCode? StatusCode { get; }
   
        public ErrorModel(Exception exception)
        {
            StackTrace = exception.StackTrace;
            ErrorMessages = new List<string> { exception.Message };

            if (exception is FailedValidationException validationException)
            {
                StatusCode = HttpStatusCode.BadRequest;                             
                ErrorMessages = validationException.Result.Errors.Select(x => x.ErrorMessage).ToList();
                StackTrace = string.Empty;
            }
            else
            {
                StatusCode = HttpStatusCode.InternalServerError;             
            }
        }
    }
}
