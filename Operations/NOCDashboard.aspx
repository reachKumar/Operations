<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NOCDashboard.aspx.cs" Inherits="Operations.test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ShiftHandover.aspx" 
        Font-Underline="True" ForeColor="Blue">Back</asp:HyperLink>
    </div>
     <iframe src ="https://intranet.hibernianetworks.com/NOC/SitePages/NOC%20Tickets.aspx" width="110%"  frameborder="0"   height="1024px">
        
        </iframe>
    </div>
    </form>
</body>
</html>
