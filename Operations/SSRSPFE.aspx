<%@ Page Title="" Language="C#" MasterPageFile="~/ReportsSite.Master" AutoEventWireup="true" CodeBehind="SSRSPFE.aspx.cs" Inherits="Operations.SSRSPFE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentReports" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentReports" runat="server">
 <iframe src ="http://ssrs.hibernianetworks.com/ReportServer_SHAREPOINT/Pages/ReportViewer.aspx?%2fPFE%2fPFE&rs:Command=Render" width="100%"  frameborder="0"   height="625px">
        
        </iframe>
</asp:Content>
