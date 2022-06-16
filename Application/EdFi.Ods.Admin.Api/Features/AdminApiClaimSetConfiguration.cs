using EdFi.Ods.AdminApp.Management;
using EdFi.Ods.AdminApp.Management.Configuration.Claims;
using static EdFi.Ods.AdminApp.Management.Configuration.Claims.CloudOdsClaimAction;
using static EdFi.Ods.AdminApp.Management.Configuration.Claims.CloudOdsClaimAuthorizationStrategy;

namespace EdFi.Ods.Admin.Api.Features
{
    public class AdminApiClaimSetConfiguration
    {
        public static CloudOdsClaimSet Default = new CloudOdsClaimSet
        {
            ApplicationName = CloudOdsAdminApp.SecurityContextApplicationName,
            ClaimSetName = CloudOdsAdminApp.InternalAdminAppClaimSet,
            Claims = new[]
            {
                new CloudOdsEntityClaim
                {
                    EntityName = "educationOrganizations",
                    Actions = new[] { Create, Read, Update, Delete },
                    AuthorizationStrategy = NoFurtherAuthorizationRequired
                },
                new CloudOdsEntityClaim
                {
                    EntityName = "systemDescriptors",
                    Actions = new[] { Create, Read, Update, Delete },
                    AuthorizationStrategy = NoFurtherAuthorizationRequired
                },
                new CloudOdsEntityClaim
                {
                    EntityName = "managedDescriptors",
                    Actions = new[] { Create, Read, Update, Delete },
                    AuthorizationStrategy = NoFurtherAuthorizationRequired
                },
                new CloudOdsEntityClaim
                {
                    EntityName = "types",
                    Actions = new[] { Read },
                    AuthorizationStrategy = NoFurtherAuthorizationRequired
                }
            }
        };
    }
}
