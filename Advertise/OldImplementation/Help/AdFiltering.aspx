<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="AdFiltering.aspx.cs" Inherits="test_AdFiltering" %>

<%@ Register TagPrefix="BannerRotator" Namespace="AdControl" Assembly="AdControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="banner">
        <BannerRotator:BannerRotator ID="BannerRotator1" DataSourceID="BannerSqlDataSource"
            Target="_blank" OnAdCreated="AdRotator1AdCreated" runat="server" />
        <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            SelectCommand="SELECT Id, ImageUrl, Width, Height, NavigateUrl, AlternateText, Keyword, Impressions FROM AdList"
            runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="BannerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            SelectCommand="SELECT ID, ImageUrl, Width, Height, NavigateUrl, AlternateText, Keyword From TempAd">
        </asp:SqlDataSource>
    </div>
</asp:Content>
