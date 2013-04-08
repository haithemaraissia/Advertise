<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="EditAd.aspx.cs" Inherits="Admanagment.Advertiser.GetEditAd" %>
<%@ Register TagPrefix="BannerRotator" Namespace="AdControl" Assembly="AdControl" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="AdListPanel" runat="server" Height="649px" Style="position: relative;
        overflow: hidden; top: 0px;" BackColor="White">
        <asp:Label ID="AdListLabel" runat="server" BackColor="#414952" Font-Bold="True" Height="20px"
            Style="position: relative" Text="<%$ Resources:Resource, MyAd %>" Width="100%"
            ForeColor="White"></asp:Label>
        <asp:GridView runat="server" ID="AdGridView" DataSourceID="AdSqlDataSource" AllowPaging="True"
            Width="850px" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID"
            CellPadding="4" ForeColor="#333333" GridLines="None" Style="text-align: center"
            OnRowDataBound="AdGridViewRowDataBound" OnSelectedIndexChanged="AdGridViewSelectedIndexChanged">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Height="10px" ForeColor="White"
                CssClass="gridHeader" HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="AdName" HeaderText="<%$ Resources:Resource, Name %>" SortExpression="AdName" />
                <asp:BoundField DataField="StartDate" HeaderText="<%$ Resources:Resource, Start %>" SortExpression="StartDate"
                    DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" />
                <asp:BoundField DataField="EndDate" HeaderText="<%$ Resources:Resource, End %>" SortExpression="EndDate" DataFormatString="{0:MM/dd/yyyy}"
                    HtmlEncode="false" />
                <asp:TemplateField HeaderText="<%$ Resources:Resource, CountryName %>" SortExpression="CountryName">
                    <ItemTemplate>
                        <asp:Image ID="FlagImage" runat="server" ImageUrl='<%# Eval("FlagPath", "{0}") %>' /><br />
                        <asp:Label ID="CountryCodeLabel" runat="server" Text='<%# Eval("CountryCode", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, Creative %>">
                    <ItemTemplate>
                        <BannerRotator:FlashControl ID="FlashControl1" runat="server" ViewStateMode="Enabled"
                            FlashUrl='<%# Eval("ImageUrl", "{0}") %>' Width="150px" Height="150px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
            </Columns>
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="AdSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            SelectCommand="SELECT AdGeneral.ID, AdGeneral.AdName, AdGeneral.ImageUrl, AdGeneral.StartDate, AdGeneral.EndDate, AdAudience.CountryName,AdAudience.FlagPath, AdAudience.CountryCode
 FROM AdAudience INNER JOIN AdGeneral ON AdAudience.AdID = AdGeneral.AdID"></asp:SqlDataSource>
    </asp:Panel>
    <asp:RoundedCornersExtender ID="AdListRoundedCornersExtender" runat="server" TargetControlID="AdListPanel"
        Color="SlateGray" Radius="9" Enabled="True" BorderColor="SlateGray">
    </asp:RoundedCornersExtender>
</asp:Content>
