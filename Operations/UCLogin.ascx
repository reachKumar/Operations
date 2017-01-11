<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLogin.ascx.cs" Inherits="Operations.UCLogin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<style type="text/css">
    .style5
    {
    }
    .style6
    {
        width: 130px;
    }
</style>
<script language="JavaScript" type="text/javascript">
    function btnClick() {

        var txt1 = document.getElementById('<%= txtusername.ClientID %>');
        var txt2 = document.getElementById('<%= txtpassword.ClientID %>');
        // if (txt1.value == "" && txt2.value == "") {
        if (txt1.value == "ENTER USER NAME") {
            txt1.style.borderColor = "Red";
            // txt2.style.borderColor = "Red";
        }
        else {
            txt1.style.BorderColor = "";
            //txt2.style.borderColor = "";
        }

        //        if (txt2.value == "") {
        //            txt2.style.borderColor = "Red";
        //        }
        //        else if (txt1.value == "") {
        //            txt2.style.borderColor = "Red";
        //        }
        //        else {
        //            txt2.style.BorderColor = "";
        //            txt2.style.borderColor = "";
        //        }
    }
</script>
<div runat="server" id="LoginDiv">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <center>
            <table cellspacing="2">
                <tr>
                    <td height="42" colspan="2">
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="color: #283c46">
                        Please enter your username and password without domain name.
                    </td>
                </tr>
                <tr>
                    <td class="bold green alignright">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td class="bold green">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtusername">Username:</asp:Label>
                    </td>
                    <td>
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtusername" runat="server" CssClass="ddl"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername"
                            CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                            ValidationGroup="LoginUserValidationGroup" Font-Bold="True" Font-Size="Large">*</asp:RequiredFieldValidator>
                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender10" runat="server" WatermarkText="ENTER USER NAME"
                            TargetControlID="txtusername" WatermarkCssClass="watermark">
                        </asp:TextBoxWatermarkExtender>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" height="5">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="txtpassword">Password:</asp:Label>
                    </td>
                    <td>
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtpassword" runat="server" CssClass="ddl" TextMode="Password"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender11" runat="server" WatermarkText="ENTER PASSWORD"
                            TargetControlID="txtpassword" WatermarkCssClass="watermark">
                        </asp:TextBoxWatermarkExtender>
                    </td>
                </tr>
                <tr>
                    <td height="5">
                    </td>
                    <td colspan="2" height="5">
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: right; position: fixed; left: 54%;">
                        <asp:Button ID="btnlogin"  CssClass="btn btn-primary configure"
                            OnClick="btnlogin_Click" Text="Log In" ValidationGroup="LoginUserValidationGroup"
                            OnClientClick="btnClick();" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                     <asp:Label ID="lblerrormsg" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblsuccessmsg" runat="server" ForeColor="#009933"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br />
                        <strong style="font-size: large; text-decoration: underline;">Login Info:- </strong>
                        <br />
                        Admin Username : admin, password :- admin
                        <br />
                        Normal Password :- user, password :- user
                    </td>
                </tr>
            </table>
        </center>
        <%--<div>
    <table style="width:100%;">
        <tr>
            <td class="style6" >
         <h2>
        Log In
    </h2>
                </td>
            <td>
                </td>
        </tr>

        <tr>
            <td class="style5" colspan="2">
             Please enter your username and password.
               </td>
        </tr>

        <tr>
            <td class="style5" colspan="2">
                &nbsp;</td>
        </tr>

        <tr>
            <td class="style6" >
               
                    <asp:Label ID="lblUserName" runat="server" Font-Bold="True" ForeColor="Black" 
                        AssociatedControlID="txtUserName" Font-Size="14pt">Username:</asp:Label>
            </td>
            

            <td>
                    <asp:TextBox ID="txtusername" runat="server" CssClass="textEntry"  Height="25px"
Font-Size="10" Font-Names="Verdana"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="txtUserName" 
                             CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2"  TargetControlID ="txtUserName" runat="server" WatermarkText ="Enter User Name">
                </asp:TextBoxWatermarkExtender>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6"  >
              
                    <asp:Label ID="lblPassword" runat="server"  Font-Bold="True" ForeColor="Black" Font-Size="14pt" AssociatedControlID="txtPassword">Password:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtpassword" runat="server" CssClass="passwordEntry" 
                TextMode="Password"  Height="25px"
                Font-Size="10" Font-Names="Verdana"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txtPassword" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
     
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" TargetControlID = "txtPassword" WatermarkText ="Enter Your Password">
                </asp:TextBoxWatermarkExtender></td>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
              
              <asp:Button ID="btnlogin" CssClass="btn btn-primary configure" runat="server" Text="Log In" 
                   ValidationGroup="LoginUserValidationGroup"  Font-Bold="True" onclick="btnlogin_Click"/>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
              <asp:Label ID="lblerrormsg" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblsuccessmsg" runat="server" ForeColor="#009933"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            <br />
              <strong style="font-size: large; text-decoration: underline;">  Login Info:- </strong>
                <br /> Admin Username : admin, password :- admin
                <br />Normal Password :- user, password :- user
                </td>
        </tr>
    </table>
</div>--%>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnlogin" EventName="click" />
    </Triggers>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
        DisplayAfter="0">
        <ProgressTemplate>
            <div style="position: fixed; top: 0px; bottom: 0px; left: 0px; right: 0px; background-color: Gray;
                filter: alpha(opacity=40); opacity: 0.4;">
            </div>
            <div style="position: fixed; left: 41%; top: 40%; z-index: 100600; background-color: white;
                width: 221px; height: 35px; border: 1px solid Black; padding: 5px;">
                <img src="../Images/ProgressBar/AnimatedProgress.gif" alt="" />
                Processing, please wait...
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</div>
