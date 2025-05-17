using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ONLINE_EXAMINATION_SYSTEM.Models
{
    public class Class
    {
        [Required(ErrorMessage ="Please Select Your Class.")]
        public int class_Id { get; set; }

        [Required(ErrorMessage = "Please Select Your Course.")]
        public int course_Id {  get; set; }

     
        public string class_Name { get; set; }



        [Required(ErrorMessage = "Please Select Your Roll Number.")]
        public int roll_Id { get; set; }
        public int Course_Id { get; set; }
        public int Class_Id { get; set; }
        public int roll_Number { get; set; }
        public DateTime attendance_Date { get; set; }

    }
}