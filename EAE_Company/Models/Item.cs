using System;
using System.Collections.Generic;
using System.Data;
using log4net;
using Microsoft.ApplicationBlocks.Data;
using EAE_Company.Commons;

namespace EAE_Company.Models
{
    public class Item
    {

        // LANGUAGE FLAG : en-US - English 
        //                 vi - VietNamese
        string LANGUAGE = "vi";
        //Declare an instance for log4net
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        string itemCode { get; set; }
        string itemNameVi { get; set; }
        string itemDescriptionVi { get; set; }
        string itemDescription { get; set; }
        string itemName { get; set; }
        List<string> imageList { get; set; }


        public Item()
        {

        }
        public Item(string code, string nameVi, string name, string desVi, string des, List<string> imgs)
        {
            this.itemCode = code;
            this.itemName = name;
            this.itemNameVi = nameVi;
            this.itemDescription = des;
            this.itemDescriptionVi = desVi;
            this.imageList = imgs;
        }
        // GET  ITEMS  
        // 0 - New Arrival
        // 3 - Three Items
        // 2 - Two Items
        public List<Item> getItems(int item_group)
        {
            List<Item> listItem = new List<Item>();
            string sQuery = "";
            try
            {
                sQuery = @" SELECT i.ID , i.Item_Code, i.Item_Name_Vi, i.Item_Name_Eng, 
                            i.Item_Description_Vi , i.Item_Description_Eng, img.Image_URL from item i 
                            left join images img on 
                            img.Item_ID = i.ID 
							where i.Is_Active ='1' and Item_Group={0}";

                sQuery = string.Format(sQuery, item_group);
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
                        item.itemCode = r["ID"].ToString();
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

        // UPDATE LANGUAGE 
        public void setLanguage(string language)
        {
            this.LANGUAGE = language;
        }

        public string getName()
        {
            if (LANGUAGE.Equals("en-US"))
            {
                return this.itemName;
            }

            return this.itemNameVi;
        }
        public string getItemCode()
        {
            return this.itemCode;
        }
        // GET FIRST IMAGE OF LIST IMAGE
        public string getFirstImage()
        {
            string a = this.imageList[0].ToString();
            return this.imageList[0].ToString().Trim();
        }

        // GET DESCRIPTION OF ITEM
        public string getDescription()
        {
            if (LANGUAGE.Equals("en-US"))
            {
                return this.itemDescription;
            }

            return this.itemDescriptionVi;
        }


        public List<String> getImageList()
        {
            return this.imageList;
        }
        public Item loadINFOByCode(string itemID)
        {
            Item item = new Item();
            string sQuery = "";
            try
            {
                sQuery = @"SELECT * FROM item 
                WHERE  
                ID ={0} ";
                sQuery = string.Format(sQuery, itemID);
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        item.itemNameVi = r["Item_Name_Vi"].ToString().Trim();
                        item.itemName = r["Item_Name_Eng"].ToString().Trim();
                        item.itemDescription = r["Item_Description_Eng"].ToString().Trim();
                        item.itemDescriptionVi = r["Item_Description_Vi"].ToString().Trim();
                        item.itemCode = r["Item_Code"].ToString().Trim();
                        item.imageList = getImgSrouce(itemID);
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
                sQuery = @"SELECT * FROM images WHERE Item_ID ='{0}' AND is_Active = '1';  ";
                sQuery = string.Format(sQuery, itemID);
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        li.Add(r["Image_URL"].ToString().Trim());
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
    }
}