using ONLINE_EXAMINATION_SYSTEM.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace ONLINE_EXAMINATION_SYSTEM.Controllers
{
    public class DashboardController : Controller
    {

        SqlCommand cmd;
        SqlDataReader reader;
        [HttpGet]
        public ActionResult Dashboard()
        {
            if (Session["home"] != null)
            {
                List<Student> students = getSpecificStudentDetail();

                ViewBag.StudentName = students.Select(s => s.student_Name).ToList();
                ViewBag.StudentUsername = students.Select(s => s.student_Username).ToList();
                ViewBag.StudentStatus = students.Select(s => s.student_Status).ToList();

                return View();
            }
            else
            {
                return RedirectToAction("Home", "Home");
            }
          
        }

  
        //Logout Section.
        [HttpGet]
        public ActionResult Logout()
        {
            return View();
        }

        //Hamburger menu Section.
        [HttpGet]
        public ActionResult Hamburgermenu()
        {
            return View();
        }
      
        public List<Student> getSpecificStudentDetail()
        {
            List<Student> students = new List<Student>();
            if (Session["username"] != null)
            {
                Connection.getConnection();
                Connection.con.Open();
                cmd = new SqlCommand("sp_GetSpecificStudentDetail",Connection.con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", Session["username"]);
                
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Student student = new Student()
                    {
                        student_Name = reader.GetValue(0).ToString(),
                        student_Username=reader.GetValue(1).ToString(),
                        student_Status=reader.GetValue(2).ToString()
                       
                    };
                    students.Add(student);
                }
                reader.Close();
                Connection.con.Close();              
                
            }
            return students;
        }

        [HttpGet]
        public ActionResult MyResult()
        {
            return View();
        }
    
        [HttpGet]
        public ActionResult FormDetail()
        {
            List<Form> student = getStudent();
            return View(student);
        }
        public List<Form> getStudent()
        {
            List<Form> students = new List<Form>();

            Connection.getConnection();
            Connection.con.Open();

            cmd = new SqlCommand("sp_Select", Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Form form = new Form()
                {
                    Id=Convert.ToInt16(reader.GetValue(0).ToString()),
                   Name = reader.GetValue(1).ToString(),
                    Email = reader.GetValue(2).ToString(),
                
                };
                students.Add(form);

            }
            Connection.con.Close();
            return students;
        }



    }
}

