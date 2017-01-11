<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftNavigation.ascx.cs" Inherits="Operations.UserControls.LeftNavigation" %>
<asp:Menu ID="leftMenuNavigation" runat="server"  

  MaximumDynamicDisplayLevels="0"
    DataSourceID="SMDCLeftMenuNavigation" Orientation="Vertical">

      <StaticMenuItemStyle CssClass="LeftMenuItemStyle" />
        <StaticSelectedStyle CssClass="SelectedStyle" />
        <StaticHoverStyle CssClass="HoverStyle" />
        <staticmenuitemstyle BorderWidth="0px" ItemSpacing="1" BorderColor="White" /> 

</asp:Menu>
<asp:SiteMapDataSource ID="SMDCLeftMenuNavigation" SiteMapProvider="LeftMenu" runat="server" ShowStartingNode="false" />