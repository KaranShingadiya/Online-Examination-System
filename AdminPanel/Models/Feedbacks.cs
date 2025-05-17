using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdminPanel.Models
{
    public class Feedbacks
    {
        public int fb_Id {  get; set; }
        public int exmne_Id { get; set; }
        public string fb_Exmne_as {  get; set; }
        public string fb_Feedbacks {  get; set; }
        public string fb_Date {  get; set; }
    }
}