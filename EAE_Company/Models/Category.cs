using System;
using System.Collections.Generic;
using System.Data;
using log4net;
using Microsoft.ApplicationBlocks.Data;
using EAE_Company.Commons;

namespace EAE_Company.Models
{
    public class Category
    {
        string categoryCode { get; set; }
        string categoryNameVi { get; set; }
        string categoryNameEn { get; set; }
        //Declare an instance for log4net
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);


        public Category()
        {
        }

        public Category(string code, string nameVi, string nameEn)
        {
            this.categoryCode = code;
            this.categoryNameVi = nameVi;
            this.categoryNameEn = nameEn;
        }

        public List<Category> getAllCategory()
        {
            List<Category> categoryList = new List<Category>();
            string sQuery = "";
            try
            {
                sQuery = @"SELECT  [Category_Code],[Category_Name_Vi],[Category_Name_Eng]
                      FROM [DB_EAE].[dbo].[category]
                      WHERE Is_Active is not null";

                sQuery = string.Format(sQuery);
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        Category category = new Category();
                        category.categoryCode = r["Category_Code"].ToString().Trim();
                        category.categoryNameVi = r["Category_Name_Vi"].ToString().Trim();
                        category.categoryNameEn = r["Category_Name_Eng"].ToString().Trim();
                        categoryList.Add(category);
                        count++;
                    }
                }
            }
            catch (Exception ex)
            {
                log.Error("ERROR at : " + ex);

            }

            return categoryList;
        }

        public string getCategoryCode()
        {
            return this.categoryCode;
        }

        public string getCategoryNameVi()
        {
            return this.categoryNameVi;
        }

        public string getCategoryNameEn()
        { 
            return this.categoryNameEn;
        }
    }


}