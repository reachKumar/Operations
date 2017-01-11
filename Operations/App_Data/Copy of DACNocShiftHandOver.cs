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
    public class DACNocShiftHandOver
    {
        SqlConnection sqlcon;
        SqlCommand sqlcmd;
        SqlDataAdapter sqlad;
        
        DataSet dsGetExistingTickets, dsNewTickets, dsClosedTickets,dsProvisioningTickets,dsAccessRequest,dsOutofHoursVisit;
        DataSet dsAlarmDetails, dsCustomerServiceRequests, dsCallDetails;

        Int64 retvalgwid;

        public string DatabaseCredientials = ConfigurationManager.ConnectionStrings["NocHandOver"].ToString();

        public string NoticeBoardDesc { get; set; }

        public string OPSGroupName
        {
            get;
            set;
        }
        public DateTime Date
        {
            get;
            set;
        }

        public decimal Critical
        {
            get;
            set;
        }

        public decimal Major
        {

            get;
            set;
        }

        public decimal Minor
        {
            get;
            set;
        }

        public int TID
        {
            get;
            set;

        }

        public int IncidentNumber
        {
            get;
            set;

        }

        public int ID
        {
            get;
            set;

        }

        public int RID
        {
            get;
            set;
        }

        public string Site
        {
            get;
            set;
        }
        public string NocCallDescription
        {
            get;
            set;
        }
        public string EmergencyNumber
        {
            get;
            set;
        }
        public string CompanyName
        {
            get;
            set;
        }

        public DateTime DateIn
        {
            get;
            set;
        }
        public DateTime DateOut
        {
            get;
            set;
        }

        public string WO
        {
            get;
            set;
        }
        public string DescriptionofWork
        {
            get;
            set;
        }
        public string Platformname
        {
            get;
            set;
        }
        public string FirstEscalation
        {
            get;
            set;
        }
        public string SecondEscalation
        {
            get;
            set;
        }
        public string ThirdEscalation
        {
            get;
            set;
        }
        public string ModifiedBy
        {
            get;
            set;
        }

        public string NOCCallList
        {
            get;
            set;
        }
        public string DepartmentName
        {
            get;
            set;
        }
        public string Contacts
        {
            get;
            set;
        }
        public string Status
        {
            get;
            set;
        }
        public string CustomerName
        {
            get;
            set;
        }
        public string ReportTO
        {
            get;
            set;
        }

        public string AlarmName
        {
            get;
            set;
        }

        public string NextAction
        {
            get;
            set;
        }

        public string CreatedBy
        {
            get;
            set;
        }

        public string MethodName
        {
            get;
            set;
        } 


        //to display error msg

        public string DACErrormsg { get; set; }
 
        //GetExistingTickets
        public DataSet GetExistingTickets()                
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_ExistingTickets"; // SSRS_Ops_ExistingTickets
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsGetExistingTickets = new DataSet();
                sqlad.Fill(dsGetExistingTickets);



            }
            catch (Exception ex)
            {
                DACErrormsg = "";

                DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsGetExistingTickets;
        }

        //Search on Opsgroup, Incident Number for Existing Tickets
        public DataSet SearchExistingTickets()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_ExistingTickets";
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;
                sqlcmd.Parameters.Add("@IncidentNumber", SqlDbType.BigInt).Value = IncidentNumber;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsGetExistingTickets = new DataSet();
                sqlad.Fill(dsGetExistingTickets);



            }
            catch (Exception ex)
            {
                DACErrormsg = "";

                DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsGetExistingTickets;
        }

        //Insert Next Action for all tickets
        public void InsertNextAction()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsInsertTicketsNextAction";

                sqlcmd.Parameters.Add("@IncidentNumber", SqlDbType.BigInt).Value = IncidentNumber;
                sqlcmd.Parameters.Add("@NextAction", SqlDbType.VarChar, 500).Value = NextAction;
                sqlcmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar, 500).Value = CreatedBy;
                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar, 500).Value = ModifiedBy;
                sqlcmd.Parameters.Add("@MethodName", SqlDbType.VarChar, 500).Value = MethodName;


                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //New Tickets
        public DataSet GetNewTickets()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_NewTickets"; // SSRS_Ops_NewTickets
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsNewTickets = new DataSet();
                sqlad.Fill(dsNewTickets);



            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsNewTickets;
        }

        //Search on OpsGroup, Incident Number for new Tickets
        public DataSet SearchNewTickets()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_NewTickets";
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;
                sqlcmd.Parameters.Add("@IncidentNumber", SqlDbType.BigInt).Value = IncidentNumber;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsGetExistingTickets = new DataSet();
                sqlad.Fill(dsGetExistingTickets);



            }
            catch (Exception ex)
            {
                DACErrormsg = "";

                DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsGetExistingTickets;
        }

        //Closed Tickets
        public DataSet GetClosedTickets()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_ClosedTickets"; // SSRS_Ops_ClosedTickets
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsClosedTickets = new DataSet();
                sqlad.Fill(dsClosedTickets);



            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsClosedTickets;
        }

        //Search on OpsGroup, Incident Number for close Tickets     //Search_Ops_ProvisioningTickets
        public DataSet SearchCloseTickets()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_ClosedTickets";
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;
                sqlcmd.Parameters.Add("@IncidentNumber", SqlDbType.BigInt).Value = IncidentNumber;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsGetExistingTickets = new DataSet();
                sqlad.Fill(dsGetExistingTickets);



            }
            catch (Exception ex)
            {
                DACErrormsg = "";

                DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsGetExistingTickets;
        }

        //Provisioning Tickets
        public DataSet GetProvisioningTickets()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_ProvisioningTickets"; //Search_Ops_ProvisioningTickets SSRS_Ops_ProvisioningTickets
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsProvisioningTickets = new DataSet();
                sqlad.Fill(dsProvisioningTickets);



            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsProvisioningTickets;
        }

        //Search on OpsGroup, Incident Number for Provisioning Tickets  
        public DataSet SearchProvisioningTickets()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_ProvisioningTickets";
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;
                sqlcmd.Parameters.Add("@IncidentNumber", SqlDbType.BigInt).Value = IncidentNumber;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsGetExistingTickets = new DataSet();
                sqlad.Fill(dsGetExistingTickets);



            }
            catch (Exception ex)
            {
                DACErrormsg = "";

                DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsGetExistingTickets;
        }

        //Access Request
        public DataSet GetAccessRequest()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_AccessRequest"; //Search_Ops_AccessRequest SSRS_Ops_AccessRequestTickets
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsAccessRequest = new DataSet();
                sqlad.Fill(dsAccessRequest);



            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsAccessRequest;
        }

        //Search on OpsGroup, Incident Number for Access Request Tickets  
        public DataSet SearchAccessRequest()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_AccessRequest";
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;
                sqlcmd.Parameters.Add("@IncidentNumber", SqlDbType.BigInt).Value = IncidentNumber;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsGetExistingTickets = new DataSet();
                sqlad.Fill(dsGetExistingTickets);



            }
            catch (Exception ex)
            {
                DACErrormsg = "";

                DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsGetExistingTickets;
        }

        //OutofHoursVisit
        public DataSet GetOutofHoursVisit()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_OutofHoursVisit";  //  SSRS_Ops_OutofHoursVisit
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsOutofHoursVisit = new DataSet();
                sqlad.Fill(dsOutofHoursVisit);



            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsOutofHoursVisit;
        }

        //InsertOutOfHoursVisit
        public void InsertOutofHoursVisit()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "InsOutofHoursVisit";

                

                sqlcmd.Parameters.Add("@Site", SqlDbType.VarChar,500).Value = Site;
                sqlcmd.Parameters.Add("@CompanyName", SqlDbType.VarChar, 500).Value = CompanyName;
                sqlcmd.Parameters.Add("@WO", SqlDbType.VarChar, 500).Value = WO;
                sqlcmd.Parameters.Add("@DescriptionofWork", SqlDbType.VarChar, 500).Value = DescriptionofWork;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.VarChar, 500).Value = OPSGroupName;
                sqlcmd.Parameters.Add("@InDateTime", SqlDbType.DateTime).Value = DateIn;
                sqlcmd.Parameters.Add("@OutDateTime", SqlDbType.DateTime).Value = DateOut;
                
                
                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //UpdateOutOfHoursVisit
        public void UpdateOutofHoursVisit()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsUpdateOutofHours";


                sqlcmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
                sqlcmd.Parameters.Add("@Site", SqlDbType.VarChar, 500).Value = Site;
                sqlcmd.Parameters.Add("@CompanyName", SqlDbType.VarChar, 500).Value = CompanyName;
                sqlcmd.Parameters.Add("@WO", SqlDbType.VarChar, 500).Value = WO;
                sqlcmd.Parameters.Add("@DescriptionofWork", SqlDbType.VarChar, 500).Value = DescriptionofWork;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.VarChar, 500).Value = OPSGroupName;
                sqlcmd.Parameters.Add("@InDateTime", SqlDbType.DateTime).Value = DateIn;
                sqlcmd.Parameters.Add("@OutDateTime", SqlDbType.DateTime).Value = DateOut;
                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar, 500).Value = ModifiedBy;


                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //DeleteOutOfHoursVisit
        public void DeleteOutofHoursVisit()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsDeleteOutOfHours";


                sqlcmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar, 500).Value = ModifiedBy;
                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //GetAlarmDetails
        public DataSet GetAlarmDetails()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_AlarmDetails"; // SSRS_Ops_AlarmDetails
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsAlarmDetails = new DataSet();
                sqlad.Fill(dsAlarmDetails);



            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsAlarmDetails;
        }

        //InsertPFEDetails
        public void InsertPFEDetails()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "UPDAlarmDetails";

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;
                sqlcmd.Parameters.Add("@AlarmName", SqlDbType.Decimal).Value = AlarmName;
                sqlcmd.Parameters.Add("@Critical", SqlDbType.Decimal).Value = Critical;
                sqlcmd.Parameters.Add("@Major", SqlDbType.Decimal).Value = Major;
                sqlcmd.Parameters.Add("@Minor", SqlDbType.Decimal).Value = Minor;
                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar,  255 ).Value = ModifiedBy;
                sqlcmd.Parameters.Add("@Platform", SqlDbType.NVarChar, 255).Value = Platformname;
                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //DeletePFE/AlarmDetails
        public void DeleteAlarmDetails()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsDeleteAlarm";

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;

                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 500).Value = ModifiedBy;

                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //Customer Access Request
        public DataSet GeCustomerServiceRequest()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_CustomerServiceRequest"; // SSRS_Ops_CustomerServiceRequests
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsCustomerServiceRequests = new DataSet();
                sqlad.Fill(dsCustomerServiceRequests);



            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsCustomerServiceRequests;
        }

        //Search on OpsGroup, Incident Number for Customer Access Request  
        public DataSet SearchCustomerServiceRequest()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_CustomerServiceRequest";
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;
                sqlcmd.Parameters.Add("@IncidentNumber", SqlDbType.BigInt).Value = IncidentNumber;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsGetExistingTickets = new DataSet();
                sqlad.Fill(dsGetExistingTickets);



            }
            catch (Exception ex)
            {
                DACErrormsg = "";

                DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsGetExistingTickets;
        }

        //Get Call List
        public DataSet GetCallListDetails()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_CallDetails"; // SSRS_Ops_CallDetails
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsCallDetails = new DataSet();
                sqlad.Fill(dsCallDetails);

            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsCallDetails;
        }

        //Insert/Update Call list Details
        public void InsertCallListDetails()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "UpdCallListDetails";

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;

                sqlcmd.Parameters.Add("@NOCCallList", SqlDbType.NVarChar, 500).Value = NOCCallList;

                sqlcmd.Parameters.Add("@Description", SqlDbType.NVarChar, 500).Value = NocCallDescription;

                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 500).Value = ModifiedBy;
                
                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //Delete Call List
        public void DeleteCallList()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsDeleteCallList";

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;

                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 500).Value = ModifiedBy;

                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //InsertNoticeBoardDetails
        public void InsertNoticeBoardDetails()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "UpdNoticeBoardDetails";

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;

                sqlcmd.Parameters.Add("@NoticeBoardDesc", SqlDbType.NVarChar, 500).Value = NoticeBoardDesc;

                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //Get Platform List
        public DataSet GetPlatformDetails()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "Search_Ops_PlatformDetails"; // OperationPlatformDetails
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsCallDetails = new DataSet();
                sqlad.Fill(dsCallDetails);



            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsCallDetails;
        }

        //Insert /Update PlatformDetails
        public void InsertPlatformDetails()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsInsertPlatformDetails";

                sqlcmd.Parameters.Add("@Platformname", SqlDbType.NVarChar, 500).Value = Platformname;

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;

                sqlcmd.Parameters.Add("@FirstEscalation", SqlDbType.NVarChar, 500).Value = FirstEscalation;

                sqlcmd.Parameters.Add("@SecondEscalation", SqlDbType.NVarChar, 500).Value = SecondEscalation;

                sqlcmd.Parameters.Add("@ThirdEscalation", SqlDbType.NVarChar, 500).Value = ThirdEscalation;

                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 500).Value = ModifiedBy;

                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //Delete Platform Details
        public void DeletePlatformDetails()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsDeletePlatform";

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;

                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 500).Value = ModifiedBy;

                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //Get Department Details
        public DataSet GetDepartmentDetails()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsShowDepartmentDetails";
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsCallDetails = new DataSet();
                sqlad.Fill(dsCallDetails);

            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsCallDetails;
        }

        // Insert/Udpate Department Details
        public void InsertDepartmentDetails()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsUpdateDeptDetails";

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;

                sqlcmd.Parameters.Add("@DepartmentName", SqlDbType.NVarChar, 500).Value = DepartmentName;

                sqlcmd.Parameters.Add("@Contacts", SqlDbType.NVarChar, 500).Value = Contacts;

                sqlcmd.Parameters.Add("@EmergencyContact", SqlDbType.NVarChar, 500).Value = EmergencyNumber;

                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 500).Value = ModifiedBy;

                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //delete Department Details
        public void DeleteDepartmentDetails()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsDeleteDeptDetails";

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;

                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 500).Value = ModifiedBy;

                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //Get CustomerReportDetails
        public DataSet GetCustomerReportDetails()
        {
            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsShowCustReportTodetails";
                sqlcmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = Date;
                sqlcmd.Parameters.Add("@OpsGroup", SqlDbType.NVarChar, 225).Value = OPSGroupName;

                sqlad = new SqlDataAdapter(sqlcmd);
                dsCallDetails = new DataSet();
                sqlad.Fill(dsCallDetails);

            }
            catch (Exception ex)
            {
                // DACErrormsg = "";

                // DACErrormsg = ex.Message.ToString();
            }

            finally
            {

            }

            return dsCallDetails;
        }

        // Insert/Udpate CustomerReport Details
        public void InsertCustomerReportDetails()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsUpdateCustDetails";

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;

                sqlcmd.Parameters.Add("@CustomerName", SqlDbType.NVarChar, 500).Value = CustomerName;

                sqlcmd.Parameters.Add("@ReportTo", SqlDbType.NVarChar, 500).Value = ReportTO;

                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 500).Value = ModifiedBy;

                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        //delete CustomerReportDetails
        public void DeleteCustomerReportDetails()
        {

            try
            {
                sqlcon = new SqlConnection(DatabaseCredientials);
                sqlcon.Open();

                sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "OperationsDeleteCustDetails";

                sqlcmd.Parameters.Add("@TID", SqlDbType.Int).Value = TID;

                sqlcmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 500).Value = ModifiedBy;

                sqlcmd.Parameters.Add("@RID", SqlDbType.Int).Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();

                RID = Convert.ToInt32(sqlcmd.Parameters["@RID"].Value.ToString());

            }

            catch (Exception ex)
            {
                //DACErrorMsg = "";
                //DACErrorMsg = ex.Message.ToString();
            }


        }

        
    }

}