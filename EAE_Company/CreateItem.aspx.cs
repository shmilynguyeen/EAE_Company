using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using EAE_Company.Models;
using System.Data.SqlClient;
using System.Data;
using EAE_Company.Commons;
using System.IO;
using log4net;

namespace EAE_Company
{
    public partial class CreateItem : System.Web.UI.Page
    {
        //Declare an instance for log4net
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                loadCategory();
            }
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            btnUpdate.Visible = false;
            // init
            loadCategory();

            if (Request.QueryString["item_id"] != null)
            {
                //case : Edit/update items 
                btnUpdate.Visible = true;
                btnsave.Visible = false;
                string item_id = Request.QueryString["item_id"];
                editItem(item_id);

            }





        }



        //protected void btnPreview_Click(object sender, EventArgs e)
        //{
        //    int count = 1;
        //    //Validate file type 
        //    //if (!Page.IsValid)
        //    //{
        //    //    lbOutput.Text = "Invalid file type ! ";
        //    //}

        //    foreach (HttpPostedFile p in FileUpload1.PostedFiles)
        //    {
        //        if (count > 4)
        //        {
        //            break;
        //        }
        //        p.SaveAs(MapPath("~/assets/data_img_temp/" + "img" + count + ".jpg"));
        //        count += 1;

        //    }

        //}

        protected void btnsave_Click(object sender, EventArgs e)
        {
            List<string> imageDelete = (List<string>)Session["imageDelete"];
            List<string> categoryCode = new List<string>();
            categoryCode.Add(DropDownList1.SelectedValue);
            categoryCode.Add(DropDownList2.SelectedValue);
            categoryCode.Add(DropDownList3.SelectedValue);
            categoryCode.Add(DropDownList4.SelectedValue);
            categoryCode.Add(DropDownList5.SelectedValue);

            string itemNameVi = txtItemNameVi.Text;
            string itemNameEn = txtItemNameEn.Text;
            string descriptionVi = txtDescriptionVi.Text;
            string descriptionEn = txtDescriptionEn.Text;


            List<String> img = new List<string>();
            Item item = new Item(categoryCode, itemNameVi, itemNameEn, descriptionVi, descriptionEn, img);
            string ID = "";
            string Code = "";
            User user = (User)Session["user"];
            string UserID = user.getUserId();
            item.GenCode("Item", UserID, out ID, out Code);
            item.setItemCode(Code);

            item.insertItem(item);
            getFileUpload(item.getItemCode());
            Response.Redirect("admin_items.aspx");


        }

        protected void btnCreateItem_Click(object sender, EventArgs e)
        {

        }

        public void loadCategory()
        {
            string constr = ClsCommons.connectionStr;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sQuery = @"Select * From item_category";

                using (SqlCommand cmd = new SqlCommand(sQuery))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;

                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            DropDownList1.DataSource = dt;
                            DropDownList1.DataBind();
                            DropDownList1.Items.Insert(0, new ListItem(String.Empty, "0"));

                            DropDownList2.DataSource = dt;
                            DropDownList2.Items.Insert(0, new ListItem(String.Empty, "0"));

                            DropDownList3.DataSource = dt;
                            DropDownList3.Items.Insert(0, new ListItem(String.Empty, "0"));

                            DropDownList4.DataSource = dt;
                            DropDownList4.Items.Insert(0, new ListItem(String.Empty, "0"));

                            DropDownList5.DataSource = dt;
                            DropDownList5.Items.Insert(0, new ListItem(String.Empty, "0"));

                        }

                    }
                }
            }
        }


        public void editItem(string item_id)
        {
            Item item = new Item().loadINFOByID(item_id);

            List<string> category = item.getCategory();
            txtItemNameVi.Text = item.getNameVi();
            txtItemNameEn.Text = item.getNameEn();
            txtDescriptionVi.Text = item.getDescriptionVi();
            txtDescriptionVi.Text = item.getDescriptionEn();

            try
            {
                DropDownList1.SelectedValue = item.getCategory()[0];
            }
            catch (Exception e)
            {
                log.Error(e);
            }
            try
            {
                DropDownList2.SelectedValue = item.getCategory()[1];
            }
            catch (Exception e)
            {
                log.Error(e);
            }
            try
            {
                DropDownList3.SelectedValue = item.getCategory()[2];
            }
            catch (Exception e)
            {
                log.Error(e);
            }
            try
            {
                DropDownList4.SelectedValue = item.getCategory()[3];
            }
            catch (Exception e)
            {
                log.Error(e);
            }
            try
            {
                DropDownList5.SelectedValue = item.getCategory()[4];
            }
            catch (Exception e)
            {
                log.Error(e);
            }







        }



        public void getFileUpload(string item_code)
        {
            Item item = new Item().loadINFOByCode(item_code);
            string query = "[insertImage]";
            string filepath = Server.MapPath(@"/images/uploads/");
            HttpFileCollection uploadedFiles = Request.Files;
            if (uploadedFiles.Count > 1)
            {
                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];

                    try
                    {
                        if (userPostedFile.ContentLength > 0)
                        {
                            string b = Path.GetFileName(userPostedFile.FileName);
                            string type = Path.GetFileName(userPostedFile.FileName).Substring(Path.GetFileName(userPostedFile.FileName).Length - 4);
                            string path = filepath + "\\" + item.getItemCode() + "_" + i + ".png";
                            userPostedFile.SaveAs(path);


                            using (SqlConnection conn = new SqlConnection(ClsCommons.connectionStr))
                            {
                                SqlCommand cmd = new SqlCommand(query, conn);
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.AddWithValue("@item_id", item.getItemID());
                                cmd.Parameters.AddWithValue("@image_code", item.getItemCode());
                                cmd.Parameters.AddWithValue("@image_type", type);
                                cmd.Parameters.AddWithValue("@image_size", userPostedFile.ContentLength);
                                cmd.Parameters.AddWithValue("@image_address", "/images/uploads/" + item.getItemCode() + "_" + i + ".png");
                                cmd.Parameters.AddWithValue("@date_time", DateTime.Now);

                                conn.Open();
                                int result = Convert.ToInt32(cmd.ExecuteScalar());
                                conn.Close();
                            }
                        }
                        
                    }
                    catch (Exception ex)
                    {
                        log.Error(ex.Message);

                    }
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(ClsCommons.connectionStr))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@item_id", item.getItemID());
                    cmd.Parameters.AddWithValue("@image_code", item.getItemCode());
                    cmd.Parameters.AddWithValue("@image_type", "PNG");
                    cmd.Parameters.AddWithValue("@image_size", 1024);
                    cmd.Parameters.AddWithValue("@image_address", "/assets/pages/img/index-sliders/slide1.jpg");
                    cmd.Parameters.AddWithValue("@date_time", DateTime.Now);

                    conn.Open();
                    int result = Convert.ToInt32(cmd.ExecuteScalar());
                    conn.Close();
                }


            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_items.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["item_id"] != null)
            {

                String item_id = Request.QueryString["item_id"];
                Item item = new Item().loadINFOByID(item_id);
                List<String> categoryCode = new List<string>();
                categoryCode.Add(DropDownList1.SelectedValue);
                categoryCode.Add(DropDownList2.SelectedValue);
                categoryCode.Add(DropDownList3.SelectedValue);
                categoryCode.Add(DropDownList4.SelectedValue);
                categoryCode.Add(DropDownList5.SelectedValue);

                item.setItemName(txtItemNameVi.Text);
                item.setItemNameEn(txtItemNameEn.Text);
                item.setItemDescription(txtDescriptionVi.Text);
                item.setItemDescriptionEn(txtDescriptionEn.Text);
                item.setCategory(categoryCode);

                // UPDATE ITEM ! 
                new Item().updateItem(item);
                getFileUpload(item.getItemCode()); // Update images

            }

            // DELETE IMAGES IF EXISTS ANY REQUEST
            string hiddens = hidden.Value.Trim();
            if (hiddens != null && hiddens.Length > 0)
            {
                /* store using for delete image */
                string storeProc2 = "[usp_InsertUpdateitem_image]";

                //split method for split each element in source list hidden 
                Char delimiter = ' ';
                String[] substrings = hiddens.Split(delimiter);
                foreach (var substring in substrings)
                {
                    string tes = substring;

                    using (SqlConnection conn = new SqlConnection(ClsCommons.connectionStr))
                    {
                        SqlCommand cmd = new SqlCommand(storeProc2, conn);
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@item_address", substring);
                        conn.Open();
                        cmd.ExecuteScalar();
                        conn.Close();
                    }

                }
            }
        }
    }
}