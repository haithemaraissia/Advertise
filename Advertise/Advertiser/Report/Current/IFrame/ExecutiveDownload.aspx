<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExecutiveDownload.aspx.cs"
    Inherits="Advertiser.Report.Current.IFrame.ExecutiveDownload" EnableEventValidation="false" %>
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
        <div style="width: 845px">
            <div id="SumTable" runat="server">
                <table align="center">
                    <tr>
                        <td style="background-color: #5D7B9D; color: #FFFFFF">
                            <asp:Label ID="CurrentMonthLabel" runat="server" Text="<%$ Resources:Resource, Month %>"></asp:Label>
                        </td>
                       <td style="background-color: #5D7B9D; color: #FFFFFF">
                            <asp:Label ID="TotalHitLabel" runat="server" Text="<%$ Resources:Resource, TotalHit %>"></asp:Label>
                        </td>
                        <td style="background-color: #5D7B9D; color: #FFFFFF">
                            <asp:Label ID="AverageHitLabel" runat="server" Text="<%$ Resources:Resource, AverageHit %>"></asp:Label>
                        </td>
                       <td style="background-color: #5D7B9D; color: #FFFFFF">
                            <asp:Label ID="TotalClickLabel" runat="server" Text="<%$ Resources:Resource, TotalClick %>"></asp:Label>
                        </td>
                       <td style="background-color: #5D7B9D; color: #FFFFFF">
                            <asp:Label ID="AverageClickLabel" runat="server" Text="<%$ Resources:Resource, AverageClick %>"></asp:Label>
                        </td>
                    </tr>
                    <tr bgcolor="#00CCFF">
                        <td>
                            <asp:Label ID="CurrentMonth" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="TotalHit" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="AverageHit" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="TotalClick" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="AverageClick" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </div>
        </div>
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
                            <asp:BoundField DataField="AdID" HeaderText="<%$ Resources:Resource, ID %>" SortExpression="AdID" />
                            <asp:BoundField DataField="AdName" HeaderText="<%$ Resources:Resource, Name %>" SortExpression="AdName" />
                            <asp:BoundField DataField="StartDate" HeaderText="<%$ Resources:Resource, StartDate %>"
                                SortExpression="StartDate" DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="EndDate" HeaderText="<%$ Resources:Resource, EndDate %>"
                                SortExpression="EndDate" DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="TotalImpression" HeaderText="<%$ Resources:Resource, Impression %>"
                                SortExpression="TotalImpression" />
                            <asp:BoundField DataField="TotalClick" HeaderText="<%$ Resources:Resource, Click %>"
                                SortExpression="TotalClick" />
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
        <asp:SqlDataSource ID="dsdetails" runat="server" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            SelectCommand="SELECT AdGeneral.AdID, AdGeneral.ImageUrl, AdGeneral.Impressions, AdGeneral.StartDate, AdGeneral.EndDate, AdGeneral.IsActive, AdTotalStats.TotalImpression, AdTotalStats.TotalClick, AdGeneral.AdName FROM AdGeneral INNER JOIN AdTotalStats ON AdGeneral.AdID = AdTotalStats.AdId WHERE (AdGeneral.UserID = @UserID) And (AdGeneral.IsActive = 1)">
            <SelectParameters>
                <asp:Parameter Name="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
