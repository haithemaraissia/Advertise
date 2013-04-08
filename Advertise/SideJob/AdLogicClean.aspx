<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="AdLogicClean.aspx.cs" Inherits="SideJob.SideJobAdLogicClean" %>

<%@ Register Assembly="AdControl" Namespace="AdControl" TagPrefix="BannerRotator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="90%">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Top</td>
            <td>
                <BannerRotator:BannerRotator ID="TopBannerRotator" DataSourceID="SqlDataSource1"
                    Target="_blank" OnAdCreated="TopBannerRotatorCreated" runat="server" />
                <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
                    SelectCommand="SELECT ID, ImageUrl, Width, Height, NavigateUrl, AlternateText,Keyword, Impressions FROM AdGeneral"
                    runat="server"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Right</td>
            <td>
                <BannerRotator:BannerRotator ID="RightBannerRotator" DataSourceID="SqlDataSource1"
                    Target="_blank" OnAdCreated="RightBannerRotatorCreated" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>


    
</asp:Content>

