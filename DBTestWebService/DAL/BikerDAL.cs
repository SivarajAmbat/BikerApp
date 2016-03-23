using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace DAL
{
    public class BikerDAL
    {
        static BikerDAL()
        {
            db = new BikerDataClassesDataContext();
            db.DeferredLoadingEnabled = false;
        }

        public static BikerDataClassesDataContext db;

        OtpClient.ServiceSoapClient otpDb = new OtpClient.ServiceSoapClient();
        public inputmessage BikerLogInCreateOtp(string empid, string imeinumber, string osversion,
            string devicename, string appversion)
        {
            inputmessage msg = new inputmessage();
            System.Data.Linq.ISingleResult<MHrCreateOtpResult> mhrCreateOtpResult = db.MHrCreateOtp(empid, imeinumber, osversion, devicename, appversion);
            if (mhrCreateOtpResult != null)
            {
                SMSbyWebservice sms = SMSbyWebservice.Instance;
                var smsTemp = mhrCreateOtpResult.Where(m => m != null && !String.IsNullOrEmpty(m.Biker_Mob))
                .Select(m => new
                {
                    EmployeeId = m.Biker_Code,
                    MobileNumber = m.Biker_Mob,
                    OTP = m.otp,
                    Biker_Name = m.Biker_Name,
                    Status = m.Status,
                    Message = m.Message
                }).FirstOrDefault();

                if (smsTemp != null)
                {
                    sms.EmployeeId = smsTemp.EmployeeId;
                    sms.MobileNumber = smsTemp.MobileNumber;
                    sms.OTP = smsTemp.OTP;
                    string returnValue = sms.SendSMS();
                    //string returnValue = otpDb.sendsms(sms.MobileNumber, BodyMessage(sms.Biker_Name, sms.OTP), sms.Biker_Name, "pass@1234");// 

                    msg.Code = smsTemp.Status;
                    msg.des = smsTemp.Message;
                    return msg;
                }

                //if (!String.IsNullOrEmpty(dt.Rows[0][1].ToString()))
                //{
                //    string body = BodyMessage(dt.Rows[0][1].ToString(), dt.Rows[0][4].ToString());
                //    mailsql m2 = new mailsql(dt.Rows[0][2].ToString(), "not", "not", "Luminous_mobileApp One Time Password", body, "");
                //    m2.sendMaildb();
                //}
            }
            else
            {
                msg.Code = "ERROR";
                msg.des = "Invalid Employee";
                return msg;
            }
            return msg;
        }

        private string BodyMessage(string Biker_Name, string OTP)
        {
            return "Your one time password is " + OTP + ". It will  expire in 30 minutes";
        }

        public bool CheckRetailerAssigned(string BikerLoginId)
        {
            return true;
        }

        public inputmessage OTPAuthentication(string empid, string imeinumber,
            string osversion, string devicename, string otp, string appid, string devid, string ostype)
        {
            inputmessage msg = new inputmessage();
            System.Data.Linq.ISingleResult<MHrVarifyOtpNotificationResult> mhrVarifyOtpNotificationResult =
                db.MHrVarifyOtpNotification(empid, imeinumber, osversion, devicename, otp, appid, devid, ostype);
            if (mhrVarifyOtpNotificationResult != null)
            {
                inputmessage inputMessage = mhrVarifyOtpNotificationResult.Where(m => m != null)
                    .Select(m => new inputmessage { Code = m.Code, des = m.Message }).FirstOrDefault();
                if (inputMessage != null)
                {
                    msg.Code = inputMessage.Code;
                    msg.des = inputMessage.des;
                }
                else
                {
                    msg.Code = inputMessage.Code;
                    msg.des = inputMessage.des;
                }
            }
            else
            {
                msg.Code = "ERROR";
                msg.des = "Please try again";
            }
            return msg;
        }

        public List<DistDealerDetail> GetDistributors(string BikersLogInId)
        {
            System.Data.Linq.ISingleResult<SP_GetDistributors_By_BikersLogInIdResult> getDistributorModels = db.SP_GetDistributors_By_BikersLogInId(BikersLogInId);
            List<DistDealerDetail> distDealerDetail = null;
            if (getDistributorModels != null && getDistributorModels.Count() > 0)
                distDealerDetail = db.SP_GetDistributors_By_BikersLogInId(BikersLogInId).Select(m => new DistDealerDetail { ID = m.ID, Customer_Type = m.Customer_Type, Dis_Sap_Code = m.Dis_Sap_Code, Dis_Name = m.Dis_Name }).ToList();
            return distDealerDetail;
        }

        public List<Item> GetItems()
        {
            System.Data.Linq.ISingleResult<SP_GetItemsResult> sp_GetItemsResult = db.SP_GetItems();
            List<Item> items = null;
            if (sp_GetItemsResult != null && sp_GetItemsResult.Count() > 0)
                items = db.SP_GetItems().Select(m => new Item { ID = m.ID, ItemName = m.ItemName }).ToList();
            return items;
        }

        public List<BeatDetail> GetBeatList(string BDistributorId, string BikersLogInId)
        {
            System.Data.Linq.ISingleResult<SP_GetBeatList_By_DistId_BikerIdResult> sp_GetBeatList_By_DistId_BikerIdResult = db.SP_GetBeatList_By_DistId_BikerId(BDistributorId, BikersLogInId);
            List<BeatDetail> beatDetails = null;
            if (sp_GetBeatList_By_DistId_BikerIdResult != null && sp_GetBeatList_By_DistId_BikerIdResult.Count() > 0)
                beatDetails = db.SP_GetBeatList_By_DistId_BikerId(BDistributorId, BikersLogInId).Select(m => new BeatDetail { ID = m.ID, Code = m.Code, Name = m.Name }).ToList();
            return beatDetails;
        }

        public List<RetailerDetail> GetRetailerList(string BeatId, string BDistributorId, string BikersLogInd, string SearchStringRetailerName)
        {
            System.Data.Linq.ISingleResult<SP_GetRetailerList_By_BeatId_DistId_BikerIdResult> sp_GetRetailerList_By_BeatId_DistId_BikerIdResult = db.SP_GetRetailerList_By_BeatId_DistId_BikerId(BeatId, BDistributorId, BikersLogInd, SearchStringRetailerName);
            List<RetailerDetail> retailerDetails = null;
            if (sp_GetRetailerList_By_BeatId_DistId_BikerIdResult != null && sp_GetRetailerList_By_BeatId_DistId_BikerIdResult.Count() > 0)
                retailerDetails = db.SP_GetRetailerList_By_BeatId_DistId_BikerId(BeatId, BDistributorId, BikersLogInd, SearchStringRetailerName).Select(m => new RetailerDetail { ID = m.ID, Code = m.Code, Name = m.Name }).ToList();
            return retailerDetails;
        }

        public List<RetailerDetail> GetRetailerListByName(string RetailerName)
        {
            List<RetailerDetail> retalersResult = null;
            List<RetailerDetail> retalers = db.RetailerDetails.Where(m => !String.IsNullOrEmpty(m.Active_Status)&& m.Active_Status == "Active" && m.Name.Contains(RetailerName)).ToList();
            if (retalers != null && retalers.Count > 0)
                retalersResult = retalers.Select(m =>
                new RetailerDetail
                {
                    ID = m.ID,
                    Code = m.Code,
                    Name = m.Name,
                    Contact_Number = m.Contact_Number,
                    Address = m.Address,
                    State = m.State,
                    CityArea = m.CityArea,
                    Pin_Code = m.Pin_Code
                }).ToList();
            return retalersResult;
        }

        public ResultMessage SaveNewOrder(string DestributorId, string RetailerId, string BeatId, string BikerLogInId,
            DateTime DateOfVisit, string Visisted, string Sold, string Status, List<OrderItemSave> OrderItemsSave) //int ItemsID, int RequiredQuantity, int SuppliedQuantity
        {
            ResultMessage message = new ResultMessage { Message = "Faliure", OrderId = 0 };
            try
            {
                int dist_ID = db.DistDealerDetails.Where(m => m.Dis_Sap_Code == DestributorId).Select(m => m.ID).FirstOrDefault();
                int Retailer_ID = db.RetailerDetails.Where(m => m.Code == RetailerId).Select(m => m.ID).FirstOrDefault();
                int Beat_ID = db.BeatDetails.Where(m => m.Code == BeatId).Select(m => m.ID).FirstOrDefault();

                OrderDetail orderDetails = new OrderDetail
                {
                    Date_Of_Visit = DateOfVisit,
                    Distributor_Id = dist_ID,
                    //Dis_Sap_Code = m.DistDealerDetail.Dis_Sap_Code,
                    //Dis_Name = m.DistDealerDetail.Dis_Name,
                    Beat_Id = Beat_ID,
                    //Beat_Code = m.BeatDetail.Code,
                    //Beat_Name = m.BeatDetail.Name,
                    Retailer_Id = Retailer_ID,
                    //Retailer_Code = m.RetailerDetail.Code,
                    //Retailer_Name = m.RetailerDetail.Name,
                    Visted = (!String.IsNullOrEmpty(Visisted) && Visisted.ToLower() == "yes") ? true : false,
                    Sold = (!String.IsNullOrEmpty(Sold) && Sold.ToLower() == "yes") ? true : false,
                    Status = Status,
                    Ordered_On = DateTime.Now,
                    Order_By = BikerLogInId
                };

                db.OrderDetails.InsertOnSubmit(orderDetails);
                db.SubmitChanges();

                if (OrderItemsSave != null && OrderItemsSave.Count > 0 && orderDetails.ID > 0)
                {
                    List<OrderItem> orderItems = new List<OrderItem>();
                    foreach (OrderItemSave OrderItemSaveObj in OrderItemsSave)
                    {
                        orderItems.Add(new OrderItem
                        {
                            Item_Id = OrderItemSaveObj.Item_Id,
                            Order_Id = orderDetails.ID,
                            Required_Quantity = OrderItemSaveObj.Required_Quantity,
                            Created_By = BikerLogInId,
                            Created_On = DateTime.Now
                        });
                    }

                    db.OrderItems.InsertAllOnSubmit(orderItems);
                    db.SubmitChanges();
                }

                //int result = 0;
                //System.Data.Linq.ISingleResult<SP_SaveNewOrderResult> sp_SaveNewOrderResult = db.SP_SaveNewOrder(DestributorId, RetailerId, BeatId, BikerLogInId, DateOfVisit, Visisted, Sold, Status, ItemsID, RequiredQuantity, SuppliedQuantity);
                //if (sp_SaveNewOrderResult != null)
                //{
                //    SP_SaveNewOrderResult obj = sp_SaveNewOrderResult.FirstOrDefault();
                //    if(obj != null)
                //        result = obj.Column1;
                //}
                //if (result == 1)
                if (orderDetails.ID > 0)
                    message = new ResultMessage { Message = "Success", OrderId = orderDetails.ID };
            }
            catch (Exception ex)
            {
                message = new ResultMessage { Message = "Faliure", OrderId = 0 };
            }
            return message;
        }

        public List<OrderIdBeatIdRetailId> GetOrders(string DestributorId, string BikerLogInId, string status, string RetailerId)
        {
            //TODO: Filter results!


            // Original
            /*
             *   List<OrderDetailed> OrderDetails = db.OrderDetails//.GroupJoin(db.OrderItems, m => m.ID, n => n.Order_Id, (m, n) => new { m, n })
                .Where(k => k.DistDealerDetail.Dis_Sap_Code == DestributorId
                     && k.Order_By == BikerLogInId && k.Status.ToLower() ==  status.ToLower())
             * 
             * Modified to return all status below -- 21/3/2016 -- SA
             */

            DistDealerDetail disDetail = null;
            if (!String.IsNullOrEmpty(DestributorId) && DestributorId.ToLower() != "null")
                disDetail = db.DistDealerDetails.Where(m => m.Dis_Sap_Code == DestributorId).FirstOrDefault();
            RetailerDetail retDetail = null;
            if (!String.IsNullOrEmpty(RetailerId) && RetailerId.ToLower() != "null")
                retDetail = db.RetailerDetails.Where(m => m.Code == RetailerId).FirstOrDefault();

            int distId = (disDetail != null) ? disDetail.ID : 0;
            int retId = (retDetail != null) ? retDetail.ID : 0;



            //&& k.Distributor_Id == ((distId == 0) ? k.Distributor_Id : distId)
            //&& k.Retailer_Id == ((retId == 0) ? k.Retailer_Id : retId)

            List<OrderDetailed> OrderDetails = db.OrderDetails
                .Where(k => k.Distributor_Id == ((distId == 0) ? k.Distributor_Id : distId)
                && k.Retailer_Id == ((retId == 0) ? k.Retailer_Id : retId)
                     && k.Order_By == BikerLogInId && k.Status.ToLower() == (status.ToLower() == "all" ? k.Status : status.ToLower()))
                .Select(
                m => new OrderDetailed
                {
                    Order_ID = m.ID,
                    //Date_Of_Visit = m.Date_Of_Visit,
                    //Distributor_Id = m.Distributor_Id,
                    Dis_Sap_Code = m.DistDealerDetail.Dis_Sap_Code,
                    Dis_Name = m.DistDealerDetail.Dis_Name,
                    //Beat_Id = m.Beat_Id,
                    Beat_Code = m.BeatDetail.Code,
                    Beat_Name = m.BeatDetail.Name,
                    //Retailer_Id = m.Retailer_Id,
                    Retailer_Code = m.RetailerDetail.Code,
                    Retailer_Name = m.RetailerDetail.Name,
                    //Visted = m.Visted,
                    //Sold = m.Sold,
                    Status = m.Status,
                    //Ordered_On = m.Ordered_On,
                    //Order_By = m.Order_By,
                    //Updated_On = m.Updated_On,
                    //Updated_By = m.Updated_By,
                    //OrderItems = m.OrderItems.Select(n => new OrderDetailedItem
                    //{
                    //    ID = n.ID,
                    //    Order_Id = n.Order_Id,
                    //    Item_Id = n.Item_Id,
                    //    ItemName = n.Item.ItemName,
                    //    Required_Quantity = n.Required_Quantity,
                    //    Pending_Quantity = (n.Required_Quantity - n.Supplied_Quantity),
                    //    Supplied_Quantity = n.Supplied_Quantity,
                    //    Created_On = n.Created_On,
                    //    Created_By = n.Created_By,
                    //    Updated_On = n.Updated_On,
                    //    Updated_By = n.Updated_By
                    //}).ToList()
                }).ToList();
            if (OrderDetails != null)
            {
                List<OrderIdBeatIdRetailId> OrderIdBeatIdRetailIds = new List<OrderIdBeatIdRetailId>();
                OrderIdBeatIdRetailIds.AddRange(OrderDetails.Select(m => new OrderIdBeatIdRetailId
                {
                    Order_ID = m.Order_ID,
                    Beat_Code = m.Beat_Code,
                    Beat_Name = m.Beat_Name,
                    Retailer_Code = m.Retailer_Code,
                    Retailer_Name = m.Retailer_Name,
                    Destributor_Code = m.Dis_Sap_Code,
                    Destributor_Name = m.Dis_Name
                }).Distinct().ToList());
                return OrderIdBeatIdRetailIds;
            }
            return new List<OrderIdBeatIdRetailId>();
        }

        public OrderDetailed OrderDetails(int OrderId)
        {



            OrderDetailed orderDetailed = db.OrderDetails.Where(k => k.ID == OrderId).Select(
               m => new OrderDetailed
               {
                   Order_ID = m.ID,
                   //Date_Of_Visit = m.Date_Of_Visit,
                   //Distributor_Id = m.Distributor_Id,
                   Dis_Sap_Code = m.DistDealerDetail.Dis_Sap_Code,
                   Dis_Name = m.DistDealerDetail.Dis_Name,
                   //Beat_Id = m.Beat_Id,
                   Beat_Code = m.BeatDetail.Code,
                   Beat_Name = m.BeatDetail.Name,
                   //Retailer_Id = m.Retailer_Id,
                   Retailer_Code = m.RetailerDetail.Code,
                   Retailer_Name = m.RetailerDetail.Name,
                   //Visted = m.Visted,
                   //Sold = m.Sold,
                   Status = m.Status,
                   //Ordered_On = m.Ordered_On,
                   //Order_By = m.Order_By,
                   //Updated_On = m.Updated_On,
                   //Updated_By = m.Updated_By,
                   //OrderItems = 

               }).FirstOrDefault();



            OrderDetail orderDetailTemp = db.OrderDetails
                //.Include(k => k.OrderItems)
                .Where(k => k.ID == OrderId).FirstOrDefault();


            //if (orderDetailTemp != null)
            //{
            List<OrderDetailedItem> orderDetailedItems = db.OrderItems
                .Where(n => n.Order_Id == OrderId)
                .Select(n => new OrderDetailedItem
            {
                ID = n.ID,
                Order_Id = n.Order_Id,
                Item_Id = n.Item_Id,
                ItemName = n.Item.ItemName,
                Required_Quantity = ((n.Required_Quantity == null) ? 0 : n.Required_Quantity),
                Pending_Quantity = (((n.Required_Quantity == null) ? 0 : n.Required_Quantity) - ((n.Supplied_Quantity == null) ? 0 : n.Supplied_Quantity)),
                Supplied_Quantity = ((n.Supplied_Quantity == null) ? 0 : n.Supplied_Quantity),
                Created_On = n.Created_On,
                Created_By = n.Created_By,
                Updated_On = n.Updated_On,
                Updated_By = n.Updated_By
            }).ToList();


            if (orderDetailedItems != null && orderDetailedItems.Count > 0)
            {
                foreach (OrderDetailedItem item in orderDetailedItems)
                {
                    if (item.ItemName.ToLower() == "fan")
                    {
                        orderDetailed.Item_Id_Fan = (item.Item_Id == null) ? 0 : Convert.ToInt32(item.Item_Id);
                        orderDetailed.Item_Fan_Name = item.ItemName;
                        orderDetailed.Required_FanQuantity = (item.Required_Quantity == null) ? 0 : Convert.ToInt32(item.Required_Quantity);
                        orderDetailed.Pending_FanQuantity = (item.Pending_Quantity == null) ? ((orderDetailed.Status.ToLower() == "completed") ? 0 : orderDetailed.Required_FanQuantity) : Convert.ToInt32(item.Pending_Quantity);
                    }
                    else if (item.ItemName.ToLower() == "wire")
                    {
                        orderDetailed.Item_Id_Wire = (item.Item_Id == null) ? 0 : Convert.ToInt32(item.Item_Id);
                        orderDetailed.Item_Wire_Name = item.ItemName;
                        orderDetailed.Required_WireQuantity = (item.Required_Quantity == null) ? 0 : Convert.ToInt32(item.Required_Quantity);
                        orderDetailed.Pending_WireQuantity = (item.Pending_Quantity == null) ? ((orderDetailed.Status.ToLower() == "completed") ? 0 : orderDetailed.Required_FanQuantity) : Convert.ToInt32(item.Pending_Quantity);
                    }
                    else if (item.ItemName.ToLower() == "lighting")
                    {
                        orderDetailed.Item_Id_Lighting = (item.Item_Id == null) ? 0 : Convert.ToInt32(item.Item_Id);
                        orderDetailed.Item_Light_Name = item.ItemName;
                        orderDetailed.Required_LightQuantity = (item.Required_Quantity == null) ? 0 : Convert.ToInt32(item.Required_Quantity);
                        orderDetailed.Pending_LightQuantity = (item.Pending_Quantity == null) ? ((orderDetailed.Status.ToLower() == "completed") ? 0 : orderDetailed.Required_FanQuantity) : Convert.ToInt32(item.Pending_Quantity);
                    }
                }
                //}
            }




            return orderDetailed;
        }

        public string UpateOrder(List<OrderItemUpdate> orderItemUpdate, string status)
        {
            string message = "Faliure";
            try
            {
                OrderDetail orderDetails = db.OrderDetails.Where(m => m.ID == orderItemUpdate.FirstOrDefault().Order_Id).FirstOrDefault();
                if (orderDetails != null)
                {
                    orderDetails.Status = status;
                    orderDetails.Updated_On = DateTime.Now;
                    orderDetails.Updated_By = orderDetails.Order_By;
                    //db.OrderDetails.Attach(orderDetails);
                    db.SubmitChanges();

                    if (orderDetails != null && db.OrderItems != null)
                    {
                        List<OrderItem> orderItmeToUpdate = new List<OrderItem>();
                        List<OrderItem> orderItemsTemp = db.OrderItems.Where(m => m.Order_Id == orderDetails.ID).ToList();
                        foreach (OrderItem item in orderItemsTemp)
                        {
                            if (orderItemUpdate.Where(m => m.Item_Id == item.Item_Id).FirstOrDefault() != null)
                            {
                                item.Supplied_Quantity = ((item.Supplied_Quantity == null) ? 0 : item.Supplied_Quantity) + ((orderItemUpdate.Where(m => m.Item_Id == item.Item_Id).FirstOrDefault().Supplied_Quantity == null) ? 0 : orderItemUpdate.Where(m => m.Item_Id == item.Item_Id).FirstOrDefault().Supplied_Quantity);
                                item.Updated_On = DateTime.Now;
                                item.Updated_By = orderDetails.Order_By;
                            }

                            orderItmeToUpdate.Add(item);
                        }
                        if (orderItmeToUpdate != null && orderItmeToUpdate.Count > 0)
                        {
                            //db.OrderItems.AttachAll(orderItmeToUpdate);
                            db.SubmitChanges();
                            message = "Success";
                        }
                    }
                    message = "Success";
                }
            }
            catch (Exception)
            {
                message = "Faliure";
            }
            return message;


            //string message = "Faliure";
            //int result = 0;
            //System.Data.Linq.ISingleResult<SP_UpateOrderResult> sp_UpateOrderResult = db.SP_UpateOrder(OrderId, ItemId, SuppliedQuantity, Status);
            //if (sp_UpateOrderResult != null)
            //{
            //    SP_UpateOrderResult obj = sp_UpateOrderResult.FirstOrDefault();
            //    if (obj != null)
            //        result = obj.Column1;
            //}
            //if (result == 1)
            //    message = "Success";
            //return message;
        }


    }
}
