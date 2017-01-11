<%@ Page Title="" Language="C#" MasterPageFile="~/Hibernia.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Operations.Login" %>
<%@ Register src="UCLogin.ascx" tagname="UCLogin" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCLogin ID="UCLogin1" runat="server" />
</asp:Content>
