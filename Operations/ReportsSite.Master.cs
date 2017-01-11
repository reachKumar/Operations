using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Operations
{
    public partial class ReportsSite : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //string pageName = this.Page.ToString().Substring(4, this.Page.ToString().Substring(4).Length - 5) + ".aspx";
            if (Session["UserName"] != null)
            {

                lblUserName.Text = Session["UserName"].ToString();
                A1.Visible = true;
                //if (pageName == "popactivity.aspx")
                //{
                //    LeftNavigation21.Visible = false;   
                //}
            }
            else 
            {
                A1.Visible = false;
                Response.Redirect("Login.aspx");
             
            }
        }
    }
}