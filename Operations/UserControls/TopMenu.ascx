<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenu.ascx.cs" Inherits="Operations.UserControls.TopMenu" %>

                <asp:Menu ID="NavigationMenu" runat="server" 
    MaximumDynamicDisplayLevels="0" Orientation="Horizontal"
    DataSourceID="topMenuData">
        <StaticMenuItemStyle CssClass="MenuItemStyle" />
        <StaticSelectedStyle CssClass="SelectedStyle" />
        <StaticHoverStyle CssClass="HoverStyle" />
        <staticmenuitemstyle BorderWidth="0px" ItemSpacing="1" BorderColor="White" /> 
                </asp:Menu>
            

            
                   <asp:SiteMapDataSource ID="topMenuData" runat="server" SiteMapProvider="TopMenu"  ShowStartingNode="false" />