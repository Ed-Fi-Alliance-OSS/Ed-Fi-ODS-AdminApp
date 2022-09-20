using AutoMapper;
using EdFi.Ods.Admin.Api.Infrastructure;
using EdFi.Ods.AdminApp.Management.ClaimSetEditor;
using FluentValidation;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
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

        public async Task<IResult> Handle(Validator validator,IGetClaimSetByNameQuery getClaimSetByNameQuery, ClaimSetFileImportCommand claimSetFileImportCommand,
            IMapper mapper, Request request)
        {
            await validator.GuardAsync(request);

            var sharingModel = new SharingModel
            {
                Title = "Add Claim Set",
                Template = new SharingTemplate
                {
                    ClaimSets = new SharingClaimSet[]
                    {
                        new SharingClaimSet{
                        Name = request.Name,
                        ResourceClaims = request.ResourceClaims?.Select(x =>JObject.Parse(JsonConvert.SerializeObject(x))).ToList()
                        }
                    }
                }
            };
            claimSetFileImportCommand.Execute(sharingModel);
            var createdClaimSet = getClaimSetByNameQuery.Execute(request.Name);
            var model = mapper.Map<ClaimSetModel>(createdClaimSet);
            model.ClaimSetContent = new ClaimSetContent
            {
                Name = request.Name,
                ResourceClaims = mapper.Map<List<ResourceClaimModel>>(request.ResourceClaims?.ToList())
            };
            return AdminApiResponse<ClaimSetModel>.Created(model, "ClaimSet", $"/claimsets/{model.Id}");
        }

        [SwaggerSchema(Title = "AddClaimSetRequest")]
        public class Request : IClaimSetContent
        {
            [SwaggerSchema(Description = FeatureConstants.ClaimSetNameDescription, Nullable = false)]
            public string? Name { get; set; }

            [SwaggerSchema(Description = FeatureConstants.ResourceClaimsDescription, Nullable = false)]
            public List<ResourceClaimModel>? ResourceClaims { get; set; }
        }

        public class Validator : AbstractValidator<Request>
        {
            private readonly IGetClaimSetByNameQuery _byNameQuery;
            public Validator(IGetClaimSetByNameQuery byNameQuery)
            {
                _byNameQuery = byNameQuery;
                RuleFor(m => m.Name).NotEmpty()
                    .Must(BeAUniqueName)
                    .WithMessage("A claim set with this name already exists in the database. Please enter a unique name.");

                RuleFor(m => m.Name)
                    .MaximumLength(255)
                    .WithMessage("The claim set name must be less than 255 characters.");
            }

            private bool BeAUniqueName(string? name)
            {
                return true;
               // return _byNameQuery.Execute(name) == null;
            }
        }
    }
}
