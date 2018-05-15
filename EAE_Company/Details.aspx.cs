using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAE_Company
{
    public partial class Details : System.Web.UI.Page
    {
         void Page_Load(object sender, EventArgs e)
        {
            String a = "";
        }

      

        protected void send_comment_Click(object sender, EventArgs e)
        {
            String id = comment_email.Text;
            String user_name = comment_name.Text;

        }


        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            String test = "abc";
        }
    }
}