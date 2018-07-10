using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EAE_Company.Models;

namespace EAE_Company
{
    public partial class CreateItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            int count = 1;
            //Validate file type 
            //if (!Page.IsValid)
            //{
            //    lbOutput.Text = "Invalid file type ! ";
            //}

            foreach (HttpPostedFile p in FileUpload1.PostedFiles)
            {
                if (count > 4)
                {
                    break;
                }
                p.SaveAs(MapPath("~/assets/data_img_temp/" + "img" + count + ".jpg"));
                count += 1;

            }

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            List<string> imageDelete = (List<string>)Session["imageDelete"];
            string categoryCode = dropdownCategoryCode.SelectedValue;
            string itemNameVi = txtItemNameVi.Text;
            string itemNameEn = txtItemNameEn.Text;
            string descriptionVi = txtDescriptionVi.Text;
            string descriptionEn = txtDescriptionEn.Text;
            string price = txtPrice.Text;
            string itemGroup = txtGroup.SelectedValue;
            List<String> img = new List<string>();
            Item item = new Item(categoryCode, itemNameVi, itemNameEn, descriptionVi, descriptionEn, price, img, itemGroup);
            //item.insertItem(item);


        }

        protected void btnCreateItem_Click(object sender, EventArgs e)
        {

        }
    }
}