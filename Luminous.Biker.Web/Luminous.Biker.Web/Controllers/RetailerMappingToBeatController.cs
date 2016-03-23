using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Luminous.Biker.Web.Models;

namespace Luminous.Biker.Web.Controllers
{
    public class RetailerMappingToBeatController : Controller
    {
        private LuminousBikerAppEntities db = new LuminousBikerAppEntities();

        // GET: /RetailerMappingToBeat/
        public ActionResult Index()
        {
            var retailbeatmappings = db.RetailBeatMappings.Include(r => r.BeatDetail).Include(r => r.RetailerDetail);
            return View(retailbeatmappings.ToList());
        }

        // GET: /RetailerMappingToBeat/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RetailBeatMapping retailbeatmapping = db.RetailBeatMappings.Find(id);
            if (retailbeatmapping == null)
            {
                return HttpNotFound();
            }
            return View(retailbeatmapping);
        }

        // GET: /RetailerMappingToBeat/Create
        public ActionResult Create()
        {
            ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code");
            ViewBag.Retailer_Id = new SelectList(db.RetailerDetails, "ID", "Code");
            return View();
        }

        // POST: /RetailerMappingToBeat/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,Beat_Id,Retailer_Id")] RetailBeatMapping retailbeatmapping)
        {
            if (ModelState.IsValid)
            {
                db.RetailBeatMappings.Add(retailbeatmapping);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code", retailbeatmapping.Beat_Id);
            ViewBag.Retailer_Id = new SelectList(db.RetailerDetails, "ID", "Code", retailbeatmapping.Retailer_Id);
            return View(retailbeatmapping);
        }

        // GET: /RetailerMappingToBeat/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RetailBeatMapping retailbeatmapping = db.RetailBeatMappings.Find(id);
            if (retailbeatmapping == null)
            {
                return HttpNotFound();
            }
            ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code", retailbeatmapping.Beat_Id);
            ViewBag.Retailer_Id = new SelectList(db.RetailerDetails, "ID", "Code", retailbeatmapping.Retailer_Id);
            return View(retailbeatmapping);
        }

        // POST: /RetailerMappingToBeat/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,Beat_Id,Retailer_Id")] RetailBeatMapping retailbeatmapping)
        {
            if (ModelState.IsValid)
            {
                db.Entry(retailbeatmapping).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code", retailbeatmapping.Beat_Id);
            ViewBag.Retailer_Id = new SelectList(db.RetailerDetails, "ID", "Code", retailbeatmapping.Retailer_Id);
            return View(retailbeatmapping);
        }

        // GET: /RetailerMappingToBeat/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RetailBeatMapping retailbeatmapping = db.RetailBeatMappings.Find(id);
            if (retailbeatmapping == null)
            {
                return HttpNotFound();
            }
            return View(retailbeatmapping);
        }

        // POST: /RetailerMappingToBeat/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RetailBeatMapping retailbeatmapping = db.RetailBeatMappings.Find(id);
            db.RetailBeatMappings.Remove(retailbeatmapping);
            db.SaveChanges();
            return RedirectToAction("Index");
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
