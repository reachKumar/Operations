<%@ Page Title="" Language="C#" MasterPageFile="~/ReportsSite.Master" AutoEventWireup="true" CodeBehind="SSRSNetWorkOutages.aspx.cs" Inherits="Operations.SSRSNetWorkOutages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentReports" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentReports" runat="server">

 <iframe src ="http://hibdb2008/ReportServer/Pages/ReportViewer.aspx?%2fApplications%2fNetOps%2fNetworkOutages&rs:Command=Render" width="1024px"  frameborder="0"  height="625px">
        
        </iframe>
</asp:Content>
