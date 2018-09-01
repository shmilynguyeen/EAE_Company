using System;
using EAE_Company.Models;

namespace EAE_Company
{
    public partial class Create_Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

            string categoryNameVi = txtCategoryNameVi.Text;
            string categoryCode = txtCategoryCode.Text;


            Category category = new Category(categoryCode, categoryNameVi);

            category.insertCategory();
            Response.Redirect("admin_category.aspx");


        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_category.aspx");
        }

        
    }

}