<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExecutiveDownload.aspx.cs"
    Inherits="Admanagment.Advertiser.ExecutiveDownload" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                   <asp:GridView runat="server" ID="gvdetails" DataSourceID="dsdetails" AllowPaging="True"
                        Width="830px" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id"
                        OnSelectedIndexChanged="gvdetails_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" >
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="left"/>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Height="10px" ForeColor="White"
                            CssClass="gridHeader" HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" HeaderStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" HeaderStyle-HorizontalAlign="Center"  />
                            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate"  DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false"  HeaderStyle-HorizontalAlign="Center"/>
                            <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" HeaderStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="TotalImpression" HeaderText="Impression" SortExpression="TotalImpression"  HeaderStyle-HorizontalAlign="Center"/>
                            <asp:BoundField DataField="TotalClick" HeaderText="Click" SortExpression="TotalClick" HeaderStyle-HorizontalAlign="Center" />
            <%--                <asp:TemplateField>
                                <ItemTemplate>
                                    <BannerRotator:FlashControl ID="FlashControl1" runat="server" ViewStateMode="Enabled"
                                        FlashUrl='<%# Eval("ImageUrl", "{0}") %>' Width="50px" Height="50px" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
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
          SelectCommand="SELECT AdList.Id, AdList.ImageUrl, AdList.Impressions, AdList.StartDate, AdList.EndDate, AdList.IsActive, AdTotalStats.TotalImpression, AdTotalStats.TotalClick FROM AdList INNER JOIN AdTotalStats ON AdList.Id = AdTotalStats.id" />
    </div>
    </form>
</body>
</html>
