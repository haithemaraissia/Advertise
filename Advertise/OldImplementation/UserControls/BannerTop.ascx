<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BannerTop.ascx.cs" Inherits="Admanagment.Advertiser.UserControls.BannerTop" %>
<%@ Register TagPrefix="BannerRotator" Namespace="AdControl" Assembly="AdControl" %>
<div id="banner">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
               <%-- <BannerRotator:BannerRotator ID="BannerRotator1" DataSourceID="SqlDataSource1" Target="_blank"
                    OnAdCreated="AdRotator1AdCreated" KeywordFilter="Home" CssClass="banner" runat="server" />--%>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            SelectCommand="SELECT Id, ImageUrl, Width, Height, NavigateUrl, AlternateText,
 Keyword, Impressions
            FROM AdList" InsertCommand="INSERT AdStats (AdId, EntryDate, Type) VALUES (@AdId, GetDate(), 0)"
            runat="server">
            <InsertParameters>
                <asp:Parameter Name="AdId" Type="int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" CausesValidation="True" Height="77px" 
            Width="473px"></asp:TextBox>
        <br />
        <br />
    </div>