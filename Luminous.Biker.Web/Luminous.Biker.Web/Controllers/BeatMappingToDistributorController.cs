using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Luminous.Biker.Web.Models;
using Newtonsoft.Json;

namespace Luminous.Biker.Web.Controllers
{
    public class BeatMappingToDistributorController : Controller
    {
        private LuminousBikerAppEntities db = new LuminousBikerAppEntities();

        // GET: /BeatMappingToDistributor/
        public ActionResult Index()
        {
            var beatdistributormappings = db.BeatDistributorMappings.Include(b => b.DistDealerDetail).Include(b => b.BeatDetail);
            return View(beatdistributormappings.ToList());
        }

        // GET: /BeatMappingToDistributor/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BeatDistributorMapping beatdistributormapping = db.BeatDistributorMappings.Find(id);
            if (beatdistributormapping == null)
            {
                return HttpNotFound();
            }
            return View(beatdistributormapping);
        }

        // GET: /BeatMappingToDistributor/Create
        public ActionResult Create()
        {
            ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Customer_Type");
            ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code");
            return View();
        }

        // POST: /BeatMappingToDistributor/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,Distributor_Id,Beat_Id")] BeatDistributorMapping beatdistributormapping)
        {
            if (ModelState.IsValid)
            {
                db.BeatDistributorMappings.Add(beatdistributormapping);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Customer_Type", beatdistributormapping.Distributor_Id);
            ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code", beatdistributormapping.Beat_Id);
            return View(beatdistributormapping);
        }

        // GET: /BeatMappingToDistributor/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BeatDistributorMapping beatdistributormapping = db.BeatDistributorMappings.Find(id);
            if (beatdistributormapping == null)
            {
                return HttpNotFound();
            }
            ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Customer_Type", beatdistributormapping.Distributor_Id);
            ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code", beatdistributormapping.Beat_Id);
            return View(beatdistributormapping);
        }

        // POST: /BeatMappingToDistributor/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,Distributor_Id,Beat_Id")] BeatDistributorMapping beatdistributormapping)
        {
            if (ModelState.IsValid)
            {
                db.Entry(beatdistributormapping).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Customer_Type", beatdistributormapping.Distributor_Id);
            ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code", beatdistributormapping.Beat_Id);
            return View(beatdistributormapping);
        }

        // GET: /BeatMappingToDistributor/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BeatDistributorMapping beatdistributormapping = db.BeatDistributorMappings.Find(id);
            if (beatdistributormapping == null)
            {
                return HttpNotFound();
            }
            return View(beatdistributormapping);
        }

        // POST: /BeatMappingToDistributor/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BeatDistributorMapping beatdistributormapping = db.BeatDistributorMappings.Find(id);
            db.BeatDistributorMappings.Remove(beatdistributormapping);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public string GetMappedBeatByDistributorId(int? distId)
        {
            List<int> bikerMappedIds = db.BeatDistributorMappings.Where(m => m.Distributor_Id != null && m.Beat_Id != null && m.Distributor_Id == distId)
                .Select(m => m.Beat_Id).ToList();
            return JsonConvert.SerializeObject(bikerMappedIds);
        }

        [HttpPost]
        public string UpdateMappingBikerAndDistributor(int? distId, List<int?> beatIds)
        {
            string message = "";
            try
            {
                if (distId != null && beatIds != null)
                {
                    List<BeatDistributorMapping> mappingBeats = db.BeatDistributorMappings.Where(m => m.Distributor_Id == distId).ToList();
                    if (mappingBeats != null)
                    {
                        foreach (var item in mappingBeats)
                        {
                            if (!beatIds.Contains(item.Beat_Id))
                            {
                                db.BeatDistributorMappings.Remove(item);
                            }
                        }
                        db.SaveChanges();
                    }
                    mappingBeats = db.BeatDistributorMappings.Where(m => m.Distributor_Id == distId).ToList();
                    if (mappingBeats != null)
                    {
                        foreach (var item in beatIds)
                        {
                            if ((mappingBeats.All(m => m.Beat_Id != item)))
                            {
                                db.BikerDistMappings.Add(new BikerDistMapping { BikerBoy_Id = item, Distributor_Id = distId });
                            }
                        }
                        db.SaveChanges();
                    }
                    message = "Updated Successfully";
                }
                else
                {
                    message = "Please select Distributor and Biker";
                }
            }
            catch (Exception)
            {
                message = "Some Error occured. Please try again";
            }

            return JsonConvert.SerializeObject(message);
        }



        [HttpGet, ActionName("SearchDistributor")]
        public ActionResult SearchDistributor(string searchParameter)
        {
            //return "Hello World";
            return PartialView("_DistributorRadio", searchParameter);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
