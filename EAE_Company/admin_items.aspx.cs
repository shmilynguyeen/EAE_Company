using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EAE_Company.Commons;
using EAE_Company.Models;
namespace EAE_Company
{
    public partial class admin_items : System.Web.UI.Page
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {


        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
        }

        private void bindGrid()
        {
            string constr = ClsCommons.connectionStr;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sQuery = @" SELECT I.*,
                               C1.category_name AS category_name1,
                               C2.category_name AS category_name2,
                               C3.category_name AS category_name3,
                               C4.category_name AS category_name4,
                               C5.category_name AS category_name5
                          FROM item AS I
                               LEFT JOIN images  AS imgs ON imgs.item_id = I.item_id
                               LEFT JOIN item_category AS C1 ON I.category_id1 = C1.item_category_id
                               LEFT JOIN item_category AS C2 ON I.category_id2 = C2.item_category_id
                               LEFT JOIN item_category AS C3 ON I.category_id3 = C3.item_category_id
                               LEFT JOIN item_category AS C4 ON I.category_id4 = C4.item_category_id
                               LEFT JOIN item_category AS C5 ON I.category_id5 = C5.item_category_id
                           Where  I.Is_Active ='1' ";

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



        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindGrid();
        }
        protected void gvbind()
        {
            SqlConnection conn = new SqlConnection(ClsCommons.connectionStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand(@" SELECT I.*,
                               C1.category_name AS category_name1,
                               C2.category_name AS category_name2,
                               C3.category_name AS category_name3,
                               C4.category_name AS category_name4,
                               C5.category_name AS category_name5
                          FROM item AS I
                               LEFT JOIN images  AS imgs ON imgs.item_id = I.item_id
                               LEFT JOIN item_category AS C1 ON I.category_id1 = C1.item_category_id
                               LEFT JOIN item_category AS C2 ON I.category_id2 = C2.item_category_id
                               LEFT JOIN item_category AS C3 ON I.category_id3 = C3.item_category_id
                               LEFT JOIN item_category AS C4 ON I.category_id4 = C4.item_category_id
                               LEFT JOIN item_category AS C5 ON I.category_id5 = C5.item_category_id
                           Where  I.Is_Active ='1' ", conn);
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

            //GridView1.EditIndex = e.NewEditIndex;
            //gvbind();
            int id = Convert.ToInt32(GridView1.Rows[e.NewEditIndex].Cells[0].Text);
            Response.Redirect("CreateItem.aspx?item_id=" +id);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ClsCommons.connectionStr);

            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            string id = (GridView1.DataKeys[e.RowIndex].Value.ToString());
            //string id = string id = (e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["geo_province_id"].ToString();

            conn.Open();
            string sQuery = @"UPDATE item set Is_Active =0 where item_id='{0}'";
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
            string category_id1 = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();
            string category_id2 = ((TextBox)row.Cells[4].Controls[0]).Text.Trim();
            string category_id3 = ((TextBox)row.Cells[5].Controls[0]).Text.Trim();
            string category_id4 = ((TextBox)row.Cells[6].Controls[0]).Text.Trim();
            string category_id5 = ((TextBox)row.Cells[7].Controls[0]).Text.Trim();

            TextBox nameVi = (TextBox)row.Cells[1].Controls[0];
            TextBox nameEn = (TextBox)row.Cells[2].Controls[0];
            TextBox descriptionVi = (TextBox)row.Cells[8].Controls[0];
            TextBox descriptionEn = (TextBox)row.Cells[9].Controls[0];


            //TextBox textadd = (TextBox)row.FindControl("txtadd");  
            //TextBox textc = (TextBox)row.FindControl("txtc");  
            GridView1.EditIndex = -1;
            conn.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
            string sQuery = @"UPDATE [dbo].[item]
                   SET  
                       [item_name_en] = '{0}'
                      ,[item_name] = '{1}'
                      ,[category_id1] = '{2}'
                      ,[category_id2] = '{3}'
                      ,[category_id3] = '{4}'
                      ,[category_id4] = '{5}'
                      ,[category_id5] = '{6}'
                      ,[description_en] = '{7}'
                      ,[description] = '{8}'
                       WHERE item_id = '{9}'"; 
            sQuery = string.Format(sQuery, nameEn.Text, nameVi.Text, category_id1, category_id2, category_id3, category_id4,
                category_id5,descriptionEn.Text, descriptionVi.Text, id);
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

        //protected void btnPreview_Click(object sender, EventArgs e)
        //{
        //    int count = 1;
        //    //Validate file type 
        //    //if (!Page.IsValid)
        //    //{
        //    //    lbOutput.Text = "Invalid file type ! ";
        //    //}

        //    foreach(HttpPostedFile p in FileUpload1.PostedFiles)
        //    {
        //        if(count > 4)
        //        {
        //            break;
        //        }
        //        p.SaveAs(MapPath("~/assets/data_img_temp/" + "img"+count + ".jpg" ));
        //        count += 1;

        //    }

        //}

        protected void btn_hidden1_Click(object sender, EventArgs e)
        {
            if (File.Exists(MapPath("~/assets/data_img_temp/img1.jpg")))
            {
                File.Delete(MapPath("~/assets/data_img_temp/img1.jpg"));
            }
            Response.Redirect("admin_Services.aspx");


        }

        protected void btnCreateItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateItem.aspx");
        }
    }

}