namespace EdFi.Ods.Admin.Api.Infrastructure.Extensions
{
    public static class StringExtensions
    {
        public static string ToSingleEntity(this string input)
        {
            return input.Remove(input.Length - 1, 1);
        }

        public static string IncludeVersion(this string route, string version)
        {
            return $"/{version}{route}";
        }
    }
}
