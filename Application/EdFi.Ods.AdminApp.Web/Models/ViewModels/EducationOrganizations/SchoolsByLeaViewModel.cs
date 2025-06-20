using System.Collections.Generic;
using EdFi.Ods.AdminApp.Management.Api.Models;

namespace EdFi.Ods.AdminApp.Web.Models.ViewModels.EducationOrganizations
{
    public class SchoolsByLeaViewModel
    {
        public int LeaId { get; set; }
        public List<School> Schools { get; set; }
        public int PageNumber { get; set; }
        public int TotalPages { get; set; }
        public int TotalSchools { get; set; }
    }
}
