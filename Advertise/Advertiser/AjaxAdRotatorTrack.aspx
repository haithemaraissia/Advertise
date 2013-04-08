<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="AjaxAdRotatorTrack.aspx.cs" Inherits="Admanagment.Advertiser.AjaxAdRotatorTrack" %>
<%@ Register Assembly="AdControl" Namespace="AdControl" TagPrefix="BannerRotator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Timer runat="server" ID="Timer1" Interval="10000" OnTick="OnTimerTick" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
            <BannerRotator:BannerRotator
        id="AdRotator1"
        DataSourceID="srcAds"
        Target="_blank" 
        OnAdCreated="AdRotator1AdCreated"
        Runat="server" />    
</ContentTemplate>
</asp:UpdatePanel>

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
