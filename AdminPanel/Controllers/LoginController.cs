using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AdminPanel.Models;

namespace AdminPanel.Controllers
{
    public class LoginController : Controller
    {
        [HttpGet]
        public ActionResult AdminPanelLogin()
        {
            return View(new Login());
        }

        [HttpPost]
        public ActionResult AdminPanelLogin(Login model)
        {
            if (ModelState.IsValid)
            {
                
                if (model.Username == "admin" && model.Password == "admin")
                {
                    return RedirectToAction("Admin","Admin");
                }
                else
                {
                    ModelState.AddModelError("", "Invalid username or password.");
                }
            }
            return View(model);
        }

        public ActionResult Dashboard()
        {
            return View();
        }
    }
}
