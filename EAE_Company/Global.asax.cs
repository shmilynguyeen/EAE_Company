﻿using System;
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
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
                Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");

            }
            string language = Thread.CurrentThread.CurrentCulture.Name;
            string Uilanguage = Thread.CurrentThread.CurrentUICulture.Name;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //Response.Redirect("~/Home.aspx");
            string language = Thread.CurrentThread.CurrentCulture.Name;
            Session["language"] = language;

            //Load Item List for New Arrivals 
            Item item = new Item();
            List<Item> newArrivals = item.getNewArrivalItems();
            Session["newArrivals"] = newArrivals;
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