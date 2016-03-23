using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Luminous.Biker.Web.Models;

namespace Luminous.Biker.Web.Controllers
{
    [Authorize]
    public class CRetailerController : Controller
    {
        private LuminousBikerAppEntities db = new LuminousBikerAppEntities();

        //
        // GET: /CRetailer/

        public ActionResult Index()
        {
            var retailerdetails = db.RetailerDetails;//.Include(r => r.BeatDetail);
            return View(retailerdetails.ToList());
        }

        //
        // GET: /CRetailer/Details/5

        public ActionResult Details(int id = 0)
        {
            RetailerDetail retailerdetail = db.RetailerDetails.Find(id);
            if (retailerdetail == null)
            {
                return HttpNotFound();
            }

            return View(retailerdetail);
        }

        //
        // GET: /CRetailer/Create

        public ActionResult Create()
        {
           // ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code");
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View();
        }

        //
        // POST: /CRetailer/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(RetailerDetail retailerdetail)
        {
            if (ModelState.IsValid)
            {
                db.RetailerDetails.Add(retailerdetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code", retailerdetail.Beat_Id);
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View(retailerdetail);
        }

        //
        // GET: /CRetailer/Edit/5

        public ActionResult Edit(int id = 0)
        {
            RetailerDetail retailerdetail = db.RetailerDetails.Find(id);
            if (retailerdetail == null)
            {
                return HttpNotFound();
            }
            //ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code", retailerdetail.Beat_Id);
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View(retailerdetail);
        }

        //
        // POST: /CRetailer/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(RetailerDetail retailerdetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(retailerdetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //ViewBag.Beat_Id = new SelectList(db.BeatDetails, "ID", "Code", retailerdetail.Beat_Id);
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View(retailerdetail);
        }

        //
        // GET: /CRetailer/Delete/5

        public ActionResult Delete(int id = 0)
        {
            RetailerDetail retailerdetail = db.RetailerDetails.Find(id);
            if (retailerdetail == null)
            {
                return HttpNotFound();
            }
            return View(retailerdetail);
        }

        //
        // POST: /CRetailer/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RetailerDetail retailerdetail = db.RetailerDetails.Find(id);
            db.RetailerDetails.Remove(retailerdetail);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}