using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Operations
{
    public partial class SSRSMaintance : System.Web.UI.Page
    {
        int ReportAccess;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {

                ReportAccess = Convert.ToInt32(Session["ReportsAccess"].ToString());

                if (ReportAccess != 1)
                {
                  //  Response.Redirect("Login.aspx");
                    Response.Redirect("POPActivity.aspx");
                }
            }

        }
    }
}