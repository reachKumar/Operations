using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;
using System.Xml.Serialization;
using System.Globalization;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;


namespace Operations
{
    public partial class WUCGenerator : System.Web.UI.UserControl
    {
        DateTimeFormatInfo ukDtfi = new CultureInfo("en-GB", false).DateTimeFormat; //--dd/MM/yyyy 

        EntityGeneratorDetails objEntityGeneratorDetails;
        SendEmail mail;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    LoadControls();
                    //CheckLoginDetails objCheckLoginDetails = new CheckLoginDetails();
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

                dsActivity = objActivityDetails.GetActivityControlDetails();

                //select 1 PurposeName
                drpSiteNames.DataSource = dsActivity.Tables[3];
                drpSiteNames.DataTextField = "SiteName";
                drpSiteNames.DataValueField = "ID";
                drpSiteNames.DataBind();

                //select 2


            }
            catch (Exception ex)
            {

            }
        }

        public void btnsave_Click(object sender, EventArgs e)
        { 


            try 
            {
                EntityGeneratorHeader objEntityGeneratorHeader = new EntityGeneratorHeader();

                objEntityGeneratorDetails = new EntityGeneratorDetails();
                mail = new SendEmail();

                
                objEntityGeneratorHeader.SiteName = drpSiteNames.SelectedValue;
                objEntityGeneratorHeader.SiteLocation = txtsitelocation.Text;
                objEntityGeneratorHeader.CarriedOutBy = txtcarriedoutby.Text;

                // objEntityGeneratorHeader.TestingStartedDate = Convert.ToDateTime(txttestingstarted.Text, ukDtfi);
               // objEntityGeneratorDetails.startDate = DateTime.ParseExact(txttestingstarted.Text, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                objEntityGeneratorHeader.TestingStartedDate = txttestingstarted.Text;

                //objEntityGeneratorHeader.TestingCompleDate = Convert.ToDateTime(txtTestingComplete.Text, ukDtfi);
              //  objEntityGeneratorDetails.CompleteDate = DateTime.ParseExact(txtTestingComplete.Text, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                objEntityGeneratorHeader.TestingCompleDate = txtTestingComplete.Text;

                objEntityGeneratorHeader.FuelTank1 =Convert.ToDecimal( txtfueltank1.Text);
                objEntityGeneratorHeader.Pump1Running = Convert.ToDecimal(txtpump1running.Text);
                objEntityGeneratorHeader.FuelTank2 = Convert.ToDecimal(txtFuelTank2.Text);
                objEntityGeneratorHeader.Pump2Running = Convert.ToDecimal( txtpump2running.Text);
                

                //Items 

                List<EntityGeneratorDetails> lstEntityGeneratorDetails = new List<EntityGeneratorDetails>();

                


                //lstEntityGeneratorHeader.Add(objEntityGeneratorHeader);

                int i = 0;
                
                for ( i= 1; i <= 3; i++)
                {

                    if (i == 1)
                    {

                             objEntityGeneratorDetails = new EntityGeneratorDetails(); 

                            //hardcorde

                            objEntityGeneratorDetails.GSeqId = 1;

                            //lubricatingoillevel

                            objEntityGeneratorDetails.LOL = cblol1.Checked;
                            objEntityGeneratorDetails.LOLvalue = Convert.ToDecimal(txtcblolValue1.Text);
                        
                            //collentlevel

                            objEntityGeneratorDetails.CI = cbcl1.Checked;
                            objEntityGeneratorDetails.CIValue = Convert.ToDecimal(txtcbclValue1.Text);


                            //collenettemperature

                            objEntityGeneratorDetails.CT = cbct1.Checked;
                            objEntityGeneratorDetails.CTValue=Convert.ToDecimal(txtcbctValue1.Text);

                            //daytanklvevl

                            objEntityGeneratorDetails.DTL = cbdtl1.Checked;
                            objEntityGeneratorDetails.DTLvalue = txtcbdtlValue1.Text;

                            //checkforoil or coolantleaked

                            objEntityGeneratorDetails.COCL = cbcocl1.Checked;
                            objEntityGeneratorDetails.COCLValue = Convert.ToDecimal(txtcbcoclValue1.Text);

                            //checkfordebris

                            objEntityGeneratorDetails.CD = cbcd1.Checked;
                            objEntityGeneratorDetails.CDValue=Convert.ToDecimal( txtcbcdValue1.Text);

                            //hoursrun

                            objEntityGeneratorDetails.HR = cbhr1.Checked;
                            objEntityGeneratorDetails.HRValue=Convert.ToDecimal (txtcbhrValue1.Text);

                            //voltages

                            objEntityGeneratorDetails.BV = cbbv1.Checked;
                            objEntityGeneratorDetails.BVValue =Convert.ToDecimal( txtcbbvValue1.Text);

                            //chargelight

                            objEntityGeneratorDetails.BCL = cbbcl1.Checked;
                            objEntityGeneratorDetails.BCLValue=Convert.ToDecimal(txtcbbclValue1.Text);

                            //chargerate

                            objEntityGeneratorDetails.BCR = cbbcr1.Checked;
                            objEntityGeneratorDetails.BCRValue =Convert.ToDecimal(txtcbbcrValue1.Text);
                        
                            //offload

                            objEntityGeneratorDetails.OffLoad = cboffloav1.Checked;
                            objEntityGeneratorDetails.OffLoadValue=Convert.ToDecimal( txtcboffloavValue1.Text);

                            //onload

                            objEntityGeneratorDetails.OnLoad = cbonload1.Checked;
                            objEntityGeneratorDetails.OnLoadValue = Convert.ToDecimal(txtcbonloadValue1.Text);

                            //checkoil or coolantleaks

                            objEntityGeneratorDetails.VCOCL = cbvcocl1.Checked;
                            objEntityGeneratorDetails.VCOCLValue = Convert.ToDecimal(txtcbvcoclValue1.Text);


                             //checkrpm
                        
                            objEntityGeneratorDetails.DRCRPM = cbdrcrpm1.Checked;
                            objEntityGeneratorDetails.DRCRPMValue = Convert.ToDecimal(txtcbdrcrpmValue1.Text);

                            //checkfrequency

                            objEntityGeneratorDetails.DRCF = cbdrcf1.Checked;
                            objEntityGeneratorDetails.DRCFValue= Convert.ToDecimal( txtcbdrcfValue1.Text);

                            //checkoil pressure

                            objEntityGeneratorDetails.DRCOP = cbdrcop1.Checked;
                            objEntityGeneratorDetails.DRCOPValue = Convert.ToDecimal(txtcbdrcopValue1.Text);

                            //check coolanttemperature

                            objEntityGeneratorDetails.DRCCT = cbdrcct1.Checked;
                            objEntityGeneratorDetails.DRCCTValue= Convert.ToDecimal (txtcbdrcctValue1.Text);

                            //check engine charge amps pss

                            objEntityGeneratorDetails.DRCECA = cbdrceca1.Checked;
                            objEntityGeneratorDetails.DRCECAValue=Convert.ToDecimal (txtcbdrcecaValue1.Text); 


                            //check volts

                            objEntityGeneratorDetails.DRCV = cbdrcv1.Checked;
                            objEntityGeneratorDetails.DRCVValue = Convert.ToDecimal( txtcbdrcvValue1.Text);

                            // check amps

                            objEntityGeneratorDetails.DRCA = cbdrca1.Checked;
                            objEntityGeneratorDetails.DRCAValue = Convert.ToDecimal (txtcbdrcaValue1.Text);


                            //daytanfilling

                            objEntityGeneratorDetails.SGACDDTF = cbsgacdtf1.Checked;
                            objEntityGeneratorDetails .SGACDDTFValue= Convert.ToDecimal(txtcbsgacdtfValue1.Text);


                            //returnedtostandbymode


                            objEntityGeneratorDetails.SGACRSM = cbsgacrsm1.Checked;
                            objEntityGeneratorDetails .SGACRSMValue= Convert.ToDecimal (txtcbsgacrsmValue1.Text);

                            //Fuel Pressure Field
                            objEntityGeneratorDetails.FPF = chkFPF1.Checked;
                            objEntityGeneratorDetails.FPFValue = Convert.ToDecimal(txtFuelPressureFields1.Text);

                        lstEntityGeneratorDetails.Add(objEntityGeneratorDetails);
                    }


                    if (i == 2)
                    {

                        objEntityGeneratorDetails = new EntityGeneratorDetails();
                        //hardcorde

                        objEntityGeneratorDetails.GSeqId = 2;

                        //lubricatingoillevel

                        objEntityGeneratorDetails.LOL = cblol2.Checked;
                        objEntityGeneratorDetails.LOLvalue = Convert.ToDecimal(txtcblolValue2.Text);

                        //collentlevel

                        objEntityGeneratorDetails.CI = cbcl2.Checked;
                        objEntityGeneratorDetails.CIValue = Convert.ToDecimal(txtcbclValue2.Text);


                        //collenettemperature


                        objEntityGeneratorDetails.CT = cbct2.Checked;
                        objEntityGeneratorDetails.CTValue = Convert.ToDecimal(txtcbctValue2.Text);                        
                        
                        //daytanklvevl
                        
                        objEntityGeneratorDetails.DTL = cbdtl2.Checked;
                        objEntityGeneratorDetails.DTLvalue = txtcbdtlValue2.Text;

                        //checkforoil or coolantleaked

                        objEntityGeneratorDetails.COCL = cbcocl2.Checked;
                        objEntityGeneratorDetails.COCLValue = Convert.ToDecimal(txtcbcoclValue2.Text);

                        //checkfordebris

                        objEntityGeneratorDetails.CD = cbcd2.Checked;
                        objEntityGeneratorDetails.CDValue = Convert.ToDecimal(txtcbcdValue2.Text);

                        //hoursrun

                        objEntityGeneratorDetails.HR = cbhr2.Checked;
                        objEntityGeneratorDetails.HRValue = Convert.ToDecimal(txtcbhrValue2.Text);

                        //voltages

                        objEntityGeneratorDetails.BV = cbbv2.Checked;
                        objEntityGeneratorDetails.BVValue = Convert.ToDecimal(txtcbbvValue2.Text);

                        //chargelight

                        objEntityGeneratorDetails.BCL = cbbcl2.Checked;
                        objEntityGeneratorDetails.BCLValue = Convert.ToDecimal(txtcbbclValue2.Text);

                        //chargerate

                        objEntityGeneratorDetails.BCR = cbbcr2.Checked;
                        objEntityGeneratorDetails.BCRValue = Convert.ToDecimal(txtcbbcrValue2.Text);

                        //offload

                        objEntityGeneratorDetails.OffLoad = cboffloav2.Checked;
                        objEntityGeneratorDetails.OffLoadValue = Convert.ToDecimal(txtcboffloavValue2.Text);

                        //onload

                        objEntityGeneratorDetails.OnLoad = cbonload2.Checked;
                        objEntityGeneratorDetails.OnLoadValue = Convert.ToDecimal(txtcbonloadValue2.Text);

                        //checkoil or coolantleaks

                        objEntityGeneratorDetails.VCOCL = cbvcocl2.Checked;
                        objEntityGeneratorDetails.VCOCLValue = Convert.ToDecimal(txtcbvcoclValue2.Text);


                        //checkrpm

                        objEntityGeneratorDetails.DRCRPM = cbdrcrpm2.Checked;
                        objEntityGeneratorDetails.DRCRPMValue = Convert.ToDecimal(txtcbdrcrpmValue2.Text);

                        //checkfrequency

                        objEntityGeneratorDetails.DRCF = cbdrcf2.Checked;
                        objEntityGeneratorDetails.DRCFValue = Convert.ToDecimal(txtcbdrcfValue2.Text);

                        //checkoil pressure

                        objEntityGeneratorDetails.DRCOP = cbdrcop2.Checked;
                        objEntityGeneratorDetails.DRCOPValue = Convert.ToDecimal(txtcbdrcopValue2.Text);

                        //check coolanttemperature

                        objEntityGeneratorDetails.DRCCT = cbdrcct2.Checked;
                        objEntityGeneratorDetails.DRCCTValue = Convert.ToDecimal(txtcbdrcctValue2.Text);

                        //check engine charge amps pss


                        objEntityGeneratorDetails.DRCECA = cbdrceca2.Checked;
                        objEntityGeneratorDetails.DRCECAValue = Convert.ToDecimal(txtcbdrcecaValue2.Text);


                        //check volts

                        objEntityGeneratorDetails.DRCV = cbdrcv2.Checked;
                        objEntityGeneratorDetails.DRCVValue = Convert.ToDecimal(txtcbdrcvValue2.Text);

                        // check amps

                        objEntityGeneratorDetails.DRCA = cbdrca2.Checked;
                        objEntityGeneratorDetails.DRCAValue = Convert.ToDecimal(txtcbdrcaValue2.Text);

                        //daytanfilling

                        objEntityGeneratorDetails.SGACDDTF = cbsgacdtf2.Checked;
                        objEntityGeneratorDetails.SGACDDTFValue = Convert.ToDecimal(txtcbsgacdtfValue2.Text);


                        //returnedtostandbymode


                        objEntityGeneratorDetails.SGACRSM = cbsgacrsm2.Checked;
                        objEntityGeneratorDetails.SGACRSMValue = Convert.ToDecimal(txtcbsgacrsmValue2.Text);

                        //Fuel Pressure Field
                        objEntityGeneratorDetails.FPF = chkFPF2.Checked;
                        objEntityGeneratorDetails.FPFValue = Convert.ToDecimal(txtFuelPressureFields2.Text);

                        lstEntityGeneratorDetails.Add(objEntityGeneratorDetails);
                    }

                    if (i == 3)
                    {
                        objEntityGeneratorDetails = new EntityGeneratorDetails();
                        //hardcorde

                        objEntityGeneratorDetails.GSeqId = 3;

                        //lubricatingoillevel

                        objEntityGeneratorDetails.LOL = cblol3.Checked;
                        objEntityGeneratorDetails.LOLvalue = Convert.ToDecimal(txtcblolValue3.Text);

                        //collentlevel

                        objEntityGeneratorDetails.CI = cbcl3.Checked;
                        objEntityGeneratorDetails.CIValue = Convert.ToDecimal(txtcbclValue3.Text);


                        //collenettemperature


                        objEntityGeneratorDetails.CT = cbct3.Checked;
                        objEntityGeneratorDetails.CTValue = Convert.ToDecimal(txtcbctValue3.Text);

                        //daytanklvevl
                        
                        objEntityGeneratorDetails.DTL = cbdtl3.Checked;
                        objEntityGeneratorDetails.DTLvalue = txtcbdtlValue3.Text;

                        //checkforoil or coolantleaked

                        objEntityGeneratorDetails.COCL = cbcocl3.Checked;
                        objEntityGeneratorDetails.COCLValue = Convert.ToDecimal(txtcbcoclValue3.Text);

                        //checkfordebris

                        objEntityGeneratorDetails.CD = cbcd3.Checked;
                        objEntityGeneratorDetails.CDValue = Convert.ToDecimal(txtcbcdValue3.Text);

                        //hoursrun

                        objEntityGeneratorDetails.HR = cbhr3.Checked;
                        objEntityGeneratorDetails.HRValue = Convert.ToDecimal(txtcbhrValue3.Text);

                        //voltages

                        objEntityGeneratorDetails.BV = cbbv3.Checked;
                        objEntityGeneratorDetails.BVValue = Convert.ToDecimal(txtcbbvValue3.Text);

                        //chargelight

                        objEntityGeneratorDetails.BCL = cbbcl3.Checked;
                        objEntityGeneratorDetails.BCLValue = Convert.ToDecimal(txtcbbclValue3.Text);

                        //chargerate

                        objEntityGeneratorDetails.BCR = cbbcr3.Checked;
                        objEntityGeneratorDetails.BCRValue = Convert.ToDecimal(txtcbbcrValue3.Text);

                        //offload

                        objEntityGeneratorDetails.OffLoad = cboffloav3.Checked;
                        objEntityGeneratorDetails.OffLoadValue = Convert.ToDecimal(txtcboffloavValue3.Text);

                        //onload

                        objEntityGeneratorDetails.OnLoad = cbonload3.Checked;
                        objEntityGeneratorDetails.OnLoadValue = Convert.ToDecimal(txtcbonloadValue3.Text);

                        //checkoil or coolantleaks

                        objEntityGeneratorDetails.VCOCL = cbvcocl3.Checked;
                        objEntityGeneratorDetails.VCOCLValue = Convert.ToDecimal(txtcbvcoclValue3.Text);


                        //checkrpm

                        objEntityGeneratorDetails.DRCRPM = cbdrcrpm3.Checked;
                        objEntityGeneratorDetails.DRCRPMValue = Convert.ToDecimal(txtcbdrcrpmValue3.Text);

                        //checkfrequency

                        objEntityGeneratorDetails.DRCF = cbdrcf3.Checked;
                        objEntityGeneratorDetails.DRCFValue = Convert.ToDecimal(txtcbdrcfValue3.Text);

                        //checkoil pressure

                        objEntityGeneratorDetails.DRCOP = cbdrcop3.Checked;
                        objEntityGeneratorDetails.DRCOPValue = Convert.ToDecimal(txtcbdrcopValue3.Text);

                        //check coolanttemperature

                        objEntityGeneratorDetails.DRCCT = cbdrcct3.Checked;
                        objEntityGeneratorDetails.DRCCTValue = Convert.ToDecimal(txtcbdrcctValue3.Text);

                        //check engine charge amps pss


                        objEntityGeneratorDetails.DRCECA = cbdrceca3.Checked;
                        objEntityGeneratorDetails.DRCECAValue = Convert.ToDecimal(txtcbdrcecaValue3.Text);


                        //check volts

                        objEntityGeneratorDetails.DRCV = cbdrcv3.Checked;
                        objEntityGeneratorDetails.DRCVValue = Convert.ToDecimal(txtcbdrcvValue3.Text);

                        // check amps

                        objEntityGeneratorDetails.DRCA = cbdrca3.Checked;
                        objEntityGeneratorDetails.DRCAValue = Convert.ToDecimal(txtcbdrcaValue3.Text);

                        //daytanfilling

                        objEntityGeneratorDetails.SGACDDTF = cbsgacdtf3.Checked;
                        objEntityGeneratorDetails.SGACDDTFValue = Convert.ToDecimal(txtcbsgacdtfValue3.Text);


                        //returnedtostandbymode


                        objEntityGeneratorDetails.SGACRSM = cbsgacrsm3.Checked;
                        objEntityGeneratorDetails.SGACRSMValue = Convert.ToDecimal(txtcbsgacrsmValue3.Text);

                        //Fuel Pressure Field
                        objEntityGeneratorDetails.FPF = chkFPF3.Checked;
                        objEntityGeneratorDetails.FPFValue = Convert.ToDecimal(txtFuelPressureFields3.Text);

                        lstEntityGeneratorDetails.Add(objEntityGeneratorDetails);
                    }

                    
                }

                string subject =("Generator for " + drpSiteNames.SelectedItem.Text.ToString());
                 string msgBody = "Hello," + "<br/>" + "<br/>"
                      + "Generator has been created and also it is saved in database." + "<br/>"
                      + "<br/>"
                      + "The Location for which Generator created is: "+ drpSiteNames.SelectedItem.Text +"<br/>"
                      + "<br/>"
                    + "-------------------------------" + "<br/>"
                    + "System Generated Mail" + "<br/>"
                    + "Please Do not reply this mail" + "<br/>" + "-------------------------------";

                //call xml method
                  InsertGenerator objInsertGenerator = new InsertGenerator();
                  Int64 outvalue  =     objInsertGenerator.InsGenerator ( GenerateXML(lstEntityGeneratorDetails), objEntityGeneratorHeader);
                  if (outvalue == 1)
                  {
                      string successFullyMailSent = mail.SendMail(subject, msgBody);
                      lblSuccessMessage.Text = string.Empty;
                      lblSuccessMessage.ForeColor = System.Drawing.Color.Green;
                      lblSuccessMessage.Text = "Successfully Inserted your Transaction" + " " + successFullyMailSent.ToString();
                      lnkClr.Visible = true;
                  }
                  else
                  {
                      lnkClr.Visible = false;
                      lblSuccessMessage.Text = string.Empty;
                      lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
                      lblSuccessMessage.Text = "Error while Insertion please contact your Adminstrator" + objEntityGeneratorDetails.ErrorMessage;
                  }


            }

            catch (Exception ex)
            {
                lblSuccessMessage.Text = string.Empty;
                lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
                lblSuccessMessage.Text = "Error while Insertion please contact your Adminstrator" + objEntityGeneratorDetails.ErrorMessage;
            }
        
        }


        public void btncancel_Click(object sender, EventArgs e)
        {

            Response.Redirect("GeneratorDetails.aspx");
        }

        private string GenerateXML(List<EntityGeneratorDetails> objRequest)
        {
            TextWriter objTextWriter = new StringWriter();
            XmlSerializer objXmlSerializer = new XmlSerializer(typeof(List<EntityGeneratorDetails>));
            objXmlSerializer.Serialize(objTextWriter, objRequest);
            objTextWriter.Flush();
            string strXML = objTextWriter.ToString();
            objTextWriter.Close();
            StringBuilder sbXML = new StringBuilder();
            
            //user class name in index of 
            sbXML.Append(strXML.Substring(strXML.IndexOf("<EntityGeneratorDetails>")));

            //sbXML.Append("<RequestOfListOfSpaceDemand>", 0, 0);
            sbXML.Insert(0, "<Items>");
            sbXML.Replace("</ArrayOfEntityGeneratorDetails>", "</Items>");
            return sbXML.ToString();

        }

        protected void lnkClr_Click(object sender, EventArgs e)
        {
            Response.Redirect("GeneratorDetails.aspx");
        }


    }
}