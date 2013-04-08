<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="Payments.aspx.cs" Inherits="Advertiser_Compaign_Payment_Payments" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:content id="Content1" contentplaceholderid="HeadContent" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="Server">
    <asp:toolkitscriptmanager id="ScriptManager1" runat="server">
    </asp:toolkitscriptmanager>
    <asp:panel id="PaymentDuePanel" runat="server" height="314px" style="position: relative;
        overflow: hidden; top: 0px; width: 850px" backcolor="White">
        <asp:label id="PaymentDueLabel" runat="server" backcolor="#414952" font-bold="True"
            height="20px" style="position: relative" text="<%$ Resources:Resource, PaymentDue %>"
            width="850px" forecolor="White"></asp:label>
        <asp:gridview runat="server" id="PaymentDueGridView" datasourceid="PaymentDueSqlDataSource"
            allowpaging="True" width="850px" allowsorting="True" autogeneratecolumns="False"
            datakeynames="PaymentDueID" cellpadding="4" forecolor="#333333" gridlines="None"
            style="text-align: center" onrowdatabound="PaymentDueGridViewRowDataBound" onselectedindexchanged="PaymentDueGridViewSelectedIndexChanged"
            pagesize="7">
            <rowstyle backcolor="#F7F6F3" forecolor="#333333" />
            <editrowstyle backcolor="#999999" />
            <footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
            <pagerstyle backcolor="#284775" forecolor="White" horizontalalign="Center" />
            <headerstyle backcolor="#5D7B9D" font-bold="True" height="10px" forecolor="White"
                cssclass="gridHeader" horizontalalign="Center" />
            <columns>
                <asp:BoundField DataField="AdID" HeaderText="<%$ Resources:Resource, ID %>" 
                    SortExpression="AdID" />
                <asp:BoundField DataField="AdName" HeaderText="<%$ Resources:Resource, Name %>" SortExpression="AdName">
                </asp:BoundField>
                <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" dataformatstring="{0:M/dd/yyyy}" />
                <asp:BoundField DataField="PaymentDue" HeaderText="<%$ Resources:Resource, PaymentDue %>" 
                    SortExpression="PaymentDue"></asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                         <asp:LinkButton ID="PaymentDuePayNowLinkButton" runat="server" CausesValidation="False"
                                                                            CommandName="select" Font-Bold="True" ForeColor="Maroon" CssClass="UnderlineLink" Style="position: relative"
                                                                             Text="<%$ Resources:Resource, PayNow %>"></asp:LinkButton>
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
            <sortedascendingcellstyle backcolor="#E9E7E2" />
            <sortedascendingheaderstyle backcolor="#506C8C" />
            <sorteddescendingcellstyle backcolor="#FFFDF8" />
            <sorteddescendingheaderstyle backcolor="#6F8DAE" />
            <sortedascendingcellstyle backcolor="#E9E7E2" />
            <sortedascendingheaderstyle backcolor="#506C8C" />
            <sorteddescendingcellstyle backcolor="#FFFDF8" />
            <sorteddescendingheaderstyle backcolor="#6F8DAE" />
        </asp:gridview>
        <asp:sqldatasource id="PaymentDueSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            
            selectcommand="SELECT AdvertiserPaymentDue.AdID, AdvertiserPaymentDue.AdAmount, AdvertiserPaymentDue.Date, AdvertiserPaymentDue.PaymentDue, AdvertiserPaymentDue.AdvertiserID, AdGeneral.AdName, AdvertiserPaymentDue.PaymentDueID FROM AdvertiserPaymentDue INNER JOIN AdGeneral ON AdvertiserPaymentDue.AdID = AdGeneral.AdID AND AdGeneral.UserID = @UserID AND  PaymentProcess = 0">
            <SelectParameters>
                <asp:Parameter Name="UserID" />
            </SelectParameters>
        </asp:sqldatasource>
    </asp:panel>
    <asp:roundedcornersextender id="PaymentDueRoundedCornersExtender" runat="server"
        targetcontrolid="PaymentDuePanel" color="SlateGray" radius="9" enabled="True"
        bordercolor="SlateGray">
    </asp:roundedcornersextender>
    <br />
    <br />
    <asp:panel id="PaymentDueStatusPanel" runat="server" height="314px" style="position: relative;
        overflow: hidden; top: 0px; width: 850px" backcolor="White">
        <asp:label id="PaymentDueStatusLabel" runat="server" backcolor="#414952" font-bold="True"
            height="20px" style="position: relative" text="<%$ Resources:Resource, PaymentStatus %>" width="850px"
            forecolor="White"></asp:label>
        <asp:gridview runat="server" id="PaymentDueStatusGridView" datasourceid="PaymentDueStatusSqlDataSource"
            allowpaging="True" width="850px" allowsorting="True" autogeneratecolumns="False"
            datakeynames="PaymentDueID" cellpadding="4" forecolor="#333333" gridlines="None"
            style="text-align: center" onrowdatabound="PaymentDueStatusGridViewRowDataBound"
            pagesize="7">
            <rowstyle backcolor="#F7F6F3" forecolor="#333333" />
            <editrowstyle backcolor="#999999" />
            <footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
            <pagerstyle backcolor="#284775" forecolor="White" horizontalalign="Center" />
            <headerstyle backcolor="#5D7B9D" font-bold="True" height="10px" forecolor="White"
                cssclass="gridHeader" horizontalalign="Center" />
            <columns>
                <asp:BoundField DataField="AdID" HeaderText="<%$ Resources:Resource, ID %>" 
                    SortExpression="AdID" />
                <asp:BoundField DataField="AdName" HeaderText="<%$ Resources:Resource, Name %>" 
                    SortExpression="AdName"></asp:BoundField>
                <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" dataformatstring="{0:M/dd/yyyy}">
                </asp:BoundField>
                <asp:BoundField DataField="PaymentDue" HeaderText="PaymentDue" 
                    SortExpression="PaymentDue" />
                <asp:BoundField DataField="Status" HeaderText="<%$ Resources:Resource, Status %>" SortExpression="Status">
                </asp:BoundField>
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
        <asp:sqldatasource id="PaymentDueStatusSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            selectcommand="SELECT AdvertiserPaymentDue.AdID, AdvertiserPaymentDue.AdAmount, AdvertiserPaymentDue.Date, AdvertiserPaymentDue.PaymentDue, AdvertiserPaymentDue.AdvertiserID, AdGeneral.AdName, AdvertiserPaymentDue.PaymentDueID, AdvertiserPaymentDue.Status FROM AdvertiserPaymentDue INNER JOIN AdGeneral ON AdvertiserPaymentDue.AdID = AdGeneral.AdID AND AdGeneral.UserID = @UserID  AND  PaymentProcess = 1">
            <SelectParameters>
                <asp:Parameter Name="UserID" />
            </SelectParameters>
        </asp:sqldatasource>
    </asp:panel>
    <asp:roundedcornersextender id="PaymentDueStatusRoundedCornersExtender" runat="server"
        targetcontrolid="PaymentDueStatusPanel" color="SlateGray" radius="9" enabled="True"
        bordercolor="SlateGray">
    </asp:roundedcornersextender>
    <br />
    <br />
    <asp:panel id="PaymentDueHistoryPanel" runat="server" height="314px" style="position: relative;
        overflow: hidden; top: 0px; width: 850px" backcolor="White">
        <asp:label id="PaymentDueHistoryLabel" runat="server" backcolor="#414952" font-bold="True"
            height="20px" style="position: relative" text="<%$ Resources:Resource, PaymentHistory %>" width="850px"
            forecolor="White"></asp:label>
        <asp:gridview runat="server" id="PaymentDueHistoryGridView" datasourceid="PaymentDueHistorySqlDataSource"
            allowpaging="True" width="850px" allowsorting="True" autogeneratecolumns="False"
            cellpadding="4" forecolor="#333333" gridlines="None" style="text-align: center"
            onrowdatabound="PaymentDueHistoryGridViewRowDataBound" pagesize="7" datakeynames="PaymentDueID">
            <rowstyle backcolor="#F7F6F3" forecolor="#333333" />
            <editrowstyle backcolor="#999999" />
            <footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
            <pagerstyle backcolor="#284775" forecolor="White" horizontalalign="Center" />
            <headerstyle backcolor="#5D7B9D" font-bold="True" height="10px" forecolor="White"
                cssclass="gridHeader" horizontalalign="Center" />
            <columns>
                <asp:BoundField DataField="AdID" HeaderText="<%$ Resources:Resource, ID %>" 
                    SortExpression="AdID" />
                <asp:BoundField DataField="AdName" HeaderText="<%$ Resources:Resource, Name %>" 
                    SortExpression="AdName"></asp:BoundField>
                <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" dataformatstring="{0:M/dd/yyyy}">
                </asp:BoundField>
                <asp:BoundField DataField="PaymentDue" HeaderText="<%$ Resources:Resource, PaymentDue %>" 
                    SortExpression="PaymentDue" />
                <asp:CheckBoxField DataField="IsActive" HeaderText="<%$ Resources:Resource, Active %>" 
                    SortExpression="IsActive">
                    <ItemStyle Font-Bold="True" />
                </asp:CheckBoxField>
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
        <asp:sqldatasource id="PaymentDueHistorySqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            selectcommand="SELECT ArchivedAdvertiserPayment.AdID, ArchivedAdvertiserPayment.AdAmount, ArchivedAdvertiserPayment.Date, ArchivedAdvertiserPayment.PaymentDue, ArchivedAdvertiserPayment.AdvertiserID, AdGeneral.AdName, ArchivedAdvertiserPayment.PaymentDueID, AdGeneral.IsActive FROM ArchivedAdvertiserPayment INNER JOIN AdGeneral ON ArchivedAdvertiserPayment.AdID = AdGeneral.AdID AND AdGeneral.UserID = @UserID">
            <SelectParameters>
                <asp:Parameter Name="UserID" />
            </SelectParameters>
        </asp:sqldatasource>
    </asp:panel>
    <asp:roundedcornersextender id="PaymentDueHistoryRoundedCornersExtender" runat="server"
        targetcontrolid="PaymentDueHistoryPanel" color="SlateGray" radius="9" enabled="True"
        bordercolor="SlateGray">
    </asp:roundedcornersextender>
</asp:content>
