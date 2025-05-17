using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ONLINE_EXAMINATION_SYSTEM.Models
{
    public class Login
    {
        public int studentId { get; set; }

        [Required(ErrorMessage ="Please Enter Your Username")]
        public string studentUsername { get; set; }

        [Required(ErrorMessage ="Please Enter Your Password")]
        public string studentPassword {  get; set; }
    }
}