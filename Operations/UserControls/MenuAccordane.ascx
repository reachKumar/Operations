<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuAccordane.ascx.cs" Inherits="Operations.UserControls.MenuAccordane" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

 <link rel="stylesheet" type="text/css" href="../Styles/Accordion.css" media="screen"/>

<asp:Accordion ID="Accordion1" CssClass="pankaj" HeaderCssClass="accordionMenuHeader"
                HeaderSelectedCssClass="accordionHeaderSelectedMenu"
                runat="server">

                <Panes>
                    <asp:AccordionPane runat="server" ID="APReports">
                        <Header>
                            <li><a class="">Reports</a></Header>
                        <Content>
                              <%--  <li class="accordionMenuContents"><a href="SSRSActivity.aspx">Activity</a> </li>
                                <li class="accordionMenuContents"><a href="SSRSNetOpsRegion.aspx">Generator Weekly Testing</a> </li>--%>
                                  <li class="accordionMenuContents"><a href="SSRSUpdateonExisting.aspx">Update on Existing</a> </li>
                                   <li class="accordionMenuContents"><a href="SSRSNewIncidence.aspx">New Incident</a> </li>
                                    <li class="accordionMenuContents"><a href="SSRSWorkOrders.aspx">Work Orders</a> </li>
                                       <li class="accordionMenuContents"><a href="SSRSNetWorkOutages.aspx">Network Outages</a> </li>
                                <li class="accordionMenuContents"><a href="SSRSMaintance.aspx">Maintenance</a> </li>
                                    <li class="accordionMenuContents"><a href="SSRSPFE.aspx">PFE</a> </li>
    
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="APSpanReport" runat="server">
                        <Header> 
                            <li><a class="">Span Report</a>
                        </Header>
                        <Content>
                            <div id="MyPerformance" runat="server">
                                    <li class="accordionMenuContents"><a href="SSRSSpanID.aspx">Span ID</a> </li>
                                     <li class="accordionMenuContents"><a href="SSRSSpanRegion.aspx">Span Region</a> </li>
                            </div>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="APShiftHandover" runat="server">
                        <Header>
                            <li><a class="">Shift Handover</a>
                        </Header>
                        <Content>
                               <li class="accordionMenuContents"><a href="NOCCallList.aspx">NOCOnCallList</a> </li>
                                 <li class="accordionMenuContents"><a href="ShiftHandover.aspx">Shift Handover</a> </li>
                              
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane runat="server" ID="APNocDashboard">
                        <Header>
                            <li><a class="">NOC Dashboard</a></Header>
                        <Content>
                                <li class="accordionMenuContents"><a href="NOCDashboard.aspx">Dashboard</a> </li>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane runat="server" ID="APPFE">
                        <Header>
                            <li><a class="">PFE</a></Header>
                        <Content>
                                <li class="accordionMenuContents"><a href="PFE.aspx">Dashboard</a> </li>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="ActivityOrGenerator" runat="server">
                        <Header>
                            <li><a class="">ActivityORGenerator</a>
                        </Header>
                        <Content>
                               <li class="accordionMenuContents"><a href="../PopActivity.aspx">Pop Activity</a> </li>
                                 <li class="accordionMenuContents"><a href="../GeneratorDetails.aspx">Generator Details</a> </li>
                              
                        </Content>
                    </asp:AccordionPane>

                    
                </Panes>

</asp:Accordion>