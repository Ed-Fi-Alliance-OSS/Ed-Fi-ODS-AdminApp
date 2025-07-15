using Microsoft.AspNetCore.Mvc.Rendering;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels
{
    public class SelectListItemWithDescription : SelectListItem
    {
        public string Description { get; set; } = string.Empty;
    }
}
