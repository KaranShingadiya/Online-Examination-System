using ONLINE_EXAMINATION_SYSTEM.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;

namespace ONLINE_EXAMINATION_SYSTEM.Controllers
{
    public class LoginController : Controller
    {
        SqlCommand cmd;
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Login login)
        {
            if (ModelState.IsValid && Session["home"]==null)
            {
                Connection.getConnection();
                Connection.con.Open();

                cmd = new SqlCommand("sp_studentLoginInsert",Connection.con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@studentUsername", login.studentUsername);
                cmd.Parameters.AddWithValue("@studentPassword",login.studentPassword);
               

                int res=cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    Session["username"] = login.studentUsername;     
                    return RedirectToAction("Dashboard", "Dashboard");
                }
                else
                {
                    return RedirectToAction("Home", "Home");
                }
            }
            else
            {
                return View(login);
            }
        }
    }
}