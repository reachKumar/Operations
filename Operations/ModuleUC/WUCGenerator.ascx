<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUCGenerator.ascx.cs"
    Inherits="Operations.WUCGenerator" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<link href="Styles/Accordion.css" rel="stylesheet" type="text/css" />
<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</asp:ToolkitScriptManager>--%>
<table class="TableWidth" align="center" cellspacing="1">
    <tr>
        <td colspan="3">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SSRSGeneratorReport.aspx"
                Font-Underline="True" ForeColor="Blue">Generator Weekly Reports</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <p>
                <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label>
            &nbsp;
                <asp:LinkButton ID="lnkClr" runat="server" onclick="lnkClr_Click" 
                    Visible="False">Clear All For New Entry</asp:LinkButton>
            </p>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Accordion ID="Accordion1" CssClass="accordion" HeaderCssClass="accordionHeader"
                HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent"
                runat="server">
                <Panes>
                    <asp:AccordionPane runat="server">
                        <Header>
                            Generator Weekly Testing
                        </Header>
                        <Content>
                            <table>
                                <tr>
                                    <td colspan="3">
                                        Generator Weekly Testing Record
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Site
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drpSiteNames" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Site Location
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtsitelocation" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Carried Out By
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtcarriedoutby" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        TestingStarted
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txttestingstarted" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="CEtxttestingstarted" Format="dd/MM/yyyy HH:mm" TargetControlID="txttestingstarted"
                                            runat="server">
                                        </asp:CalendarExtender>
                                         <asp:FilteredTextBoxExtender ID="filterredStartDate" runat="server" TargetControlID="txttestingstarted"
                                    InvalidChars=",#$@%^!*'';\.=()&<>+-?|{}[]_`~abcdefghijklmnopqrstuvwxyz" FilterMode="InvalidChars" FilterType="Custom">
                                </asp:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Testing Complete
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTestingComplete" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="CEtxtTestingComplete" Format="dd/MM/yyyy HH:mm" TargetControlID="txtTestingComplete"
                                            runat="server">
                                        </asp:CalendarExtender>
                                        <asp:FilteredTextBoxExtender ID="filterredStartComplete" runat="server" TargetControlID="txtTestingComplete"
                                    InvalidChars=",#$@%^!*'';\.=()&<>+-?|{}[]_`~abcdefghijklmnopqrstuvwxyz" FilterMode="InvalidChars" FilterType="Custom">
                                </asp:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Fuel Tank 1
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtfueltank1" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Pump 1 Running
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtpump1running" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Fuel Tank 2
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtFuelTank2" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Pump 2 Running
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtpump2running" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="APGenerator1" runat="server">
                        <Header>
                            Generator 1
                        </Header>
                        <Content>
                            <table>
                                <tr>
                                    <td colspan="5">
                                        Pre start Checks:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Lubriccating Oil Level
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cblol1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcblolValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Coolent Level
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbcl1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbclValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Coolant Temperature
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbct1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbctValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &#39;C
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Day Tank Level
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdtl1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdtlValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check for Oil / Coolant Leaks
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbcocl1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbcoclValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check for debris
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbcd1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbcdValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Hours Run
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbhr1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbhrValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        hrs.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Batteries</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Voltage
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbbv1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbbvValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Volts
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Charge Light
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbbcl1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbbclValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Charge Rate
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbbcr1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbbcrValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Amps
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Start the Generator</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Off Load
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cboffloav1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcboffloavValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        On Load
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbonload1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbonloadValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        KW
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Visual Checks</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Oil / Coolant Leaks
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbvcocl1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbvcoclValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Display Readings</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check RPM
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcrpm1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcrpmValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        RPM
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Frequency
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcf1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcfValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Hz
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Oil Pressure Bewteen 480 - 550 KPA)
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcop1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcopValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        KPA
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Coolant Temperature (Between 70 - 80'C)
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcct1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcctValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &#39;C
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Engine Charge Amps
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrceca1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcecaValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Amps
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Volts
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcv1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcvValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Volts
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Amps
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrca1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcaValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Amps
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Fuel Pressure Fields
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkFPF1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtFuelPressureFields1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        KPA
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Stop the Generator and allow cool down</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Day tank filling
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbsgacdtf1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbsgacdtfValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Returned to standby mode
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbsgacrsm1" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbsgacrsmValue1" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="APGenerator2" runat="server">
                        <Header>
                            Generator 2
                        </Header>
                        <Content>
                            <table>
                                <tr>
                                    <td colspan="5">
                                        Pre start Checks:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Lubriccating Oil Level
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cblol2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcblolValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Coolent Level
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbcl2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbclValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Coolant Temperature
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbct2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbctValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &#39;C
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Day Tank Level
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdtl2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdtlValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check for Oil / Coolant Leaks
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbcocl2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbcoclValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check for debris
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbcd2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbcdValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Hours Run
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbhr2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbhrValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        hrs.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Batteries</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Voltage
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbbv2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbbvValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Volts
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Charge Light
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbbcl2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbbclValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Charge Rate
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbbcr2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbbcrValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Amps
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Start the Generator</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Off Load
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cboffloav2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcboffloavValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        On Load
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbonload2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbonloadValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        KW
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Visual Checks</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Oil / Coolant Leaks
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbvcocl2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbvcoclValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Display Readings</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check RPM
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcrpm2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcrpmValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        RPM
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Frequency
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcf2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcfValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Hz
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Oil Pressure Bewteen 480 - 550 KPA)
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcop2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcopValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        KPA
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Coolant Temperature (Between 70 - 80'C)
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcct2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcctValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &#39;C
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Engine Charge Amps
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrceca2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcecaValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Amps
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Volts
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcv2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcvValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Volts
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Amps
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrca2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcaValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Amps
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Fuel Pressure Fields
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkFPF2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtFuelPressureFields2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        KPA
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Stop the Generator and allow cool down</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Day tank filling
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbsgacdtf2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbsgacdtfValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Returned to standby mode
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbsgacrsm2" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbsgacrsmValue2" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="APGenerator3" runat="server">
                        <Header>
                            Generator 3
                        </Header>
                        <Content>
                            <table>
                                <tr>
                                    <td colspan="5">
                                        Pre start Checks:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Lubriccating Oil Level
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cblol3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcblolValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Coolent Level
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbcl3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbclValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Coolant Temperature
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbct3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbctValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &#39;C
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Day Tank Level
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdtl3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdtlValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check for Oil / Coolant Leaks
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbcocl3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbcoclValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check for debris
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbcd3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbcdValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Hours Run
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbhr3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbhrValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        hrs.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Batteries</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Voltage
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbbv3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbbvValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Volts
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Charge Light
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbbcl3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbbclValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Charge Rate
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbbcr3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbbcrValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Amps
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Start the Generator</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Off Load
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cboffloav3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcboffloavValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        On Load
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbonload3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbonloadValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        KW
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Visual Checks</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Oil / Coolant Leaks
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbvcocl3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbvcoclValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Display Readings</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check RPM
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcrpm3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcrpmValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        RPM
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Frequency
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcf3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcfValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Hz
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Oil Pressure Bewteen 480 - 550 KPA)
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcop3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcopValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        KPA
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Coolant Temperature (Between 70 - 80'C)
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcct3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcctValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &#39;C
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Engine Charge Amps
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrceca3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcecaValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Amps
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Volts
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrcv3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcvValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Volts
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Check Amps
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbdrca3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbdrcaValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Amps
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Fuel Pressure Fields
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkFPF3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtFuelPressureFields3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        KPA
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <u>Stop the Generator and allow cool down</u>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Day tank filling
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbsgacdtf3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbsgacdtfValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Returned to standby mode
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbsgacrsm3" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox Text="0" ID="txtcbsgacrsmValue3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="Submit" />
                                        <asp:Button ID="btncancel" runat="server" OnClick="btncancel_Click" Text="Cancel" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </Content>
                    </asp:AccordionPane>
                </Panes>
            </asp:Accordion>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
</table>
