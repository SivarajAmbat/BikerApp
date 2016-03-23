using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class OrderDetailedItem
    {
        public int ID{ get; set; }

        public int? Order_Id{ get; set; }

        public int? Item_Id{ get; set; }
        public string ItemName { get; set; }

        public double? Required_Quantity{ get; set; }

        public double? Pending_Quantity { get; set; }

        public double? Supplied_Quantity{ get; set; }

        public DateTime? Created_On{ get; set; }

        public string Created_By{ get; set; }

        public DateTime? Updated_On{ get; set; }

        public string Updated_By{ get; set; }
    }
}
