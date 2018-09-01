using System;
using System.Collections.Generic;
using System.Data;
using log4net;
using Microsoft.ApplicationBlocks.Data;
using EAE_Company.Commons;
using System.Data.SqlClient;

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

        public Category(string code, string nameVi)
        {
            this.categoryCode = code;
            this.categoryNameVi = nameVi;
        }

        public List<Category> getAllCategory()
        {
            List<Category> categoryList = new List<Category>();
            string sQuery = "";
            try
            {
                sQuery = @"SELECT [item_category_code]
                      ,[category_name]
                      ,[category_type]
                      ,[category_level]
                      FROM [item_category]
                      WHERE [is_Active] is not null";

                sQuery = string.Format(sQuery);
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    int count = 0;
                    while (count < ds.Tables[0].Rows.Count)
                    {
                        DataRow r = ds.Tables[0].Rows[count];
                        Category category = new Category();
                        category.categoryCode = r["item_category_code"].ToString().Trim();
                        category.categoryNameVi = r["category_name"].ToString().Trim();
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

        public void insertCategory()
        {
            try
            {
                string sQuery = @"INSERT INTO [dbo].[item_category]
           ([item_category_code],
           [category_name],
            [Is_Active])
            VALUES ('{0}', '{1}', '{2}' )";

                sQuery = string.Format(sQuery, this.getCategoryCode(), this.getCategoryNameVi(), '1');

                SqlConnection con = new SqlConnection(ClsCommons.connectionStr);
                SqlCommand command = new SqlCommand(sQuery, con);
                con.Open();
                command.ExecuteNonQuery();
                con.Close();
                log.Info("Insert category  " + getCategoryCode() + "success ! ");

            }
            catch (Exception ex)
            {
                log.Error("ERROR INSERT Category at : " + ex.Message);

            }
        }
    }


}