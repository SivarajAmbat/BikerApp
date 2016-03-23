using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class OrderItemUpdate
    {
        public int? Order_Id { get; set; }

        public int? Item_Id { get; set; }

        public double? Supplied_Quantity { get; set; }

    }
}
