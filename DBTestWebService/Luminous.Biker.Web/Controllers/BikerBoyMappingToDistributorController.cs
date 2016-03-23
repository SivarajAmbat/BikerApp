using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Luminous.Biker.Web.Models;
using Newtonsoft.Json;

namespace Luminous.Biker.Web.Controllers
{
    public class BikerBoyMappingToDistributorController : Controller
    {
        private LuminousBikerAppEntities db = new LuminousBikerAppEntities();

        //
        // GET: /BikerBoyMappingToDistributor/

        public ActionResult Index()
        {
            var bikerdistmappings = db.BikerDistMappings.Include(b => b.BikerBoyDetail).Include(b => b.DistDealerDetail);
            return View(bikerdistmappings.ToList());
        }

        //
        // GET: /BikerBoyMappingToDistributor/Details/5

        public ActionResult Details(int id = 0)
        {
            BikerDistMapping bikerdistmapping = db.BikerDistMappings.Find(id);
            if (bikerdistmapping == null)
            {
                return HttpNotFound();
            }
            return View(bikerdistmapping);
        }

        //
        // GET: /BikerBoyMappingToDistributor/Create

        public ActionResult Create()
        {
            ViewBag.BikerBoy_Id = new SelectList(db.BikerBoyDetails, "ID", "BB_Code");
            ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Dis_Sap_Code");
            return View();
        }

        //
        // POST: /BikerBoyMappingToDistributor/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BikerDistMapping bikerdistmapping)
        {
            if (ModelState.IsValid)
            {
                db.BikerDistMappings.Add(bikerdistmapping);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BikerBoy_Id = new SelectList(db.BikerBoyDetails, "ID", "BB_Code", bikerdistmapping.BikerBoy_Id);
            ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Customer_Type", bikerdistmapping.Distributor_Id);
            return View(bikerdistmapping);
        }

        //
        // GET: /BikerBoyMappingToDistributor/Edit/5

        public ActionResult Edit(int id = 0)
        {
            BikerDistMapping bikerdistmapping = db.BikerDistMappings.Find(id);
            if (bikerdistmapping == null)
            {
                return HttpNotFound();
            }
            ViewBag.BikerBoy_Id = new SelectList(db.BikerBoyDetails, "ID", "BB_Code", bikerdistmapping.BikerBoy_Id);
            ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Customer_Type", bikerdistmapping.Distributor_Id);
            return View(bikerdistmapping);
        }

        //
        // POST: /BikerBoyMappingToDistributor/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BikerDistMapping bikerdistmapping)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bikerdistmapping).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BikerBoy_Id = new SelectList(db.BikerBoyDetails, "ID", "BB_Code", bikerdistmapping.BikerBoy_Id);
            ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Customer_Type", bikerdistmapping.Distributor_Id);
            return View(bikerdistmapping);
        }

        //
        // GET: /BikerBoyMappingToDistributor/Delete/5

        public ActionResult Delete(int id = 0)
        {
            BikerDistMapping bikerdistmapping = db.BikerDistMappings.Find(id);
            if (bikerdistmapping == null)
            {
                return HttpNotFound();
            }
            return View(bikerdistmapping);
        }

        //
        // POST: /BikerBoyMappingToDistributor/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BikerDistMapping bikerdistmapping = db.BikerDistMappings.Find(id);
            db.BikerDistMappings.Remove(bikerdistmapping);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public string GetMappedBikerByDistributorId(int? distId)
        {
            List<int?> bikerMappedIds = db.BikerDistMappings.Where(m => m.Distributor_Id != null && m.BikerBoy_Id != null && m.Distributor_Id == distId)
                .Select(m => m.BikerBoy_Id).ToList();
            return JsonConvert.SerializeObject(bikerMappedIds);
        }

        [HttpPost]
        public string UpdateMappingBikerAndDistributor(int? distId, List<int?> bikerIds)
        {
            string message = "";
            try
            {
                if (distId != null && bikerIds != null)
                {
                    List<BikerDistMapping> mappingBikers = db.BikerDistMappings.Where(m => m.Distributor_Id == distId).ToList();
                    if (mappingBikers != null)
                    {
                        foreach (var item in mappingBikers)
                        {
                            if (!bikerIds.Contains(item.BikerBoy_Id))
                            {
                                db.BikerDistMappings.Remove(item);
                            }
                        }
                        db.SaveChanges();
                    }
                    mappingBikers = db.BikerDistMappings.Where(m => m.Distributor_Id == distId).ToList();
                    if (mappingBikers != null)
                    {
                        foreach (var item in bikerIds)
                        {
                            if ((mappingBikers.All(m => m.BikerBoy_Id != item)))
                            {
                                db.BikerDistMappings.Add(new BikerDistMapping { BikerBoy_Id = item, Distributor_Id = distId });
                            }
                        }
                        db.SaveChanges();
                    }
                    message = "Updated Successfully";
                }
                else{
                     message = "Please select Distributor and Biker";
                }
            }
            catch (Exception)
            {
                message = "Some Error occured. Please try again";
            }
                
            return JsonConvert.SerializeObject(message);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}