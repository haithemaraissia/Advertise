﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GeographicDownload.aspx.cs" Inherits="Advertiser.Report.Completed.IFrame.AdvertiserReportCompletedIFrameGeographicDownload"    EnableEventValidation="false" %>

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
                            <asp:BoundField DataField="CountryName" HeaderText="<%$ Resources:Resource, CountryName %>"
                                SortExpression="CountryName" />
                            <asp:BoundField DataField="Region" HeaderText="<%$ Resources:Resource, RegionName %>"
                                SortExpression="Region" />
                            <asp:BoundField DataField="CityName" HeaderText="<%$ Resources:Resource, CityName %>"
                                SortExpression="CityName" />
                            <asp:BoundField DataField="PostalCode" HeaderText="<%$ Resources:Resource, PostalCode %>"
                                SortExpression="PostalCode" />
                            <asp:BoundField DataField="AreaCode" HeaderText="<%$ Resources:Resource, AreaCode %>"
                                SortExpression="AreaCode" />
                            <asp:BoundField DataField="MetroCode" HeaderText="<%$ Resources:Resource, MetroCode %>"
                                SortExpression="MetroCode" />
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
            SelectCommand="SELECT DISTINCT TOP (10000) VisitorGeo.AdId, AdGeneral.AdName, VisitorGeo.CountryName, VisitorGeo.Region,  VisitorGeo.CityName, VisitorGeo.PostalCode, VisitorGeo.AreaCode,  VisitorGeo.MetroCode, AdStats.EntryDate, AdGeneral.ImageUrl FROM  AdGeneral INNER JOIN VisitorGeo ON AdGeneral.AdId = VisitorGeo.AdId INNER JOIN AdStats ON AdGeneral.adID = AdStats.AdId WHERE  AdGeneral.UserID = @UserID AND (AdGeneral.Completed = 1) And (AdGeneral.IsActive = 0) ORDER BY AdStats.EntryDate">
            <SelectParameters>
                <asp:Parameter Name="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
