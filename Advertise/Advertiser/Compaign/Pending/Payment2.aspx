<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="Payment2.aspx.cs" Inherits="Advertiser_Compaign_Pending_Payment2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <h4>Payment Process</h4>
       <div>
        
        Payment Due, Pending Payment, Success Payment
          <br />
          <br />
          Current Ad, Saved Ad
          <br /><br />

          <h5>Payment Due</h5>
           <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
               AutoGenerateColumns="False" DataKeyNames="PaymentDueID" 
               DataSourceID="SqlDataSource1">
               <Columns>
                   <asp:BoundField DataField="AdvertiserID" HeaderText="AdvertiserID" 
                       SortExpression="AdvertiserID" />
                   <asp:BoundField DataField="PaymentDueID" HeaderText="PaymentDueID" 
                       ReadOnly="True" SortExpression="PaymentDueID" />
                   <asp:BoundField DataField="AdID" HeaderText="AdID" SortExpression="AdID" />
                   <asp:BoundField DataField="AdAmount" HeaderText="AdAmount" 
                       SortExpression="AdAmount" />
                   <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                   <asp:BoundField DataField="CurrencyCode" HeaderText="CurrencyCode" 
                       SortExpression="CurrencyCode" />
                   <asp:BoundField DataField="PaymentDue" HeaderText="PaymentDue" 
                       SortExpression="PaymentDue" />
               </Columns>
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
               ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>" 
               SelectCommand="SELECT * FROM [AdvertiserPaymentDue]"></asp:SqlDataSource>
           <br /><br />
           
           
           
           <h5>Pending Payment</h5>
           <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
               AutoGenerateColumns="False" DataKeyNames="PaymentDueID" 
               DataSourceID="SqlDataSource2">
               <Columns>
                   <asp:BoundField DataField="AdvertiserID" HeaderText="AdvertiserID" 
                       SortExpression="AdvertiserID" />
                   <asp:BoundField DataField="PaymentDueID" HeaderText="PaymentDueID" 
                       ReadOnly="True" SortExpression="PaymentDueID" />
                   <asp:BoundField DataField="AdID" HeaderText="AdID" SortExpression="AdID" />
                   <asp:BoundField DataField="AdAmount" HeaderText="AdAmount" 
                       SortExpression="AdAmount" />
                   <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                   <asp:BoundField DataField="CurrencyCode" HeaderText="CurrencyCode" 
                       SortExpression="CurrencyCode" />
                   <asp:BoundField DataField="PaymentDue" HeaderText="PaymentDue" 
                       SortExpression="PaymentDue" />
               </Columns>
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
               ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>" 
               SelectCommand="SELECT * FROM [PendingAdvertiserPayment]">
           </asp:SqlDataSource>
           <br /><br />
           
           
           
           <h5>Success Payment</h5>
           <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
               AutoGenerateColumns="False" DataKeyNames="PaymentDueID" 
               DataSourceID="SqlDataSource3">
               <Columns>
                   <asp:BoundField DataField="AdvertiserID" HeaderText="AdvertiserID" 
                       SortExpression="AdvertiserID" />
                   <asp:BoundField DataField="PaymentDueID" HeaderText="PaymentDueID" 
                       ReadOnly="True" SortExpression="PaymentDueID" />
                   <asp:BoundField DataField="AdID" HeaderText="AdID" SortExpression="AdID" />
                   <asp:BoundField DataField="AdAmount" HeaderText="AdAmount" 
                       SortExpression="AdAmount" />
                   <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                   <asp:BoundField DataField="CurrencyCode" HeaderText="CurrencyCode" 
                       SortExpression="CurrencyCode" />
                   <asp:BoundField DataField="PaymentDue" HeaderText="PaymentDue" 
                       SortExpression="PaymentDue" />
               </Columns>
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
               ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>" 
               SelectCommand="SELECT * FROM [ArchivedAdvertiserPayment]">
           </asp:SqlDataSource>
           <br /><br />
           
           
           
           <h5>Current Ad</h5>
           <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
               AutoGenerateColumns="False" DataKeyNames="AdID" DataSourceID="SqlDataSource4">
               <Columns>
                   <asp:BoundField DataField="AdID" HeaderText="AdID" ReadOnly="True" 
                       SortExpression="AdID" />
                   <asp:BoundField DataField="SiteID" HeaderText="SiteID" 
                       SortExpression="SiteID" />
                   <asp:BoundField DataField="NavigateUrl" HeaderText="NavigateUrl" 
                       SortExpression="NavigateUrl" />
                   <asp:BoundField DataField="Impressions" HeaderText="Impressions" 
                       SortExpression="Impressions" />
                   <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                       SortExpression="StartDate" />
                   <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                       SortExpression="EndDate" />
                   <asp:BoundField DataField="AdName" HeaderText="AdName" 
                       SortExpression="AdName" />
                   <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" 
                       SortExpression="IsActive" />
               </Columns>
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
               ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>" 
               SelectCommand="SELECT AdAudience.AdID, AdGeneral.SiteID, AdGeneral.NavigateUrl, AdGeneral.Impressions, AdGeneral.StartDate, AdGeneral.EndDate, AdGeneral.AdName, AdGeneral.IsActive FROM AdAudience INNER JOIN AdGeneral ON AdAudience.AdID = AdGeneral.AdID WHERE (AdGeneral.IsActive = 1)">
           </asp:SqlDataSource>
           <br /><br />
           
           
           
           <h5>Saved Ad</h5>
           <asp:GridView ID="GridView5" runat="server" AllowPaging="True" 
               AutoGenerateColumns="False" DataKeyNames="AdID" DataSourceID="SqlDataSource5">
               <Columns>
                   <asp:BoundField DataField="AdID" HeaderText="AdID" ReadOnly="True" 
                       SortExpression="AdID" />
                   <asp:BoundField DataField="SiteID" HeaderText="SiteID" 
                       SortExpression="SiteID" />
                   <asp:BoundField DataField="NavigateUrl" HeaderText="NavigateUrl" 
                       SortExpression="NavigateUrl" />
                   <asp:BoundField DataField="Impressions" HeaderText="Impressions" 
                       SortExpression="Impressions" />
                   <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                       SortExpression="StartDate" />
                   <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                       SortExpression="EndDate" />
                   <asp:BoundField DataField="AdName" HeaderText="AdName" 
                       SortExpression="AdName" />
                   <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" 
                       SortExpression="IsActive" />
               </Columns>
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
               ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>" 
               SelectCommand="SELECT AdAudience.AdID, AdGeneral.SiteID, AdGeneral.NavigateUrl, AdGeneral.Impressions, AdGeneral.StartDate, AdGeneral.EndDate, AdGeneral.AdName, AdGeneral.IsActive FROM AdAudience INNER JOIN AdGeneral ON AdAudience.AdID = AdGeneral.AdID WHERE (AdGeneral.IsActive = 0)">
           </asp:SqlDataSource>
           <br /><br />
        </div>
</asp:Content>

