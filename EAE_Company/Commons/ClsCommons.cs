using log4net;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace EAE_Company.Commons
{
    public class ClsCommons
    {
        public static string connectionStr = System.Configuration.ConfigurationManager.ConnectionStrings["SQLCon"].ConnectionString;
        public static string UrlRoot = ConfigurationManager.AppSettings["URLRoot"];
        public static string XMLPath = ConfigurationManager.AppSettings["XMLPath"];
        public static string UploadPath = ConfigurationManager.AppSettings["UploadPath"];
        public static readonly ILog logger = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

    }
}