using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ONLINE_EXAMINATION_SYSTEM.Models
{
    public class Exam
    {
        public int Id { get; set; }

        public int questionId {  get; set; }
        public string question { get; set; }
        public string option_A {  get; set; }
        public string option_B {  get; set; }
        public string option_C {  get; set; }
        public string option_D {  get; set; }
        public string correctAnswer {  get; set; }
        public int timeLimit {  get; set; }


      
        public int exam_Id {  get; set; }
        public int course_Id {  get; set; }
        public string course_Name {  get; set; }
        public int class_Id {  get; set; }
        public string class_Name {  get; set; }
        public string exam_Title {  get; set; }
        public string exam_Timelimit {  get; set; }
        public string exam_Description {  get; set; }
        public DateTime exam_StartDate { get; set; }

    }
}