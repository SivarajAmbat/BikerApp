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
    
    public partial class BeatDetail
    {
        public BeatDetail()
        {
            this.OrderDetails = new HashSet<OrderDetail>();
            this.RetailerDetails = new HashSet<RetailerDetail>();
            this.BeatDistributorMappings = new HashSet<BeatDistributorMapping>();
            this.RetailBeatMappings = new HashSet<RetailBeatMapping>();
        }
    
        public int ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public Nullable<int> Distributor_Id { get; set; }
        public string Contact_person { get; set; }
        public string State { get; set; }
        public string Cityarea { get; set; }
        public string Address { get; set; }
        public string Pin_Code { get; set; }
        public string Contact_Number { get; set; }
        public Nullable<bool> Active_Status { get; set; }
        public Nullable<System.DateTime> Date_Of_Joining { get; set; }
    
        public virtual DistDealerDetail DistDealerDetail { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<RetailerDetail> RetailerDetails { get; set; }
        public virtual ICollection<BeatDistributorMapping> BeatDistributorMappings { get; set; }
        public virtual ICollection<RetailBeatMapping> RetailBeatMappings { get; set; }
    }
}
