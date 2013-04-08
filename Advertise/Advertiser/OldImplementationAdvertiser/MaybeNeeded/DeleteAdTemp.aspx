<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="DeleteAdTemp.aspx.cs" Inherits="Advertiser_DeleteAdTemp" %>
<%@ Register TagPrefix="BannerRotator" Namespace="AdControl" Assembly="AdControl" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="AdListPanel" runat="server" Height="649px" Style="position: relative;
        overflow: hidden; top: 0px;" BackColor="White">
        <asp:Label ID="AdListLabel" runat="server" BackColor="#414952" Font-Bold="True" Height="20px"
            Style="position: relative" Text="<%$ Resources:Resource, MyAd %>" Width="100%"
            ForeColor="White"></asp:Label>
        <asp:GridView runat="server" ID="AdGridView" DataSourceID="AdSqlDataSource" AllowPaging="True"
            Width="850px" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID"
            CellPadding="4" ForeColor="#333333" GridLines="None" Style="text-align: center"
            OnRowDataBound="AdGridViewRowDataBound" OnSelectedIndexChanged="AdGridViewSelectedIndexChanged"
            PageSize="4">
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
                            FlashUrl='<%# Eval("ImageUrl", "{0}") %>' Width="150px" Height="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                </asp:CommandField>
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
        </asp:GridView>
        <asp:SqlDataSource ID="AdSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            SelectCommand="SELECT ID, AdName, StartDate, EndDate, CountryName, FlagPath, CountryCode, ImageUrl FROM TempAd"
            DeleteCommand="DeleteTempAd" DeleteCommandType="StoredProcedure">
            <deleteparameters>
                <asp:ControlParameter ControlID="AdGridView" Name="AdID" 
                    PropertyName="SelectedValue" />
            </deleteparameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
            PageSize="4">
            <Columns>
                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="ID"></asp:BoundField>
                <asp:BoundField DataField="AdName" HeaderText="AdName" SortExpression="AdName">
                </asp:BoundField>
                <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                    SortExpression="StartDate"></asp:BoundField>
                <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                    SortExpression="EndDate"></asp:BoundField>
                <asp:BoundField DataField="CountryName" HeaderText="CountryName" 
                    SortExpression="CountryName"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>" 
            DeleteCommand="DeleteTempAd" DeleteCommandType="StoredProcedure" 
            InsertCommand="INSERT INTO [AdAudience] ([AdID], [LanguageID], [GenderID], [AgeRangeID], [CountryID], [CountryName], [Zipcode], [IndustryID], [Profession], [DateCreated], [RegionID], [RegionName], [CityID], [CityName], [CountryCode], [FlagPath], [ProfessionID]) VALUES (@AdID, @LanguageID, @GenderID, @AgeRangeID, @CountryID, @CountryName, @Zipcode, @IndustryID, @Profession, @DateCreated, @RegionID, @RegionName, @CityID, @CityName, @CountryCode, @FlagPath, @ProfessionID)" 
            SelectCommand="SELECT ID, AdName, StartDate, EndDate, CountryName FROM TempAd" 
            UpdateCommand="UPDATE [AdAudience] SET [LanguageID] = @LanguageID, [GenderID] = @GenderID, [AgeRangeID] = @AgeRangeID, [CountryID] = @CountryID, [CountryName] = @CountryName, [Zipcode] = @Zipcode, [IndustryID] = @IndustryID, [Profession] = @Profession, [DateCreated] = @DateCreated, [RegionID] = @RegionID, [RegionName] = @RegionName, [CityID] = @CityID, [CityName] = @CityName, [CountryCode] = @CountryCode, [FlagPath] = @FlagPath, [ProfessionID] = @ProfessionID WHERE [AdID] = @AdID">
            <DeleteParameters>
                <asp:ControlParameter ControlID="AdGridView" DefaultValue="1" Name="AdID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AdID" Type="Int32" />
                <asp:Parameter Name="LanguageID" Type="Int32" />
                <asp:Parameter Name="GenderID" Type="Int32" />
                <asp:Parameter Name="AgeRangeID" Type="Int32" />
                <asp:Parameter Name="CountryID" Type="Int32" />
                <asp:Parameter Name="CountryName" Type="String" />
                <asp:Parameter Name="Zipcode" Type="String" />
                <asp:Parameter Name="IndustryID" Type="Int32" />
                <asp:Parameter Name="Profession" Type="String" />
                <asp:Parameter Name="DateCreated" Type="DateTime" />
                <asp:Parameter Name="RegionID" Type="Int32" />
                <asp:Parameter Name="RegionName" Type="String" />
                <asp:Parameter Name="CityID" Type="Int32" />
                <asp:Parameter Name="CityName" Type="String" />
                <asp:Parameter Name="CountryCode" Type="String" />
                <asp:Parameter Name="FlagPath" Type="String" />
                <asp:Parameter Name="ProfessionID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LanguageID" Type="Int32" />
                <asp:Parameter Name="GenderID" Type="Int32" />
                <asp:Parameter Name="AgeRangeID" Type="Int32" />
                <asp:Parameter Name="CountryID" Type="Int32" />
                <asp:Parameter Name="CountryName" Type="String" />
                <asp:Parameter Name="Zipcode" Type="String" />
                <asp:Parameter Name="IndustryID" Type="Int32" />
                <asp:Parameter Name="Profession" Type="String" />
                <asp:Parameter Name="DateCreated" Type="DateTime" />
                <asp:Parameter Name="RegionID" Type="Int32" />
                <asp:Parameter Name="RegionName" Type="String" />
                <asp:Parameter Name="CityID" Type="Int32" />
                <asp:Parameter Name="CityName" Type="String" />
                <asp:Parameter Name="CountryCode" Type="String" />
                <asp:Parameter Name="FlagPath" Type="String" />
                <asp:Parameter Name="ProfessionID" Type="String" />
                <asp:Parameter Name="AdID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:RoundedCornersExtender ID="AdListRoundedCornersExtender" runat="server" TargetControlID="AdListPanel"
        Color="SlateGray" Radius="9" Enabled="True" BorderColor="SlateGray">
    </asp:RoundedCornersExtender>
</asp:Content>


