using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class OrderDetailItems
    {
        public OrderDetail OrderDetailObj { get; set; }
        public List<OrderItem> OrderItems { get; set; }
    }
}
