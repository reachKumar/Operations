<%@ Page Title="" Language="C#" MasterPageFile="~/ReportsSite.Master"  AutoEventWireup="true" CodeBehind="PopActivity.aspx.cs" Inherits="Operations.PopActivity" %>
<%@ Register src="UCActivity.ascx" tagname="UCActivity" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentReports" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentReports" runat="server">
    <uc1:UCActivity ID="UCActivity1" runat="server" />

   
</asp:Content>
