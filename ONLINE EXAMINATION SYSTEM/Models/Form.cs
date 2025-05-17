using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ONLINE_EXAMINATION_SYSTEM.Models
{
    public class Form
    {
        public int Id {  get; set; }
        public string Name { get; set; }    
        public string Email {  get; set; }

        public List<SelectListItem> CitiesList { get; set; }
        public string SelectedCity {  get; set; }


        public string password { get; set; }
        public string gender {  get; set; }

        public List<SelectListItem> DegreeList { get; set; }
        public string SelectedDegree { get; set; }
        public List<SelectListItem> MasterList { get; set; }
        public string SelectedMaster { get; set; }


    }
}