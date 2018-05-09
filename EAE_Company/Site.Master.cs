using System;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.UI;

namespace EAE_Company
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            Page.Header.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
          if (!Page.IsPostBack)
            {
                dllLanguage.SelectedValue = Thread.CurrentThread.CurrentCulture.Name;
                string Uilanguage = Thread.CurrentThread.CurrentUICulture.Name;

            }
        }

        public void changeLanguage(object sender, EventArgs e)
        {
            // set cookie that is to be used by Global.asax
            HttpCookie cookie = new HttpCookie("CultureInfo");
            cookie.Value = dllLanguage.SelectedValue;
            Response.Cookies.Add(cookie);


            // set the culture and reload the page for immediate effect 
            // Future effects are handled by global.asax

            if (cookie.Equals("auto"))
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(HttpContext.Current.Request.UserLanguages[0].Trim());
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(HttpContext.Current.Request.UserLanguages[0].Trim());
            }
            else
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo(dllLanguage.SelectedValue, false);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(dllLanguage.SelectedValue, false);
            }

            String a = Request.Path;
            // Server.Transfer(Request.Path);
            string language = Thread.CurrentThread.CurrentCulture.Name;
            Response.Redirect(Page.Request.Url.ToString());

        }
    }
}