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
            string categoryCode = dropdownCategoryCode.SelectedValue;
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
                           i.Item_Price, i.Item_Description_Vi , i.Item_Description_Eng, img.Image_URL from item i 
                            left join images img on 
                            img.Item_ID = i.ID 
							where i.Is_Active ='1' and Item_Group={0}";
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
        protected void gvbind()
        {
            SqlConnection conn = new SqlConnection(ClsCommons.connectionStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT i.ID , i.Item_Code, i.Item_Name_Vi, i.Item_Name_Eng, i.Item_Group,i.Category_Code,
                           i.Item_Price, i.Item_Description_Vi , i.Item_Description_Eng, img.Image_URL from item i 
                            left join images img on 
                            img.Item_ID = i.ID 
							where i.Is_Active ='1' and Item_Group='3'", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridView1.DataSource = ds;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gvbind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ClsCommons.connectionStr);

            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            string id = (GridView1.DataKeys[e.RowIndex].Value.ToString());
            //string id = string id = (e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["geo_province_id"].ToString();

            conn.Open();
            string sQuery = @"UPDATE item set Is_Active =0 where ID='{0}'";
            sQuery = string.Format(sQuery, Convert.ToInt32(id));
            SqlCommand cmd = new SqlCommand(sQuery, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            gvbind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ClsCommons.connectionStr);
            int userid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];

            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string category = ((TextBox)row.Cells[1].Controls[0]).Text.Trim();
            TextBox nameVi = (TextBox)row.Cells[2].Controls[0];
            TextBox nameEn = (TextBox)row.Cells[3].Controls[0];
            TextBox descriptionVi = (TextBox)row.Cells[4].Controls[0];

            TextBox descriptionEn = (TextBox)row.Cells[5].Controls[0];
            decimal price = decimal.Parse(((TextBox)row.Cells[6].Controls[0]).Text.Trim());
            TextBox group = (TextBox)row.Cells[7].Controls[0];


            //TextBox textadd = (TextBox)row.FindControl("txtadd");  
            //TextBox textc = (TextBox)row.FindControl("txtc");  
            GridView1.EditIndex = -1;
            conn.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
            string sQuery = @"update item set [Category_Code]='{0}' , [Item_Name_Vi] = '{1}' , 
                [Item_Name_Eng] = '{2}' , [Item_Description_Vi] = '{3}' , [Item_Description_Eng] = '{4}', [Item_Price] = '{5}' , 
                    [Item_Group] = {6} WHERE ID = '{7}'";
            sQuery = string.Format(sQuery, category, nameVi.Text, nameEn.Text,
                descriptionVi.Text, descriptionEn.Text, price, group.Text, id);
            SqlCommand cmd = new SqlCommand(sQuery, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            gvbind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gvbind();
        }
    }
}