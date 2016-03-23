using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DAL;

namespace DBTestWebService
{
    /// <summary>
    /// Summary description for Service1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Service1 : System.Web.Services.WebService
    {
        public static BikerDataClassesDataContext db = new BikerDataClassesDataContext();

        //[WebMethod]
        //public string HelloWorld()
        //{
        //    return "Hello World";
        //}

        //[WebMethod]
        //public List<Item> GetItems()
        //{
        //    return db.Items.ToList();
        //}

        //[WebMethod]
        //public List<DistDealerDetail> GetDistributors()
        //{
        //    return db.DistDealerDetails.ToList();
        //}

        BikerDAL dal = new BikerDAL();



        [WebMethod]
        public inputmessage OTPAuthentication(string empid, string imeinumber, 
            string osversion, string devicename, string otp, string appid, string devid, string ostype)
        {
            return dal.OTPAuthentication(empid, imeinumber, 
            osversion, devicename, otp, appid, devid, ostype);
        }

        [WebMethod]
        public inputmessage BikerLogInCreateOtp(string empid, string imeinumber, string osversion,
            string devicename, string appversion)
        {
            
            return dal.BikerLogInCreateOtp(empid, imeinumber, osversion,
            devicename, appversion);
        }

        public bool CheckRetailerAssigned(string BikerLoginId)
        {
            return dal.CheckRetailerAssigned(BikerLoginId);
        }


        [WebMethod]
        public List<DistDealerDetail> GetDistributors(string BikersLogInId)
        {
            return dal.GetDistributors(BikersLogInId);
        }

        [WebMethod]
        public List<Item> GetItems()
        {
            return dal.GetItems();
        }

        [WebMethod]
        public List<BeatDetail> GetBeatList(string BDistributorId, string BikersLogInId)
        {
            return dal.GetBeatList(BDistributorId, BikersLogInId);
        }

        [WebMethod]
        public List<RetailerDetail> GetRetailerList(string BeatId, string BDistributorId, string BikersLogInd,string SearchStringRetailerName)
        {
            return dal.GetRetailerList(BeatId, BDistributorId, BikersLogInd, SearchStringRetailerName);
        }

        [WebMethod]
        public List<RetailerDetail> GetRetailerListByName(string RetailerName)
        {
            return dal.GetRetailerListByName(RetailerName);
        }

        [WebMethod]
        public ResultMessage SaveNewOrder(string DestributorId, string RetailerId, string BeatId, string BikerLogInId,
            string DateOfVisit, string Visisted, string Sold, string Status, int Item_IdFan, double Required_QuantityFan,
            int Item_IdWire, double Required_QuantityWire, int Item_IdLighting, double Required_QuantityLighting)
        {
            //Required_QuantityFan=20; Item_IdWire=2; Item_IdLighting=3; BeatId=1000; DestributorId=100000; Item_IdFan=1; 
            //Status=Pending for Supply; Required_QuantityWire=200; RetailerId=1000; 
            //DateOfVisit=03/16/2016; Required_QuantityLighting=500; BikerLogInId=KD53; Sold=Yes; Visisted=Yes;


            List<OrderItemSave> OrderItemsSave = new List<OrderItemSave>();
            OrderItemsSave.Add(new OrderItemSave { Item_Id = Item_IdFan, Required_Quantity = Required_QuantityFan });
            OrderItemsSave.Add(new OrderItemSave { Item_Id = Item_IdWire, Required_Quantity = Required_QuantityWire });
            OrderItemsSave.Add(new OrderItemSave { Item_Id = Item_IdLighting, Required_Quantity = Required_QuantityLighting });
            DateTime dateofvisit = DateTime.Now;
            if (Convert.ToDateTime(DateOfVisit) != null)
                dateofvisit = Convert.ToDateTime(DateOfVisit);
            return dal.SaveNewOrder(DestributorId, RetailerId, BeatId, BikerLogInId, dateofvisit, Visisted, 
                Sold, Status, OrderItemsSave);//"Success";//"Faliure";
        }

        [WebMethod]
        public List<OrderIdBeatIdRetailId> GetOrders(string DestributorId, string BikerLogInId, string status, string RetailerId)
        {
            return dal.GetOrders(DestributorId, BikerLogInId, status, RetailerId);
        }

        [WebMethod]
        public OrderDetailed OrderDetails(int OrderId)
        {
            return dal.OrderDetails(OrderId);
        }

        [WebMethod]
        public string UpateOrder(int Order_Id, int Item_IdFan, double Supplied_QuantityFan, int Item_IdWire, double Supplied_QuantityWire, int Item_IdLighting, double Supplied_QuantityLighting, string status)
        {
            List<OrderItemUpdate> orderItemUpdates = new List<OrderItemUpdate>();
            orderItemUpdates.Add(new OrderItemUpdate { Order_Id = Order_Id, Item_Id = Item_IdFan, Supplied_Quantity = Supplied_QuantityFan });
            orderItemUpdates.Add(new OrderItemUpdate { Order_Id = Order_Id, Item_Id = Item_IdWire, Supplied_Quantity = Supplied_QuantityWire });
            orderItemUpdates.Add(new OrderItemUpdate { Order_Id = Order_Id, Item_Id = Item_IdLighting, Supplied_Quantity = Supplied_QuantityLighting });
            return dal.UpateOrder(orderItemUpdates, status);
        }

        [WebMethod]
        public DateTime GetCurrentDate() { return DateTime.Now; }
    }
}