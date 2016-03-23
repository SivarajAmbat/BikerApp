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
    public class CDistributorController : Controller
    {
        private LuminousBikerAppEntities db = new LuminousBikerAppEntities();

        //
        // GET: /CDistributor/

        public ActionResult Index()
        {
            return View(db.DistDealerDetails.ToList());
        }

        //
        // GET: /CDistributor/Details/5

        public ActionResult Details(int id = 0)
        {
            DistDealerDetail distdealerdetail = db.DistDealerDetails.Find(id);
            if (distdealerdetail == null)
            {
                return HttpNotFound();
            }
            return View(distdealerdetail);
        }

        //
        // GET: /CDistributor/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /CDistributor/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DistDealerDetail distdealerdetail)
        {
            if (ModelState.IsValid)
            {
                db.DistDealerDetails.Add(distdealerdetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(distdealerdetail);
        }

        //
        // GET: /CDistributor/Edit/5

        public ActionResult Edit(int id = 0)
        {
            DistDealerDetail distdealerdetail = db.DistDealerDetails.Find(id);
            if (distdealerdetail == null)
            {
                return HttpNotFound();
            }
            return View(distdealerdetail);
        }

        //
        // POST: /CDistributor/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(DistDealerDetail distdealerdetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(distdealerdetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(distdealerdetail);
        }

        //
        // GET: /CDistributor/Delete/5

        public ActionResult Delete(int id = 0)
        {
            DistDealerDetail distdealerdetail = db.DistDealerDetails.Find(id);
            if (distdealerdetail == null)
            {
                return HttpNotFound();
            }
            return View(distdealerdetail);
        }

        //
        // POST: /CDistributor/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DistDealerDetail distdealerdetail = db.DistDealerDetails.Find(id);
            db.DistDealerDetails.Remove(distdealerdetail);
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