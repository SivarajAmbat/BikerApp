using Luminous.Test.ServiceReference1;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Luminous.Test
{
    class Program
    {
        static ServiceReference1.Service1SoapClient client = new ServiceReference1.Service1SoapClient();
        static void Main(string[] args)
        {
            Console.WriteLine("1 : Save order");
            Console.WriteLine("2 : Update order");
            Console.WriteLine("3 : Get orders");
            Console.WriteLine("4 : Order Detail");
            Console.WriteLine("5 : GetRetailerListByName");
            int ip = Convert.ToInt32(Console.ReadLine());
            switch (ip)
            {
                case 1:
                    {
                        SaveOrder();
                    }
                    break;
                case 2:
                    {
                        UpdateOrder();
                    }
                    break;
                case 3:
                    {
                        GetOrders();
                    }
                    break;
                case 4:
                    {
                        GetOrderById();
                    }
                    break;
                case 5:
                    {
                        GetRetailerListByName();
                    }
                    break;
                default:
                    break;
            }
            Console.ReadLine();
        }

        private static void GetRetailerListByName()
        {
            string RetailerName = "Techfour";
            RetailerDetail[] RetailerDetails = client.GetRetailerListByName(RetailerName);
            Console.WriteLine(JsonConvert.SerializeObject(RetailerDetails));
        }

        private static void GetOrderById()
        {
            Console.WriteLine("Enter Order Id");
            int orderId = Convert.ToInt32(Console.ReadLine());
            OrderDetailed orderDetailed = client.OrderDetails(orderId);
            Console.WriteLine(JsonConvert.SerializeObject(orderDetailed));
        }

        private static void GetOrders()
        {
            string DestributorId = "100000";
            string BikerLogInId = "KD53";
            string Status = "Pending";
            string RetailerId = "90000001";
            OrderIdBeatIdRetailId[] orderDetaileds1 = client.GetOrders(DestributorId, BikerLogInId, Status, "");
            OrderIdBeatIdRetailId[] orderDetaileds2 = client.GetOrders("", BikerLogInId, Status, RetailerId);
            Console.WriteLine(JsonConvert.SerializeObject(orderDetaileds1));
            Console.WriteLine("================================================");
            Console.WriteLine(JsonConvert.SerializeObject(orderDetaileds2));
        }

        private static void UpdateOrder()
        {

            int Order_Id = 9;
            int Item_IdFan = 1;
            double Supplied_QuantityFan = 3;
            int Item_IdWire = 2;
            double Supplied_QuantityWire = 7;
            int Item_IdLighting = 3;
            double Supplied_QuantityLighting = 5;
            string status = "Partially Completed";

            client.UpateOrder(Order_Id, Item_IdFan, Supplied_QuantityFan, Item_IdWire, Supplied_QuantityWire, Item_IdLighting, Supplied_QuantityLighting, status);
        }

        private static void SaveOrder()
        {

            //Required_QuantityFan=20; Item_IdWire=2; Item_IdLighting=3; BeatId=1000; DestributorId=100000; Item_IdFan=1; 
            //Status=Pending for Supply; Required_QuantityWire=200; RetailerId=1000; 
            //DateOfVisit=03/16/2016; Required_QuantityLighting=500; BikerLogInId=KD53; Sold=Yes; Visisted=Yes;
            string DestributorId = "100000";
            string RetailerId = "90000002";
            string BeatId = "80000001";
            string BikerLogInId = "KD53";
            string DateOfVisit = "03/16/2016";
            string Visisted = "Yes";
            string Sold = "Yes";
            string Status = "Pending for Supply";

            int Item_IdFan = 1;
            double Required_QuantityFan = 20;
            int Item_IdWire = 2;
            double Required_QuantityWire = 200;
            int Item_IdLighting = 3;
            double Required_QuantityLighting = 500;


            ResultMessage message = client.SaveNewOrder(DestributorId, RetailerId,
                BeatId, BikerLogInId, DateOfVisit, Visisted, Sold, Status, Item_IdFan, Required_QuantityFan, Item_IdWire, Required_QuantityWire, Item_IdLighting, Required_QuantityLighting);

            Console.WriteLine(JsonConvert.SerializeObject(message));
        }
    }
}
