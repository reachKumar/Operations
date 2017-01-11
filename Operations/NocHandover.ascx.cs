using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Globalization;
using System.Text.RegularExpressions;
using System.IO;
using System.Net.NetworkInformation;
using System.Text;
using System.Configuration;
using System.Web.Services;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;


namespace Operations
{
    public partial class NocHandover : System.Web.UI.UserControl
    {

       // string conITSM = ConfigurationManager.ConnectionStrings["conITSM"].ToString();

        public static string NocHandOver = ConfigurationManager.ConnectionStrings["NocHandOver"].ToString();

        DateTimeFormatInfo ukDtfi = new CultureInfo("en-GB", false).DateTimeFormat; //--dd/MM/yyyy 

        DataSet dsGetExistingTickets, dsNewTickets, dsClosedTickets, dsProvisioningTickets, dsSearchCloseTickets, dsSearchProvisioningTickets, dsSearchAccessRequest, dsSearchCustomerServiceRequests;
        DataSet dsAccessRequest, dsOutofHoursVisit, dsAlarmDetails, dsCustomerServiceRequests, dsCallDetails, dsDepartmentDetails, dsCustomerReportTo, dsPlatformDetails, dsSearchExistingTickets, dsSearchNewTickets;

        DACNocShiftHandOver objNocShiftHandOver;

        string UploadPath = @"\XmlFile\";

        protected void Page_Load(object sender, EventArgs e)
        {
    
            if(!IsPostBack )
            {
               
                Lod();
                lbllastrefeshtime.Text = "Last Refresh Time : " + DateTime.Now.ToString();
                NOCONCALLList.Visible = false;
                showhide.Visible = false;
                imgoncallhidediv.Visible = false;
                NOtickets.Visible = false;
                Tickets.Visible = false;
           
            }
            

        }

        public void pageIdentity()
        {
            string pageName = this.Page.ToString().Substring(4, this.Page.ToString().Substring(4).Length - 5) + ".aspx";
            if (pageName == "noccalllist.aspx")
            {

                NOCONCALLList.Visible = true;
                showhide.Visible = false;
                imgoncallhidediv.Visible = false;
                NOtickets.Visible = false;
                Tickets.Visible = false;
           
            }
            else if (pageName == "shifthandover.aspx")
            {
            
                Tickets.Visible = true;
                NOCONCALLList.Visible = false;
                showhide.Visible = true;
                imgoncallhidediv.Visible = false;
                imgoncallhowdiv.Visible = true;
                NOtickets.Visible = false;
                
             
                
            }
        }


        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            pageIdentity();
            Lod();
                
        }


        public void Lod()
        {
            try
            {
                lblerrormsg.Text = "";


                DACNocShiftHandOver objNocShiftHandOver = new DACNocShiftHandOver();

                //Parameters Passing
                objNocShiftHandOver.Date = Convert.ToDateTime(DateTime.Now, ukDtfi);


                objNocShiftHandOver.IncidentNumber = 0;

                try
                {
                    objNocShiftHandOver.Date = Convert.ToDateTime(DateTime.Now, ukDtfi);

                    if (RadioButtonList1.SelectedItem.Value != "")
                    {
                        objNocShiftHandOver.OPSGroupName = RadioButtonList1.SelectedItem.Value.ToString();
                        //Tickets.Visible = true;
                    }
                }
                catch (Exception tttt)
                {
                    objNocShiftHandOver.OPSGroupName = "ALL";
                    
                }


               
                //Calling the Methods

                //Existing Tickets    GetExistingTickets

                dsGetExistingTickets = new DataSet();
                dsGetExistingTickets = objNocShiftHandOver.SearchExistingTickets();

                if (dsGetExistingTickets.Tables[0].Rows.Count == 0)
                {

                    lblexistingtickets.Text = "";
                    dsGetExistingTickets.Tables[0].Rows.Add(dsGetExistingTickets.Tables[0].NewRow());
                    GVExistingTickets.DataSource = dsGetExistingTickets;
                    GVExistingTickets.DataBind();
                    int columncount = GVExistingTickets.Rows[0].Cells.Count;
                    GVExistingTickets.Rows[0].Cells.Clear();
                    GVExistingTickets.Rows[0].Cells.Add(new TableCell());
                    GVExistingTickets.Rows[0].Cells[0].ColumnSpan = columncount;
                    GVExistingTickets.Rows[0].Cells[0].Text = " ";
                }

                else if (dsGetExistingTickets.Tables[0].Rows.Count > 0)
                {
                    GVExistingTickets.DataSource = dsGetExistingTickets;
                    GVExistingTickets.DataBind();

                }

                //New Tickets    GetNewTickets
                 
                dsNewTickets = new DataSet();
                dsNewTickets = objNocShiftHandOver.SearchNewTickets();

                if (dsNewTickets.Tables[0].Rows.Count == 0)
                {

                    dsNewTickets.Tables[0].Rows.Add(dsNewTickets.Tables[0].NewRow());
                    GVNewTickets.DataSource = dsNewTickets;
                    GVNewTickets.DataBind();
                    int columncount = GVNewTickets.Rows[0].Cells.Count;
                    GVNewTickets.Rows[0].Cells.Clear();
                    GVNewTickets.Rows[0].Cells.Add(new TableCell());
                    GVNewTickets.Rows[0].Cells[0].ColumnSpan = columncount;
                    GVNewTickets.Rows[0].Cells[0].Text = " ";
                }
                else if (dsNewTickets.Tables[0].Rows.Count > 0)
                {
                    GVNewTickets.DataSource = dsNewTickets;
                    GVNewTickets.DataBind();

                }


                //Closed Tickets    GetClosedTickets

                dsClosedTickets = new DataSet();
                dsClosedTickets = objNocShiftHandOver.SearchCloseTickets();

                if (dsClosedTickets.Tables[0].Rows.Count == 0)
                {
                    dsClosedTickets.Tables[0].Rows.Add(dsClosedTickets.Tables[0].NewRow());
                    GVClosedTickets.DataSource = dsClosedTickets;
                    GVClosedTickets.DataBind();
                    int columncount = GVClosedTickets.Rows[0].Cells.Count;
                    GVClosedTickets.Rows[0].Cells.Clear();
                    GVClosedTickets.Rows[0].Cells.Add(new TableCell());
                    GVClosedTickets.Rows[0].Cells[0].ColumnSpan = columncount;
                    GVClosedTickets.Rows[0].Cells[0].Text = " ";
                }
                else if (dsClosedTickets.Tables[0].Rows.Count > 0)
                {
                    GVClosedTickets.DataSource = dsClosedTickets;
                    GVClosedTickets.DataBind();
                }


                //Provisioning Tickets    GetProvisioningTickets
                 
                dsProvisioningTickets = new DataSet();
                dsProvisioningTickets = objNocShiftHandOver.SearchProvisioningTickets();

                if (dsProvisioningTickets.Tables[0].Rows.Count == 0)
                {
                    dsProvisioningTickets.Tables[0].Rows.Add(dsProvisioningTickets.Tables[0].NewRow());
                    GVProvisioningTickets.DataSource = dsProvisioningTickets;
                    GVProvisioningTickets.DataBind();
                    int columncount = GVProvisioningTickets.Rows[0].Cells.Count;
                    GVProvisioningTickets.Rows[0].Cells.Clear();
                    GVProvisioningTickets.Rows[0].Cells.Add(new TableCell());
                    GVProvisioningTickets.Rows[0].Cells[0].ColumnSpan = columncount;
                    GVProvisioningTickets.Rows[0].Cells[0].Text = " ";

                }

                else if (dsProvisioningTickets.Tables[0].Rows.Count > 0)
                {
                    GVProvisioningTickets.DataSource = dsProvisioningTickets;
                    GVProvisioningTickets.DataBind();
                }


                //Access Request  GetAccessRequest

                dsAccessRequest = new DataSet();

                dsAccessRequest = objNocShiftHandOver.SearchAccessRequest();

                if (dsAccessRequest.Tables[0].Rows.Count == 0)
                {

                    dsAccessRequest.Tables[0].Rows.Add(dsAccessRequest.Tables[0].NewRow());
                    GVAccessRequest.DataSource = dsAccessRequest;
                    GVAccessRequest.DataBind();
                    int columncount = GVAccessRequest.Rows[0].Cells.Count;
                    GVAccessRequest.Rows[0].Cells.Clear();
                    GVAccessRequest.Rows[0].Cells.Add(new TableCell());
                    GVAccessRequest.Rows[0].Cells[0].ColumnSpan = columncount;
                    GVAccessRequest.Rows[0].Cells[0].Text = " ";

                }

                else if (dsAccessRequest.Tables[0].Rows.Count > 0)
                {

                    GVAccessRequest.DataSource = dsAccessRequest;
                    GVAccessRequest.DataBind();
                }

                //Out of Hours Visit

                dsOutofHoursVisit = new DataSet();

                dsOutofHoursVisit = objNocShiftHandOver.GetOutofHoursVisit();

                if (dsOutofHoursVisit.Tables[0].Rows.Count == 0)
                {

                    dsOutofHoursVisit.Tables[0].Rows.Add(dsOutofHoursVisit.Tables[0].NewRow());
                    GVoutofHoursVisit.DataSource = dsOutofHoursVisit;
                    GVoutofHoursVisit.DataBind();
                    int columncount = GVoutofHoursVisit.Rows[0].Cells.Count;
                    GVoutofHoursVisit.Rows[0].Cells.Clear();
                    GVoutofHoursVisit.Rows[0].Cells.Add(new TableCell());
                    GVoutofHoursVisit.Rows[0].Cells[0].ColumnSpan = columncount;
                    GVoutofHoursVisit.Rows[0].Cells[0].Text = " ";

                }

                else if (dsOutofHoursVisit.Tables[0].Rows.Count > 0)
                {

                    GVoutofHoursVisit.DataSource = dsOutofHoursVisit;
                    GVoutofHoursVisit.DataBind();
                }


                //Alartm Details

                dsAlarmDetails = new DataSet();

                dsAlarmDetails = objNocShiftHandOver.GetAlarmDetails();

                if (dsAlarmDetails.Tables[0].Rows.Count == 0)
                {

                    dsAlarmDetails.Tables[0].Rows.Add(dsAlarmDetails.Tables[0].NewRow());
                    GV1Details.DataSource = dsAlarmDetails;
                    GV1Details.DataBind();
                    int columncount = GV1Details.Rows[0].Cells.Count;
                    GV1Details.Rows[0].Cells.Clear();
                    GV1Details.Rows[0].Cells.Add(new TableCell());
                    GV1Details.Rows[0].Cells[0].ColumnSpan = columncount;
                    GV1Details.Rows[0].Cells[0].Text = " ";

                }
                else if (dsAlarmDetails.Tables[0].Rows.Count > 0)
                {
                    GV1Details.DataSource = dsAlarmDetails;
                    GV1Details.DataBind();
                   // txtCustomerName.ReadOnly = false;

                }

                if (dsAlarmDetails.Tables[1].Rows.Count > 0)
                {


                    for (int i = 0; i < dsAlarmDetails.Tables[1].Rows.Count; i++)
                    {
                        txtpopTID.Text = dsAlarmDetails.Tables[1].Rows[i][0].ToString();
                        txtNoticeBoard.Text = dsAlarmDetails.Tables[1].Rows[i][1].ToString();
                        txtPopNoticeBoard.Text = dsAlarmDetails.Tables[1].Rows[i][1].ToString();
                    }
                }
                else
                {
                    txtNoticeBoard.Text = "";
                }


                //Customer SErvice Request  GeCustomerServiceRequest

                dsCustomerServiceRequests = new DataSet();

                dsCustomerServiceRequests = objNocShiftHandOver.SearchCustomerServiceRequest();

                if (dsCustomerServiceRequests.Tables[0].Rows.Count == 0)
                {
                    dsCustomerServiceRequests.Tables[0].Rows.Add(dsCustomerServiceRequests.Tables[0].NewRow());
                    GVCustomerServiceRequests.DataSource = dsCustomerServiceRequests;
                    GVCustomerServiceRequests.DataBind();
                    int columncount = GVCustomerServiceRequests.Rows[0].Cells.Count;
                    GVCustomerServiceRequests.Rows[0].Cells.Clear();
                    GVCustomerServiceRequests.Rows[0].Cells.Add(new TableCell());
                    GVCustomerServiceRequests.Rows[0].Cells[0].ColumnSpan = columncount;
                    GVCustomerServiceRequests.Rows[0].Cells[0].Text = " ";
                }
                else if (dsCustomerServiceRequests.Tables[0].Rows.Count > 0)
                {
                    GVCustomerServiceRequests.DataSource = dsCustomerServiceRequests;
                    GVCustomerServiceRequests.DataBind();
                }


                //CallList

                dsCallDetails = new DataSet();

                dsCallDetails = objNocShiftHandOver.GetCallListDetails();

                if (dsCallDetails.Tables[0].Rows.Count == 0)
                {

                    dsCallDetails.Tables[0].Rows.Add(dsCallDetails.Tables[0].NewRow());
                    GVCallList.DataSource = dsCallDetails;
                    GVCallList.DataBind();
                    int columncount = GVCallList.Rows[0].Cells.Count;
                    GVCallList.Rows[0].Cells.Clear();
                    GVCallList.Rows[0].Cells.Add(new TableCell());
                    GVCallList.Rows[0].Cells[0].ColumnSpan = columncount;
                    GVCallList.Rows[0].Cells[0].Text = " ";

                }
                else if (dsCallDetails.Tables[0].Rows.Count > 0)
                {
                    GVCallList.DataSource = dsCallDetails;
                    GVCallList.DataBind();
                    txtnocCallist.ReadOnly = false;

                }

                //Platform Details

                dsPlatformDetails = new DataSet();

                dsPlatformDetails = objNocShiftHandOver.GetPlatformDetails();

                if (dsPlatformDetails.Tables[0].Rows.Count == 0)
                {
                    dsPlatformDetails.Tables[0].Rows.Add(dsPlatformDetails.Tables[0].NewRow());
                    gvEnggPlatform.DataSource = dsPlatformDetails;
                    gvEnggPlatform.DataBind();
                    int columncount = gvEnggPlatform.Rows[0].Cells.Count;
                    gvEnggPlatform.Rows[0].Cells.Clear();
                    gvEnggPlatform.Rows[0].Cells.Add(new TableCell());
                    gvEnggPlatform.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvEnggPlatform.Rows[0].Cells[0].Text = " ";

                }
                else if (dsPlatformDetails.Tables[0].Rows.Count > 0)
                {
                    gvEnggPlatform.DataSource = dsPlatformDetails;
                    gvEnggPlatform.DataBind();
                    txtplatform.ReadOnly = false;
                }

                // Department Contacts details
                dsDepartmentDetails = new DataSet();

                dsDepartmentDetails = objNocShiftHandOver.GetDepartmentDetails();

                if (dsDepartmentDetails.Tables[0].Rows.Count == 0)
                {
                    dsDepartmentDetails.Tables[0].Rows.Add(dsDepartmentDetails.Tables[0].NewRow());
                    gvDeptDetails.DataSource = dsDepartmentDetails;
                    gvDeptDetails.DataBind();
                    int columncount = gvDeptDetails.Rows[0].Cells.Count;
                    gvDeptDetails.Rows[0].Cells.Clear();
                    gvDeptDetails.Rows[0].Cells.Add(new TableCell());
                    gvDeptDetails.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvDeptDetails.Rows[0].Cells[0].Text = " ";

                }
                else if (dsDepartmentDetails.Tables[0].Rows.Count > 0)
                {
                    gvDeptDetails.DataSource = dsDepartmentDetails;
                    gvDeptDetails.DataBind();
                    txtDeptName.ReadOnly = false;

                }

                ////Customer Report To details
                //dsCustomerReportTo = new DataSet();

                //dsCustomerReportTo = objNocShiftHandOver.GetCustomerReportDetails();

                //if (dsCustomerReportTo.Tables[0].Rows.Count == 0)
                //{
                //    dsCustomerReportTo.Tables[0].Rows.Add(dsCustomerReportTo.Tables[0].NewRow());
                //    GvCustomerReportTo.DataSource = dsCustomerReportTo;
                //    GvCustomerReportTo.DataBind();
                //    int columncount = GvCustomerReportTo.Rows[0].Cells.Count;
                //    GvCustomerReportTo.Rows[0].Cells.Clear();
                //    GvCustomerReportTo.Rows[0].Cells.Add(new TableCell());
                //    GvCustomerReportTo.Rows[0].Cells[0].ColumnSpan = columncount;
                //    GvCustomerReportTo.Rows[0].Cells[0].Text = " ";

                //}
                //else if (dsCustomerReportTo.Tables[0].Rows.Count > 0)
                //{
                //    GvCustomerReportTo.DataSource = dsCustomerReportTo;
                //    GvCustomerReportTo.DataBind();
                //    txtCustomerName.ReadOnly = false;
                //}

            }

            catch (Exception ex)
            {
                //lblerrormsg.Text = "";
                //lblerrormsg.Text = "An error has Occured : " + ex.Message.ToString();
            }
        }

        //Insert New Out of hours
        protected void btnsave_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();
            if (txtOutOfhoursID.Text != string.Empty)
            {
                Session["ID"] = Convert.ToInt32(txtOutOfhoursID.Text);
                UpdateNewOutofHours();
            }
            else
            {
                objInsert.ID = 0;
                InsertNewOutofHours();
            }
        }

        //Insert Method for Outof Hours
        public void InsertNewOutofHours()
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            objInsert.Site = txtsite.Text;
            objInsert.CompanyName = txtcomanyname.Text;
            objInsert.DateIn = Convert.ToDateTime(txtdatetimein.Text, ukDtfi);
            objInsert.DateOut = Convert.ToDateTime(txtdatetimeout.Text, ukDtfi);
            objInsert.WO = txtWO.Text;
            objInsert.DescriptionofWork = txtdescofwork.Text;
            objInsert.OPSGroupName = RadioButtonList1.SelectedItem.Value.ToString();
            objInsert.InsertOutofHoursVisit();

            if (objInsert.RID > 0)
            {
                Lod();
                txtOutOfhoursID.Text = "";
                txtsite.Text = "";
                txtcomanyname.Text = "";
                txtdatetimein.Text = "";
                txtdatetimeout.Text = "";
                txtdescofwork.Text = "";
                txtsite.Text = "";
                txtWO.Text = "";
            }
        }

        //Update Method for Out of Hours
        public void UpdateNewOutofHours()
        {
            DACNocShiftHandOver objUpd = new DACNocShiftHandOver();

            objUpd.ID = Convert.ToInt32(Session["ID"]);
            objUpd.Site = txtsite.Text;
            objUpd.CompanyName = txtcomanyname.Text;
            objUpd.DateIn = Convert.ToDateTime(txtdatetimein.Text, ukDtfi);
            objUpd.DateOut = Convert.ToDateTime(txtdatetimeout.Text, ukDtfi);
            objUpd.WO = txtWO.Text;
            objUpd.DescriptionofWork = txtdescofwork.Text;
            objUpd.OPSGroupName = RadioButtonList1.SelectedItem.Value.ToString();
            objUpd.ModifiedBy = Session["UserName"].ToString();
            objUpd.UpdateOutofHoursVisit();

            if (objUpd.RID > 0)
            {
                Lod();
                txtOutOfhoursID.Text = "";
                txtsite.Text = "";
                txtcomanyname.Text = "";
                txtdatetimein.Text = "";
                txtdatetimeout.Text = "";
                txtdescofwork.Text = "";
                txtsite.Text = "";
                txtWO.Text = "";
            }
        }

        //Show PoPup for updating the Out of Hours.
        protected void ShowOutOfhours_Click(object sender, EventArgs e)
        {
            //lblerrormsg.Text = "";
            this.ModalPopupOutofHours.Show();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = GVoutofHoursVisit.DataKeys[gvrow.RowIndex].Value.ToString();

            txtOutOfhoursID.Text = ID;
            txtsite.Text = gvrow.Cells[1].Text;
            txtcomanyname.Text = gvrow.Cells[2].Text;
            txtdatetimein.Text = gvrow.Cells[3].Text;
            txtdatetimeout.Text = gvrow.Cells[4].Text;
            txtWO.Text = gvrow.Cells[5].Text;
            txtdescofwork.Text = gvrow.Cells[6].Text;

            // txtnocCallist.ReadOnly = true;
            btnDelOutOfhours.Visible = true;
        }

        protected void btnsavenoticeboard_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            objInsert.NoticeBoardDesc = txtPopNoticeBoard.Text;

            objInsert.TID = Convert.ToInt32(txtpopTID.Text);

            objInsert.InsertNoticeBoardDetails();



            if (objInsert.RID > 0)
            {
                Lod();
                //loadwithoutwebpart();


            }

        }


        [WebMethod]
        public static List<string> GetPlatformName(string prefixText, int count)
        {
            List<string> address = new List<string>();
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = NocHandOver;
                SqlCommand command = new SqlCommand("OperationsGetPlatformName", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Platform", prefixText);
                command.CommandText = "OperationsGetPlatformName";
                connection.Open();
                using (SqlDataReader sdr = command.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        address.Add(sdr["PlatformName"].ToString());
                    }
                }
                connection.Close();
            }
            catch
            { }
            return address;
        }

        //Show Platform details
        protected void ShowPopUp_Click(object sender, EventArgs e)
        {
            lblerrormsg.Text = "";
            this.ModalPopupExtender3.Show();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = gvEnggPlatform.DataKeys[gvrow.RowIndex].Value.ToString();

            txtplatformtid.Text = ID;
            txtplatform.Text = gvrow.Cells[0].Text;
            txtfirstescal.Text = gvrow.Cells[1].Text;
            txtsecondescal.Text = gvrow.Cells[2].Text;
            txtthirdescal.Text = gvrow.Cells[3].Text;
            txtplatform.ReadOnly = true;
            btnDeleteplatform.Visible = true;
        }

        //Save Platform Details
        protected void btnsaveplatform_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            if (txtplatformtid.Text != string.Empty)
            {
                objInsert.TID = Convert.ToInt32(txtplatformtid.Text);


            }
            else
            {
                objInsert.TID = 0;
            }
            objInsert.Platformname = txtplatform.Text;

            objInsert.FirstEscalation = txtfirstescal.Text;

            objInsert.SecondEscalation = txtsecondescal.Text;

            objInsert.ThirdEscalation = txtthirdescal.Text;

            objInsert.ModifiedBy = Session["UserName"].ToString();

            objInsert.InsertPlatformDetails();

            int getRID = objInsert.RID;

            if (getRID > 0)
            {
                txtplatformtid.Text = "";
                txtplatform.Text = "";
                txtfirstescal.Text = "";
                txtsecondescal.Text = "";
                txtthirdescal.Text = "";


            }

            Lod();
           // loadwithoutwebpart();
            //lblerrormsg.Text = "Your Transaction is uploaded successfully";
        }


        //Deleting Platform Details
        protected void btnDeleteplatform_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objDelete = new DACNocShiftHandOver();

            if (txtplatformtid.Text != string.Empty)
            {
                objDelete.TID = Convert.ToInt32(txtplatformtid.Text);
            }
            else
            {
                objDelete.TID = 0;
            }

            objDelete.ModifiedBy = Session["UserName"].ToString();

            objDelete.DeletePlatformDetails();

            int getRID = objDelete.RID;

            if (getRID > 0)
            {
                txtplatformtid.Text = "";
                txtplatform.Text = "";
                txtfirstescal.Text = "";
                txtsecondescal.Text = "";
                txtthirdescal.Text = "";
            }

            Lod();
           // loadwithoutwebpart();
        }

        //Showing Call List Details
        protected void ShowGVCallListpopup_Click(object sender, EventArgs e)
        {
            lblerrormsg.Text = "";
            this.ModalPoPupCallList.Show();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = GVCallList.DataKeys[gvrow.RowIndex].Value.ToString();

            txtCallListId.Text = ID;
            txtnocCallist.Text = gvrow.Cells[0].Text;
            txtNOCDescription.Text = gvrow.Cells[1].Text;
            txtnocCallist.ReadOnly = true;
            btnDeleteCallList.Visible = true;
        }

        

        //Save Call List Details
        protected void btnSaveCallList_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            if (txtCallListId.Text != string.Empty)
            {
                objInsert.TID = Convert.ToInt32(txtCallListId.Text);
            }
            else
            {
                objInsert.TID = 0;
            }
            objInsert.NOCCallList = txtnocCallist.Text;

            objInsert.NocCallDescription = txtNOCDescription.Text;

            objInsert.ModifiedBy = Session["UserName"].ToString();

            objInsert.InsertCallListDetails();

            int getRID = objInsert.RID;

            if (getRID > 0)
            {
                txtnocCallist.Text = "";
                txtNOCDescription.Text = "";
                txtCallListId.Text = "";
            }

            Lod();
            //loadwithoutwebpart();
            // lblerrormsg.Text = "Your Transaction is uploaded successfully";
        }

        //Deleting Call List Details
        protected void btnDeleteCallList_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objDelete = new DACNocShiftHandOver();

            if (txtCallListId.Text != string.Empty)
            {
                objDelete.TID = Convert.ToInt32(txtCallListId.Text);
            }
            else
            {
                objDelete.TID = 0;
            }

            objDelete.ModifiedBy = Session["UserName"].ToString();

            objDelete.DeleteCallList();

            int getRID = objDelete.RID;

            if (getRID > 0)
            {
                txtnocCallist.Text = "";
                txtNOCDescription.Text = "";
                txtCallListId.Text = "";
            }

            Lod();
            //loadwithoutwebpart();
        }

        //Showing Department Details
        protected void ShowDepartmentpopup_Click(object sender, EventArgs e)
        {
            lblerrormsg.Text = "";
            this.ModalPopupDeptDetails.Show();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = gvDeptDetails.DataKeys[gvrow.RowIndex].Value.ToString();

            txtDeptDetailsID.Text = ID;
            txtDeptName.Text = gvrow.Cells[0].Text;
            txtDeptContacts.Text = gvrow.Cells[1].Text;
            txtEmergencyContact.Text = gvrow.Cells[2].Text;
            txtDeptName.ReadOnly = true;
            btnDeleteplatform.Visible = true;
        }

        //Save Department Details
        protected void btnSaveDeptDetails_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            if (txtDeptDetailsID.Text != string.Empty)
            {
                objInsert.TID = Convert.ToInt32(txtDeptDetailsID.Text);
            }
            else
            {
                objInsert.TID = 0;
            }
            objInsert.DepartmentName = txtDeptName.Text;

            objInsert.Contacts = txtDeptContacts.Text;

            objInsert.EmergencyNumber = txtEmergencyContact.Text;

            objInsert.ModifiedBy = Session["UserName"].ToString();

            objInsert.InsertDepartmentDetails();

            int getRID = objInsert.RID;

            if (getRID > 0)
            {
                txtDeptName.Text = "";
                txtDeptContacts.Text = "";
                txtDeptDetailsID.Text = "";
                txtEmergencyContact.Text = "";
            }

            Lod();
           // loadwithoutwebpart();
        }

        //Deleting Department Details
        protected void btnDeleteDeptDetails_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objDelete = new DACNocShiftHandOver();

            if (txtDeptDetailsID.Text != string.Empty)
            {
                objDelete.TID = Convert.ToInt32(txtDeptDetailsID.Text);
            }
            else
            {
                objDelete.TID = 0;
            }

            objDelete.ModifiedBy = Session["UserName"].ToString();

            objDelete.DeleteDepartmentDetails();

            int getRID = objDelete.RID;

            if (getRID > 0)
            {
                txtDeptName.Text = "";
                txtDeptContacts.Text = "";
                txtDeptDetailsID.Text = "";
                txtEmergencyContact.Text = "";
            }

            Lod();
            //loadwithoutwebpart();
        }

       

        ////Showing CustomerReport Details
        //protected void ShowCustomerReportpopup_Click(object sender, EventArgs e)
        //{
        //    lblerrormsg.Text = "";
        //    this.ModalPopupCustomerReport.Show();

        //    ImageButton BindTextBox = sender as ImageButton;

        //    GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

        //    string ID = GvCustomerReportTo.DataKeys[gvrow.RowIndex].Value.ToString();

        //    txtCustomerID.Text = ID;
        //    txtCustomerName.Text = gvrow.Cells[0].Text;
        //    txtReportTO.Text = gvrow.Cells[1].Text;
        //    txtCustomerName.ReadOnly = true;
        //    btnDeleteCustomerReport.Visible = true;
        //}

        ////Save CustomerReport Details
        //protected void btnSaveCustomerReport_Click(object sender, EventArgs e)
        //{
        //    DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

        //    if (txtCustomerID.Text != string.Empty)
        //    {
        //        objInsert.TID = Convert.ToInt32(txtCustomerID.Text);
        //    }
        //    else
        //    {
        //        objInsert.TID = 0;
        //    }
        //    objInsert.CustomerName = txtCustomerName.Text;

        //    objInsert.ReportTO = txtReportTO.Text;

        //    objInsert.ModifiedBy = Session["UserName"].ToString();

        //    objInsert.InsertCustomerReportDetails();

        //    int getRID = objInsert.RID;

        //    if (getRID > 0)
        //    {
        //        txtCustomerID.Text = "";
        //        txtCustomerName.Text = "";
        //        txtReportTO.Text = "";
        //    }

        //    Lod();
        //    loadwithoutwebpart();
        //}

        ////Deleting CustomerReport Details
        //protected void btnDeleteCustomerReport_Click(object sender, EventArgs e)
        //{
        //    DACNocShiftHandOver objDelete = new DACNocShiftHandOver();

        //    if (txtCustomerID.Text != string.Empty)
        //    {
        //        objDelete.TID = Convert.ToInt32(txtCustomerID.Text);
        //    }
        //    else
        //    {
        //        objDelete.TID = 0;
        //    }

        //    objDelete.ModifiedBy = Session["UserName"].ToString();

        //    objDelete.DeleteCustomerReportDetails();

        //    int getRID = objDelete.RID;

        //    if (getRID > 0)
        //    {
        //        txtCustomerID.Text = "";
        //        txtCustomerName.Text = "";
        //        txtReportTO.Text = "";
        //    }

        //    Lod();
        //    loadwithoutwebpart();
        //}

        ////Changing the control state for CustomerReport Details
        //protected void btncancelCustomerReport_Click(object sender, EventArgs e)
        //{
        //    txtCustomerID.Text = "";
        //    txtCustomerName.Text = "";
        //    txtReportTO.Text = "";
        //    Lod();
        //    loadwithoutwebpart();

        //}

        //Showing Alarm/PFE Details
        protected void ShowAlarmDetails_Click(object sender, EventArgs e)
        {
            lblerrormsg.Text = "";
            this.ModalPopupAlaram.Show();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = GV1Details.DataKeys[gvrow.RowIndex].Value.ToString();

            txtAlaramID.Text = ID;
            txtT2000.Text = gvrow.Cells[0].Text;
            txtAlaramCritical.Text = gvrow.Cells[1].Text;
            txtAlaramMajor.Text = gvrow.Cells[2].Text;
            txtAlaramMinor.Text = gvrow.Cells[3].Text;
            Drpdwnplatform.SelectedItem.Text = gvrow.Cells[4].Text;
            txtT2000.ReadOnly = true;
            btnDeleteAlaram.Visible = true;
        }

        //Save Alarm/PFE Details
        protected void btnsaveAlaram_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            if (txtAlaramID.Text != string.Empty)
            {
                objInsert.TID = Convert.ToInt32(txtAlaramID.Text);
            }
            else
            {
                objInsert.TID = 0;
            }
            objInsert.AlarmName = txtT2000.Text;

            objInsert.Critical = Convert.ToDecimal(txtAlaramCritical.Text);

            objInsert.Major = Convert.ToDecimal(txtAlaramMajor.Text);

            objInsert.Minor = Convert.ToDecimal(txtAlaramMinor.Text);

            objInsert.ModifiedBy = Session["UserName"].ToString();

            objInsert.Platformname = Drpdwnplatform.SelectedItem.Text;

            objInsert.InsertPFEDetails();

            int getRID = objInsert.RID;

            if (getRID > 0)
            {
                txtT2000.Text = "";
                txtAlaramCritical.Text = "";
                txtAlaramMajor.Text = "";
                txtAlaramMinor.Text = "";
                txtAlaramID.Text = "";
                Drpdwnplatform.SelectedIndex = 0;
            }

            Lod();
            //loadwithoutwebpart();
        }

        //Deleting Alarm/PFE Details
        protected void btnDeleteAlaram_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objDelete = new DACNocShiftHandOver();

            if (txtAlaramID.Text != string.Empty)
            {
                objDelete.TID = Convert.ToInt32(txtAlaramID.Text);
            }
            else
            {
                objDelete.TID = 0;
            }

            objDelete.ModifiedBy = Session["UserName"].ToString();

            objDelete.DeleteAlarmDetails();

            int getRID = objDelete.RID;

            if (getRID > 0)
            {
                txtT2000.Text = "";
                txtAlaramCritical.Text = "";
                txtAlaramMajor.Text = "";
                txtAlaramMinor.Text = "";
                txtAlaramID.Text = "";
                Drpdwnplatform.SelectedIndex = 0;
            }

            Lod();
           // loadwithoutwebpart();
        }

        //Changing the control state for Alarm/PFE Details
        protected void btncancalAlaram_Click(object sender, EventArgs e)
        {
            txtT2000.Text = "";
            txtAlaramCritical.Text = "";
            txtAlaramMajor.Text = "";
            txtAlaramMinor.Text = "";
            txtAlaramID.Text = "";
            Drpdwnplatform.SelectedIndex = 0;
            Lod();
            //loadwithoutwebpart();

        }

        //Delete Out Of hours
        protected void btnDelOutOfhours_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objDelete = new DACNocShiftHandOver();

            if (txtOutOfhoursID.Text != string.Empty)
            {
                objDelete.ID = Convert.ToInt32(txtOutOfhoursID.Text);
            }
            else
            {
                objDelete.ID = 0;
            }

            objDelete.ModifiedBy = Session["UserName"].ToString();

            objDelete.DeleteOutofHoursVisit();

            int getRID = objDelete.RID;

            if (getRID > 0)
            {
                txtOutOfhoursID.Text = "";
                txtsite.Text = "";
                txtcomanyname.Text = "";
                txtdatetimein.Text = "";
                txtdatetimeout.Text = "";
                txtdescofwork.Text = "";
                txtsite.Text = "";
                txtWO.Text = "";
            }

            Lod();
           // loadwithoutwebpart();
        }

        //Search Existing Tickets
        protected void btnSearchExistingTickets_Click(object sender, EventArgs e)
        {
            //DivExistingTickets.Focus();

            DACNocShiftHandOver ObjSearchExistingTickets = new DACNocShiftHandOver();

            //Parameters Passing
            ObjSearchExistingTickets.Date = Convert.ToDateTime(DateTime.Now, ukDtfi); ;
            ObjSearchExistingTickets.OPSGroupName = RadioButtonList1.SelectedItem.Value.ToString();

            if (txtIncidentNumberExistingTickets.Text == "")
            {
                ObjSearchExistingTickets.IncidentNumber = 0;
            }
            else
            {
                ObjSearchExistingTickets.IncidentNumber = Convert.ToInt32(txtIncidentNumberExistingTickets.Text);
            }

            dsSearchExistingTickets = new DataSet();
            dsSearchExistingTickets = ObjSearchExistingTickets.SearchExistingTickets();


            if (dsSearchExistingTickets.Tables[0].Rows.Count == 0)
            {

                lblexistingtickets.Text = "";
                dsSearchExistingTickets.Tables[0].Rows.Add(dsSearchExistingTickets.Tables[0].NewRow());
                GVExistingTickets.DataSource = dsSearchExistingTickets;
                GVExistingTickets.DataBind();
                int columncount = GVExistingTickets.Rows[0].Cells.Count;
                GVExistingTickets.Rows[0].Cells.Clear();
                GVExistingTickets.Rows[0].Cells.Add(new TableCell());
                GVExistingTickets.Rows[0].Cells[0].ColumnSpan = columncount;
                GVExistingTickets.Rows[0].Cells[0].Text = " ";
            }

            else if (dsSearchExistingTickets.Tables[0].Rows.Count > 0)
            {
                GVExistingTickets.DataSource = dsSearchExistingTickets;
                GVExistingTickets.DataBind();

            }
        }

        //Showing Existing Tickets in popup
        protected void SearchExistingTickets_Click(object sender, EventArgs e)
        {
           
            this.ModalPopupExistingTickets.Show();

            //DivExistingTickets.Focus();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = GVExistingTickets.DataKeys[gvrow.RowIndex].Value.ToString();
           
            txtIncidentNumberID.Text = Convert.ToInt32(ID).ToString();
            txtExistingCreatedDateTime.Text = gvrow.Cells[1].Text;
            txtExistingTicketCategory.Text = gvrow.Cells[2].Text;
            txtExistingOpsGroup.Text = gvrow.Cells[3].Text;
            txtExistingCustName.Text = gvrow.Cells[4].Text;
            txtExistingCircuitID.Text = gvrow.Cells[5].Text;
            txtExistingStatus.Text = gvrow.Cells[6].Text;
            txtExistingSummary.Text = gvrow.Cells[7].Text;
            txtExistingNextAction.Text = gvrow.Cells[8].Text;
            txtIncidentNumberExistingTickets.Text = "";
            txtExistingTicket.Text = GVExistingTickets.DataKeys[gvrow.RowIndex].Values[1].ToString(); 
          
        }

        //Insert/Update In Existint Tickets as Next Action
        protected void btnExistingSave_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            objInsert.IncidentNumber = Convert.ToInt32(txtIncidentNumberID.Text);

            objInsert.NextAction = txtExistingNextAction.Text;

            objInsert.CreatedBy = Session["UserName"].ToString(); ;

            objInsert.ModifiedBy = Session["UserName"].ToString();

            objInsert.MethodName = "ExistingTickets";

            objInsert.InsertNextAction();

            //filepaths = Directory.GetFiles(Server.MapPath(UploadPath));
            string filepaths = Server.MapPath(UploadPath);

            objInsert.createxml(objInsert.IncidentNumber, objInsert.NextAction, filepaths);

            int getRID = objInsert.RID;
            
            if (getRID > 0)
            {
                txtIncidentNumberID.Text = "";
                txtExistingTicketCategory.Text = "";
                txtExistingCreatedDateTime.Text = "";
                txtExistingOpsGroup.Text = "";
                txtExistingCustName.Text = "";
                txtExistingCircuitID.Text = "";
                txtExistingStatus.Text = "";
                txtExistingSummary.Text = "";
                txtExistingNextAction.Text = "";
                txtExistingTicket.Text = "";
            }

           
            Lod();
           // loadwithoutwebpart();
        }

        //Search New Tickets
        protected void BtnSearchNewTickets_Click(object sender, EventArgs e)
        {
            //DivNewTickets.Focus();

            DACNocShiftHandOver ObjSearchNewTickets = new DACNocShiftHandOver();

            //Parameters Passing
            ObjSearchNewTickets.Date = Convert.ToDateTime(DateTime.Now, ukDtfi); ;
            ObjSearchNewTickets.OPSGroupName = RadioButtonList1.SelectedItem.Value.ToString();

            if(txtIncidentNumberNewTickets.Text == "")
            {
                ObjSearchNewTickets.IncidentNumber = 0;
            }
            else
            {
            ObjSearchNewTickets.IncidentNumber = Convert.ToInt32(txtIncidentNumberNewTickets.Text);
            }
           
            dsSearchNewTickets = new DataSet();
            dsSearchNewTickets = ObjSearchNewTickets.SearchNewTickets();


            if (dsSearchNewTickets.Tables[0].Rows.Count == 0)
            {

                lblexistingtickets.Text = "";
                dsSearchNewTickets.Tables[0].Rows.Add(dsSearchNewTickets.Tables[0].NewRow());
                GVNewTickets.DataSource = dsSearchNewTickets;
                GVNewTickets.DataBind();
                int columncount = GVNewTickets.Rows[0].Cells.Count;
                GVNewTickets.Rows[0].Cells.Clear();
                GVNewTickets.Rows[0].Cells.Add(new TableCell());
                GVNewTickets.Rows[0].Cells[0].ColumnSpan = columncount;
                GVNewTickets.Rows[0].Cells[0].Text = " ";
            }

            else if (dsSearchNewTickets.Tables[0].Rows.Count > 0)
            {
                GVNewTickets.DataSource = dsSearchNewTickets;
                GVNewTickets.DataBind();

            }
        }

        // Showing Search New Tickets in popup
        protected void ShowSearchNewTickets_Click(object sender, EventArgs e)
        {
            this.ModalPopupNewtickets.Show();

            //DivNewTickets.Focus();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = GVNewTickets.DataKeys[gvrow.RowIndex].Value.ToString();

            txtNewTicketIncidentNumber.Text = Convert.ToInt32(ID).ToString(); //txtNewTicketIncidentNumber
            txtnewticketcreatedatetime.Text = gvrow.Cells[1].Text;
            txtnewticketCategory.Text = gvrow.Cells[2].Text;
            txtnewticketOpsgroup.Text = gvrow.Cells[3].Text;
            txtnewticketCustName.Text = gvrow.Cells[4].Text;
            txtnewticketcircuitid.Text = gvrow.Cells[5].Text;
            txtnewticketstatus.Text = gvrow.Cells[6].Text;
            txtnewticketSummary.Text = gvrow.Cells[7].Text;
            txtnewticketNxtAction.Text = gvrow.Cells[8].Text;
            txtIncidentNumberNewTickets.Text = "";
        }

        //Insert/Update in New ticket as next action
        protected void btnnewticketsave_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            objInsert.IncidentNumber = Convert.ToInt32(txtNewTicketIncidentNumber.Text);

            objInsert.NextAction = txtnewticketNxtAction.Text;

            objInsert.CreatedBy = Session["UserName"].ToString(); ;

            objInsert.ModifiedBy = Session["UserName"].ToString();

            objInsert.MethodName = "OpenedTickets";

            objInsert.InsertNextAction();

            string filepaths = Server.MapPath(UploadPath);

            objInsert.createxml(objInsert.IncidentNumber, objInsert.NextAction, filepaths);

            int getRID = objInsert.RID;

            if (getRID > 0)
            {
                txtNewTicketIncidentNumber.Text = "";
                txtnewticketCategory.Text = "";
                txtnewticketcreatedatetime.Text = "";
                txtnewticketOpsgroup.Text = "";
                txtnewticketCustName.Text = "";
                txtnewticketcircuitid.Text = "";
                txtnewticketstatus.Text = "";
                txtnewticketSummary.Text = "";
                txtnewticketNxtAction.Text = "";
            }

            Lod();
            //loadwithoutwebpart();
        }

        // Search Close ticket
        protected void BtnSearchClosedTickets_Click(object sender, EventArgs e)
        {
            //DivClosedTickets.Focus();

            DACNocShiftHandOver ObjSearchCloseTickets = new DACNocShiftHandOver();

            //Parameters Passing
            ObjSearchCloseTickets.Date = Convert.ToDateTime(DateTime.Now, ukDtfi); ;
            ObjSearchCloseTickets.OPSGroupName = RadioButtonList1.SelectedItem.Value.ToString();

            if(txtIncidentCloseTickets.Text == "")
            {
                ObjSearchCloseTickets.IncidentNumber = 0;
            }
            else
            {
            ObjSearchCloseTickets.IncidentNumber = Convert.ToInt32(txtIncidentCloseTickets.Text);
            }

            dsSearchCloseTickets = new DataSet();
            dsSearchCloseTickets = ObjSearchCloseTickets.SearchCloseTickets();


            if (dsSearchCloseTickets.Tables[0].Rows.Count == 0)
            {

                lblexistingtickets.Text = "";
                dsSearchCloseTickets.Tables[0].Rows.Add(dsSearchCloseTickets.Tables[0].NewRow());
                GVClosedTickets.DataSource = dsSearchCloseTickets;
                GVClosedTickets.DataBind();
                int columncount = GVClosedTickets.Rows[0].Cells.Count;
                GVClosedTickets.Rows[0].Cells.Clear();
                GVClosedTickets.Rows[0].Cells.Add(new TableCell());
                GVClosedTickets.Rows[0].Cells[0].ColumnSpan = columncount;
                GVClosedTickets.Rows[0].Cells[0].Text = " ";
            }

            else if (dsSearchCloseTickets.Tables[0].Rows.Count > 0)
            {
                GVClosedTickets.DataSource = dsSearchCloseTickets;
                GVClosedTickets.DataBind();

            }
        }

        //ShowSearchCloseTickets_Click
        protected void ShowSearchCloseTickets_Click(object sender, EventArgs e)
        {
            this.ModalPopupClosetickets.Show();

            //DivClosedTickets.Focus();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = GVClosedTickets.DataKeys[gvrow.RowIndex].Value.ToString();

            txtcloseticketincidentnumber.Text = Convert.ToInt32(ID).ToString();
            txtcloseticketcustname.Text = gvrow.Cells[1].Text;
            txtcloseticketsummary.Text = gvrow.Cells[2].Text;
            txtcloseticketnextaction.Text = gvrow.Cells[3].Text;
            txtIncidentCloseTickets.Text = "";


        }

        //Insert/Update in Close ticket as next action
        protected void btncloseticketsave_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            objInsert.IncidentNumber = Convert.ToInt32(txtcloseticketincidentnumber.Text);

            objInsert.NextAction = txtcloseticketnextaction.Text;

            objInsert.CreatedBy = Session["UserName"].ToString(); ;

            objInsert.ModifiedBy = Session["UserName"].ToString();

            objInsert.MethodName = "ResolvedTicktets";

            objInsert.InsertNextAction();

            string filepaths = Server.MapPath(UploadPath);

            objInsert.createxml(objInsert.IncidentNumber, objInsert.NextAction, filepaths);

            int getRID = objInsert.RID;

            if (getRID > 0)
            {
                txtcloseticketincidentnumber.Text = "";
                txtcloseticketcustname.Text = "";
                txtcloseticketsummary.Text = "";
                txtcloseticketnextaction.Text = "";
            }

            Lod();
          //  loadwithoutwebpart();
        }

        //Search Provisioning ticket
        protected void btnsearchProvisioningticket_Click(object sender, EventArgs e)
        {

            //DivProvisioningTickets.Focus();

            DACNocShiftHandOver ObjSearchProvisioningTickets = new DACNocShiftHandOver();

            //Parameters Passing
            ObjSearchProvisioningTickets.Date = Convert.ToDateTime(DateTime.Now, ukDtfi); ;
            ObjSearchProvisioningTickets.OPSGroupName = RadioButtonList1.SelectedItem.Value.ToString();

            if(txtIncidentprovisioningticket.Text == "")
            {
                ObjSearchProvisioningTickets.IncidentNumber = 0;
            }
            else
            {
                ObjSearchProvisioningTickets.IncidentNumber = Convert.ToInt32(txtIncidentprovisioningticket.Text);
            }

            dsSearchProvisioningTickets = new DataSet();
            dsSearchProvisioningTickets = ObjSearchProvisioningTickets.SearchProvisioningTickets();

            if (dsSearchProvisioningTickets.Tables[0].Rows.Count == 0)
            {
                dsSearchProvisioningTickets.Tables[0].Rows.Add(dsSearchProvisioningTickets.Tables[0].NewRow());
                GVProvisioningTickets.DataSource = dsSearchProvisioningTickets;
                GVProvisioningTickets.DataBind();
                int columncount = GVProvisioningTickets.Rows[0].Cells.Count;
                GVProvisioningTickets.Rows[0].Cells.Clear();
                GVProvisioningTickets.Rows[0].Cells.Add(new TableCell());
                GVProvisioningTickets.Rows[0].Cells[0].ColumnSpan = columncount;
                GVProvisioningTickets.Rows[0].Cells[0].Text = " ";

            }

            else if (dsSearchProvisioningTickets.Tables[0].Rows.Count > 0)
            {
                GVProvisioningTickets.DataSource = dsSearchProvisioningTickets;
                GVProvisioningTickets.DataBind();
            }
        }

        //Insert/Update in Provisioning ticket as next action 
        protected void btnprovisioningticketsave_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            objInsert.IncidentNumber = Convert.ToInt32(txtprovisioningticketincidentnumber.Text);

            objInsert.NextAction = txtprovisioningticketnextaction.Text;

            objInsert.CreatedBy = Session["UserName"].ToString(); ;

            objInsert.ModifiedBy = Session["UserName"].ToString();

            objInsert.MethodName = "ProvisioningTicket";

            string filepaths = Server.MapPath(UploadPath);

            objInsert.createxml(objInsert.IncidentNumber, objInsert.NextAction, filepaths);

            objInsert.InsertNextAction();

            int getRID = objInsert.RID;

            if (getRID > 0)
            {
                txtprovisioningticketincidentnumber.Text = "";
                txtprovisioningticketcreateddatetime.Text = "";
                txtprovisioningticketcategory.Text = "";
                txtprovisioningticketcustname.Text = "";
                txtprovisioningticketopsgroup.Text = "";
                txtprovisioningticketcircuitid.Text = "";
                txtprovisioningticketstatus.Text = "";
                txtprovisioningticketsummary.Text = "";
                txtprovisioningticketnextaction.Text = "";
            }

            Lod();
          //  loadwithoutwebpart();
        }

        //Showing Provision ticket in popup
        protected void ShowSearchProvisioningTickets_Click(object sender, EventArgs e)
        {
            this.ModalPopupProvisioningticket.Show();

            //DivProvisioningTickets.Focus();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = GVProvisioningTickets.DataKeys[gvrow.RowIndex].Value.ToString();

            txtprovisioningticketincidentnumber.Text = Convert.ToInt32(ID).ToString(); //
            txtprovisioningticketcreateddatetime.Text = gvrow.Cells[1].Text;
            txtprovisioningticketcategory.Text = gvrow.Cells[2].Text;
            txtprovisioningticketopsgroup.Text = gvrow.Cells[3].Text;
            txtprovisioningticketcustname.Text = gvrow.Cells[4].Text;
            txtprovisioningticketcircuitid.Text = gvrow.Cells[5].Text;
            txtprovisioningticketstatus.Text = gvrow.Cells[6].Text;
            txtprovisioningticketsummary.Text = gvrow.Cells[7].Text;
            txtprovisioningticketnextaction.Text = gvrow.Cells[8].Text;
            txtIncidentprovisioningticket.Text = "";


        }

        //Search Access Request
        protected void btnsearchAccessrequest_Click(object sender, EventArgs e)
        {

            //DivAccessRequest.Focus();

            DACNocShiftHandOver ObjSearchAccessRequest = new DACNocShiftHandOver();

            //Parameters Passing
            ObjSearchAccessRequest.Date = Convert.ToDateTime(DateTime.Now, ukDtfi); ;
            ObjSearchAccessRequest.OPSGroupName = RadioButtonList1.SelectedItem.Value.ToString();

            if(txtIncidentaccessrequest.Text == "")
            {
                ObjSearchAccessRequest.IncidentNumber = 0;
            }
            else
            {
              ObjSearchAccessRequest.IncidentNumber = Convert.ToInt32(txtIncidentaccessrequest.Text);
            }
            dsSearchAccessRequest = new DataSet();

            dsSearchAccessRequest = ObjSearchAccessRequest.SearchAccessRequest();

            if (dsSearchAccessRequest.Tables[0].Rows.Count == 0)
            {

                dsSearchAccessRequest.Tables[0].Rows.Add(dsSearchAccessRequest.Tables[0].NewRow());
                GVAccessRequest.DataSource = dsSearchAccessRequest;
                GVAccessRequest.DataBind();
                int columncount = GVAccessRequest.Rows[0].Cells.Count;
                GVAccessRequest.Rows[0].Cells.Clear();
                GVAccessRequest.Rows[0].Cells.Add(new TableCell());
                GVAccessRequest.Rows[0].Cells[0].ColumnSpan = columncount;
                GVAccessRequest.Rows[0].Cells[0].Text = " ";

            }

            else if (dsSearchAccessRequest.Tables[0].Rows.Count > 0)
            {

                GVAccessRequest.DataSource = dsSearchAccessRequest;
                GVAccessRequest.DataBind();
            }
        }

        //Insert/Update in Access Request as next action
        protected void btnaccessrequestSave_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            objInsert.IncidentNumber = Convert.ToInt32(txtaccessrequestincidentnumber.Text);

            objInsert.NextAction = txtaccessrequestnextaction.Text;

            objInsert.CreatedBy = Session["UserName"].ToString(); ;

            objInsert.ModifiedBy = Session["UserName"].ToString();

            objInsert.MethodName = "AccessRequest";

            string filepaths = Server.MapPath(UploadPath);

            objInsert.createxml(objInsert.IncidentNumber, objInsert.NextAction, filepaths);

            objInsert.InsertNextAction();

            int getRID = objInsert.RID;

            if (getRID > 0)
            {
                txtaccessrequestincidentnumber.Text = "";
                txtaccessrequestcreateddatetime.Text = "";
                txtaccessrequestCategory.Text = "";
                txtaccessrequestopsgroup.Text = "";
                txtaccessrequestcustname.Text = "";
                txtaccessrequestcircuitId.Text = "";
                txtaccessrequeststatus.Text = "";
                txtaccessrequestsummary.Text = "";
                txtaccessrequestnextaction.Text = "";
            }

            Lod();
            //loadwithoutwebpart();
        }

        //Showing Access Request in popup
        protected void ShowSearchAccessRequest_Click(object sender, EventArgs e)
        {
            this.ModalPopupAccessRequest.Show();

            //DivAccessRequest.Focus();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = GVAccessRequest.DataKeys[gvrow.RowIndex].Value.ToString();

            txtaccessrequestincidentnumber.Text = Convert.ToInt32(ID).ToString(); //
            txtaccessrequestcreateddatetime.Text = gvrow.Cells[1].Text;
            txtaccessrequestCategory.Text = gvrow.Cells[2].Text;
            txtaccessrequestopsgroup.Text = gvrow.Cells[3].Text;
            txtaccessrequestcustname.Text = gvrow.Cells[4].Text;
            txtaccessrequestcircuitId.Text = gvrow.Cells[5].Text;
            txtaccessrequeststatus.Text = gvrow.Cells[6].Text;
            txtaccessrequestsummary.Text = gvrow.Cells[7].Text;
            txtaccessrequestnextaction.Text = gvrow.Cells[8].Text;
            txtIncidentaccessrequest.Text = "";


        }

        //Search Customer Service Request
        protected void btnsearchCustServiceRequest_Click(object sender, EventArgs e)
        {

            //DivIncidentCustServiceRequest.Focus();

            DACNocShiftHandOver ObjSearchCustServiceRequest = new DACNocShiftHandOver();

            //Parameters Passing
            ObjSearchCustServiceRequest.Date = Convert.ToDateTime(DateTime.Now, ukDtfi); ;
            ObjSearchCustServiceRequest.OPSGroupName = RadioButtonList1.SelectedItem.Value.ToString();

            if (txtIncidentCustServiceRequest.Text == "")
            {
                ObjSearchCustServiceRequest.IncidentNumber = 0;
            }
            else
            {
                ObjSearchCustServiceRequest.IncidentNumber = Convert.ToInt32(txtIncidentCustServiceRequest.Text);
            }
            dsSearchCustomerServiceRequests = new DataSet();

            dsSearchCustomerServiceRequests = ObjSearchCustServiceRequest.SearchCustomerServiceRequest();

            if (dsSearchCustomerServiceRequests.Tables[0].Rows.Count == 0)
            {
                dsSearchCustomerServiceRequests.Tables[0].Rows.Add(dsSearchCustomerServiceRequests.Tables[0].NewRow());
                GVCustomerServiceRequests.DataSource = dsSearchCustomerServiceRequests;
                GVCustomerServiceRequests.DataBind();
                int columncount = GVCustomerServiceRequests.Rows[0].Cells.Count;
                GVCustomerServiceRequests.Rows[0].Cells.Clear();
                GVCustomerServiceRequests.Rows[0].Cells.Add(new TableCell());
                GVCustomerServiceRequests.Rows[0].Cells[0].ColumnSpan = columncount;
                GVCustomerServiceRequests.Rows[0].Cells[0].Text = " ";
            }
            else if (dsSearchCustomerServiceRequests.Tables[0].Rows.Count > 0)
            {
                GVCustomerServiceRequests.DataSource = dsSearchCustomerServiceRequests;
                GVCustomerServiceRequests.DataBind();
            }
        }

        //Insert/Update in Customer Service Request as next action
        protected void btnCustServicerequestSave_Click(object sender, EventArgs e)
        {
            DACNocShiftHandOver objInsert = new DACNocShiftHandOver();

            objInsert.IncidentNumber = Convert.ToInt32(txtcustservicereqincidentNum.Text);

            objInsert.NextAction = txtcustservicereqNxtAction.Text;

            objInsert.CreatedBy = Session["UserName"].ToString(); ;

            objInsert.ModifiedBy = Session["UserName"].ToString();

            objInsert.MethodName = "CustomerRequestTicket";

            string filepaths = Server.MapPath(UploadPath);

            objInsert.createxml(objInsert.IncidentNumber, objInsert.NextAction, filepaths);

            objInsert.InsertNextAction();

            int getRID = objInsert.RID;

            if (getRID > 0)
            {
                txtcustservicereqincidentNum.Text = "";
                txtcustservicereqcreateddatetime.Text = "";
                txtcustservicereqcategory.Text = "";
                txtcustservicereqopsgroup.Text = "";
                txtcustservicereqcustname.Text = "";
                txtcustservicereqcircuitID.Text = "";
                txtcustservicereqStatus.Text = "";
                txtcustservicereqSummary.Text = "";
                txtcustservicereqNxtAction.Text = "";
            }

            Lod();
         //   loadwithoutwebpart();
        }

        //Showing Customer Service Request in popup
        protected void ShowSearchCustServiceRequest_Click(object sender, EventArgs e)
        {
            this.ModalPopupCustServiceRequest.Show();

            //DivIncidentCustServiceRequest.Focus();

            ImageButton BindTextBox = sender as ImageButton;

            GridViewRow gvrow = (GridViewRow)BindTextBox.NamingContainer;

            string ID = GVCustomerServiceRequests.DataKeys[gvrow.RowIndex].Value.ToString();

            txtcustservicereqincidentNum.Text = Convert.ToInt32(ID).ToString();
            txtcustservicereqcreateddatetime.Text = gvrow.Cells[1].Text;
            txtcustservicereqcategory.Text = gvrow.Cells[2].Text;
            txtcustservicereqopsgroup.Text = gvrow.Cells[3].Text;
            txtcustservicereqcustname.Text = gvrow.Cells[4].Text;
            txtcustservicereqcircuitID.Text = gvrow.Cells[5].Text;
            txtcustservicereqStatus.Text = gvrow.Cells[6].Text;
            txtcustservicereqSummary.Text = gvrow.Cells[7].Text;
            txtcustservicereqNxtAction.Text = gvrow.Cells[8].Text;
            txtIncidentCustServiceRequest.Text = "";


        }

        protected void gvEnggPlatform_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEnggPlatform.PageIndex = e.NewPageIndex;
            Lod();
           // loadwithoutwebpart();
        }

        protected void GVExistingTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVExistingTickets.PageIndex = e.NewPageIndex;
            Lod();
           // loadwithoutwebpart();
        }

        protected void GVCallList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVCallList.PageIndex = e.NewPageIndex;
            Lod();
           // loadwithoutwebpart();
        }

        //Oncall List show
        protected void imgoncallhowdiv_Click(object sender, ImageClickEventArgs e)
        {

            imgoncallhowdiv.ImageUrl = "~/Images/HideShow/plus.jpg";
            NOCONCALLList.Visible = false;


            NOtickets.Visible = true;

            imgoncallhowdiv.Visible = false;
            imgoncallhidediv.Visible = true;
           // Lod();
        }

        //Oncall List hide
        protected void imgoncallhidediv_Click(object sender, ImageClickEventArgs e)
        {
        
                imgoncallhidediv.ImageUrl = "~/Images/HideShow/minus.jpg";
                //InnerDependantDiv.Visible = false;
                NOCONCALLList.Visible = false;

                NOtickets.Visible = false;

                imgoncallhowdiv.Visible = true;
                imgoncallhidediv.Visible = false;
               // Lod();
           
        }

        protected void GVNewTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVNewTickets.PageIndex = e.NewPageIndex;
            Lod();
            

        }

        protected void GVCustomerServiceRequests_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVCustomerServiceRequests.PageIndex = e.NewPageIndex;
            Lod();
        }

        protected void GVAccessRequest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVAccessRequest.PageIndex = e.NewPageIndex;
            Lod();
        }

        protected void GVProvisioningTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           GVProvisioningTickets.PageIndex = e.NewPageIndex;
            Lod();
        }

        protected void GVClosedTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           GVClosedTickets.PageIndex = e.NewPageIndex;
            Lod();
        }

        
      
      
    }
}