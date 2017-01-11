<%@ Page Title="" Language="C#" MasterPageFile="~/ReportsSite.Master" AutoEventWireup="true" CodeBehind="GeneratorDetails.aspx.cs" Inherits="Operations.GeneratorDetails" %>


<%@ Register src="ModuleUC/WUCGenerator.ascx" tagname="WUCGenerator" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentReports" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentReports" runat="server">
 
    <uc1:WUCGenerator ID="WUCGenerator1" runat="server" />
 
</asp:Content>
