//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Luminous.Biker.Web.Models
{
    using System;
    using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
    
    [MetadataTypeAttribute(typeof(BikerBoyDetailMeta))]
    public partial class BikerBoyDetail
	{
		
	}

    public class BikerBoyDetailMeta
    {
        //public BikerBoyDetail()
        //{
        //    this.BikerDistMappings = new HashSet<BikerDistMapping>();
        //}
    
        public int ID { get; set; }

        [Display(Name = "Biker Code")]
        [Required]
        public string BB_Code { get; set; }

        [Display(Name = "Name")]
        public string BB_Name { get; set; }

        [Display(Name = "Date Of Joining")]
        public Nullable<System.DateTime> Date_Of_Joining { get; set; }
        public string Region { get; set; }

        [Display(Name = "Zonal Code")]
        public string Zonal_Code { get; set; }

        [Display(Name = "State")]
        public string BB_State { get; set; }

        public string Town { get; set; }

        [Display(Name = "Contact Number")]
        [Required]
        public string Mob { get; set; }

        [Display(Name = "Code")]
        public string ZM_Name { get; set; }

        [Display(Name = "ZM Code")]
        public string ZM_Code { get; set; }

        [Display(Name = "RM Name")]
        public string RM_Name { get; set; }

        [Display(Name = "Code")]
        public string RM_Code { get; set; }

        [Display(Name = "ASM Name")]
        public string ASM_Name { get; set; }

        [Display(Name = "ASM Code")]
        public string ASM_Code { get; set; }

        [Display(Name = "Cord1 Name")]
        public string Cord1_Name { get; set; }

        [Display(Name = "Cord1 Code")]
        public string Cord1_Code { get; set; }

        [Display(Name = "Cord2 Name")]
        public string Cord2_Name { get; set; }

        [Display(Name = "Cord2 Code")]
        public string Cord2_Code { get; set; }

        [Display(Name = "Branch Manager")]
        public string BranchManager { get; set; }

        public string Active { get; set; }

    
        //public virtual ICollection<BikerDistMapping> BikerDistMappings { get; set; }
    }
}
