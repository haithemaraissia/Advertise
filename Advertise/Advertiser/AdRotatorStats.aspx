<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="AdRotatorStats.aspx.cs" Inherits="AdManagment.AdRotatorStats" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    helloretertertretertert
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />
    <style type="text/css">
        .grid td, .grid th
        {
            border-bottom: solid 1px black;
            padding: 5px;
        }
        .style1
        {
            width: 400px;
        }
        .style2
        {
            width: 92px;
            height: 20px;
        }
        .style3
        {
            width: 53px;
            height: 33px;
        }
        .style4
        {
            width: 53px;
            height: 28px;
        }
        .style5
        {
            width: 92px;
            height: 13px;
        }
        .style7
        {
            text-align: center;
        }
    </style>
    <h1>
        Advertisement Statistics</h1>
    Impressions represent the number of times an advertisement has been viewed. Transfers
    represent the number of times an advertisement has been clicked.<br />
    <br />
    JPEG,GIF : Good<br />
    Flash: You have to have ClickTag like FBN.<br />
    <strong>3Party:<br />
    Video:</strong><br />
    Jquery Rotator :Good<br />
    KeyWord: Good<br />
    <strong>User, Browser, Location Information:<br />
    Logic: Date Time, When the impression is up or time is up, then do logic too</strong>
    <h2>
        Impressions</h2>
    <asp:GridView ID="grdImpressions" DataSourceID="srcImpressions" AutoGenerateColumns="false"
        GridLines="None" CssClass="grid" runat="server">
        <Columns>
            <asp:BoundField DataField="AdId" HeaderText="AdId" />
            <asp:BoundField DataField="Impressions" HeaderText="Impressions" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="srcImpressions" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
        SelectCommand="SELECT AdId,Count(*) As Impressions
            FROM AdStats
            WHERE Type=0
            GROUP BY AdId
            ORDER BY Impressions DESC" runat="server" />
            
            
            
            
            
            
            
            
            
              <h2>
        Definition</h2>
    <asp:GridView ID="GridView1" DataSourceID="SqlDataSource1" AutoGenerateColumns="False"
        GridLines="None" CssClass="grid" runat="server" DataKeyNames="Id">
        <Columns>
            <asp:BoundField DataField="AdId" HeaderText="AdId" SortExpression="AdId" />
            <asp:BoundField DataField="Impressions" HeaderText="Impressions" 
                ReadOnly="True" SortExpression="Impressions" />
            <asp:BoundField DataField="ImageUrl" HeaderText="ImageUrl" 
                SortExpression="ImageUrl" />
            <asp:BoundField DataField="NavigateUrl" HeaderText="NavigateUrl" 
                SortExpression="NavigateUrl" />
            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
            <asp:BoundField DataField="Height" HeaderText="Height" 
                SortExpression="Height" />
            <asp:BoundField DataField="Keyword" HeaderText="Keyword" 
                SortExpression="Keyword" />
            <asp:BoundField DataField="AlternateText" HeaderText="AlternateText" 
                SortExpression="AlternateText" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
        
        SelectCommand="SELECT AdStats.AdId, COUNT(*) AS Impressions, AdList.ImageUrl, AdList.NavigateUrl, AdList.Width, AdList.Height, AdList.Keyword, AdList.AlternateText, AdStats.Id FROM AdStats INNER JOIN AdList ON AdStats.Id = AdList.Id WHERE (AdStats.Type = 0) GROUP BY AdStats.AdId, AdList.ImageUrl, AdList.NavigateUrl, AdList.Width, AdList.Height, AdList.Keyword, AdList.AlternateText, AdStats.Id ORDER BY Impressions DESC" 
        runat="server" />
            
            
            <div>
                 <h2>Ads</h2>
                 <table class="style1" border="1">
                     <tr>
                         <td class="style7">
                             9</td>
                         <td class="style7">
                             Ad1</td>
                         <td class="style7">
                             <img alt="Ad1" class="style2" src="Ads/Ad1.gif" /></td>
                     </tr>
                     <tr>
                         <td class="style7">
                             10</td>
                         <td class="style7">
                             Ad2</td>
                         <td class="style7">
                             <img alt="Ad2" class="style3" src="Ads/Ad2.gif" /></td>
                     </tr>
                     <tr>
                         <td class="style7">
                             11</td>
                         <td class="style7">
                             Ad3</td>
                         <td class="style7">
                             <img alt="Ad3" class="style4" src="Ads/Ad3.jpg" /></td>
                     </tr>
                     <tr>
                         <td class="style7">
                             12</td>
                         <td class="style7">
                             Ad4</td>
                         <td class="style7">
                             <img alt="Ad4" class="style5" src="Ads/Ad4.jpg" /></td>
                     </tr>
                     <tr>
                         <td class="style7">
                             13</td>
                         <td class="style7">
                             Ad5</td>
                         <td class="style7">
                             <a href="Ads/ad5.swf">ad5.swf</a></td>
                     </tr>
                     </table>
            </div>
           
           <h2>
        Ads Defintion Database</h2>
    <asp:GridView ID="GridView2" DataSourceID="SqlDataSource2" AutoGenerateColumns="False"
        GridLines="None" CssClass="grid" runat="server" DataKeyNames="Id">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" 
                SortExpression="Id" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="ImageUrl" HeaderText="ImageUrl" 
                SortExpression="ImageUrl" />
            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
            <asp:BoundField DataField="Height" HeaderText="Height" 
                SortExpression="Height" />
            <asp:BoundField DataField="NavigateUrl" HeaderText="NavigateUrl" 
                SortExpression="NavigateUrl" />
            <asp:BoundField DataField="Keyword" HeaderText="Keyword" 
                SortExpression="Keyword" />
            <asp:BoundField DataField="Impressions" HeaderText="Impressions" 
                SortExpression="Impressions" />
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="44px" 
                        ImageUrl='<%# Bind("ImageUrl") %>' Width="165px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
 
        SelectCommand="SELECT Id, ImageUrl, Width, Height, NavigateUrl, Keyword, Impressions FROM AdList" 
        runat="server" />
            

    <h2>
        Transfers</h2>
    <asp:GridView ID="grdTransfers" DataSourceID="srcTransfers" AutoGenerateColumns="False"
        GridLines="None" CssClass="grid" runat="server">
        <Columns>
            <asp:BoundField DataField="AdId" HeaderText="AdId" />
            <asp:BoundField DataField="Transfers" HeaderText="Transfers" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="srcTransfers" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
 SelectCommand="SELECT AdId,Count(*) As Transfers
            FROM AdStats
            WHERE Type=1
            GROUP BY AdId
            ORDER BY Transfers DESC" runat="server" />
            
            
            <br />
            
            <h2>Total Impression/Clicks</h2>

             <asp:GridView ID="TotalGridView" DataSourceID="Total" AutoGenerateColumns="False"
        GridLines="None" CssClass="grid" runat="server" DataKeyNames="id">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="AdId" HeaderText="AdId" SortExpression="AdId" />
            <asp:BoundField DataField="TotalImpression" HeaderText="TotalImpression" 
                SortExpression="TotalImpression" />
            <asp:BoundField DataField="TotalClick" HeaderText="TotalClick" 
                SortExpression="TotalClick" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="Total" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
 SelectCommand="SELECT AdTotalStats.* FROM AdTotalStats" runat="server" />

    <asp:HyperLink ID="BackToHomeHyperLink" runat="server" 
        NavigateUrl="~/Advertiser/Home.aspx">Back</asp:HyperLink>
        
           <asp:Panel ID="CustomerReport" runat="server">
        <rsweb:ReportViewer ID="CustomerReportViewer" runat="server" Font-Names="Verdana"
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana"
            WaitMessageFont-Size="14pt" Height="536px" Width="712px" 
                   ExportContentDisposition="AlwaysAttachment" SizeToReportContent="True">
            <LocalReport ReportPath="Advertiser\Report\StatsReport.rdlc" EnableExternalImages="True"
                EnableHyperlinks="True">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="AdListObjectDataSource" Name="AdListDataSet" />
                    <rsweb:ReportDataSource DataSourceId="AdStatsDataSetObjectDataSource"
                        Name="AdStatsDataSet" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="AdListObjectDataSource" runat="server" 
                   OldValuesParameterFormatString="original_{0}" SelectMethod="GetAdList" 
                   TypeName="AdDatabaseDataSetTableAdapters.AdListTableAdapter" >
            
            <SelectParameters>
                <asp:Parameter DefaultValue="10" Name="ID" Type="Int32" />
            </SelectParameters>
            
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="AdStatsDataSetObjectDataSource" runat="server" 
                   OldValuesParameterFormatString="original_{0}" SelectMethod="GetAdStats" 
                   TypeName="AdDatabaseDataSetTableAdapters.AdStatsTableAdapter">
          
            <SelectParameters>
                <asp:Parameter DefaultValue="5514" Name="ID" Type="Int32" />
            </SelectParameters>
          
        </asp:ObjectDataSource>
               <br />
    </asp:Panel>
    
    
  
</asp:Content>
