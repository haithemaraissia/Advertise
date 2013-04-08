<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlatformDownload.aspx.cs" Inherits="Advertiser.Report.Completed.IFrame.AdvertiserReportCompletedIFramePlatformDownload"  EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .gridHeader th a:link
        {
            color: #000000;
            text-decoration: none;
        }
        
        .gridHeader th a:active
        {
            color: #000000;
        }
        
        .gridHeader th a:visited
        {
            color: #000000;
        }
        
        .gridHeader th a:hover
        {
            color: #006633;
            text-decoration: underline;
        }
        
        .gridHeader td a:link
        {
            text-decoration: none;
        }
        
        .gridHeader th a:active
        {
        }
        
        .gridHeader th a:visited
        {
        }
        
        .gridHeader th a:hover
        {
            text-decoration: underline;
        }
        
        .a:link
        {
            text-decoration: none;
        }
        
        .a:hover
        {
            text-decoration: underline;
        }
        
        
        a.UnderlineLink
        {
            color: #000000;
            text-decoration: none;
        }
        
        a.UnderlineLink:hover
        {
            text-decoration: underline;
        }
        .gridHeader td a:hover
        {
            text-decoration: underline;
        }
        .pager span
        {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Div1" runat="server">
        <table id="Detail" runat="server" width="845px">
            <tr>
                <td align="center">
                    <asp:GridView runat="server" ID="gvdetails" DataSourceID="dsdetails" Width="845px"
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                        Style="text-align: center" HorizontalAlign="Center" ShowFooter="True">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Height="10px" ForeColor="White"
                            HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="AdName" HeaderText="<%$ Resources:Resource, Name %>" SortExpression="AdName" />
                            <asp:BoundField DataField="BrowserName" HeaderText="<%$ Resources:Resource, Browser %>"
                                SortExpression="BrowserName" />
                            <asp:BoundField DataField="BrowserPlatform" HeaderText="<%$ Resources:Resource, Platform %>"
                                SortExpression="BrowserPlatform" />
                            <asp:BoundField DataField="BrowserType" HeaderText="<%$ Resources:Resource, Type %>"
                                SortExpression="BrowserType" />
                            <asp:BoundField DataField="UserLanguage" HeaderText="<%$ Resources:Resource, Language %>"
                                SortExpression="UserLanguage" />
                            <asp:BoundField DataField="DeviceType" HeaderText="<%$ Resources:Resource, DeviceType %>"
                                SortExpression="DeviceType" />
                            <asp:BoundField DataField="EntryDate" HeaderText="<%$ Resources:Resource, Date %>"
                                SortExpression="EntryDate" />
                        </Columns>
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="dsdetails" runat="server" ConnectionString="<%$  ConnectionStrings:AdDatabaseConnectionString1 %>"
            SelectCommand="SELECT DISTINCT TOP (10000) AdGeneral.AdName, AdStats.EntryDate, AdGeneral.ImageUrl, VisitorPlatform.AdId, VisitorPlatform.BrowserType,
                         VisitorPlatform.BrowserName, VisitorPlatform.BrowserPlatform, VisitorPlatform.DeviceType, VisitorPlatform.UserLanguage, VisitorPlatform.MobileDeviceModel 
                         FROM  AdGeneral INNER JOIN AdStats ON AdGeneral.AdID = AdStats.AdId INNER JOIN VisitorPlatform ON AdGeneral.AdID = VisitorPlatform.AdId
                         WHERE (AdGeneral.Completed = 1) AND (AdGeneral.UserID = @UserID) AND (AdGeneral.IsActive = 0) ORDER BY AdStats.EntryDate">
            <SelectParameters>
                <asp:Parameter Name="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
