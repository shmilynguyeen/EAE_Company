using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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
        // GET NEW ARRIVAL ITEMS  
        public List<Item> getNewArrivalItems()
        {
            List<Item> listItem = new List<Item>();
            string sQuery = "";
            try
            {
                sQuery = @" SELECT i.Item_Code , i.Item_Name_Vi, i.Item_Name_Eng, i.Item_Description_Vi , i.Item_Description_Eng, img.Image_URL from item i 
                           left join category c on 
                            i.ID = c.ID  
                            left join images img on 
                            img.Item_ID = i.ID ";

                sQuery = string.Format(sQuery);
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        Item item = new Item();
                        item.itemNameVi = r["Item_Name_Vi"].ToString();
                        item.itemName = r["Item_Name_Eng"].ToString();
                        item.itemDescription = r["Item_Description_Eng"].ToString();
                        item.itemDescriptionVi = r["Item_Description_Vi"].ToString();
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
        // GET FIRST IMAGE OF LIST IMAGE
        public string getFirstImage()
        {
            string a = this.imageList[0].ToString();
            return this.imageList[0].ToString().Trim();
        }
        //        public List<Item> loadByName(string name)
        //        {
        //            List<Item> listItem = new List<Item>();
        //            string sQuery = "";

        //            try
        //            {

        //                sQuery = @" SELECT * FROM item as i left join item_price as p on i.item_id = p.item_id
        //WHERE 
        //                           item_name LIKE N'%{0}%' ";






        //                sQuery = string.Format(sQuery, name);
        //                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
        //                if (ds.Tables.Count > 0)
        //                {
        //                    int count = 0;
        //                    while (count < ds.Tables[0].Rows.Count)
        //                    {
        //                        string itemName = "";
        //                        int itemID = 0;
        //                        double itemPrice = 0;

        //                        DataRow r = ds.Tables[0].Rows[count];
        //                        try
        //                        {
        //                            itemName = r["item_name"].ToString();

        //                        }
        //                        catch (Exception e)
        //                        {
        //                            itemName = "";
        //                        }
        //                        try
        //                        {
        //                            itemID = int.Parse(r["item_id"].ToString().Trim());
        //                        }
        //                        catch (Exception e)
        //                        {
        //                            itemID = 0;
        //                        }
        //                        try
        //                        {
        //                            itemPrice = double.Parse(r["giaban_sauvat"].ToString().Trim());
        //                        }
        //                        catch (Exception e)
        //                        {
        //                            itemPrice = 0;
        //                        }

        //                        try
        //                        {
        //                            USName = (r["item_name_En"].ToString().Trim());
        //                        }
        //                        catch (Exception e)
        //                        {
        //                            USName = "";
        //                        }
        //                        List<string> img = new Item().getImgSrouce(r["item_id"].ToString().Trim());

        //                        listItem.Add(new Item(itemName, itemPrice, " ", img, itemID));
        //                        count++;
        //                    }
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //            }
        //            int a = listItem.Count;




        //            return listItem;
        //        }



        //public List<string> getImgSrouce(string itemID)
        //{
        //    List<string> li = new List<string>();
        //    string sQuery = "";

        //    try
        //    {

        //        sQuery = @"SELECT * FROM item_images WHERE item_id ='{0}' AND is_Active = '1';  ";

        //        sQuery = string.Format(sQuery, itemID);
        //        DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
        //        if (ds.Tables.Count > 0)
        //        {
        //            int count = 0;
        //            while (count < ds.Tables[0].Rows.Count)
        //            {
        //                DataRow r = ds.Tables[0].Rows[count];
        //                li.Add(r["image_address"].ToString().Trim());
        //                count++;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //    }


        //    return li;

        //}
    }
}