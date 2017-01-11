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
    public class InsertGenerator
    {
        SqlConnection sqlcon;
        SqlCommand sqlcmd;
        SqlDataAdapter sqlad;
        DataSet ds;
        Int64 retvalgwid;

        public string DatabaseCredientials = ConfigurationManager.ConnectionStrings["NocHandOver"].ToString();
        DateTimeFormatInfo ukDtfi = new CultureInfo("en-GB", false).DateTimeFormat;

        EntityGeneratorDetails objEntityGeneratorDetails = null;
  

        public Int64 InsGenerator(string GeneratorItems, EntityGeneratorHeader objEntityGeneratorHeader)
        {
            objEntityGeneratorDetails = new EntityGeneratorDetails();
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Operations.InsGenerator";

                sqlcmd.Parameters.Add("@SiteLocation", SqlDbType.VarChar, 225).Value = objEntityGeneratorHeader.SiteLocation;

                sqlcmd.Parameters.Add("@CarriedOutBy", SqlDbType.VarChar, 225).Value = objEntityGeneratorHeader.CarriedOutBy;
                if (objEntityGeneratorHeader.TestingStartedDate.Length > 0)
                {
                    sqlcmd.Parameters.Add("@TestingStartedDate", SqlDbType.DateTime).Value = Convert.ToDateTime(objEntityGeneratorHeader.TestingStartedDate, ukDtfi);
                }
                else
                {
                    sqlcmd.Parameters.Add("@TestingStartedDate", SqlDbType.DateTime).Value = DBNull.Value;
                }

                if (objEntityGeneratorHeader.TestingCompleDate.Length > 0)
                {
                    sqlcmd.Parameters.Add("@TestingCompleDate", SqlDbType.DateTime).Value = Convert.ToDateTime(objEntityGeneratorHeader.TestingCompleDate, ukDtfi);
                }
                else
                {
                    sqlcmd.Parameters.Add("@TestingCompleDate", SqlDbType.DateTime).Value = DBNull.Value;
                }
      
                sqlcmd.Parameters.Add("@FuelTank1", SqlDbType.Decimal).Value = objEntityGeneratorHeader.FuelTank1;
                sqlcmd.Parameters.Add("@Pump1Running", SqlDbType.Decimal).Value = objEntityGeneratorHeader.Pump1Running;
                sqlcmd.Parameters.Add("@FuelTank2", SqlDbType.Decimal).Value = objEntityGeneratorHeader.FuelTank2;
                sqlcmd.Parameters.Add("@Pump2Running", SqlDbType.Decimal).Value = objEntityGeneratorHeader.Pump2Running;
                sqlcmd.Parameters.Add("@SiteName", SqlDbType.VarChar, 225).Value = objEntityGeneratorHeader.SiteName;
                sqlcmd.Parameters.Add("@XMLDoc", SqlDbType.Xml).Value = GeneratorItems;
                sqlcmd.Parameters.Add("@GWID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                sqlcmd.Parameters.Add("@Retout", SqlDbType.Int).Direction = ParameterDirection.Output;
                
                
                sqlcmd.ExecuteNonQuery();

                Int64 partition = Convert.ToInt64(sqlcmd.Parameters["@GWID"].Value.ToString());
                retvalgwid =  Convert.ToInt64(sqlcmd.Parameters["@Retout"].Value.ToString());    

            }

            catch (Exception ex)
            {
                objEntityGeneratorDetails.ErrorMessage = ex.Message.ToString();
            }

            return retvalgwid;

        }
    }
}