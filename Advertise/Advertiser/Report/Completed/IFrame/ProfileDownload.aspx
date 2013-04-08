<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfileDownload.aspx.cs" Inherits="Advertiser.Report.Completed.IFrame.AdvertiserReportCompletedIFrameProfileDownload" EnableEventValidation="false" %>
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
                        <asp:BoundField DataField="FirstName" HeaderText="<%$ Resources:Resource, FirstName %>"
                            SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="<%$ Resources:Resource, LastName %>"
                            SortExpression="LastName" />
                        <asp:TemplateField SortExpression="IndustryID" HeaderText="<%$ Resources:Resource, IndustryLabel %>"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="IndustryLabel" runat="server" Text='<%# Eval("IndustryID") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CountryName" HeaderText="<%$ Resources:Resource, CountryName %>"
                            SortExpression="CountryName" />
                        <asp:BoundField DataField="RegionName" HeaderText="<%$ Resources:Resource, RegionName %>"
                            SortExpression="RegionName" />
                        <asp:BoundField DataField="CityName" HeaderText="<%$ Resources:Resource, CityName %>"
                            SortExpression="CityName" />
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td align="center">
                                            <asp:ImageButton ID="ProfileImage" runat="server" DescriptionUrl='<%# Eval("UserRole", "{0}") %>'
                                                Height="100px" ImageUrl='<%# Eval("PhotoPath") %>' ToolTip='<%# Eval("UserId", "{0}") %>'
                                                Width="100px" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
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
        SelectCommand="SELECT DISTINCT TOP (10000) AdGeneral.AdName, AdStats.EntryDate, AdGeneral.ImageUrl, VisitorInfo.AdId, VisitorInfo.UserId, VisitorInfo.UserRole,VisitorInfo.FirstName, VisitorInfo.LastName, VisitorInfo.Address, VisitorInfo.CountryName, VisitorInfo.RegionName, VisitorInfo.CityName, VisitorInfo.Age, VisitorInfo.Gender, VisitorInfo.PhotoPath, VisitorInfo.IndustryID, VisitorInfo.ProfessionID FROM AdGeneral INNER JOIN AdStats ON AdGeneral.AdID = AdStats.AdId INNER JOIN VisitorInfo ON AdGeneral.AdID = VisitorInfo.AdId WHERE (AdGeneral.UserID = @UserID) AND (AdGeneral.IsActive = 0) AND (AdGeneral.Completed = 1) ORDER BY AdStats.EntryDate">
        <SelectParameters>
            <asp:Parameter Name="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
