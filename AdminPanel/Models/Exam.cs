using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdminPanel.Models
{
    public class Exam
    {
        public int exam_Id {  get; set; }
        public int exam_CourseId { get; set; }
        public string exam_CourseName { get; set; }
        public int exam_ClassId { get;set; }
        public string exam_Title { get; set; }
        public string exam_TimeValue { get; set; }
        public int exam_QuestionLimit { get; set; }
        public DateTime exam_StartDate { get; set; }
        public string exam_Description { get; set; }


        public string exam_TimeName {  get; set; }



        public int que_Id {  get; set; }
        public string exam_Question {  get; set; }
        public string exam_Option_1 {  get; set; }
        public string exam_Option_2 { get; set; }
        public string exam_Option_3 { get;  set; }
        public string exam_Option_4 { get;  set; }
        public string exam_CorrectAnswer {  get; set; }

        public string exam_Status {  get; set; }
        
    }
}