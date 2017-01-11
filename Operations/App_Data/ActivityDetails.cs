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
    public class ActivityDetails
    {
        SqlConnection sqlcon;
        SqlCommand sqlcmd;
        SqlDataAdapter sqlad;
        DataSet ds;


        // DateTimeFormatInfo ukDtfi = new CultureInfo("en-GB", false).DateTimeFormat; //--dd/MM/yyyy 

        public string DatabaseCredientials = ConfigurationManager.ConnectionStrings["NocHandOver"].ToString();



         public Int64 ActivityId 
         {
            get;
            set;
         }
        public Int64 PurposeId 
        {
            get;
            set;
        }
        public string ProviderName 
        {
            get;
            set;
        }
        public int ProviderId
        {
            get;
            set;
        }
        public string POPName  
        {
            get;
            set;
        }
        public DateTime  Date 
        {
            get;
            set;
        }
        public string ModifiedBy 
        {
            get;
            set;
        }
        public string Location 
        {
            get;
            set;
        }
        public string Comments 
        {
            get;
            set;
        }
        public decimal Voltage 
        {
            get;
            set;
        }
        public string EngineerName 
        {
            get;
            set;
        }
        public string Logintime 
        {
            get;
            set;
        }
        public string Logouttime
        {
            get;
            set;
        }
        public  decimal  BatteryLoad
        {
            get;
            set;
        }
        public string Rectifier 
        {
            get;
            set;
        }


        public string DACErrormsg
        {
            get;
            set;
        }


        public string WOTicketNumber
        {
            get;
            set;
        }

        public DataSet GetActivityControlDetails()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Operations.GetActivityControlDetails";

                sqlad = new SqlDataAdapter(sqlcmd);
                ds = new DataSet();
                sqlad.Fill(ds);



            }
            catch (Exception ex)
            {
                DACErrormsg = "";

                DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return ds;

        }



        public void InsActivityDetails()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Operations.InsActivity";
                
                
                sqlcmd.Parameters.Add("@PurposeId", SqlDbType.BigInt).Value = PurposeId ;
                sqlcmd.Parameters.Add("@ProviderId", SqlDbType.Int).Value = ProviderId;
                sqlcmd.Parameters.Add("@POPName", SqlDbType.VarChar,225).Value = POPName ;
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date ;
                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar,225).Value = ModifiedBy ;
                sqlcmd.Parameters.Add("@Location", SqlDbType.VarChar,225).Value = Location ;
                sqlcmd.Parameters.Add("@Comments", SqlDbType.VarChar,500).Value = Comments ;
                sqlcmd.Parameters.Add("@Voltage", SqlDbType.Decimal).Value =  Voltage ;
                sqlcmd.Parameters.Add("@EngineerName", SqlDbType.VarChar,225).Value = EngineerName ;
                //sqlcmd.Parameters.Add("@Logintime", SqlDbType.Time).Value = TimeSpan.Parse(Logintime );
                //sqlcmd.Parameters.Add("@Logouttime", SqlDbType.Time).Value = TimeSpan.Parse(Logouttime);
                sqlcmd.Parameters.Add("@Logintime", SqlDbType.VarChar,7).Value = Logintime;
                sqlcmd.Parameters.Add("@Logouttime", SqlDbType.VarChar,7).Value = Logouttime;
                sqlcmd.Parameters.Add("@BatteryLoad", SqlDbType.Decimal).Value = BatteryLoad;
                sqlcmd.Parameters.Add("@Rectifier", SqlDbType.Decimal).Value = Rectifier;
                sqlcmd.Parameters.Add("@WOTicketNumber", SqlDbType.NVarChar,500).Value = WOTicketNumber;

                sqlcmd.Parameters.Add("@ActivityId", SqlDbType.BigInt).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();
                
                ActivityId=Convert.ToInt64(sqlcmd.Parameters["@ActivityId"].Value.ToString ());


            }
            catch (Exception ex)
            {
                DACErrormsg = "";

                DACErrormsg = ex.Message.ToString();
            }

          

        }
    }
}