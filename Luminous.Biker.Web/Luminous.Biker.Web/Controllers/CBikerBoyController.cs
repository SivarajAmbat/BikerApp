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
    public class CBikerBoyController : Controller
    {
        private LuminousBikerAppEntities db = new LuminousBikerAppEntities();

        //
        // GET: /CBikerBoy/

        public ActionResult Index()
        {
            return View(db.BikerBoyDetails.ToList());
        }

        //
        // GET: /CBikerBoy/Details/5

        public ActionResult Details(int id = 0)
        {
            BikerBoyDetail bikerboydetail = db.BikerBoyDetails.Find(id);
            if (bikerboydetail == null)
            {
                return HttpNotFound();
            }
            return View(bikerboydetail);
        }

        //
        // GET: /CBikerBoy/Create

        public ActionResult Create()
        {
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View();
        }

        //
        // POST: /CBikerBoy/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BikerBoyDetail bikerboydetail)
        {
            if (ModelState.IsValid)
            {
                db.BikerBoyDetails.Add(bikerboydetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View(bikerboydetail);
        }

        //
        // GET: /CBikerBoy/Edit/5

        public ActionResult Edit(int id = 0)
        {
            BikerBoyDetail bikerboydetail = db.BikerBoyDetails.Find(id);
            if (bikerboydetail == null)
            {
                return HttpNotFound();
            }
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View(bikerboydetail);
        }

        //
        // POST: /CBikerBoy/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BikerBoyDetail bikerboydetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bikerboydetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Active = new SelectList(ActiveStatus.GetIEStatus(), "StatusValue", "StatusValue");
            return View(bikerboydetail);
        }

        //
        // GET: /CBikerBoy/Delete/5

        public ActionResult Delete(int id = 0)
        {
            BikerBoyDetail bikerboydetail = db.BikerBoyDetails.Find(id);
            if (bikerboydetail == null)
            {
                return HttpNotFound();
            }
            return View(bikerboydetail);
        }

        //
        // POST: /CBikerBoy/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BikerBoyDetail bikerboydetail = db.BikerBoyDetails.Find(id);
            db.BikerBoyDetails.Remove(bikerboydetail);
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