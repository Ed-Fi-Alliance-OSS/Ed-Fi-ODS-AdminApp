using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
using System.Reflection;

namespace EdFi.Ods.Admin.Api.Infrastructure.Documentation
{
    [AttributeUsage(AttributeTargets.Property)]
    public class SwaggerExcludeAttribute : Attribute
    {
    }

    public class SwaggerExcludeSchemaFilter : ISchemaFilter
    {
        public void Apply(OpenApiSchema schema, SchemaFilterContext context)
        {
            var properties = context.Type.GetProperties();

            foreach (var property in properties)
            {
                var attribute = property.GetCustomAttribute(typeof(SwaggerExcludeAttribute));
                var propertyNameInCamelCasing = char.ToLowerInvariant(property.Name[0]) + property.Name.Substring(1);

                if (attribute != null)
                {
                    schema.Properties.Remove(propertyNameInCamelCasing);
                }
            }
        }
    }
}
