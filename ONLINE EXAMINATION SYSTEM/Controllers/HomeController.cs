using ONLINE_EXAMINATION_SYSTEM.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ONLINE_EXAMINATION_SYSTEM.Controllers
{
    public class HomeController : Controller
    {
        SqlCommand cmd;
        SqlDataReader reader;
        [HttpGet]
        public ActionResult Home()
        {
            List<Course> courses = getCourse();
            ViewBag.CourseList = new SelectList(courses, "course_Id", "course_Name");              
            return View();
        }
        

        //Get Course for DropDownList

        
        public List<Course> getCourse()
        {
            List<Course> course = new List<Course>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getCourse", Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Course course1 = new Course()
                {
                    course_Id = Convert.ToInt16(reader.GetValue(0).ToString()),
                    
                    course_Name = reader.GetValue(1).ToString()
                };
                course.Add(course1);
            }
            reader.Close();
            Connection.con.Close();
            return course;
        }
       



        [HttpPost]
            public JsonResult GetCatId(int catid)
            {
                return Json(new { catid });
            }

        [HttpPost]
        public JsonResult GetClass(int courseid)
            {
            Connection.getConnection();
            Connection.con.Open();
            try
            {
                List<SelectListItem> classes = new List<SelectListItem>();
                cmd = new SqlCommand("sp_getClass", Connection.con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", courseid);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    classes.Add(new SelectListItem()
                    {
                        Value = reader.GetValue(0).ToString(),
                        Text = reader.GetValue(2).ToString()
                    });

                }
                Session["courseId"] = courseid;
                reader.Close();
                Connection.con.Close();
                return Json(classes, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                return Json(new {success=false,message=ex.Message});
            }
           
        }




        [HttpPost]
        public JsonResult GetRollno(int classid)
        
        {
            Connection.getConnection();
            Connection.con.Open();
            try
            {
                
                List<SelectListItem> classes = new List<SelectListItem>();
                cmd = new SqlCommand("sp_getRollno", Connection.con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", classid);
                Session["classid"] = classid;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    classes.Add(new SelectListItem()
                    {
                        Value = reader.GetValue(0).ToString(),
                        Text = reader.GetValue(1).ToString()
                    });

                }
                reader.Close();
                Connection.con.Close();
                return Json(classes, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }

        }
        [HttpPost]
        public ActionResult Home(int? rollid)
        {         
            if(rollid == null)
            {
                TempData["error"] = "Roll id needed";
                RedirectToAction("Home");
            }
          if (ModelState.IsValid)
            {
                try
                {
                    Connection.getConnection();
                    Connection.con.Open();
                    cmd = new SqlCommand("sp_LoggedStatusUpdate", Connection.con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@roll_Id", rollid);
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        TempData["success"] = "You Are Eligible For This Exam";
                        Session["rollId"] = rollid;
                        
                        Connection.con.Close();
                        return RedirectToAction("Login", "Login");
                    }
                    else
                    {
                        TempData["error"] = "Something Went Wrong!!!";
                        Connection.con.Close();
                        return RedirectToAction("Home", "Home");
                    }
                }
                catch (Exception ex)
                {
                    TempData["error"] = "Error:" + ex.Message;
                    Connection.con.Close();
                    return RedirectToAction("Home");
                }
            }
            else
            {             
                return View();
            }
        }
    }
}

