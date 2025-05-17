using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ONLINE_EXAMINATION_SYSTEM.Models
{
    public class Rollno
    {

        public int roll_Id { get; set; }
        public int Course_Id { get; set; }
        public int Class_Id { get; set; }
        public int roll_Number { get; set; }
        public DateTime attendance_Date { get; set; }
    }
}