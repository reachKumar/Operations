<%@ Page Title="" Language="C#" MasterPageFile="~/ReportsSite.Master" AutoEventWireup="true" CodeBehind="SSRSActivity.aspx.cs" Inherits="Operations.SSRSActivity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentReports" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentReports" runat="server">

<table>
<tr>
<td>
</td>
<td>
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/PopActivity.aspx" ForeColor="Blue" Font-Underline="True">Back</asp:HyperLink>
</td>
</tr>
<tr>
<td width="100%">
<iframe src ="http://hibdb2008/ReportServer/Pages/ReportViewer.aspx?%2fApplications%2fNetOps%2fActivity&rs:Command=Render" width="100%"  frameborder="0"  height="625px">
        
        </iframe>
</td>
<td>

</td>
</tr>
</table>
 
    
</asp:Content>
