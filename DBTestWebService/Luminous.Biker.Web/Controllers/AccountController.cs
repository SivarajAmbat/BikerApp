using Luminous.Biker.Web.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Security;

namespace Luminous.Biker.Web.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Account/LogOn
        [AllowAnonymous]
        public ActionResult LogOn()
        {
            LogOnViewModel model = new LogOnViewModel();
            return View(model);
        }

        //
        // POST: /Account/LogOn
        [AllowAnonymous]
        [HttpPost]
        public ActionResult LogOn(LogOnViewModel model, string returnUrl)
        {
            //FormsAuthenticationCredentials c = new FormsAuthenticationCredentials();
            //var users = c.Users;



            if (this.ModelState.IsValid && ConfigurationManager.AppSettings.AllKeys.Contains(model.UserName) && ConfigurationManager.AppSettings["admin"] == model.Password)//FormsAuthentication.Authenticate(model.UserName, model.Password)//users.Cast<FormsAuthenticationUser>().Any(m => m.Name.ToLower() == model.UserName && m.Password == model.Password)
            {
                FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                if (this.Url.IsLocalUrl(returnUrl))
                {
                    return Redirect(returnUrl);
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }

            // If we got this far, something failed, redisplay form
            this.ModelState.AddModelError("", "Incorrect user name or password.");
            return View(model);
        }

        //
        // POST: /Account/LogOff
        [HttpPost]
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }
    }
}
