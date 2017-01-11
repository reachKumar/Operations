using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Operations
{
    public partial class UCLogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblerrormsg.Text = "";
                lblsuccessmsg.Text = "";
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {

                CheckLoginDetails objCheckLoginDetails = new CheckLoginDetails();

                objCheckLoginDetails.LoginUserName = txtusername.Text;
                objCheckLoginDetails.LoginPassword = txtpassword.Text;
                objCheckLoginDetails.CheckLogin();

                Session["UserName"] = objCheckLoginDetails.FullName;
                Session["ID"] = objCheckLoginDetails.ID;
                Session["ReportsAccess"] = objCheckLoginDetails.ReportsAccess;


                if ((objCheckLoginDetails.ReportsAccess)!= 1)
                {
                    
                    Response.Redirect("POPActivity.aspx");
                }
                else if ((objCheckLoginDetails.ReportsAccess) == 1)
                {


                    Response.Redirect("ShiftHandover.aspx");


                    //lblerrormsg.Text = "";
                    //lblerrormsg.Text = "Login Failed"; 

                }
                else 
                {

                    Response.Redirect("Login.aspx");
                
                }
            }

            catch (Exception ex)
            {
                lblerrormsg.Text = "";
                lblerrormsg.Text = ex.Message.ToString();
            }
            finally 
            {
            
            }
        }
    }
}