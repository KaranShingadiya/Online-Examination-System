using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ONLINE_EXAMINATION_SYSTEM.Models
{
    public class Result
    {
        


        public string StundentName { get; set; }
        public int Score { get; set; }
        public int TotalMarks { get; set; }
        public double Percentage { get; set; }
        public int CorrectAnswers { get;set; }
        public int WrongAnswers { get; set; }
        public int NotAttempted { get; set; }
        public int ExamId { get;set;     }
    }
}