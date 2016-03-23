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
    public class LoggerController : Controller
    {
        private LuminousBikerAppEntities db = new LuminousBikerAppEntities();

        //
        // GET: /Logger/

        public ActionResult Index()
        {
            return View(db.Loggers.ToList());
        }

        //
        // GET: /Logger/Details/5

        public ActionResult Details(int id = 0)
        {
            Logger logger = db.Loggers.Find(id);
            if (logger == null)
            {
                return HttpNotFound();
            }
            return View(logger);
        }

        //
        // GET: /Logger/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Logger/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Logger logger)
        {
            if (ModelState.IsValid)
            {
                db.Loggers.Add(logger);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(logger);
        }

        //
        // GET: /Logger/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Logger logger = db.Loggers.Find(id);
            if (logger == null)
            {
                return HttpNotFound();
            }
            return View(logger);
        }

        //
        // POST: /Logger/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Logger logger)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logger).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(logger);
        }

        //
        // GET: /Logger/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Logger logger = db.Loggers.Find(id);
            if (logger == null)
            {
                return HttpNotFound();
            }
            return View(logger);
        }

        //
        // POST: /Logger/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Logger logger = db.Loggers.Find(id);
            db.Loggers.Remove(logger);
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