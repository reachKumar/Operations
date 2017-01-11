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

namespace Operations
{
    public partial class UCActivity : System.Web.UI.UserControl
    {

        //string conITSM = ConfigurationManager.ConnectionStrings["conITSM"].ToString();

        DateTimeFormatInfo ukDtfi = new CultureInfo("en-GB", false).DateTimeFormat; //--dd/MM/yyyy 
        // dd.FromDate = Convert.ToDateTime(txtFromDate.Text, ukDtfi);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    LoadControls();

                    int Access = Convert.ToInt32(Session["ID"]);
                    if (Access != 1)
                    {

                        HyperLink1.Visible = false;
                    }
                    else
                    {
                        HyperLink1.Visible = true;
                    }

                }
                else 
                {
                    Response.Redirect("Login.aspx");
                }
            }

        }

        public void LoadControls()
        {

            try
            {


                ActivityDetails objActivityDetails = new ActivityDetails();

                DataSet dsActivity = new DataSet();

                dsActivity= objActivityDetails.GetActivityControlDetails();

                //select 1 PurposeName
                ddlvisit.DataSource = dsActivity.Tables[0];
                ddlvisit.DataTextField = "PurposeName";
                ddlvisit.DataValueField = "ID";
                ddlvisit.DataBind();

                //select 2

                ddlprovider.DataSource = dsActivity.Tables[1];
                ddlprovider.DataTextField = "Provider";
                ddlprovider.DataValueField = "ID";
                ddlprovider.DataBind();

                //Select 3
                ddlpop.DataSource = dsActivity.Tables[2];
                ddlpop.DataTextField = "PoPName";
                ddlpop.DataValueField = "PoPName";
                ddlpop.DataBind();
                

            }
            catch (Exception ex)
            {

                lblerrormsg.Text = "";
                lblerrormsg.Text = ex.Message.ToString();
                lblsuccessmsg.Text = "";

            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {

                ActivityDetails objActivityDetails = new ActivityDetails();

                objActivityDetails.PurposeId = Convert.ToInt64(ddlvisit.SelectedItem.Value);
                objActivityDetails.ProviderId =Convert.ToInt32(ddlprovider.SelectedItem.Value);
                objActivityDetails.POPName = ddlpop.SelectedItem.Value;
                objActivityDetails.Date = Convert.ToDateTime(txtdate.Text, ukDtfi);
                objActivityDetails.ModifiedBy = txtmodifiedby.Text;
                objActivityDetails.Location = txtlocation.Text;
                objActivityDetails.Comments = txtcomments.Text;
                objActivityDetails.Voltage= Convert.ToDecimal (txtvoltage.Text);
                objActivityDetails.EngineerName = txtengineer.Text;
                objActivityDetails.Logintime = txtlogintime.Text;
                objActivityDetails.Logouttime = txtlogouttime.Text;
                objActivityDetails.BatteryLoad = Convert.ToDecimal(txtbatteryload.Text);
                objActivityDetails.Rectifier = txtrectifier.Text;
                objActivityDetails.WOTicketNumber = txtWorkOrderNumber.Text;
                objActivityDetails.InsActivityDetails();

                if (objActivityDetails.ActivityId > 0)
                {
                    lblerrormsg.Text = "";
                    lblsuccessmsg.Text = "";
                    lblsuccessmsg.Text = "Success";
                }
                else 
                {
                    lblerrormsg.Text = "";
                    lblsuccessmsg.Text = "";
                    lblerrormsg.Text = "Failed";
                }
                

            }
            catch (Exception ex)
            {

                lblerrormsg.Text = "";
                lblerrormsg.Text = ex.Message.ToString();
                lblsuccessmsg.Text = "";

            }
        }

        protected void RadioButtonTimeFrom_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(RadioButtonTimeFrom.SelectedValue))
            {
                // Popup result is the selected task
                 PopupControlExtender2.Commit(RadioButtonTimeFrom.SelectedValue);
            }
            else
            {
                // Cancel the popup
                PopupControlExtender2.Cancel();
            }
            // Reset the selected item
            RadioButtonTimeFrom.ClearSelection();
        }


        protected void RadioButtontxtlogouttime_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(RadioButtontxtlogouttime.SelectedValue))
            {
                // Popup result is the selected task
                PopupControlExtenderLogoutTime.Commit(RadioButtontxtlogouttime.SelectedValue);
            }
            else
            {
                // Cancel the popup
                PopupControlExtenderLogoutTime.Cancel();
            }
            // Reset the selected item
            RadioButtontxtlogouttime.ClearSelection();
        }

      

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("POPActivity.aspx");
        }

        protected void ddlvisit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlvisit.SelectedItem.Text == "Audit")
            {
                txtWorkOrderNumber.ReadOnly = true;
            }
            else
            {
                txtWorkOrderNumber.ReadOnly = false;
            }

        }
    }
}