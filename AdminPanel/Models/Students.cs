using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdminPanel.Models
{
    public class Students
    {


        public int class_Id { get; set; }
        public string class_Name { get; set; }
        public int course_Id { get; set; }
   





        //only for add student 
        public int exmne_Id { get; set; }

        public string exmne_Fullname { get; set; }

        public string exmne_Birthdate { get; set; }


        
        public string exmne_Gender { get; set; }

        public int exmne_CourseId { get; set; }
        public string exmne_CourseName { get; set; }

        public int exmne_ClassId { get; set; }
        public int exmne_RollnoId { get; set; }


   
        public string exmne_Yearlevel { get; set; }
        public string exmne_Username { get; set; }
        public string exmne_Password { get; set; }


        public string exmne_Status { get;set; }

        public string exmne_SessionToken {  get; set; }


    }
}