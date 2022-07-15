using System.Reflection;

namespace EdFi.Ods.Admin.Api.Infrastructure
{
    public class AdminApiVersions
    {
        public const string v1 = "v1";
        public const string v2 = "v2";
        public static List<string> GetAllVersions()
        {
            return typeof(AdminApiVersions)
                .GetFields(BindingFlags.Public | BindingFlags.Static)
                .Where(fi => fi.IsLiteral && !fi.IsInitOnly && fi.FieldType == typeof(string))
                .Select(x => x.GetRawConstantValue() as string ?? "")
                .ToList();
        }
    }
}
