using EAE_Company.Commons;
using EAE_Company.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAE_Company
{
    public partial class admin_category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                GridView1.AllowPaging = true;
                GridView1.AllowSorting = true;
                bindGrid();
            }
        }

        private void bindGrid()
        {
            string constr = ClsCommons.connectionStr;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sQuery = @" SELECT * FROM item_category  WHERE is_Active = '1' ";

                sQuery = string.Format(sQuery);
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
        protected void gvbind()
        {
            SqlConnection conn = new SqlConnection(ClsCommons.connectionStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand(@" SELECT  *
                          FROM item_category 
                           Where  is_Active ='1' ", conn);
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ClsCommons.connectionStr);

            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            string id = (GridView1.DataKeys[e.RowIndex].Value.ToString());
            //string id = string id = (e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["geo_province_id"].ToString();

            conn.Open();
            string sQuery = @"UPDATE item_category set is_Active = 0 where item_category_id='{0}'";
            sQuery = string.Format(sQuery, Convert.ToInt32(id));
            SqlCommand cmd = new SqlCommand(sQuery, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            bindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ClsCommons.connectionStr);
            int userid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];

            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string categoryCode = ((TextBox)row.Cells[1].Controls[0]).Text.Trim();
            string categoryNameVi = ((TextBox)row.Cells[2].Controls[0]).Text.Trim();

            GridView1.EditIndex = -1;
            conn.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
            string sQuery = @"UPDATE [item_category]
                   SET  
                       [item_category_code] = N'{0}'
                      ,[category_name] = N'{1}'
                       WHERE item_category_id = '{2}'";
            sQuery = string.Format(sQuery, categoryCode, categoryNameVi, id);
            SqlCommand cmd = new SqlCommand(sQuery, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            bindGrid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gvbind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gvbind();
        }

        protected void btnCreateCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_Category.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            //GridView1.DataBind();
            bindGrid();
        }


    }
}