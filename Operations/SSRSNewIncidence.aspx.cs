using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Operations
{
    public partial class SSRSNewIncidence : System.Web.UI.Page
    {
        string ReportAccess;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {

                ReportAccess = Session["ReportsAccess"].ToString();

                if (Convert.ToInt32(ReportAccess) != 1)
                {
                   // Response.Redirect("Login.aspx");
                    Response.Redirect("POPActivity.aspx");
                }
            }

        }
    }
}