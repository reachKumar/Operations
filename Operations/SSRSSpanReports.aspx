<%@ Page Title="" Language="C#" MasterPageFile="~/ReportsSite.Master" AutoEventWireup="true" CodeBehind="SSRSSpanReports.aspx.cs" Inherits="Operations.SSRSSpanReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentReports" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentReports" runat="server">
<iframe src ="http://ssrs.hibernianetworks.com/ReportServer_SHAREPOINT/Pages/ReportViewer.aspx?%2fNetOps%2fSpans&rs:Command=Render" width="1024px"  frameborder="0"   height="625px">
        
        </iframe>

</asp:Content>
