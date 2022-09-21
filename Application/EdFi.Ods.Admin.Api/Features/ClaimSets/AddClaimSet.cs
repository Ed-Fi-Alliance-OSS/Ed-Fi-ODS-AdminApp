using AutoMapper;
using EdFi.Ods.Admin.Api.Infrastructure;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using EdFi.Security.DataAccess.Contexts;
using FluentValidation;
using Swashbuckle.AspNetCore.Annotations;

namespace EdFi.Ods.Admin.Api.Features.ClaimSets
{
    public class AddClaimSet : IFeature
    {
        public void MapEndpoints(IEndpointRouteBuilder endpoints)
        {
            AdminApiEndpointBuilder.MapPost(endpoints, "/claimsets", Handle)
            .WithDefaultDescription()
            .WithRouteOptions(b => b.WithResponse<ClaimSetModel>(201))
            .BuildForVersions(AdminApiVersions.V1);
        }

        public async Task<IResult> Handle(Validator validator, AddClaimSetCommand addClaimSetCommand,
            AddOrUpdateResourcesOnClaimSetCommand addOrUpdateResourcesOnClaimSetCommand,
            IGetClaimSetByIdQuery getClaimSetByIdQuery,
            IGetResourcesByClaimSetIdQuery getResourcesByClaimSetIdQuery,
            IMapper mapper, Request request)
        {
            await validator.GuardAsync(request);
            var addedClaimSetId = addClaimSetCommand.Execute(new AddClaimSetModel
            {
                ClaimSetName = request.Name
            });

            addOrUpdateResourcesOnClaimSetCommand.Execute(addedClaimSetId, mapper.Map<List<ResourceClaim>>(request.ResourceClaims));

            var calimSet = getClaimSetByIdQuery.Execute(addedClaimSetId);
            var allResources = getResourcesByClaimSetIdQuery.AllResources(addedClaimSetId);
            var model = mapper.Map<ClaimSetModel>(calimSet);
            model.ResourceClaims = mapper.Map<List<ResourceClaimModel>>(allResources.ToList());
            return AdminApiResponse<ClaimSetModel>.Created(model, "ClaimSet", $"/claimsets/{addedClaimSetId}");
        }

        [SwaggerSchema(Title = "AddClaimSetRequest")]
        public class Request : IAddClaimSetModel
        {
            [SwaggerSchema(Description = FeatureConstants.ClaimSetNameDescription, Nullable = false)]
            public string? Name { get; set; }

            [SwaggerSchema(Description = FeatureConstants.ResourceClaimsDescription, Nullable = false)]
            public List<ResourceClaimModel>? ResourceClaims { get; set; }
        }

        public class Validator : AbstractValidator<Request>
        {
            private readonly ISecurityContext _securityContext;
            public Validator(ISecurityContext securityContext)
            {
                _securityContext = securityContext;
                RuleFor(m => m.Name).NotEmpty()
                    .Must(BeAUniqueName)
                    .WithMessage("A claim set with this name already exists in the database. Please enter a unique name.");

                RuleFor(m => m.Name)
                    .MaximumLength(255)
                    .WithMessage("The claim set name must be less than 255 characters.");
            }

            private bool BeAUniqueName(string? name)
            {
                return !_securityContext.ClaimSets.Any(x => x.ClaimSetName == name);
            }
        }
    }
}
