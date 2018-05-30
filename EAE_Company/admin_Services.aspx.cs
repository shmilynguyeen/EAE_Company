using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EAE_Company.Models;
namespace EAE_Company
{
    public partial class admin_Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string categoryCode = txtCategoryCode.Text;
            string itemNameVi = txtItemNameVi.Text;
            string itemNameEn = txtItemNameEn.Text;
            string descriptionVi = txtDescriptionVi.Text;
            string descriptionEn = txtDescriptionEn.Text;
            string price = txtPrice.Text;
            string itemGroup = txtGroup.SelectedValue;
            List<String> img = new List<string>();
            Item item = new Item(categoryCode, itemNameVi, itemNameEn , descriptionVi, descriptionEn, price, img, itemGroup);
            item.insertItem(item);
            

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}