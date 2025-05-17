using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls.WebParts;
using ONLINE_EXAMINATION_SYSTEM.Models;

namespace ONLINE_EXAMINATION_SYSTEM.Controllers
{
    public class ExamController : Controller
    {
        SqlCommand cmd;
        SqlDataReader reader;

        //Upcoming Exam Section.
        [HttpGet]
        public ActionResult UpcomingExam()
        {
            List<Exam> exams = getUpcomingExams();

            return View(exams);
        }

        public List<Exam> getUpcomingExams()
        {
            List<Exam> exams = new List<Exam>();

            try
            {
                Connection.getConnection();
                Connection.con.Open();
                cmd = new SqlCommand("sp_UpcomningExam", Connection.con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Exam exam = new Exam()
                    {

                        exam_Id = Convert.ToInt16(reader.GetValue(0).ToString()),
                        course_Id = Convert.ToInt16(reader.GetValue(1).ToString()),
                        class_Id = Convert.ToInt16(reader.GetValue(2).ToString()),
                        exam_Title = reader.GetValue(3).ToString(),
                        exam_Timelimit = reader.GetValue(4).ToString(),
                        exam_Description = reader.GetValue(5).ToString(),
                        exam_StartDate = Convert.ToDateTime(reader.GetValue(6).ToString()),
                        class_Name = reader.GetValue(7).ToString(),
                        course_Name = reader.GetValue(8).ToString()

                    };

                    ////Fetch course name
                    //exam.course_Name = getCourseName(exam.course_Id);
                    ////Fetch class name
                    //exam.class_Name = getClassName(exam.class_Id);

                    exams.Add(exam);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                Connection.con.Close();
            }

            return exams;
        }






        [HttpGet]
        public ActionResult OngoingExam()
        {
            string username = Session["Username"] as string;
            if (string.IsNullOrEmpty(username))
            {
                return RedirectToAction("Login", "Login");
            }

            var exams = GetTodayExams();
            if (exams == null || exams.Count == 0)
            {
                ViewBag.Message = "No exams available today.";
                return View();
            }

            // Filter out attempted exams
            exams = exams.Where(e => !IsExamAttempted(username, e.Id)).ToList();

            if (exams.Count == 0)
            {
                ViewBag.Message = "You have already attempted all today's exams.";
                return View();
            }

            return View(exams);  
        }

      
        [HttpPost]
        public ActionResult StartExam(int examId)
        {

            List<Exam> questions = GetExamQuestions(examId);
            if (questions == null || !questions.Any())
            {
                ViewBag.Message = "No questions found.";
                return View("OngoingExam");
            }
            ViewBag.ExamId = examId;
            ViewBag.TimeLimit = GetExamTimeLimit(examId);
            return View("ExamQuestions", questions);
        }

        private List<Exam> GetExamQuestions(int examId)
        {
            List<Exam> questions = new List<Exam>();
            Connection.getConnection();
            Connection.con.Open();
            cmd = new SqlCommand("GetExamQuestions", Connection.con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ExamId", examId);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                questions.Add(new Exam
                {
                    questionId = Convert.ToInt32(reader["Exam_Id"]),
                    question = reader["exam_Question"].ToString(),
                    option_A = reader["exam_Ch1"].ToString(),
                    option_B = reader["exam_Ch2"].ToString(),
                    option_C = reader["exam_Ch3"].ToString(),
                    option_D = reader["exam_Ch4"].ToString(),
                    correctAnswer = reader["exam_Answer"].ToString()
                });
            }
            reader.Close();
            Connection.con.Close();

            return questions;
        }
        //GetExamTimeLimit
        private int GetExamTimeLimit(int examId)
        {
            int timelimit = 0;

            Connection.getConnection();
            Connection.con.Open();

            cmd = new SqlCommand("sp_GetExamTimeLimit", Connection.con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ExamId", examId);

            object result = cmd.ExecuteScalar();
            if (result != null)
            {
                timelimit = Convert.ToInt32(result);

            }
            Connection.con.Close();
            return timelimit;
        }





        private List<Exam> GetTodayExams()
        {
            List<Exam> exams = new List<Exam>();
            Connection.getConnection();
            Connection.con.Open();

            string query = "SELECT * FROM exam_Tbl WHERE CONVERT(date, exam_StartDate) = CONVERT(date, GETDATE())";
            cmd = new SqlCommand(query, Connection.con);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                exams.Add(new Exam
                {
                    Id = Convert.ToInt32(reader["exam_Id"]),
                    exam_Title = reader["exam_Title"].ToString(),
                    timeLimit = Convert.ToInt32(reader["exam_Timelimit"]),
                    exam_StartDate = Convert.ToDateTime(reader["exam_StartDate"])
                });
            }

            reader.Close();
            Connection.con.Close();

            return exams;
        }


        private bool IsExamAttempted(string username, int examId)
        {
            Connection.getConnection();

            Connection.con.Open();

            cmd = new SqlCommand("sp_CheckExamAttepmpt", Connection.con);
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamId", examId);
                cmd.Parameters.AddWithValue("@Username", username);

                return Convert.ToBoolean(cmd.ExecuteScalar());
            }


        }
        int exmne_Id = 0;

        [HttpPost]
        public ActionResult SubmitExam(int examId, FormCollection form)
        {
            Connection.getConnection();
            Connection.con.Open();
          
            string studentName = Convert.ToString(Session["username"]);
            if (string.IsNullOrEmpty(studentName))
            {
                return RedirectToAction("Login", "Login");
            }

            cmd = new SqlCommand("Select exmne_Id from examinee_Tbl where exmne_Username=@Username", Connection.con);
            cmd.Parameters.AddWithValue("@Username", studentName);
            object obj =cmd.ExecuteScalar();
            if(obj!=null){
            exmne_Id = Convert.ToInt32(obj);
            }
            Connection.con.Close();        

            // 1. Save Student Answers
            Connection.getConnection();
            Connection.con.Open();
            foreach (string key in form.AllKeys)
            {
                if (key.StartsWith("answers_"))
                {
                    int questionId = Convert.ToInt32(key.Split('_')[1]);
                    string selectedOption = form[key];

                    SqlCommand cmd = new SqlCommand("INSERT INTO examResults_Tbl (exmne_Id, ExamId, QuestionId, SelectedOption) " +
                        "VALUES (@exmne_Id, @ExamId, @QuestionId, @SelectedOption)", Connection.con);
                    cmd.Parameters.AddWithValue("@exmne_Id", exmne_Id);
                    cmd.Parameters.AddWithValue("@ExamId", examId);
                    cmd.Parameters.AddWithValue("@QuestionId", questionId);
                    cmd.Parameters.AddWithValue("@SelectedOption", selectedOption);
                    cmd.ExecuteNonQuery();
                }
            }

            // 2. Call Stored Procedure
            SqlCommand spCmd = new SqlCommand("usp_SaveExamAndGetResult", Connection.con);
            spCmd.CommandType = CommandType.StoredProcedure;
            spCmd.Parameters.AddWithValue("@exmne_Id", exmne_Id);
            spCmd.Parameters.AddWithValue("@ExamId", examId);

            SqlParameter scoreParam = new SqlParameter("@Score", SqlDbType.Int) { Direction = ParameterDirection.Output };
            SqlParameter totalMarksParam = new SqlParameter("@TotalMarks", SqlDbType.Int) { Direction = ParameterDirection.Output };
            SqlParameter correctParam = new SqlParameter("@CorrectAnswers", SqlDbType.Int) { Direction = ParameterDirection.Output };
            SqlParameter wrongParam = new SqlParameter("@WrongAnswers", SqlDbType.Int) { Direction = ParameterDirection.Output };
            SqlParameter notAttemptedParam = new SqlParameter("@NotAttempted", SqlDbType.Int) { Direction = ParameterDirection.Output };

            spCmd.Parameters.Add(scoreParam);
            spCmd.Parameters.Add(totalMarksParam);
            spCmd.Parameters.Add(correctParam);
            spCmd.Parameters.Add(wrongParam);
            spCmd.Parameters.Add(notAttemptedParam);

            spCmd.ExecuteNonQuery();

            Result result = new Result
            {
                StundentName = studentName,
                ExamId = examId,
                Score = Convert.ToInt32(scoreParam.Value),
                TotalMarks = Convert.ToInt32(totalMarksParam.Value),
                CorrectAnswers = Convert.ToInt32(correctParam.Value),
                WrongAnswers = Convert.ToInt32(wrongParam.Value),
                NotAttempted = Convert.ToInt32(notAttemptedParam.Value),
            };

            result.Percentage = result.TotalMarks > 0 ? ((double)result.Score / result.TotalMarks) * 100 : 0;

            return View("MyResult", result);  

        }
    }
}
