using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class OrderDetailed
    {
        public int Order_ID { get; set; }

        //public DateTime? Date_Of_Visit { get; set; }

        //public int? Distributor_Id { get; set; }

        public string Dis_Sap_Code { get; set; }
        public string Dis_Name { get; set; }

        //public int? Beat_Id { get; set; }

        public string Beat_Code { get; set; }
        public string Beat_Name { get; set; }

        //public int? Retailer_Id { get; set; }

        public string Retailer_Code { get; set; }
        public string Retailer_Name { get; set; }

        //public bool? Visted { get; set; }

        //public bool? Sold { get; set; }

        public string Status { get; set; }

        //public DateTime? Ordered_On { get; set; }

        //public string Order_By { get; set; }

        //public DateTime? Updated_On { get; set; }

        //public string Updated_By { get; set; }

        //public List<OrderDetailedItem> OrderItems { get; set; }

        public int Item_Id_Fan { get; set; }
        public string Item_Fan_Name { get; set; } 
        public double Required_FanQuantity { get; set; }
        public double Pending_FanQuantity { get; set; }
        public int Item_Id_Wire { get; set; }
        public string Item_Wire_Name { get; set; }
        public double Required_WireQuantity { get; set; }
        public double Pending_WireQuantity { get; set; }
        public int Item_Id_Lighting { get; set; }
        public string Item_Light_Name { get; set; }
        public double Required_LightQuantity { get; set; }
        public double Pending_LightQuantity { get; set; }
    }
}
