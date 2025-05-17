using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace ONLINE_EXAMINATION_SYSTEM
{
    public class Connection
    {
        public static SqlConnection con;
        public static void getConnection()
        {
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["con"].ConnectionString);
        }
    }
}