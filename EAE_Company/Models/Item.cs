using System;
using System.Collections.Generic;
using System.Data;
using log4net;
using Microsoft.ApplicationBlocks.Data;
using EAE_Company.Commons;
using System.Web;
using System.Data.SqlClient;

namespace EAE_Company.Models
{
    public class Item
    {

        // LANGUAGE FLAG : en-US - English 
        //                 vi - VietNamese
        string LANGUAGE = "vi";
        //Declare an instance for log4net
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        string itemID { get; set; }
        List<string> category { get; set; }
        string itemNameVi { get; set; }
        string itemDescriptionVi { get; set; }
        string itemDescription { get; set; }
        string itemName { get; set; }
        List<string> imageList { get; set; }
        String language { get; set; }
        string itemPrice { get; set; }
        string itemGroup { get; set; }
        string itemCode { get; set; }



        public Item()
        {

        }
        public Item(List<string> category, string nameVi, string name, string desVi, string des,  List<string> imgs)
        {
            this.category = category;
            this.itemName = name;
            this.itemNameVi = nameVi;
            this.itemDescription = des;
            this.itemDescriptionVi = desVi;
            this.imageList = imgs;
        }


        public List<Item> findSimilarItems()
        {
            List<Item> listItem = new List<Item>();
            string sQuery = "";
            try
            {
                sQuery = @"  SELECT distinct  i.item_name, i.item_name_en, i.description , i.description_en , i.item_code , i.item_id  from item i 
                            left join item_images img on 
                            img.item_id = i.item_id
							where i.Is_Active ='1' and (i.category_id1 = '{0}' or i.category_id2 = '{0}' 
                            or i.category_id3 = '{0}'or i.category_id4 = '{0}' or i.category_id5 = '{0}') ";

                sQuery = string.Format(sQuery, this.category[0].ToString());
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        Item item = new Item();
                        item.itemNameVi = r["item_name"].ToString().Trim();
                        item.itemName = r["item_name_en"].ToString().Trim();
                        item.itemDescription = r["description_en"].ToString().Trim();
                        item.itemDescriptionVi = r["description"].ToString().Trim();
                        item.itemID = r["item_id"].ToString();

                        List<string> images = getImgSrouce(item.getItemID());
                        item.imageList = images;

                        listItem.Add(item);
                        count++;
                    }
                }
            }
            catch (Exception ex)
            {
                log.Error("ERROR at : " + ex);

            }
            return listItem;
        }

        // GET  ITEMS  
        // 0 - Provide Machines
        // 3 - Services
        // 2 - Maintain and Setting 
        public List<Item> getItems(int category)
        {
            List<Item> listItem = new List<Item>();
            string sQuery = "";
            try
            {
                sQuery = @"  SELECT distinct  i.item_name, i.item_name_en, i.category_id1, i.category_id2, 
                        i.category_id3, i.category_id4, i.category_id5, i.description , i.description_en ,
                        i.item_code , i.item_id  from item i 
                            left join item_images img on 
                            img.item_id = i.item_id
							where i.Is_Active ='1' and i.category_id1 = '{0}' ";

                sQuery = string.Format(sQuery, category);
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        Item item = new Item();
                        item.itemNameVi = r["item_name"].ToString().Trim();
                        item.itemName = r["item_name_en"].ToString().Trim();
                        item.itemDescription = r["description_en"].ToString().Trim();
                        item.itemDescriptionVi = r["description"].ToString().Trim();
                        item.itemID = r["item_id"].ToString();

                        List<string> images = getImgSrouce(item.getItemID());
                        List<string> categories = new List<string>();
                        categories.Add(r["category_id1"].ToString());
                        categories.Add(r["category_id2"].ToString());
                        categories.Add(r["category_id3"].ToString());
                        categories.Add(r["category_id4"].ToString());
                        categories.Add(r["category_id5"].ToString());

                        item.imageList = images;
                        item.category = categories;

                        listItem.Add(item);
                        count++;
                    }
                }
            }
            catch (Exception ex)
            {
                log.Error("ERROR at : " + ex);

            }
            return listItem;
        }



        public string getName()
        {

            this.language = HttpContext.Current.Session["language"].ToString().Trim();


            if (this.language.Equals("en-US") && null != this.language && !this.itemName.Equals("") && this.itemName != null)
            {
                return this.itemName;
            }

            return this.itemNameVi;
        }



        public string getItemGroup(int code)
        {
            string group = null;
            switch (code)
            {
                case 3:
                    group = "Services";
                    break;
                case 2:
                    group = "Provide Machines ";
                    break;
                default:
                    group = "Mantain & Setting";
                    break;
            }
            return group;

        }


        public string getNameEn()
        {
            return this.itemName;
        }

        public List<string> getCategory()
        {
            return this.category;
        }

        public string getDescriptionVi()
        {
            return this.itemDescriptionVi;
        }

        public string getDescriptionEn()
        {
            return this.itemDescription;
        }


        public string getPrice()
        {
            return this.itemPrice;
        }


        public string getItemID()
        {
            return this.itemID;
        }
        // GET FIRST IMAGE OF LIST IMAGE
        public string getFirstImage()
        {
            if (this.imageList.Count > 0)
            {
                return this.imageList[0].ToString().Trim();
            }

            return "/assets/pages/img/index-sliders/slide1.jpg";
        }

        // GET DESCRIPTION OF ITEM
        public string getDescription()
        {
            if (LANGUAGE.Equals("en-US") && this.itemDescription != null && !this.itemDescription.Equals(""))
            {
                return this.itemDescription;
            }

            return this.itemDescriptionVi;
        }


        public List<String> getImageList()
        {
            return this.imageList;
        }

        public Item loadINFOByID(string itemID)
        {
            Item item = new Item();
            string sQuery = "";
            try
            {
                sQuery = @"SELECT * FROM item 
                WHERE  
                item_id ='{0}' ";
                sQuery = string.Format(sQuery, itemID);
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        item.itemNameVi = r["item_name"].ToString().Trim();
                        item.itemName = r["item_name_en"].ToString().Trim();
                        item.itemDescription = r["description"].ToString().Trim();
                        item.itemDescriptionVi = r["description_en"].ToString().Trim();
                        item.itemID = r["item_id"].ToString().Trim();
                        item.imageList = getImgSrouce(itemID);
                        item.itemCode = r["item_code"].ToString();
                        List<string> categories = new List<string>();
                        categories.Add(r["category_id1"].ToString());
                        categories.Add(r["category_id2"].ToString());
                        categories.Add(r["category_id3"].ToString());
                        categories.Add(r["category_id4"].ToString());
                        categories.Add(r["category_id5"].ToString());
                        item.category = categories;

                        count++;
                    }
                }
            }

            catch (Exception e)
            {
                log.Error("LOADING ITEM INFO  ERROR : " + e);
            }
            return item;
        }

        public Item loadINFOByCode(string itemCode)
        {
            Item item = new Item();
            string sQuery = "";
            try
            {
                sQuery = @"SELECT * FROM item 
                WHERE  
                item_code = '{0}' ";
                sQuery = string.Format(sQuery, itemCode);
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        item.itemNameVi = r["item_name"].ToString().Trim();
                        item.itemName = r["item_name_en"].ToString().Trim();
                        item.itemDescription = r["description"].ToString().Trim();
                        item.itemDescriptionVi = r["description_en"].ToString().Trim();
                        item.itemID = r["item_id"].ToString().Trim();
                        item.imageList = getImgSrouce(itemID);
                        item.itemCode = r["item_code"].ToString();
                        List<string> categories = new List<string>();
                        categories.Add(r["category_id1"].ToString());
                        categories.Add(r["category_id2"].ToString());
                        categories.Add(r["category_id3"].ToString());
                        categories.Add(r["category_id4"].ToString());
                        categories.Add(r["category_id5"].ToString());
                        item.category = categories;

                        count++;
                    }
                }
            }

            catch (Exception e)
            {
                log.Error("LOADING ITEM INFO  ERROR : " + e);
            }
            return item;
        }


        // GET LIST IMAGES OF ITEM
        public List<string> getImgSrouce(string itemID)
        {
            List<string> li = new List<string>();
            string sQuery = "";
            try
            {
                sQuery = @"SELECT * FROM item_images WHERE item_id ='{0}' AND is_Active = '1';  ";
                sQuery = string.Format(sQuery, itemID);
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        li.Add(r["image_address"].ToString().Trim());
                        count++;
                    }
                }
            }
            catch (Exception ex)
            {
                log.Error("LOADING ITEM IMAGES ERROR :  " + ex);
            }
            return li;
        }


        // Method for search item
        public List<Item> searchItem(String text, String language)
        {
            List<Item> listItem = new List<Item>();
            string sQuery = "";
            try
            {
                if (language.Equals("en-US"))
                {
                    sQuery = @" SELECT i.ID , i.Item_Code, i.Item_Name_Vi, i.Item_Name_Eng, 
                            i.Item_Description_Vi , i.Item_Description_Eng, img.Image_URL from item i 
                            left join images img on 
                            img.Item_ID = i.ID 
							where i.Is_Active ='1' and i.Item_Name_Eng like N'%{0}%'";

                }
                else
                {
                    sQuery = @" SELECT i.ID , i.Item_Code, i.Item_Name_Vi, i.Item_Name_Eng, 
                            i.Item_Description_Vi , i.Item_Description_Eng, img.Image_URL from item i 
                            left join images img on 
                            img.Item_ID = i.ID 
							where i.Is_Active ='1' and i.Item_Name_Vi like N'%{0}%'";
                }


                sQuery = string.Format(sQuery, text);
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        Item item = new Item();
                        item.itemNameVi = r["Item_Name_Vi"].ToString().Trim();
                        item.itemName = r["Item_Name_Eng"].ToString().Trim();
                        item.itemDescription = r["Item_Description_Eng"].ToString().Trim();
                        item.itemDescriptionVi = r["Item_Description_Vi"].ToString().Trim();
                        item.itemID = r["ID"].ToString();
                        string img = r["Image_URL"].ToString().TrimEnd().TrimStart();
                        List<string> imgs = new List<string>();
                        imgs.Add(img);
                        item.imageList = imgs;

                        listItem.Add(item);
                        count++;
                    }
                }
            }
            catch (Exception ex)
            {
                log.Error("ERROR at : " + ex);

            }
            return listItem;
        }
        public string getNameVi()
        {
            return this.itemNameVi;
        }

        public void insertItem(Item item)
        {
            try
            {
                string sQuery = @" INSERT INTO [dbo].[item]
           ([item_name_en]
           ,[item_name]
           ,[category_id1]
           ,[category_id2]
           ,[category_id3]
           ,[category_id4]
           ,[category_id5]
           ,[description_en]
           ,[description]
           ,[item_code]
          )
            VALUES ('{0}', '{1}', '{2}', '{3}' , '{4}', '{5}','{6}','{7}','{8}', '{9}')";
                decimal price = 0;
                if (item.getPrice() != null)
                {
                    price = decimal.Parse(item.getPrice().Trim());
                }

                sQuery = string.Format(sQuery, item.getNameEn(), item.getNameVi(), item.getCategory()[0],
                    item.getCategory()[1], item.getCategory()[2], item.getCategory()[3], item.getCategory()[4],
                   item.getDescriptionEn(), item.getDescriptionVi() , item.getItemCode());

                SqlConnection con = new SqlConnection(ClsCommons.connectionStr);
                SqlCommand command = new SqlCommand(sQuery, con);
                con.Open();
                command.ExecuteNonQuery();
                con.Close();
                log.Info("Insert item " + item.getNameVi() + "success ! ");
             
            }
            catch (Exception ex)
            {
                log.Error("ERROR INSERT ITEM at : " + ex.Message);

            }
        }

        public  void GenCode(string CodeName, string UserID, out string ID, out string Code)
        {

            try
            {
                ID = "";
                Code = "";

                string storeProc = "usp_Sys_Gen_Code";
                using (SqlConnection conn = new SqlConnection(ClsCommons.connectionStr))
                {
                    SqlCommand cmd = new SqlCommand(storeProc, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (!string.IsNullOrEmpty(UserID))
                    {
                        SqlParameter p_CodeName = new SqlParameter("@CodeName", SqlDbType.VarChar);
                        p_CodeName.Size = 20;
                        p_CodeName.Value = CodeName;
                        p_CodeName.Direction = ParameterDirection.Input;
                        cmd.Parameters.Add(p_CodeName);


                        SqlParameter p_UserID = new SqlParameter("@UserID", SqlDbType.BigInt);
                        p_UserID.Value = UserID;
                        p_UserID.Direction = ParameterDirection.Input;
                        cmd.Parameters.Add(p_UserID);

                        SqlParameter p_Code = new SqlParameter("@Code", SqlDbType.VarChar);
                        p_Code.Size = 50;
                        p_Code.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(p_Code);

                        SqlParameter p_ID = new SqlParameter("@ID", SqlDbType.BigInt);
                        p_ID.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(p_ID);


                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        ID = cmd.Parameters["@ID"].Value.ToString();
                        Code = cmd.Parameters["@Code"].Value.ToString();



                        return;
                    }
                }
            }
            catch (Exception ex)
            {
                log.Error(ex.Message);


            }

            ID = "";
            Code = "";
        }


        public void setItemCode(string code)
        {
            this.itemCode = code;
        }
        public string getItemCode( )
        {
            return this.itemCode;
        }
    }
}