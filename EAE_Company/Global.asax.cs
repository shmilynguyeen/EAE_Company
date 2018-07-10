using System;
using System.Web;
using System.Threading;
using System.Globalization;
using EAE_Company.Models;
using System.Collections.Generic;

namespace EAE_Company
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            //SqlServerTypes.Utilities.LoadNativeAssemblies(Server.MapPath("~/bin"));
            log4net.Config.XmlConfigurator.Configure();

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["CultureInfo"];
            if (cookie != null && cookie.Value != null)
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(cookie.Value, false);
                Thread.CurrentThread.CurrentCulture = new CultureInfo(cookie.Value, false);

            }
            else
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("vi");
                Thread.CurrentThread.CurrentCulture = new CultureInfo("vi");

            }
            string language = Thread.CurrentThread.CurrentCulture.Name;
            string Uilanguage = Thread.CurrentThread.CurrentUICulture.Name;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //Response.Redirect("~/Default.aspx");
            string language = Thread.CurrentThread.CurrentCulture.Name;
            Session["language"] = language;

            //Load Item List for home pages
            Item item = new Item();
            List<Item> newArrivals = item.getItems(75);
            List<Item> threeItems = item.getItems(60);
            List<Item> twoItems = item.getItems(79);
            Session["newArrivals"] = newArrivals;
            Session["threeItems"] = threeItems;
            Session["twoItems"] = twoItems;
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}