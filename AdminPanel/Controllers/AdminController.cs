using AdminPanel.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Security.Authentication;
using System.Security.Claims;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.UI.WebControls.WebParts;

namespace AdminPanel.Controllers
{
    public class AdminController : Controller
    {

        SqlCommand cmd;
        SqlDataReader reader;




        [HttpGet]
        public ActionResult Admin()
        {
            return View();
        }
        // GET: Admin/Dashboard
        public ActionResult Dashboard()
        {
            return View();
        }
        //Add Course Section

        [HttpGet]
        public ActionResult AddCourse()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddCourse(Course course)
        {
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_AddCourse",Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@course_Id",course.course_Id);
            cmd.Parameters.AddWithValue("@course_Name",course.course_Name);
            int res= cmd.ExecuteNonQuery();
            if(res>0)
            {
                TempData["success"] = "Course Added : "+course.course_Name;
                Connection.con.Close();
                return RedirectToAction("Admin","Admin");
            }
            else
            {
                TempData["error"] = "Something Went Wrong!!!";
                Connection.con.Close();
                return RedirectToAction("Admin", "Admin");
            }          
        }

        //Manage Course Section
        [HttpGet]
        public ActionResult ManageCourse()
        {
            List<Course> courses = getCourseList();
            return View(courses);
        }
        public List<Course> getCourseList()
        {
            List<Course> courses = new List<Course>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getCourse", Connection.con);
            cmd.CommandType= System.Data.CommandType.StoredProcedure;
            reader= cmd.ExecuteReader();
            while(reader.Read())
            {
                Course course = new Course()
                {
                    course_Id=Convert.ToInt16(reader.GetValue(0).ToString()),
                    course_Name=reader.GetValue(1).ToString()
                };
                courses.Add(course);
            }
            reader.Close();
            Connection.con.Close();
            return courses;
        }

        //Delete Course 
        [HttpGet]
        public ActionResult DeleteCourse(int course_Id)
        {
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_DeleteCourse",Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@courseId", course_Id);
            int res= cmd.ExecuteNonQuery();
            if (res > 0)
            {
                TempData["success"] = "Course Removed Sucessfully";
                Connection.con.Close();
                return RedirectToAction("ManageCourse","Admin");
            }
            else
            {   
                TempData["error"] = "Something Went Wrong!!!";
                Connection.con.Close();
                return RedirectToAction("ManageCourse", "Admin");
            }
        }
        [HttpGet]
        public ActionResult EditCourse(int course_Id)
        {
           Course course =getSpecificCourse(course_Id);
            return View(course);
        }

        public Course getSpecificCourse(int course_Id)
        {
            Course course = new Course();
            Connection.getConnection();
            Connection.con.Open();            
            cmd = new SqlCommand("sp_getSpecificCourse",Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@courseId", course_Id);
            reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                course = new Course();
                course.course_Id=Convert.ToInt16(reader.GetValue(0).ToString());
                course.course_Name=reader.GetValue(1).ToString();
            }
            reader.Close();
            Connection.con.Close();
            return course;
        }
        [HttpPost]
        public ActionResult EditCourse(Course course)
        {
            Connection.con.Open();
            cmd = new SqlCommand("sp_EditCourse",Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@courseId",course.course_Id);
            cmd.Parameters.AddWithValue("@courseName", course.course_Name);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                TempData["success"] = "Course Update Successfully";
                Connection.con.Close();
                return RedirectToAction("ManageCourse", "Admin");
            }
            else
            {
                TempData["error"] = "Something Went Wrong!!!";
                Connection.con.Close();
                return RedirectToAction("ManageCourse", "Admin");
            }
        }

        //Manage Student Start
        [HttpGet]
        public ActionResult ManageStudents()
        {

            List<Students> students3 = getClassFilter();
            ViewBag.StudentClassList = new SelectList(students3, "class_Id", "course_Id", "class_Name");
            

            List<Students> students = getStudents();          
            ViewBag.StudentClass = new SelectList(students, "class_Id", "course_Name");
            return View(students);
        }
        public List<Students> getStudents()
        {
            List<Students> students = new List<Students>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_SelectStudents", Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Students student = new Students()
                {
                    exmne_Id = Convert.ToInt16(reader.GetValue(0).ToString()),
                    exmne_Fullname = reader.GetValue(1).ToString(),
                    exmne_CourseName = reader.GetValue(2).ToString(),
                    exmne_ClassId = Convert.ToInt16(reader.GetValue(3).ToString()),
                    exmne_Gender = reader.GetValue(4).ToString(),
                    exmne_Birthdate = reader.GetValue(5).ToString(),
                    exmne_Yearlevel = reader.GetValue(6).ToString(),
                    exmne_Username = reader.GetValue(7).ToString(),
                    exmne_Password = reader.GetValue(8).ToString(),
                    exmne_Status = reader.GetValue(9).ToString(),
                    exmne_SessionToken = reader.GetValue(10).ToString(),


                };
                students.Add(student);
            }
            reader.Close();
            Connection.con.Close();
            return students;
        }

        [HttpGet]
        public ActionResult CreateStudent()
        {
            List<Students> students = getStudentCourse();
            ViewBag.CourseList = new SelectList(students, "exmne_CourseId", "exmne_CourseName");

            List<Students> students1 = getStudentYearlevel();
            ViewBag.StudentYearList = new SelectList(students1, "exmne_Yearlevel", "exmne_Yearlevel");

            List<Students> students2=getStudentGender();
            ViewBag.StudentGenderList = new SelectList(students2, "exmne_Gender","exmne_Gender");           
            return View();
        }

        //get Student Course
        
        [HttpPost]
        public List<Students> getStudentCourse()
        {
            List<Students> students = new List<Students>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getCourse", Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Students student = new Students()
                {
                    exmne_CourseId = Convert.ToInt16(reader.GetValue(0).ToString()),
                    exmne_CourseName = reader.GetValue(1).ToString(),
                };
                students.Add(student);
            }
            reader.Close();
            Connection.con.Close();
            return students;
        }

        [HttpPost]
        public JsonResult getStudentClass(int courseid)
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
        public JsonResult getStudentRollno(int classid)
        {
            Connection.getConnection();
            Connection.con.Open();
            try
            {
                List<SelectListItem> rollno = new List<SelectListItem>();
                cmd = new SqlCommand("sp_getRollno", Connection.con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", classid);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    rollno.Add(new SelectListItem()
                    {
                        Value = reader.GetValue(0).ToString(),
                        Text = reader.GetValue(1).ToString()
                    });
                }
                reader.Close();
                Connection.con.Close();
                return Json(rollno, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }


        //get Student Year-Level

        [HttpPost]
        public List<Students> getStudentYearlevel()
        {
            List<Students> students = new List<Students>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getStudentYearlevel",Connection.con);
            cmd.CommandType= System.Data.CommandType.StoredProcedure;
            reader= cmd.ExecuteReader();
            while (reader.Read())
            {
                Students student = new Students()
                {                   
                    exmne_Yearlevel = reader.GetValue(1).ToString(),
                };
                students.Add(student);
            }
            reader.Close();
            Connection.con.Close();
            return students;
        }


        //get Student Gender

        [HttpPost]
        public List<Students> getStudentGender()
        {
            List<Students> students= new List<Students>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getStudentGender", Connection.con);    
            cmd.CommandType=System.Data.CommandType.StoredProcedure;
            reader= cmd.ExecuteReader();
            while (reader.Read())
            {
                Students student = new Students()
                {
                    
                    exmne_Gender = reader.GetValue(1).ToString(),
                };
                students.Add(student);
            }
            reader.Close();
            Connection.con.Close();
            return students;
        }


        // Insert Student
        [HttpPost]
        public ActionResult CreateStudent(Students students)
        {
            if (ModelState.IsValid)
            {
                Connection.getConnection();
                Connection.con.Open();

                cmd = new SqlCommand("sp_InsertStudent", Connection.con);
                cmd.CommandType= System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id",students.exmne_Id);
                cmd.Parameters.AddWithValue("@Fullname",students.exmne_Fullname);
                cmd.Parameters.AddWithValue("@Course", students.exmne_CourseId);
                cmd.Parameters.AddWithValue("@Class", students.exmne_ClassId);
                cmd.Parameters.AddWithValue("@Gender", students.exmne_Gender);
                cmd.Parameters.AddWithValue("@Birthdate", students.exmne_Birthdate);
                cmd.Parameters.AddWithValue("@Yearlevel", students.exmne_Yearlevel);
                cmd.Parameters.AddWithValue("@Email", students.exmne_Username);
                cmd.Parameters.AddWithValue("@Password", students.exmne_Password);
                int res =cmd.ExecuteNonQuery();
                if(res>0)
                {
                    TempData["success"] = "Create Student Successfully";
                    Connection.con.Close();
                    return RedirectToAction("ManageStudents","Admin");                    
                }
                else
                {
                    TempData["error"] = "Somethig Went Wrong!!!";
                    Connection.con.Close();
                    return RedirectToAction("ManageStudents", "Admin");
                }          
                
            }
            return View( students);
        }

        [HttpGet]
        public ActionResult EditStudents(int studid)
        {
            List<Students> students = getStudentCourse();
            ViewBag.CourseList = new SelectList(students, "exmne_CourseId", "exmne_CourseName");

            List<Students> students1 = getStudentYearlevel();
            ViewBag.StudentYearList = new SelectList(students1, "exmne_Yearlevel", "exmne_Yearlevel");

            List<Students> students2 = getStudentGender();
            ViewBag.StudentGenderList = new SelectList(students2, "exmne_Gender", "exmne_Gender");

            Students students3 = getSpecificStudents(studid);
            return View(students3);

        }
        public Students getSpecificStudents(int studid)
        {
            Students students = new Students();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getSpecificStudent", Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", studid);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                students = new Students();
                students.exmne_Id = Convert.ToInt16(reader.GetValue(0).ToString());
                students.exmne_Fullname = reader.GetValue(1).ToString();
                students.exmne_CourseName = reader.GetValue(2).ToString();
                students.exmne_ClassId = Convert.ToInt16(reader.GetValue(3).ToString());
                students.exmne_Gender = reader.GetValue(4).ToString();
                students.exmne_Birthdate = reader.GetValue(5).ToString();
                students.exmne_Yearlevel = reader.GetValue(6).ToString();
                students.exmne_Username = reader.GetValue(7).ToString();
                students.exmne_Password = reader.GetValue(8).ToString();
                students.exmne_Status = reader.GetValue(9).ToString();
            }
            reader.Close();
            Connection.con.Close();
            return students;
        }

        //Student Edit. 

        [HttpPost]
        public ActionResult EditStudents(Students students)
        {
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_EditStudent", Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", students.exmne_Id);
            cmd.Parameters.AddWithValue("@FullName", students.exmne_Fullname);
            cmd.Parameters.AddWithValue("@Course", students.exmne_CourseName);
            cmd.Parameters.AddWithValue("@Class", students.exmne_ClassId);
            cmd.Parameters.AddWithValue("@Gender", students.exmne_Gender);
            cmd.Parameters.AddWithValue("@Birthdate", students.exmne_Birthdate);
            cmd.Parameters.AddWithValue("@Yearlevel", students.exmne_Yearlevel);
            cmd.Parameters.AddWithValue("@Email", students.exmne_Username);
            cmd.Parameters.AddWithValue("@Password", students.exmne_Password);
            cmd.Parameters.AddWithValue("@Status", students.exmne_Status);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                TempData["success"] = "Student Update Successfully";
                Connection.con.Close();
                return RedirectToAction("ManageStudents", "Admin");
            }
            else
            {
                TempData["error"] = "Something Went Wrong!!!";
                Connection.con.Close();
                return RedirectToAction("ManageStudents", "Admin");
            }
        }

        //Student Delete 

        [HttpGet]
        public ActionResult DeleteStudents(int exmne_Id)
        {
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_deleteStudent",Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", exmne_Id);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {

                TempData["success"] = "Student Deleted Successfully!!!";
                return RedirectToAction("ManageStudents", "Admin");
            }
            else
            {
                TempData["error"] = "Something Went Wrong!!!";
                return RedirectToAction("ManageStudents", "Admin");
            }
        }
        [HttpPost]
        public JsonResult GetStudId(int studid)
        {
            return Json(new { studid });
        }

        //get student class for filter.

        
        public List<Students> getClassFilter()
        {
            List<Students>  students = new List<Students>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getStudentClass", Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Students stud = new Students()
                {
                    class_Id = Convert.ToInt16(reader.GetValue(0).ToString()),
                    course_Id = Convert.ToInt16(reader.GetValue(1).ToString()),
                    class_Name = reader.GetValue(2).ToString()
                };
                students.Add(stud);
            }
            reader.Close();
            Connection.con.Close();
            return students;
        }

        //Exam Section
        [HttpGet]
        public ActionResult CreateExam()
        {
            List<Exam> exams1 = getStudentCourseForExam();
            ViewBag.CourseList = new SelectList(exams1, "exam_CourseId", "exam_CourseName");

            List<Exam> exams = getTimeForExam();
            ViewBag.TimeList = new SelectList(exams, "exam_TimeValue", "exam_TimeName");
            return View();
        }
        [HttpPost]
        public List<Exam> getStudentCourseForExam()
        {
            List<Exam> exams = new List<Exam>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getCourse",Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Exam exams1 = new Exam()
                {
                    exam_CourseId=Convert.ToInt16(reader.GetValue(0).ToString()),
                    exam_CourseName=reader.GetValue(1).ToString()
                };
                exams.Add(exams1);
            }

            reader.Close();
            Connection.con.Close();
            return exams;
        }
        public List<Exam>getTimeForExam()
        {
            List<Exam> exams= new List<Exam>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getTimeForExam",Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                Exam exam = new Exam()
                {
                    
                    exam_TimeName = reader.GetValue(0).ToString(),
                    exam_TimeValue=reader.GetValue(1).ToString()
                };
                exams.Add(exam);
            }
            reader.Close();
            Connection.con.Close();
            return exams;
        }
        [HttpPost]
        public ActionResult CreateExam(Exam exam)
        {
            if(ModelState.IsValid)
            {
                Connection.getConnection();
                Connection.con.Open();
                cmd = new SqlCommand("sp_CreateExam",Connection.con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@course_Id",exam.exam_CourseId);
                cmd.Parameters.AddWithValue("@class_Id",exam.exam_ClassId);
                cmd.Parameters.AddWithValue("@exam_Title",exam.exam_Title);
                cmd.Parameters.AddWithValue("@exam_TimeLimit", exam.exam_TimeValue);
                cmd.Parameters.AddWithValue("@exam_StartDate", exam.exam_StartDate);
                cmd.Parameters.AddWithValue("@exam_QuestionLimit", exam.exam_QuestionLimit);
                cmd.Parameters.AddWithValue("@exam_Description", exam.exam_Description);
                int res = cmd.ExecuteNonQuery();
                if(res>0)
                {
                    TempData["success"] = "Exam Create Successfully.";
                    Connection.con.Close();
                    return RedirectToAction("ManageExam", "Admin");
                }
                else
                {
                    TempData["error"] = "Something Went Wrong!!!";
                    Connection.con.Close();
                    return RedirectToAction("ManageExam", "Admin");
                }               

            }
            return View(exam);
        }

        //Exam Manage Section

        [HttpGet]
        public ActionResult ManageExam()
        {
            List<Exam> exams = getExam();
            return View(exams);
        }
        public List<Exam> getExam()
        {
            List<Exam> exams= new List<Exam>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_ManageExam",Connection.con);
            cmd.CommandType=System.Data.CommandType.StoredProcedure;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Exam exam = new Exam()
                {
                 exam_Id=Convert.ToInt16(reader.GetValue(0).ToString()),
                 exam_Title = reader.GetValue(1).ToString(),
                 exam_CourseId=Convert.ToInt16(reader.GetValue(2).ToString()),
                 exam_Description=reader.GetValue(3).ToString(),
                 exam_TimeValue=reader.GetValue(4).ToString(),
                 exam_QuestionLimit = Convert.ToInt16(reader.GetValue(5).ToString())
                };
                exams.Add(exam);
            }            
            reader.Close();
            Connection.con.Close();
            return exams;
        }

        //Edit Exam Section
        [HttpGet]
        public ActionResult EditExam(int exam_Id)
        {
            List<Exam> exams1 = getStudentCourseForExam();
            ViewBag.CourseList = new SelectList(exams1, "exam_CourseId", "exam_CourseName");

            List<Exam> exams = getTimeForExam();
            ViewBag.TimeList = new SelectList(exams, "exam_TimeValue", "exam_TimeName");

            Exam exam = getSpecificExam(exam_Id);
            return View(exam);

        }
        public Exam getSpecificExam(int exam_Id)
        {
            Exam exam = new Exam();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getSpecificExam", Connection.con);
            cmd.CommandType =System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", exam_Id);
            reader=cmd.ExecuteReader();
            while(reader.Read())
            {
                exam = new Exam();
                exam.exam_Id = Convert.ToInt16(reader.GetValue(0).ToString());
                exam.exam_CourseId=Convert.ToInt16(reader.GetValue(1).ToString()) ;
                exam.exam_ClassId=Convert.ToInt16(reader.GetValue(2).ToString());
                exam.exam_TimeValue = reader.GetValue(3).ToString();
                exam.exam_QuestionLimit = Convert.ToInt16(reader.GetValue(4).ToString());
                exam.exam_Title=reader.GetValue(5).ToString();                
                exam.exam_Description=reader.GetValue(6).ToString();
            }
            reader.Close();
            Connection.con.Close();
            return exam;
        }

        //Add Question Section.
        [HttpGet]
        public ActionResult AddQuestion(int exam_Id1)
        {
            Session["ExamId"] = exam_Id1;
            return View();
        }
        [HttpPost]
        public ActionResult AddQuestion(Exam exam)
        {
            if(ModelState.IsValid)
            {
               // Response.Write("<Script>alert('" + exam.exam_Id + "');</Script>");
                Connection.getConnection();
                Connection.con.Open();
                

                //cmd = new SqlCommand("SELECT COUNT(*) FROM examQuestion_Tbl WHERE exam_Id = @exam_Id", Connection.con);
                //cmd.Parameters.AddWithValue("@exam_Id", Session["ExamId"]);
                //int count = (int)cmd.ExecuteScalar();

                //if (count == 0)
                //{
                    cmd = new SqlCommand("sp_InsertQuestion",Connection.con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@exam_Id", Session["ExamId"]);
                cmd.Parameters.AddWithValue("@Question",exam.exam_Question);
                cmd.Parameters.AddWithValue("@option_1", exam.exam_Option_1);
                cmd.Parameters.AddWithValue("@option_2", exam.exam_Option_2);
                cmd.Parameters.AddWithValue("@option_3", exam.exam_Option_3);
                cmd.Parameters.AddWithValue("@option_4", exam.exam_Option_4);
                cmd.Parameters.AddWithValue("@option_Correct", exam.exam_CorrectAnswer);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    TempData["success"] = "Question Added Successfully";
                    Connection.con.Close();
                    return View();
                }
                else
                {
                    TempData["error"] = "Something Went Wrong!!!";
                    Connection.con.Close();
                    return View();
                }
         

        }
            else
            {
                return View();
            }
            
        }
        //Display question in QuestionDetail Page
        [HttpGet]
        public ActionResult QuestionDetail()
        {
            List<Exam> exams = getExamQuestion();

            return View(exams);
        }
        public List<Exam> getExamQuestion()
        {
            List<Exam>exams = new List<Exam>();

            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getExamQuestion",Connection.con);
            cmd.CommandType=System.Data.CommandType.StoredProcedure;
            reader= cmd.ExecuteReader();
            while(reader.Read())
            {
                Exam exam = new Exam()
                {
                    que_Id= Convert.ToInt16(reader.GetValue(0).ToString()),
                    exam_Id =Convert.ToInt16(reader.GetValue(1).ToString()),
                    exam_Question=reader.GetValue(2).ToString(),
                    exam_Option_1=reader.GetValue(3).ToString(),
                    exam_Option_2=reader.GetValue(4).ToString(),
                    exam_Option_3=reader.GetValue(5).ToString(),
                    exam_Option_4=reader.GetValue(6).ToString(),
                    exam_CorrectAnswer=reader.GetValue(7).ToString(),
                    exam_Status=reader.GetValue(8).ToString()
                };
                exams.Add(exam);
            }
            reader.Close();
            Connection.con.Close();
            return exams;
        }


        
        //Delete Exam Section
        [HttpGet]
        public ActionResult deleteExam(int exam_Id)
        {
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_deleteExam",Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@examId", exam_Id);
            int res = cmd.ExecuteNonQuery();
            if(res>0)
            {
                TempData["success"] = "Exam Deleted Successfully";
                Connection.con.Close();
                return RedirectToAction("ManageExam", "Admin");                
            }
            else
            {
                TempData["error"] = "Something Went Wrong!!!";
                Connection.con.Close();
                return RedirectToAction("ManageExam", "Admin");
            }
            
        }
        //Ranking By Exam Section.
        [HttpGet]
        public ActionResult RankingByExam()
        {
            List<Exam> exams = getRankingByExam();
            return View(exams);
        }
        public List<Exam>getRankingByExam()
        {
            List<Exam>exams = new List<Exam>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_RankingByExam",Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            reader=cmd.ExecuteReader();
            while (reader.Read())
            {
                Exam exam = new Exam()
                {
                    exam_Title = reader.GetValue(0).ToString(),
                    exam_CourseId = Convert.ToInt16(reader.GetValue(1).ToString()),
                    exam_Description = reader.GetValue(2).ToString()
                };
                exams.Add(exam);
            }
            reader.Close();
            Connection.con.Close();
            return exams;
        }
        //Feedback Section
        [HttpGet]
        public ActionResult Feedbacks()
        {
            List<Feedbacks> feedbacks = getFeedbacks();
            return View(feedbacks);
        }

        public List<Feedbacks> getFeedbacks()
        {
            List<Feedbacks> feedbacks = new List<Feedbacks>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("sp_getFeedbacks", Connection.con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Feedbacks feedback = new Feedbacks()
                {
                    fb_Id = Convert.ToInt16(reader.GetValue(0).ToString()),
                    exmne_Id = Convert.ToInt16(reader.GetValue(1).ToString()),
                    fb_Exmne_as = reader.GetValue(2).ToString(),
                    fb_Feedbacks = reader.GetValue(3).ToString(),
                    fb_Date = reader.GetValue(4).ToString(),

                };
                feedbacks.Add(feedback);
            }
            reader.Close();
            Connection.con.Close();
            return feedbacks;

        }
        //Logout Section

        [HttpGet]
        public ActionResult Logout()
        {
            return View();
        }

        [HttpPost]
        public JsonResult GetCatId(int catid)
        {
            return Json(new { catid });
        }
    }
}



