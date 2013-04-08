<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="Inventory.aspx.cs" Inherits="Advertiser_Compaign_Saved_Inventory" %>

<%@ Register TagPrefix="BannerRotator" Namespace="AdControl" Assembly="AdControl" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:content id="Content1" contentplaceholderid="HeadContent" runat="server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <asp:toolkitscriptmanager id="ScriptManager1" runat="server">
    </asp:toolkitscriptmanager>
    <asp:panel id="AdListPanel" runat="server" height="649px" style="position: relative;
        overflow: hidden; top: 0px;" backcolor="White">
        <asp:label id="AdListLabel" runat="server" backcolor="#414952" font-bold="True" height="20px"
            style="position: relative" text="<%$ Resources:Resource, MyAd %>" width="100%"
            forecolor="White"></asp:label>
        <asp:gridview runat="server" id="AdGridView" datasourceid="AdSqlDataSource" allowpaging="True"
            width="850px" allowsorting="True" autogeneratecolumns="False" datakeynames="ID"
            cellpadding="4" forecolor="#333333" gridlines="None" style="text-align: center"
            onrowdatabound="AdGridViewRowDataBound" onselectedindexchanged="AdGridViewSelectedIndexChanged"
            pagesize="4">
            <rowstyle backcolor="#F7F6F3" forecolor="#333333" />
            <editrowstyle backcolor="#999999" />
            <footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
            <pagerstyle backcolor="#284775" forecolor="White" horizontalalign="Center" />
            <headerstyle backcolor="#5D7B9D" font-bold="True" height="10px" forecolor="White"
                cssclass="gridHeader" horizontalalign="Center" />
            <columns>
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
                            FlashUrl='<%# Eval("ImageUrl", "{0}") %>' Width="150px" Height="125px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </columns>
            <selectedrowstyle backcolor="#E2DED6" font-bold="True" forecolor="#333333" />
            <sortedascendingcellstyle backcolor="#E9E7E2" />
            <sortedascendingheaderstyle backcolor="#506C8C" />
            <sorteddescendingcellstyle backcolor="#FFFDF8" />
            <sorteddescendingheaderstyle backcolor="#6F8DAE" />
            <sortedascendingcellstyle backcolor="#E9E7E2" />
            <sortedascendingheaderstyle backcolor="#506C8C" />
            <sorteddescendingcellstyle backcolor="#FFFDF8" />
            <sorteddescendingheaderstyle backcolor="#6F8DAE" />
            <sortedascendingcellstyle backcolor="#E9E7E2" />
            <sortedascendingheaderstyle backcolor="#506C8C" />
            <sorteddescendingcellstyle backcolor="#FFFDF8" />
            <sorteddescendingheaderstyle backcolor="#6F8DAE" />
        </asp:gridview>
        <asp:sqldatasource id="AdSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            selectcommand="SELECT AdGeneral.ID, AdGeneral.AdName, AdGeneral.ImageUrl, AdGeneral.StartDate, AdGeneral.EndDate, AdAudience.CountryName,AdAudience.FlagPath, AdAudience.CountryCode
 FROM AdAudience INNER JOIN AdGeneral ON AdAudience.AdID = AdGeneral.AdID WHERE AdGeneral.IsActive = 0 AND (AdGeneral.Completed = 0)  AND AdGeneral.UserID = @UserID">
             <SelectParameters>
                <asp:Parameter Name="UserID" />
            </SelectParameters>
        </asp:sqldatasource>
    </asp:panel>
    <asp:roundedcornersextender id="AdListRoundedCornersExtender" runat="server" targetcontrolid="AdListPanel"
        color="SlateGray" radius="9" enabled="True" bordercolor="SlateGray">
    </asp:roundedcornersextender>
</asp:content>
