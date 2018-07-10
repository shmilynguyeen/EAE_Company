using log4net;
using System;
using EAE_Company.Models;

namespace EAE_Company
{
    public partial class Login : System.Web.UI.Page
    {
        //Declare an instance for log4net
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User user = new User(email.Text, password.Text);
            bool login = user.login();
            if (login)
            {
                Session["user"] = user.getUserInfo();  // user is an object
                Response.Redirect("admin.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx" , false);
            }
          
        }
    }
}