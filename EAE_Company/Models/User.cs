using log4net;
using System;
using EAE_Company.Commons;
using Microsoft.ApplicationBlocks.Data;
using System.Data;


namespace EAE_Company.Models
{
    public class User
    {
        //Declare an instance for log4net
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        private string userName { get; set; }
        private string password { get; set; }
        private string role { get; set; }
        private string userId { get; set; }

        public User()
        {

        }

        public User(string user, string pwd)
        {
            this.userName = user;
            this.password = pwd;

        }


        public Boolean login()
        {
            try
            {
                string sQuery = @"SELECT *
                  FROM [user]
                  where UserName = '{0}' and PassWord = '{1}' and Is_Active is not null ";


                sQuery = string.Format(sQuery, this.userName.Trim(), this.password.Trim());
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                log.Error("Error when login " + ex);

            }
            return false;
        }

        public string getUserId()
        {
            return this.userId;
        }

        public User getUserInfo()
        {
            User user = new User();
            try
            {
                
                string sQuery = @"SELECT *
                  FROM [user]
                  where UserName = '{0}' and PassWord = '{1}' and Is_Active is not null ";


                sQuery = string.Format(sQuery, this.userName.Trim(), this.password.Trim());
                DataSet ds = SqlHelper.ExecuteDataset(ClsCommons.connectionStr, CommandType.Text, sQuery);
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow r = ds.Tables[0].Rows[0];
                        user.role = r["Role"].ToString();
                        user.userName = r["UserName"].ToString();
                        user.password = r["PassWord"].ToString();
                        user.userId = r["Row_ID"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                log.Error("Error when get user info " + ex);

            }
            return user;
        }
    }


}