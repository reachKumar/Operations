﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ReportsSite.Master" AutoEventWireup="true" CodeBehind="NOCCallList.aspx.cs" Inherits="Operations.NOCCallList" %>
<%@ Register src="NocHandover.ascx" tagname="NocHandover" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentReports" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentReports" runat="server">

    <uc1:NocHandover ID="NocHandover1" runat="server" />

</asp:Content>
