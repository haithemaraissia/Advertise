<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="AdLogicTest.aspx.cs" Inherits="Test2" %>

<%@ Register Assembly="AdControl" Namespace="AdControl" TagPrefix="BannerRotator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <BannerRotator:BannerRotator ID="BannerRotator1" DataSourceID="SqlDataSource1" Target="_blank"
        OnAdCreated="AdRotator1AdCreated" CssClass="banner" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
        SelectCommand="SELECT ID, ImageUrl, Width, Height, NavigateUrl, AlternateText,
 Keyword, Impressions
            FROM AdGeneral" runat="server"></asp:SqlDataSource>
    <%--                  <BannerRotator:BannerRotator ID="BannerRotator2" DataSourceID="SqlDataSource1" Target="_blank"
            OnAdCreated="AdRotator1AdCreated" KeywordFilter="Home" CssClass="banner" runat="server" />

        <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            SelectCommand="SELECT Id, ImageUrl, Width, Height, NavigateUrl, AlternateText,
 Keyword, Impressions
            FROM AdList" InsertCommand="INSERT AdStats (AdId, EntryDate, Type) VALUES (@AdId, GetDate(), 0)"
            runat="server">
            <InsertParameters>
                <asp:Parameter Name="AdId" Type="int32" />
            </InsertParameters>
        </asp:SqlDataSource>--%>
</asp:Content>
