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

    [MetadataTypeAttribute(typeof(ItemMeta))]
    public partial class Item
    {
        
    }

    public class ItemMeta
    {
        //public Item()
        //{
        //    this.OrderItems = new HashSet<OrderItem>();
        //}
    
        public int ID { get; set; }

        [Display(Name = "Item Name")]
        [Required]
        public string ItemName { get; set; }
    
        //public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}
