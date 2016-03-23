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
    public class CBeatController : Controller
    {
        private LuminousBikerAppEntities db = new LuminousBikerAppEntities();

        //
        // GET: /CBeat/

        public ActionResult Index()
        {
            var beatdetails = db.BeatDetails;//.Include(b => b.DistDealerDetail);
            return View(beatdetails.ToList());
        }

        //
        // GET: /CBeat/Details/5

        public ActionResult Details(int id = 0)
        {
            BeatDetail beatdetail = db.BeatDetails.Find(id);
            if (beatdetail == null)
            {
                return HttpNotFound();
            }
            return View(beatdetail);
        }

        //
        // GET: /CBeat/Create

        public ActionResult Create()
        {
            //ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Dis_Sap_Code");
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View();
        }

        //
        // POST: /CBeat/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BeatDetail beatdetail)
        {
            if (ModelState.IsValid)
            {
                db.BeatDetails.Add(beatdetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Dis_Sap_Code", beatdetail.Distributor_Id);
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View(beatdetail);
        }

        //
        // GET: /CBeat/Edit/5

        public ActionResult Edit(int id = 0)
        {
            BeatDetail beatdetail = db.BeatDetails.Find(id);
            if (beatdetail == null)
            {
                return HttpNotFound();
            }
            //ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Dis_Sap_Code", beatdetail.Distributor_Id);
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View(beatdetail);
        }

        //
        // POST: /CBeat/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BeatDetail beatdetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(beatdetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //ViewBag.Distributor_Id = new SelectList(db.DistDealerDetails, "ID", "Dis_Sap_Code", beatdetail.Distributor_Id);
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View(beatdetail);
        }

        //
        // GET: /CBeat/Delete/5

        public ActionResult Delete(int id = 0)
        {
            BeatDetail beatdetail = db.BeatDetails.Find(id);
            if (beatdetail == null)
            {
                return HttpNotFound();
            }
            return View(beatdetail);
        }

        //
        // POST: /CBeat/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BeatDetail beatdetail = db.BeatDetails.Find(id);
            db.BeatDetails.Remove(beatdetail);
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