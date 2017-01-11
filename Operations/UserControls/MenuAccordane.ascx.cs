using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Operations.UserControls
{
    public partial class MenuAccordane : System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                try
                {
                       int Access = Convert.ToInt32(Session["ID"]);
                  
                    string pageName = this.Page.ToString().Substring(4, this.Page.ToString().Substring(4).Length - 5) + ".aspx";

                   if (pageName == "ssrsupdateonexisting.aspx" || pageName == "ssrsnewincidence.aspx" || pageName == "ssrsworkorders.aspx" || pageName == "ssrsnetworkoutages.aspx"||pageName == "ssrsactivity.aspx" || pageName == "ssrsnetopsregion.aspx" || pageName == "ssrsmaintance.aspx")
                    {
                        Accordion1.FindControl("APReports").Focus();
                        Accordion1.SelectedIndex = 0;
                        //Accosrdion1.FindControl("APSalesNews").Focus();
                        //Accordion1.SelectedIndex = 4;
                    }
                    else if (pageName == "ssrsspanid.aspx" || pageName == "ssrsspanregion.aspx")
                    {
                        Accordion1.FindControl("APSpanReport").Focus();
                        Accordion1.SelectedIndex = 1;
                    }
                    else if (pageName == "noccalllist.aspx" || pageName == "shifthandover.aspx")
                    {
                        Accordion1.FindControl("APShiftHandover").Focus();
                        Accordion1.SelectedIndex = 2;
                    }
                    else if (pageName == "nocdashboard.aspx") //NOCDashboard.aspx
                    {
                        Accordion1.FindControl("APNocDashboard").Focus();
                        Accordion1.SelectedIndex = 3;
                    }
                   else if ((pageName == "popactivity.aspx" && Access != 1) || ( pageName == "generatordetails.aspx" && Access != 1))
                    {
                        APReports.Visible = false;
                        APSpanReport.Visible = false;
                        APNocDashboard.Visible = false;
                        APShiftHandover.Visible = false;
                       
                        Accordion1.FindControl("ActivityOrGenerator").Focus();
                        Accordion1.SelectedIndex = 5;
                       
                    }
                   else if (pageName == "popactivity.aspx" || pageName == "generatordetails.aspx")
                   {
                       Accordion1.FindControl("ActivityOrGenerator").Focus();
                        Accordion1.SelectedIndex = 5;
                   }

                   else
                   {
                       Accordion1.FindControl("APReports").Focus();
                       Accordion1.SelectedIndex = 0;
                   }
                }
                catch (Exception et)
                {
                    throw et;
                }
            }
        }
    }
}