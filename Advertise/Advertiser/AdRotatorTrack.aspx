<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="AdRotatorTrack.aspx.cs" Inherits="Admanagment.Advertiser.AdRotatorTrack" %>
<%@ Register Assembly="AdControl" Namespace="AdControl" TagPrefix="BannerRotator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <BannerRotator:BannerRotator
        id="AdRotator1"
        DataSourceID="srcAds"
        Target="_blank" 
        OnAdCreated="AdRotator1AdCreated"
        Runat="server" />

    <asp:SqlDataSource
        id="srcAds"

        ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
        SelectCommand="SELECT Id, ImageUrl, Width, Height, NavigateUrl, AlternateText,
 Keyword, Impressions
            FROM AdList"
        InsertCommand="INSERT AdStats (AdId, EntryDate, Type) VALUES (@AdId, GetDate(), 0)"
        Runat="server">
        <InsertParameters>
        <asp:Parameter Name="AdId" Type="int32" />
        </InsertParameters>
     </asp:SqlDataSource>
         <asp:HyperLink ID="BackToHomeHyperLink" runat="server" 
        NavigateUrl="~/Advertiser/Home.aspx">Back</asp:HyperLink>
</asp:Content>
