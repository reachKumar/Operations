<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NocHandover.ascx.cs"
    Inherits="Operations.NocHandover" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<style type="text/css">
    .titile
    {
        background-color: #009933;
        font-family: "Helvetica Neue" , "Lucida Grande" , "Segoe UI" , Arial, Helvetica, Verdana, sans-serif;
        font-size: 16px;
        font-weight: bold;
        text-align: center;
        color: White;
    }
    
    .modalbackground
    {
        background-color: gray;
        filter: alpha(opacity=50);
        opacity: 0.7;
    }
    
    .PanelDiv
    {
        min-width: 200px;
        min-height: 150px;
        background: #DFE8F6;
    }
    
    .Headerdiv
    {
        background-color: #008000;
        text-align: center;
        height: 4%;
    }
    .style2
    {
        color: #FFFFFF;
        font-size: large;
    }
    
    
    .style3
    {
        font-weight: bold;
    }
    
    
    .divpart
    {
        margin: 5px auto 0px auto;
        border: 3px solid black;
    }
</style>
<div style="width: 100%">
   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
            <div id="Selectiondiv" runat="server" class="divpart">
                <div class="Headerdiv">
                    <strong><span class="style2">Team Location(Select the team to view handover)</span>
                    </strong>
                </div>
                <div align="center">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                        RepeatDirection="Horizontal" Width="94%" AutoPostBack="True">
                        <asp:ListItem>Dublin</asp:ListItem>
                        <asp:ListItem Value="Hibernia Media">Baltimore</asp:ListItem>
                        <asp:ListItem>Pune</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div>
                    <asp:Label ID="lbllastrefeshtime" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblerrormsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </div>
                
            </div>
<%--        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" />
          
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0">
        <ProgressTemplate>
            <div id="Background">
            </div>
            <div id="Progress">
               <img src="Images/ProgressBar/loading.gif" alt="" />
                     <br /> Please wait. . . .
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>
    <div id="showhide" runat="server" style="width: 100%">
        <!--Logic -->
        <asp:ImageButton ID="imgoncallhowdiv" runat="server" Height="24px" OnClick="imgoncallhowdiv_Click"
            ImageUrl="~/Images/HideShow/plus.jpg" />
        <asp:ImageButton ID="imgoncallhidediv" runat="server" Height="24px" OnClick="imgoncallhidediv_Click"
            ImageUrl="~/Images/HideShow/minus.jpg" Visible="false" />
        <asp:Label ID="lbloncall" runat="server" Text="NoticeBoard / Out of hours Visit  / Alarams"></asp:Label>
    </div>

    <div class="divpart" id="NOCONCALLList" runat="server">
        <table style="width: 100%">
            <tr>
                <td colspan="2">
                    <div class="Headerdiv">
                        <strong><span class="style2">ON CALL LIST (ENGINEERING / OPERTIONS / IT &amp; Other)
                        </span></strong>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="platform" runat="server">
                        <ContentTemplate>
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <div style="width: 410px;" class="Headerdiv">
                                            <strong><span class="style2">Engineering Support Contacts & Escalation</span> </strong>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:GridView ID="gvEnggPlatform" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                            ForeColor="#333333" GridLines="None" BorderWidth="1px" BackColor="White" BorderColor="#3366CC"
                                            Width="410px" DataKeyNames="Tid" PageSize="5" AllowPaging="True" OnPageIndexChanging="gvEnggPlatform_PageIndexChanging">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="PlatformName" HeaderText="Platform">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="FirstEscalation" HeaderText="1st">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SecondEscalation" HeaderText="2nd">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ThirdEscalation" HeaderText="3rd">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ShowPopUp" runat="server" OnClick="ShowPopUp_Click" ImageUrl="~/Images/GridView/actionseditpage.gif"
                                                            Width="25px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <strong>
                                            <asp:LinkButton ID="lnkPlatform" runat="server">Click Here to add New Item</asp:LinkButton>
                                        </strong>
                                        <asp:ModalPopupExtender ID="ModalPopupExtender3" runat="server" DropShadow="true"
                                            DynamicServicePath="" Enabled="True" PopupControlID="PnlPlatform" TargetControlID="lnkPlatform"
                                            CancelControlID="btncancalplatform" BackgroundCssClass="modalbackground">
                                        </asp:ModalPopupExtender>
                                        <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label>
                                        &nbsp;<asp:Panel ID="PnlPlatform" runat="server" BackColor="#DFE8F6">
                                            <div class="PanelDiv">
                                                <table>
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
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            Platform
                                                        </td>
                                                        <td>
                                                            :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtplatform" runat="server" Width="125px"></asp:TextBox>
                                                            <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" CompletionInterval="0"
                                                                CompletionSetCount="1" DelimiterCharacters="" Enabled="True" MinimumPrefixLength="1"
                                                                ServiceMethod="GetPlatformName" ServicePath="" TargetControlID="txtplatform">
                                                            </asp:AutoCompleteExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            FirstEscalation
                                                        </td>
                                                        <td>
                                                            :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtfirstescal" runat="server" Width="125px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            SecondEscalation
                                                        </td>
                                                        <td>
                                                            :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtsecondescal" runat="server" Width="125px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            ThirdEscalation
                                                        </td>
                                                        <td>
                                                            :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtthirdescal" runat="server" Width="125px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <center>
                                                                <asp:Button ID="btnsaveplatform" runat="server" CssClass="btn btn-primary configure"
                                                                    OnClick="btnsaveplatform_Click" Text="Save" Width="55px" />
                                                                &nbsp;&nbsp;
                                                                <asp:Button ID="btnDeleteplatform" runat="server" CssClass="btn btn-primary configure"
                                                                    OnClick="btnDeleteplatform_Click" Text="Delete" Visible="False" Width="55px" />
                                                                &nbsp;&nbsp;
                                                                <asp:Button ID="btncancalplatform" runat="server" CssClass="btn btn-primary configure"
                                                                    Text="Cancel" Width="55px" />
                                                            </center>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <asp:TextBox ID="txtplatformtid" runat="server" Visible="false"></asp:TextBox>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnsaveplatform" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnDeleteplatform" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="platformprogress" runat="server" AssociatedUpdatePanelID="platform"
                        DisplayAfter="0">
                        <ProgressTemplate>
                            <div id="Background">
                            </div>
                            <div id="Progress">
                              <img src="Images/ProgressBar/loading.gif" alt="" />
                                 <br /> Please wait. . . .
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
                <td>
                    <asp:UpdatePanel ID="callList" runat="server">
                        <ContentTemplate>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <div style="width: 420px;" class="Headerdiv">
                                            <strong><span class="style2">Operations Persoal On Call:Week Starting:(Date)</span>
                                            </strong>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;
                                    </td>
                                    <td>
                                        <asp:GridView ID="GVCallList" runat="server" AutoGenerateColumns="False" Width="420px"
                                            CellPadding="4" DataKeyNames="TID" ForeColor="#333333" GridLines="None" AllowPaging="True"
                                            OnPageIndexChanging="GVCallList_PageIndexChanging" PageSize="5">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="NocCallList" HeaderText="Noc Call List">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Description" HeaderText="Description">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ShowCallList" runat="server" OnClick="ShowGVCallListpopup_Click"
                                                            ImageUrl="~/Images/GridView/actionseditpage.gif" Width="25px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="lnkcallList" runat="server" Style="font-weight: 700">Click Here to add New Item</asp:LinkButton>
                                        <asp:ModalPopupExtender ID="ModalPoPupCallList" runat="server" DropShadow="true"
                                            DynamicServicePath="" Enabled="True" PopupControlID="PnlCallList" TargetControlID="lnkcallList"
                                            CancelControlID="btncancelCallList" BackgroundCssClass="modalbackground">
                                        </asp:ModalPopupExtender>
                                        <asp:Panel ID="PnlCallList" runat="server" BackColor="#DFE8F6">
                                            <div class="PanelDiv">
                                                <table>
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
                                                            <%--                <asp:AutoCompleteExtender ID="AutoCompleteExtender" runat="server" 
                    CompletionInterval="0" CompletionSetCount="1" DelimiterCharacters="" 
                    Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetCallList" 
                    ServicePath="" TargetControlID="txtnocCallist">
                </asp:AutoCompleteExtender>--%>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            NOC on Call List&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtnocCallist" runat="server" Width="125px"></asp:TextBox>
                                                            <%--                <asp:AutoCompleteExtender ID="AutoCompleteExtender" runat="server" 
                    CompletionInterval="0" CompletionSetCount="1" DelimiterCharacters="" 
                    Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetCallList" 
                    ServicePath="" TargetControlID="txtnocCallist">
                </asp:AutoCompleteExtender>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            Description
                                                        </td>
                                                        <td>
                                                            :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtNOCDescription" runat="server" Width="125px" TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <center>
                                                                <asp:Button CssClass="btn btn-primary configure" ID="btnSaveCallList" runat="server"
                                                                    OnClick="btnSaveCallList_Click" Text="Save" Width="55px" />
                                                                &nbsp;&nbsp;
                                                                <asp:Button CssClass="btn btn-primary configure" ID="btnDeleteCallList" runat="server"
                                                                    OnClick="btnDeleteCallList_Click" Text="Delete" Width="55px" Visible="False" />
                                                                &nbsp;&nbsp;
                                                                <asp:Button CssClass="btn btn-primary configure" ID="btncancelCallList" runat="server"
                                                                    Text="Cancel" Width="55px" />
                                                            </center>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <asp:TextBox ID="txtCallListId" runat="server" Visible="false"></asp:TextBox>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSaveCallList" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnDeleteCallList" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="CallListprogress" runat="server" AssociatedUpdatePanelID="callList"
                        DisplayAfter="0">
                        <ProgressTemplate>
                            <div id="Background">
                            </div>
                            <div id="Progress">
                              <img src="Images/ProgressBar/loading.gif" alt="" />
                                 <br /> Please wait. . . .
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="Dept" runat="server">
                        <ContentTemplate>
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <div style="width: 500px" class="Headerdiv">
                                            <strong><span class="style2">On Call / Emergency contacts for other internal Department</span>
                                            </strong>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:GridView ID="gvDeptDetails" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                            ForeColor="#333333" GridLines="None" Width="500px" DataKeyNames="TID">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="DepartmentName" HeaderText="Department">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Contacts" HeaderText="Contacts">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="EmergencyContact" HeaderText="EmergencyNumber">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Status" HeaderText="Status">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ShowDept" runat="server" OnClick="ShowDepartmentpopup_Click"
                                                            ImageUrl="~/Images/GridView/actionseditpage.gif" Width="25px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="lnkDeptDetails" runat="server" Style="font-weight: 700">Click Here to add New Item</asp:LinkButton>
                                        <asp:ModalPopupExtender ID="ModalPopupDeptDetails" runat="server" DropShadow="true"
                                            DynamicServicePath="" Enabled="True" PopupControlID="PnlDeptDetails" TargetControlID="lnkDeptDetails"
                                            CancelControlID="btncancelDeptDetails" BackgroundCssClass="modalbackground">
                                        </asp:ModalPopupExtender>
                                        <asp:Panel ID="PnlDeptDetails" runat="server" BackColor="#DFE8F6">
                                            <div class="PanelDiv">
                                                <table>
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
                                                            <%--                <asp:AutoCompleteExtender ID="AutoCompleteExtender" runat="server" 
                    CompletionInterval="0" CompletionSetCount="1" DelimiterCharacters="" 
                    Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetCallList" 
                    ServicePath="" TargetControlID="txtnocCallist">
                </asp:AutoCompleteExtender>--%>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            Department Name&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtDeptName" runat="server" Width="125px"></asp:TextBox>
                                                            <%--                <asp:AutoCompleteExtender ID="AutoCompleteExtender" runat="server" 
                    CompletionInterval="0" CompletionSetCount="1" DelimiterCharacters="" 
                    Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetCallList" 
                    ServicePath="" TargetControlID="txtnocCallist">
                </asp:AutoCompleteExtender>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            Contact
                                                        </td>
                                                        <td>
                                                            :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtDeptContacts" runat="server" Width="125px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            Emergency Number
                                                        </td>
                                                        <td>
                                                            :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtEmergencyContact" runat="server" Width="125px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <center>
                                                                <asp:Button ID="btnSaveDeptDetails" runat="server" CssClass="btn btn-primary configure"
                                                                    OnClick="btnSaveDeptDetails_Click" Text="Save" Width="55px" />
                                                                &nbsp;&nbsp;
                                                                <asp:Button ID="btnDeleteDeptDetails" runat="server" CssClass="btn btn-primary configure"
                                                                    OnClick="btnDeleteDeptDetails_Click" Text="Delete" Visible="False" Width="55px" />
                                                                &nbsp;&nbsp;
                                                                <asp:Button ID="btncancelDeptDetails" runat="server" CssClass="btn btn-primary configure"
                                                                    Text="Cancel" Width="55px" />
                                                            </center>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <asp:TextBox ID="txtDeptDetailsID" runat="server" Visible="false"></asp:TextBox>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSaveDeptDetails" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnDeleteDeptDetails" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="Deptprogress" runat="server" AssociatedUpdatePanelID="Dept"
                        DisplayAfter="0">
                        <ProgressTemplate>
                            <div id="Background">
                            </div>
                            <div id="Progress">
                              <img src="Images/ProgressBar/loading.gif" alt="" />
                                 <br /> Please wait. . . .
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
            </tr>
        </table>
    </div>

    <asp:Panel ID="NOtickets" runat="server">
        <asp:UpdatePanel ID="notice" runat="server">
            <ContentTemplate>
                <div class="divpart" id="NoticeBoard" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <div style="width: 100%;" class="Headerdiv">
                                                <strong><span class="style2">Notice Board:(Date)</span> </strong>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtNoticeBoard" runat="server" Height="125px" TextMode="MultiLine"
                                                Width="99%" ReadOnly="True"></asp:TextBox>
                                            <asp:HtmlEditorExtender ID="txtNoticeBoard_HtmlEditorExtender" runat="server" TargetControlID="txtNoticeBoard">
                                                <Toolbar>
                                                    <asp:Undo />
                                                    <asp:Redo />
                                                    <asp:Bold />
                                                    <asp:Italic />
                                                    <asp:Underline />
                                                    <asp:StrikeThrough />
                                                    <asp:Subscript />
                                                    <asp:Superscript />
                                                    <asp:JustifyLeft />
                                                    <asp:JustifyCenter />
                                                    <asp:JustifyRight />
                                                    <asp:JustifyFull />
                                                    <asp:InsertOrderedList />
                                                    <asp:InsertUnorderedList />
                                                    <asp:CreateLink />
                                                    <asp:UnLink />
                                                    <asp:RemoveFormat />
                                                    <asp:SelectAll />
                                                    <asp:UnSelect />
                                                    <asp:Delete />
                                                    <asp:Cut />
                                                    <asp:Copy />
                                                    <asp:Paste />
                                                    <asp:BackgroundColorSelector />
                                                    <asp:ForeColorSelector />
                                                    <asp:FontNameSelector />
                                                    <asp:FontSizeSelector />
                                                    <asp:Indent />
                                                    <asp:Outdent />
                                                    <asp:InsertHorizontalRule />
                                                    <asp:HorizontalSeparator />
                                                </Toolbar>
                                            </asp:HtmlEditorExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>
                                                <asp:LinkButton ID="lbtnNoticeBoard" runat="server">Click Here to add New Item</asp:LinkButton>
                                            </b>
                                            <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" CancelControlID="btncancalnoticeboard"
                                                DropShadow="true" DynamicServicePath="" Enabled="True" PopupControlID="PnlNoticeBoard"
                                                TargetControlID="lbtnNoticeBoard" BackgroundCssClass="modalbackground">
                                            </asp:ModalPopupExtender>
                                            <asp:Panel ID="PnlNoticeBoard" runat="server" BackColor="#DFE8F6">
                                                <div class="PanelDiv">
                                                    <table>
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
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <b>ID</b>
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtpopTID" runat="server" Width="125px" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td class="style3">
                                                                <strong>Notice </strong>
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtPopNoticeBoard" runat="server" Height="125px" TextMode="MultiLine"
                                                                    Width="225px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <center>
                                                                    <asp:Button ID="btnsavenoticeboard" runat="server" CssClass="btn btn-primary configure"
                                                                        OnClick="btnsavenoticeboard_Click" Text="Save" Width="55px" />
                                                                    &nbsp;&nbsp;
                                                                    <asp:Button ID="btncancalnoticeboard" runat="server" CssClass="btn btn-primary configure"
                                                                        Text="Cancel" Width="55px" />
                                                                </center>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnsavenoticeboard" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="noticeprogress" runat="server" AssociatedUpdatePanelID="notice"
            DisplayAfter="0">
            <ProgressTemplate>
                <div id="Background">
                </div>
                <div id="Progress">
                  <img src="Images/ProgressBar/loading.gif" alt="" />
                     <br /> Please wait. . . .
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <br />
        <asp:UpdatePanel ID="alarm" runat="server">
            <ContentTemplate>
                <div class="divpart" id="Alarms" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div class="Headerdiv">
                                    <strong><span class="style2">Alarms</span> </strong>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <asp:GridView ID="GV1Details" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                ForeColor="#333333" GridLines="None" Width="410px" DataKeyNames="TID">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="T2000" HeaderText="T2000">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Critical" HeaderText="Critical">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Major" HeaderText="Major">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Minor" HeaderText="Minor">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="PlatformName" HeaderText="Platform Name">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ShowAlarmDetails" runat="server" OnClick="ShowAlarmDetails_Click"
                                                                ImageUrl="~/Images/GridView/actionseditpage.gif" Width="25px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lnkAlaram" runat="server" Style="font-weight: 700">Click Here to add New Item</asp:LinkButton>
                                            <asp:ModalPopupExtender ID="ModalPopupAlaram" runat="server" DropShadow="true" DynamicServicePath=""
                                                Enabled="True" PopupControlID="PnlAlaram" TargetControlID="lnkAlaram" BackgroundCssClass="modalbackground">
                                            </asp:ModalPopupExtender>
                                            <asp:Panel ID="PnlAlaram" runat="server" BackColor="#DFE8F6">
                                                <div class="PanelDiv">
                                                    <table>
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
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <strong>Platform</strong>
                                                            </td>
                                                            <td>
                                                                <strong>:</strong>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="Drpdwnplatform" runat="server" DataSourceID="GetPlatformValues"
                                                                    Width="125px" DataTextField="PlatformName" DataValueField="PlatformName">
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="GetPlatformValues" runat="server" ConnectionString="<%$ ConnectionStrings:NocHandOver %>"
                                                                    SelectCommand="SELECT DISTINCT PlatformName FROM Opertions.Platform"></asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <b>T2000</b>
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtT2000" runat="server" Width="125px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <b>Critical </b>
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtAlaramCritical" runat="server" Width="125px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <b>Major </b>
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtAlaramMajor" runat="server" Width="125px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <b>Minor</b>
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtAlaramMinor" runat="server" Width="125px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <center>
                                                                    <asp:Button CssClass="btn btn-primary configure" ID="btnsaveAlaram" runat="server"
                                                                        OnClick="btnsaveAlaram_Click" Text="Save" Width="55px" />
                                                                    &nbsp;&nbsp;
                                                                    <asp:Button CssClass="btn btn-primary configure" ID="btnDeleteAlaram" runat="server"
                                                                        OnClick="btnDeleteAlaram_Click" Text="Delete" Width="55px" Visible="False" />
                                                                    &nbsp;&nbsp;
                                                                    <asp:Button CssClass="btn btn-primary configure" ID="btncancalAlaram" runat="server"
                                                                        Text="Cancel" Width="55px" OnClick="btncancalAlaram_Click" />
                                                                </center>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <asp:TextBox ID="txtAlaramID" runat="server" Visible="false"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnsaveAlaram" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnDeleteAlaram" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="alarmprogress" runat="server" AssociatedUpdatePanelID="alarm"
            DisplayAfter="0">
            <ProgressTemplate>
                <div id="Background">
                </div>
                <div id="Progress">
                  <img src="Images/ProgressBar/loading.gif" alt="" />
                     <br /> Please wait. . . .
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <br />
        <asp:UpdatePanel ID="outofhour" runat="server">
            <ContentTemplate>
                <div class="divpart" id="OutofHoursVisit" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div class="Headerdiv">
                                    <strong><span class="style2">Out of Hours Visit</span> </strong>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GVoutofHoursVisit" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                ForeColor="#333333" GridLines="None" Width="630px" DataKeyNames="ID">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="ID" HeaderText="ID">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Site" HeaderText="Site">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="CompanyName" HeaderText="Company Name">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="InDateTime" HeaderText="In Date Time">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="OutDateTime" HeaderText="Out Date Time">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="WO" HeaderText="WO">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="DescriptionofWork" HeaderText="Description">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ShowOutOfhours" runat="server" OnClick="ShowOutOfhours_Click"
                                                                ImageUrl="~/Images/GridView/actionseditpage.gif" Width="25px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbloutofhoursvisit" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="lbtnoutofhours" runat="server" Style="font-weight: 700">Click Here to add New Item</asp:LinkButton>
                                            <asp:ModalPopupExtender ID="ModalPopupOutofHours" runat="server" CancelControlID="BtnCancel"
                                                DropShadow="true" DynamicServicePath="" Enabled="True" PopupControlID="PnlPoPup"
                                                TargetControlID="lbtnoutofhours" BackgroundCssClass="modalbackground">
                                            </asp:ModalPopupExtender>
                                            <asp:Panel ID="PnlPoPup" runat="server" BackColor="#DFE8F6">
                                                <div class="PanelDiv">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td class="style3">
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
                                                            <td class="style3">
                                                                <b>Site</b>
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtsite" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td class="style3">
                                                                <b>Name / Company</b>
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtcomanyname" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td class="style3">
                                                                Date/Time IN
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtdatetimein" runat="server"></asp:TextBox>
                                                                <asp:CalendarExtender ID="txtRequestedDate_CalendarExtender" runat="server" Enabled="True"
                                                                    Format="dd/MM/yyyy" TargetControlID="txtdatetimein">
                                                                </asp:CalendarExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td class="style3">
                                                                Date /Time Out
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtdatetimeout" runat="server"></asp:TextBox>
                                                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtdatetimeout"
                                                                    Format="dd/MM/yyyy">
                                                                </asp:CalendarExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td class="style3">
                                                                WO
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtWO" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td class="style3">
                                                                Description of Work
                                                            </td>
                                                            <td>
                                                                <b>:</b>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtdescofwork" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <center>
                                                                    <asp:Button CssClass="btn btn-primary configure" ID="btnsave" runat="server" OnClick="btnsave_Click"
                                                                        Text="Save" Width="55px" />
                                                                    &nbsp;&nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btnDelOutOfhours"
                                                                        runat="server" OnClick="btnDelOutOfhours_Click" Text="Delete" Visible="False" />
                                                                    &nbsp;&nbsp;
                                                                    <asp:Button CssClass="btn btn-primary configure" ID="BtnCancel" runat="server" Text="Cancel"
                                                                        Width="55px" />
                                                                </center>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <asp:TextBox ID="txtOutOfhoursID" runat="server" Visible="false"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnsave" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnDelOutOfhours" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="outofhourprogress" runat="server" AssociatedUpdatePanelID="outofhour"
            DisplayAfter="0">
            <ProgressTemplate>
                <div id="Background">
                </div>
                <div id="Progress">
                  <img src="Images/ProgressBar/loading.gif" alt="" />
                     <br /> Please wait. . . .
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </asp:Panel>

    <asp:Panel ID="Tickets" runat="server">
        <asp:UpdatePanel ID="exisitng" runat="server">
            <ContentTemplate>
                <div class="divpart" id="ExistingTickets" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div class="Headerdiv">
                                    <strong><span class="style2">Existing Tickets</span> </strong>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <center>
                                    <b>Incident Number :</b>
                                    <asp:TextBox ID="txtIncidentNumberExistingTickets" runat="server"></asp:TextBox>
                                    &nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btnSearchExistingTickets"
                                        runat="server" OnClick="btnSearchExistingTickets_Click" Text="Search" />
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="DivExistingTickets" runat="server">
                                    <center>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="GVExistingTickets" runat="server" CellPadding="4" Width="100%"
                                                        BorderWidth="1px" BackColor="White" BorderColor="#3366CC" ForeColor="#333333"
                                                        AutoGenerateColumns="False" DataKeyNames="IncidentNumber, RecId" AllowPaging="True"
                                                        OnPageIndexChanging="GVExistingTickets_PageIndexChanging" PageSize="5">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:BoundField DataField="IncidentNumber" HeaderText="Incident Number">
                                                                <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                <ItemStyle Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CreatedDateTime" HeaderText="Created Date Time">
                                                                <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                <ItemStyle Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Category" HeaderText="Category">
                                                                <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                <ItemStyle Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="OpsGroup" HeaderText="Ops Group">
                                                                <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                <ItemStyle Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CustomerName" HeaderText="Customer Name">
                                                                <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                <ItemStyle Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CircuitID" HeaderText="Circuit ID">
                                                                <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                <ItemStyle Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Status" HeaderText="Status">
                                                                <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                <ItemStyle Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Summary" HeaderText="Summary" ItemStyle-Wrap="true">
                                                                <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                <ItemStyle Width="275px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="NextAction" HeaderText="Next Action">
                                                                <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                <ItemStyle Width="275px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="CreatedDate" HeaderText="NextActionCreatedDate">
                                                                <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                <ItemStyle Width="75px" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Edit">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="SearchExistingTickets" runat="server" OnClick="SearchExistingTickets_Click"
                                                                        ImageUrl="~/Images/GridView/actionseditpage.gif" Width="25px" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblexistingtickets" runat="server"></asp:Label>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" Style="font-weight: 700"></asp:LinkButton>
                                                    <asp:ModalPopupExtender ID="ModalPopupExistingTickets" runat="server" CancelControlID="btnExisitngCancel"
                                                        DropShadow="true" DynamicServicePath="" Enabled="True" PopupControlID="PnlExistingTickets"
                                                        TargetControlID="LinkButton1" BackgroundCssClass="modalbackground ">
                                                    </asp:ModalPopupExtender>
                                                    <asp:Panel ID="PnlExistingTickets" runat="server" BackColor="#DFE8F6">
                                                        <div class="PanelDiv">
                                                            <table>
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
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <b>IncidentNumber #</b>
                                                                    </td>
                                                                    <td>
                                                                        <b>:</b>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtIncidentNumberID" runat="server" ReadOnly="True"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <b>Category</b>
                                                                    </td>
                                                                    <td>
                                                                        <b>:</b>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtExistingTicketCategory" runat="server" ReadOnly="True"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <b>Created Date Time</b>
                                                                    </td>
                                                                    <td>
                                                                        <b>:</b>
                                                                    </td>
                                                                    <td style="margin-left: 40px">
                                                                        <asp:TextBox ID="txtExistingCreatedDateTime" runat="server" ReadOnly="True"></asp:TextBox>
                                                                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" TargetControlID="txtExistingCreatedDateTime"
                                                                            Format="dd/MM/yyyy">
                                                                        </asp:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <b>Ops Group</b>
                                                                    </td>
                                                                    <td>
                                                                        <b>:</b>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtExistingOpsGroup" runat="server" ReadOnly="True"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <b>CustomerName</b>
                                                                    </td>
                                                                    <td>
                                                                        <b>:</b>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtExistingCustName" runat="server" ReadOnly="True"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <b>Circuit ID #</b>
                                                                    </td>
                                                                    <td>
                                                                        <b>:</b>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtExistingCircuitID" runat="server" ReadOnly="True"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <b>Status</b>
                                                                    </td>
                                                                    <td>
                                                                        <b>:</b>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtExistingStatus" runat="server" ReadOnly="True"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <b>Summary</b>
                                                                    </td>
                                                                    <td>
                                                                        <b>:</b>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtExistingSummary" runat="server" ReadOnly="True" TextMode="MultiLine"
                                                                            Height="200px" Width="300px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <b>Next Action</b>
                                                                    </td>
                                                                    <td>
                                                                        <b>:</b>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtExistingNextAction" runat="server" TextMode="MultiLine" Height="200px"
                                                                            Width="300px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <center>
                                                                            <asp:Button CssClass="btn btn-primary configure" ID="btnExistingSave" runat="server"
                                                                                Text="Save" OnClick="btnExistingSave_Click" Width="55px" />
                                                                            &nbsp;&nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btnExisitngCancel"
                                                                                runat="server" Text="Cancel" Width="55px" />
                                                                        </center>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <asp:TextBox ID="txtExistingTicket" runat="server" Visible="false"></asp:TextBox>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </center>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSearchExistingTickets" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnExistingSave" EventName="Click"  />
           <%--    <asp:PostBackTrigger ControlID="btnExistingSave"/>--%>
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="exisitngprogress" runat="server" AssociatedUpdatePanelID="exisitng"
            DisplayAfter="0">
            <ProgressTemplate>
                <div id="Background">
                </div>
                <div id="Progress">
                  <img src="Images/ProgressBar/loading.gif" alt="" />
                     <br /> Please wait. . . .
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <br />
        <asp:UpdatePanel ID="opened" runat="server">
            <ContentTemplate>
                <div class="divpart" id="TicketsOpened" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div class="Headerdiv">
                                    <strong><span class="style2">Tickets Opened</span> </strong>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <center>
                                    <table>
                                        <tr>
                                            <td>
                                                <center>
                                                    <b>Incident Number :</b>
                                                    <asp:TextBox ID="txtIncidentNumberNewTickets" runat="server"></asp:TextBox>
                                                    &nbsp;<asp:Button CssClass="btn btn-primary configure" ID="BtnSearchNewTickets" runat="server"
                                                        OnClick="BtnSearchNewTickets_Click" Text="Search" />
                                                </center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id="DivNewTickets" runat="server">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="GVNewTickets" runat="server" CellPadding="4" Width="100%" BorderWidth="1px"
                                                                    BackColor="White" BorderColor="#3366CC" ForeColor="#333333" AutoGenerateColumns="False"
                                                                    DataKeyNames="IncidentNumber" OnPageIndexChanging="GVNewTickets_PageIndexChanging"
                                                                    AllowPaging="True" PageSize="5">
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="IncidentNumber" HeaderText="Incident Number">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CreatedDateTime" HeaderText="Created Date Time">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Category" HeaderText="Category">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="OpsGroup" HeaderText="Ops Group">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CustomerName" HeaderText="Customer Name">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CircuitID" HeaderText="Circuit ID">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Status" HeaderText="Status">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Summary" HeaderText="Summary">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                            <ItemStyle Width="275px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="NextAction" HeaderText="Next Action">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                            <ItemStyle Width="275px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CreatedDate" HeaderText="NextActionCreatedDate">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="SearchNewTickets" runat="server" OnClick="ShowSearchNewTickets_Click"
                                                                                    ImageUrl="~/Images/GridView/actionseditpage.gif" Width="25px" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EditRowStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblnewtickets" runat="server"></asp:Label>
                                                                <asp:LinkButton ID="LinkButton2" runat="server" Style="font-weight: 700"></asp:LinkButton>
                                                                <asp:ModalPopupExtender ID="ModalPopupNewtickets" runat="server" CancelControlID="btnnewticketCancel"
                                                                    DropShadow="true" DynamicServicePath="" Enabled="True" PopupControlID="PnlNewTickets"
                                                                    TargetControlID="LinkButton2" BackgroundCssClass="modalbackground">
                                                                </asp:ModalPopupExtender>
                                                                <asp:Panel ID="PnlNewTickets" runat="server" BackColor="#DFE8F6">
                                                                    <div class="PanelDiv">
                                                                        <table>
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
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>IncidentNumber #</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtNewTicketIncidentNumber" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Category</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtnewticketCategory" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Created Date Time</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td style="margin-left: 40px">
                                                                                    <asp:TextBox ID="txtnewticketcreatedatetime" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                    <asp:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" TargetControlID="txtnewticketcreatedatetime"
                                                                                        Format="dd/MM/yyyy">
                                                                                    </asp:CalendarExtender>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Ops Group</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtnewticketOpsgroup" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>CustomerName</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtnewticketCustName" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Circuit ID #</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtnewticketcircuitid" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Status</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtnewticketstatus" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Summary</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtnewticketSummary" runat="server" ReadOnly="True" TextMode="MultiLine"
                                                                                        Height="200px" Width="300px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Next Action</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtnewticketNxtAction" runat="server" TextMode="MultiLine" Height="200px"
                                                                                        Width="300px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                </td>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <center>
                                                                                        <asp:Button CssClass="btn btn-primary configure" ID="btnnewticketsave" runat="server"
                                                                                            Text="Save" OnClick="btnnewticketsave_Click" Width="55px" />
                                                                                        &nbsp;&nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btnnewticketCancel"
                                                                                            runat="server" Text="Cancel" Width="55px" />
                                                                                    </center>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <asp:TextBox ID="txtnewticketIncidentID" runat="server" Visible="false"></asp:TextBox>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </center>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSearchNewTickets" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnnewticketsave" EventName="Click" />
             <%--  <asp:PostBackTrigger ControlID="btnnewticketsave"/>--%>
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="openedprogress" runat="server" AssociatedUpdatePanelID="opened"
            DisplayAfter="0">
            <ProgressTemplate>
                <div id="Background">
                </div>
                <div id="Progress">
                  <img src="Images/ProgressBar/loading.gif" alt="" />
                     <br /> Please wait. . . .
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <br />
        <asp:UpdatePanel ID="resolved" runat="server">
            <ContentTemplate>
                <div class="divpart" id="ResolvedTickets" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div class="Headerdiv">
                                    <strong><span class="style2">Resolved Tickets</span> </strong>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <center>
                                    <table>
                                        <tr>
                                            <td>
                                                <center>
                                                    <b>Incident Number :</b>
                                                    <asp:TextBox ID="txtIncidentCloseTickets" runat="server"></asp:TextBox>
                                                    &nbsp;<asp:Button CssClass="btn btn-primary configure" ID="BtnSearchClosedTickets"
                                                        runat="server" OnClick="BtnSearchClosedTickets_Click" Text="Search" />
                                                </center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id="DivClosedTickets" runat="server">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="GVClosedTickets" runat="server" CellPadding="4" Width="100%" BorderWidth="1px"
                                                                    BackColor="White" BorderColor="#3366CC" ForeColor="#333333" AutoGenerateColumns="False"
                                                                    DataKeyNames="IncidentNumber" AllowPaging="True" OnPageIndexChanging="GVClosedTickets_PageIndexChanging"
                                                                    PageSize="5">
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="IncidentNumber" HeaderText="Ticket #">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CustomerName" HeaderText="Customer Name">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Summary" HeaderText="Summary">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="375px" />
                                                                            <ItemStyle Width="375px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="NextAction" HeaderText="Next Action">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                            <ItemStyle Width="275px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CreatedDate" HeaderText="NextActionCreatedDate">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="SearchCloseTickets" runat="server" OnClick="ShowSearchCloseTickets_Click"
                                                                                    ImageUrl="~/Images/GridView/actionseditpage.gif" Width="25px" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EditRowStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblclosedtickets" runat="server"></asp:Label>
                                                                <asp:LinkButton ID="LinkButton3" runat="server" Style="font-weight: 700"></asp:LinkButton>
                                                                <asp:ModalPopupExtender ID="ModalPopupClosetickets" runat="server" CancelControlID="btncloseticketCancel"
                                                                    DropShadow="true" DynamicServicePath="" Enabled="True" PopupControlID="PnlCloseTickets"
                                                                    TargetControlID="LinkButton3" BackgroundCssClass="modalbackground">
                                                                </asp:ModalPopupExtender>
                                                                <asp:Panel ID="PnlCloseTickets" runat="server" BackColor="#DFE8F6">
                                                                    <div class="PanelDiv">
                                                                        <table>
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
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>IncidentNumber #</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcloseticketincidentnumber" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>CustomerName</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcloseticketcustname" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Summary</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcloseticketsummary" runat="server" ReadOnly="True" TextMode="MultiLine"
                                                                                        Height="200px" Width="300px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Next Action</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcloseticketnextaction" runat="server" TextMode="MultiLine" Height="200px"
                                                                                        Width="300px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                </td>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <center>
                                                                                        <asp:Button CssClass="btn btn-primary configure" ID="btncloseticketsave" runat="server"
                                                                                            Text="Save" OnClick="btncloseticketsave_Click" Width="55px" />
                                                                                        &nbsp;&nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btncloseticketCancel"
                                                                                            runat="server" Text="Cancel" Width="55px" />
                                                                                    </center>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <asp:TextBox ID="txtcloseticket" runat="server" Visible="false"></asp:TextBox>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </center>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSearchClosedTickets" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btncloseticketsave" EventName="Click"  />
            <%--  <asp:PostBackTrigger ControlID="btncloseticketsave"/>--%>
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="resolvedprogress" runat="server" AssociatedUpdatePanelID="resolved"
            DisplayAfter="0">
            <ProgressTemplate>
                <div id="Background">
                </div>
                <div id="Progress">
                  <img src="Images/ProgressBar/loading.gif" alt="" />
                     <br /> Please wait. . . .
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <br />
        <asp:UpdatePanel ID="provisioning" runat="server">
            <ContentTemplate>
                <div class="divpart" id="Provisioningtickets" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div class="Headerdiv">
                                    <strong><span class="style2">Provisioning Tickets</span> </strong>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <center>
                                    <table>
                                        <tr>
                                            <td>
                                                <center>
                                                    <b>Incident Number :</b>
                                                    <asp:TextBox ID="txtIncidentprovisioningticket" runat="server"></asp:TextBox>
                                                    &nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btnsearchProvisioningticket"
                                                        runat="server" OnClick="btnsearchProvisioningticket_Click" Text="Search" />
                                                </center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id="DivProvisioningTickets" runat="server">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="GVProvisioningTickets" runat="server" CellPadding="4" Width="100%"
                                                                    BorderWidth="1px" BackColor="White" BorderColor="#3366CC" ForeColor="#333333"
                                                                    AutoGenerateColumns="False" DataKeyNames="IncidentNumber" AllowPaging="True"
                                                                    OnPageIndexChanging="GVProvisioningTickets_PageIndexChanging" PageSize="5">
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="IncidentNumber" HeaderText="Incident Number">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CreatedDateTime" HeaderText="Created Date Time">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Category" HeaderText="Category">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="OpsGroup" HeaderText="Ops Group">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CustomerName" HeaderText="Customer Name">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CircuitID" HeaderText="Circuit ID">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Status" HeaderText="Status">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Summary" HeaderText="Summary">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                            <ItemStyle Width="275px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="NextAction" HeaderText="Next Action">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                            <ItemStyle Width="275px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CreatedDate" HeaderText="NextActionCreatedDate">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="SearchProvisioningTickets" runat="server" OnClick="ShowSearchProvisioningTickets_Click"
                                                                                    ImageUrl="~/Images/GridView/actionseditpage.gif" Width="25px" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EditRowStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblprovisioningtickets" runat="server"></asp:Label>
                                                                <asp:LinkButton ID="LinkButton4" runat="server" Style="font-weight: 700"></asp:LinkButton>
                                                                <asp:ModalPopupExtender ID="ModalPopupProvisioningticket" runat="server" CancelControlID="btnprovisioningticketcancel"
                                                                    DropShadow="true" DynamicServicePath="" Enabled="True" PopupControlID="PnlprovisioningTickets"
                                                                    TargetControlID="LinkButton4" BackgroundCssClass="modalbackground">
                                                                </asp:ModalPopupExtender>
                                                                <asp:Panel ID="PnlprovisioningTickets" runat="server" BackColor="#DFE8F6">
                                                                    <div class="PanelDiv">
                                                                        <table>
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
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>IncidentNumber #</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtprovisioningticketincidentnumber" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Category</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtprovisioningticketcategory" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Created Date Time</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td style="margin-left: 40px">
                                                                                    <asp:TextBox ID="txtprovisioningticketcreateddatetime" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                    <%--<asp:CalendarExtender ID="CalendarExtender3" runat="server" 
             Enabled="True" TargetControlID="txtnewticketcreatedatetime" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Ops Group</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtprovisioningticketopsgroup" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>CustomerName</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtprovisioningticketcustname" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Circuit ID #</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtprovisioningticketcircuitid" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Status</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtprovisioningticketstatus" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Summary</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtprovisioningticketsummary" runat="server" ReadOnly="True" TextMode="MultiLine"
                                                                                        Height="200px" Width="300px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Next Action</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtprovisioningticketnextaction" runat="server" TextMode="MultiLine"
                                                                                        Height="200px" Width="300px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                </td>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <center>
                                                                                        <asp:Button CssClass="btn btn-primary configure" ID="btnprovisioningticketsave" runat="server"
                                                                                            Text="Save" OnClick="btnprovisioningticketsave_Click" Width="55px" />
                                                                                        &nbsp;&nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btnprovisioningticketcancel"
                                                                                            runat="server" Text="Cancel" Width="55px" />
                                                                                    </center>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <asp:TextBox ID="txtProvisioningticket" runat="server" Visible="false"></asp:TextBox>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </center>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnsearchProvisioningticket" EventName="Click" />
             <asp:AsyncPostBackTrigger ControlID="btnprovisioningticketsave" EventName="Click"  />
               <%-- <asp:PostBackTrigger ControlID="btnprovisioningticketsave"/>--%>
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="provisioningprogress" runat="server" AssociatedUpdatePanelID="provisioning"
            DisplayAfter="0">
            <ProgressTemplate>
                <div id="Background">
                </div>
                <div id="Progress">
                  <img src="Images/ProgressBar/loading.gif" alt="" />
                     <br /> Please wait. . . .
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <br />
        <asp:UpdatePanel ID="access" runat="server">
            <ContentTemplate>
                <div class="divpart" id="AccessRequest" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div class="Headerdiv">
                                    <strong><span class="style2">Access Request</span> </strong>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <center>
                                    <table>
                                        <tr>
                                            <td>
                                                <center>
                                                    <b>Incident Number :</b>
                                                    <asp:TextBox ID="txtIncidentaccessrequest" runat="server"></asp:TextBox>
                                                    &nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btnsearchAccessrequest"
                                                        runat="server" OnClick="btnsearchAccessrequest_Click" Text="Search" />
                                                </center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id="DivAccessRequest" runat="server">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="GVAccessRequest" runat="server" CellPadding="4" Width="100%" BorderWidth="1px"
                                                                    BackColor="White" BorderColor="#3366CC" ForeColor="#333333" AutoGenerateColumns="False"
                                                                    DataKeyNames="IncidentNumber" AllowPaging="True" OnPageIndexChanging="GVAccessRequest_PageIndexChanging"
                                                                    PageSize="5">
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="IncidentNumber" HeaderText="Incident Number">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CreatedDateTime" HeaderText="Created Date Time">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Category" HeaderText="Category">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="OpsGroup" HeaderText="Ops Group">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CustomerName" HeaderText="Customer Name">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CircuitID" HeaderText="Circuit ID">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Status" HeaderText="Status">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Summary" HeaderText="Summary">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                            <ItemStyle Width="275px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="NextAction" HeaderText="Next Action">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                            <ItemStyle Width="275px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CreatedDate" HeaderText="NextActionCreatedDate">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="SearchAccessRequest" runat="server" OnClick="ShowSearchAccessRequest_Click"
                                                                                    ImageUrl="~/Images/GridView/actionseditpage.gif" Width="25px" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EditRowStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblaccessrequest" runat="server"></asp:Label>
                                                                <asp:LinkButton ID="LinkButton5" runat="server" Style="font-weight: 700"></asp:LinkButton>
                                                                <asp:ModalPopupExtender ID="ModalPopupAccessRequest" runat="server" CancelControlID="btnaccessrequestCancel"
                                                                    DropShadow="true" DynamicServicePath="" Enabled="True" PopupControlID="PnlAccessRequest"
                                                                    TargetControlID="LinkButton5" BackgroundCssClass="modalbackground">
                                                                </asp:ModalPopupExtender>
                                                                <asp:Panel ID="PnlAccessRequest" runat="server" BackColor="#DFE8F6">
                                                                    <div class="PanelDiv">
                                                                        <table>
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
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>IncidentNumber #</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtaccessrequestincidentnumber" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Category</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtaccessrequestCategory" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Created Date Time</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td style="margin-left: 40px">
                                                                                    <asp:TextBox ID="txtaccessrequestcreateddatetime" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                    <%--<asp:CalendarExtender ID="CalendarExtender3" runat="server" 
             Enabled="True" TargetControlID="txtnewticketcreatedatetime" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Ops Group</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtaccessrequestopsgroup" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>CustomerName</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtaccessrequestcustname" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Circuit ID #</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtaccessrequestcircuitId" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Status</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtaccessrequeststatus" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Summary</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtaccessrequestsummary" runat="server" ReadOnly="True" TextMode="MultiLine"
                                                                                        Height="200px" Width="300px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Next Action</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtaccessrequestnextaction" runat="server" TextMode="MultiLine"
                                                                                        Height="200px" Width="300px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                </td>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <center>
                                                                                        <asp:Button CssClass="btn btn-primary configure" ID="btnaccessrequestSave" runat="server"
                                                                                            Text="Save" OnClick="btnaccessrequestSave_Click" Width="55px" />
                                                                                        &nbsp;&nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btnaccessrequestCancel"
                                                                                            runat="server" Text="Cancel" Width="55px" />
                                                                                    </center>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <asp:TextBox ID="txtAccessRequest" runat="server" Visible="false"></asp:TextBox>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </center>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnsearchAccessrequest" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnaccessrequestSave" EventName="Click" />
              <%--<asp:PostBackTrigger ControlID="btnaccessrequestSave"/>--%>
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="accessprogress" runat="server" AssociatedUpdatePanelID="access"
            DisplayAfter="0">
            <ProgressTemplate>
                <div id="Background">
                </div>
                <div id="Progress">
                  <img src="Images/ProgressBar/loading.gif" alt="" />
                     <br /> Please wait. . . .
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <br />
        <asp:UpdatePanel ID="customer" runat="server">
            <ContentTemplate>
                <div class="divpart" id="CustomerRequest" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div class="Headerdiv">
                                    <strong><span class="style2">Customer Service Requests</span> </strong>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <center>
                                    <table>
                                        <tr>
                                            <td>
                                                <center>
                                                    <b>Incident Number :</b>
                                                    <asp:TextBox ID="txtIncidentCustServiceRequest" runat="server"></asp:TextBox>
                                                    &nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btnsearchCustServiceRequest"
                                                        runat="server" OnClick="btnsearchCustServiceRequest_Click" Text="Search" />
                                                </center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id="DivIncidentCustServiceRequest" runat="server">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="GVCustomerServiceRequests" runat="server" CellPadding="4" Width="100%"
                                                                    BorderWidth="1px" BackColor="White" BorderColor="#3366CC" ForeColor="#333333"
                                                                    AutoGenerateColumns="False" DataKeyNames="IncidentNumber" AllowPaging="True"
                                                                    OnPageIndexChanging="GVCustomerServiceRequests_PageIndexChanging" PageSize="5">
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="IncidentNumber" HeaderText="Incident Number">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CreatedDateTime" HeaderText="Created Date Time">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Category" HeaderText="Category">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="OpsGroup" HeaderText="Ops Group">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CustomerName" HeaderText="Customer Name">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CircuitID" HeaderText="Circuit ID">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Status" HeaderText="Status">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Summary" HeaderText="Summary">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                            <ItemStyle Width="275px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="NextAction" HeaderText="Next Action">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="275px" />
                                                                            <ItemStyle Width="275px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CreatedDate" HeaderText="NextActionCreatedDate">
                                                                            <HeaderStyle HorizontalAlign="Center" Width="75px" />
                                                                            <ItemStyle Width="75px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="SearchCustServiceRequest" runat="server" OnClick="ShowSearchCustServiceRequest_Click"
                                                                                    ImageUrl="~/Images/GridView/actionseditpage.gif" Width="25px" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EditRowStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblCustomerServiceRequest" runat="server"></asp:Label>
                                                                <asp:LinkButton ID="LinkButton6" runat="server" Style="font-weight: 700"></asp:LinkButton>
                                                                <asp:ModalPopupExtender ID="ModalPopupCustServiceRequest" runat="server" CancelControlID="btnCustServicerequestCancel"
                                                                    DropShadow="true" DynamicServicePath="" Enabled="True" PopupControlID="PnlCustServiceRequest"
                                                                    TargetControlID="LinkButton6" BackgroundCssClass="modalbackground">
                                                                </asp:ModalPopupExtender>
                                                                <asp:Panel ID="PnlCustServiceRequest" runat="server" BackColor="#DFE8F6">
                                                                    <div class="PanelDiv">
                                                                        <table>
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
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>IncidentNumber #</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcustservicereqincidentNum" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Category</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcustservicereqcategory" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Created Date Time</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td style="margin-left: 40px">
                                                                                    <asp:TextBox ID="txtcustservicereqcreateddatetime" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                    <%--<asp:CalendarExtender ID="CalendarExtender3" runat="server" 
             Enabled="True" TargetControlID="txtnewticketcreatedatetime" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Ops Group</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcustservicereqopsgroup" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>CustomerName</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcustservicereqcustname" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Circuit ID #</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcustservicereqcircuitID" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Status</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcustservicereqStatus" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Summary</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcustservicereqSummary" runat="server" ReadOnly="True" TextMode="MultiLine"
                                                                                        Height="200px" Width="300px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <b>Next Action</b>
                                                                                </td>
                                                                                <td>
                                                                                    <b>:</b>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtcustservicereqNxtAction" runat="server" TextMode="MultiLine"
                                                                                        Height="200px" Width="300px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                </td>
                                                                                <td>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <center>
                                                                                        <asp:Button CssClass="btn btn-primary configure" ID="btnCustServicerequestSave" runat="server"
                                                                                            Text="Save" Width="55px" OnClick="btnCustServicerequestSave_Click" />
                                                                                        &nbsp;&nbsp;<asp:Button CssClass="btn btn-primary configure" ID="btnCustServicerequestCancel"
                                                                                            runat="server" Text="Cancel" Width="55px" />
                                                                                    </center>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <asp:TextBox ID="txtCustServiceRequest" runat="server" Visible="false"></asp:TextBox>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </center>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnsearchCustServiceRequest" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnCustServicerequestSave" EventName="Click" />
            <%--  <asp:PostBackTrigger ControlID="btnCustServicerequestSave"/>--%>
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="customerprogress" runat="server" AssociatedUpdatePanelID="customer"
            DisplayAfter="0">
            <ProgressTemplate>
                <div id="Background">
                </div>
                <div id="Progress">
                  <img src="Images/ProgressBar/loading.gif" alt="" />
                     <br /> Please wait. . . .
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </asp:Panel>
</div>
