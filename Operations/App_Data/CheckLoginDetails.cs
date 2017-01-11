using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;


namespace Operations
{
    public class CheckLoginDetails
    {


        SqlConnection sqlcon;
        SqlCommand sqlcmd;
        SqlDataAdapter sqlad;
        DataSet ds;


        // DateTimeFormatInfo ukDtfi = new CultureInfo("en-GB", false).DateTimeFormat; //--dd/MM/yyyy 

        public string DatabaseCredientials = ConfigurationManager.ConnectionStrings["NocHandOver"].ToString();


        public Int64 ID
        {
            get;
            set;
        }
        public string FullName
        {
            get;
            set;
        }
        public string LoginUserName
        {
            get;
            set;
        }
        public string LoginPassword
        {
            get;
            set;
        }

        public string DACErrormsg
        {
            get;
            set;
        }
        public int ReportsAccess
        {
            get;
            set;
        }

        public void CheckLogin() 
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Operations.CheckLoginDetails";

                sqlcmd.Parameters.Add("@UserId", SqlDbType.VarChar,50).Value = LoginUserName ;
                sqlcmd.Parameters.Add("@UserPassword", SqlDbType.VarChar, 225).Value = LoginPassword ;
                sqlcmd.Parameters.Add("@FullName", SqlDbType.VarChar, 225).Direction=  ParameterDirection.Output;
                sqlcmd.Parameters.Add("@ID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                sqlcmd.Parameters.Add("@Reports", SqlDbType.BigInt).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                ID= Convert.ToInt64(sqlcmd.Parameters["@ID"].Value.ToString ());
                FullName = sqlcmd.Parameters["@FullName"].Value.ToString();
                ReportsAccess = Convert.ToInt32(sqlcmd.Parameters["@Reports"].Value.ToString());

            }
            catch (Exception ex)
            {
                DACErrormsg = "";

                DACErrormsg = ex.Message.ToString();
            }

            finally 
            {
            
            }
        
        }
        
    }
}