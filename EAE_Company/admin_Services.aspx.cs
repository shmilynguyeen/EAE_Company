using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EAE_Company.Commons;
using EAE_Company.Models;
namespace EAE_Company
{
    public partial class admin_Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.bindGrid(3);
            }
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
            Item item = new Item(categoryCode, itemNameVi, itemNameEn, descriptionVi, descriptionEn, price, img, itemGroup);
            item.insertItem(item);


        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {


        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

        }

        private void bindGrid(int itemGroup)
        {
            string constr = ClsCommons.connectionStr;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sQuery = @"SELECT i.ID , i.Item_Code, i.Item_Name_Vi, i.Item_Name_Eng, i.Item_Group,i.Category_Code,
                            i.Item_Description_Vi , i.Item_Description_Eng, img.Image_URL from item i 
                            left join images img on 
                            img.Item_ID = i.ID 
							where i.Is_Active ='1' and Item_Group={0}" ;
                sQuery = string.Format(sQuery, itemGroup);
                using (SqlCommand cmd = new SqlCommand(sQuery))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }



        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}