<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReviewAd.aspx.cs" Inherits="Admanagment.ReviewAd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="AdControl" Namespace="AdControl" TagPrefix="BannerRotator" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title id="Title1" runat="server" title="<%$ Resources:Resource, ReviewAd %>"></title>
    <link rel="canonical" href="http://gravatar.com/beau" />
    <link rel="shortcut icon" href="http://en.gravatar.com/favicon.ico" />
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .HalfWidth
        {
            width: 50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div style="width: 100%; background: #1e8cbe;">
        <table style="margin: 0 auto;" align="center">
            <tr>
                <td>
                    <h2 id="H2SideJob" style="width: 960px;" align="center">
                        <asp:Label ID="H2SideJobLabel" runat="server" Text="Side Job" Font-Bold="True" Font-Size="Large"
                            Style="font-size: xx-large; font-family: Andy; color: #FFFFFF;"></asp:Label></h2>
                </td>
            </tr>
        </table>
    </div>
    <div id="wrap">
        <div id="header">
            <div class="middle">
                <UpperNavigationButtons:NavigationButtons runat="server" />
            </div>
        </div>
        <div id="main">
            <div class="middle">
                <div class="box-top">
                </div>
                <div class="box">
                    <table style="font-size: 10pt; font-family: Verdana; text-align: center" width="820">
                        <tr>
                            <td colspan="2">
                                <h5 id="H5CreateAd" style="width: 820px;" align="center" class="CustomHeader">
                                    <asp:Label ID="ReviewADLabel" runat="server" Text="<%$ Resources:Resource, ReviewAd %>"
                                        Font-Bold="True" Font-Size="Large" Style="font-size: large; font-family: Andy;
                                        color: #FFFFFF;"></asp:Label></h5>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth" colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth" colspan="2">
                                <BannerRotator:BannerRotator ID="BannerRotator1" DataSourceID="BannerSqlDataSource"
                                    Target="_blank" OnAdCreated="AdRotator1AdCreated"  
                                    runat="server" />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth" colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <asp:SqlDataSource ID="BannerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
                                    SelectCommand="SELECT ID, ImageUrl, Width, Height, NavigateUrl, AlternateText, Keyword FROM TempAd WHERE ([ID] = @ID)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter  Name="ID" QueryStringField="ID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <span>
                                        <asp:Label ID="NewCampaignLabel" runat="server" Text="<%$ Resources:Resource, NewCampaingName %>"></asp:Label></span>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="NewCampaingTextBox" runat="server" Width="230px" BackColor="#1E8CBE"
                                        ForeColor="White"></asp:TextBox></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="SiteLabel" runat="server" Text="<%$ Resources:Resource, Site %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    <asp:DropDownList ID="SiteDropDownList" runat="server" Width="230px" BackColor="#1E8CBE"
                                        ForeColor="White">
                                        <asp:ListItem Value="1" Text="YourSideJob.com" />
                                        <asp:ListItem Value="2" Text="Forum" />
                                        <asp:ListItem Value="3" Text="AdvertiseSide" />
                                    </asp:DropDownList>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="SectionsLabel" runat="server" Text="<%$ Resources:Resource, Sections %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    <asp:DropDownList ID="SectionDropDownList" runat="server" DataSourceID="SectionObjectDataSource"
                                        DataTextField="SectionName" DataValueField="SectionsID" Width="230px" BackColor="#1E8CBE"
                                        ForeColor="White">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="SectionObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetSections" TypeName="AdUtilityTableAdapters.SectionsTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="LanguageLabel" runat="server" Text="<%$ Resources:Resource, Language %>"></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:DropDownList ID="LanguageDropDownList" runat="server" Width="230px" BackColor="#1E8CBE"
                                        ForeColor="White">
                                        <asp:ListItem Value="1" Text="<%$ Resources:Resource, English %>" Selected="true" />
                                        <asp:ListItem Value="2" Text="<%$ Resources:Resource, French %>" />
                                        <asp:ListItem Value="3" Text="<%$ Resources:Resource, Spanish %>" />
                                        <asp:ListItem Value="4" Text="<%$ Resources:Resource, Chinese %>" />
                                        <asp:ListItem Value="5" Text="<%$ Resources:Resource, Russian %>" />
                                        <asp:ListItem Value="6" Text="<%$ Resources:Resource, Arabic %>" />
                                        <asp:ListItem Value="7" Text="<%$ Resources:Resource, Japanese %>" />
                                        <asp:ListItem Value="8" Text="<%$ Resources:Resource, German %>" />
                                    </asp:DropDownList>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="GenderLabel" runat="server" Text="<%$ Resources:Resource, Gender %>"></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:DropDownList ID="GenderDropDownList" runat="server" Width="230px" BackColor="#1E8CBE"
                                        ForeColor="White">
                                        <asp:ListItem Value="1" Text="<%$ Resources:Resource, Male %>"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="<%$ Resources:Resource, Female %>"></asp:ListItem>
                                    </asp:DropDownList>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="AgeRangeLabel" runat="server" Text="<%$ Resources:Resource, AgeRange %>"></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:DropDownList ID="AgeDropDownList" runat="server" Width="230px" DataSourceID="AgeRangeObjectDataSource"
                                        DataTextField="AgeRangeValue" DataValueField="AgeRangeID" BackColor="#1E8CBE"
                                        ForeColor="White">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="AgeRangeObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetAgeRanges" TypeName="AdUtilityTableAdapters.AgeRangesTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="CountryLabel" runat="server" Text="<%$ Resources:Resource, CountryName %>"></asp:Label>
                                </p>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="CountryUpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" DataSourceID="CountriesDataSource"
                                            DataTextField="Title" DataValueField="CountryId" Font-Size="Small" Width="230px"
                                            BackColor="#1E8CBE" ForeColor="White">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="CountriesDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetCountries" TypeName="LocationDataSetTableAdapters.CountriesUpdateTableAdapter">
                                        </asp:ObjectDataSource>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="RegionLabel" runat="server" Text="<%$ Resources:Resource, RegionName %>"></asp:Label></p>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="RegionUpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="RegionsDropDownList" runat="server" AutoPostBack="True" DataSourceID="RegionDataSource"
                                            DataTextField="Region" DataValueField="RegionId" Font-Size="Small" Width="230px"
                                            BackColor="#1E8CBE" ForeColor="White">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="RegionDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetRegion" TypeName="LocationDataSetTableAdapters.regionsUpdateTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="CountryDropDownList" Name="CountryId" PropertyName="SelectedValue"
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="CountryDropDownList" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="CityLabel" runat="server" Text="<%$ Resources:Resource, CityName %>"></asp:Label>
                                </p>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="CityUpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="CitiesDropDownList" runat="server" AutoPostBack="True" DataSourceID="CitiesObjectDataSource"
                                            DataTextField="City" DataValueField="CityId" Width="230px" BackColor="#1E8CBE"
                                            ForeColor="White">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="CitiesObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetCities" TypeName="LocationDataSetTableAdapters.CitiesUpdateTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="CountryDropDownList" Name="CountryId" PropertyName="SelectedValue"
                                                    Type="Int32" />
                                                <asp:ControlParameter ControlID="RegionsDropDownList" Name="RegionId" PropertyName="SelectedValue"
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="RegionsDropDownList" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="ZipcodeLabel" runat="server" Text="<%$ Resources:Resource, Zipcode %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="ZipcodeTextBox" runat="server" Width="230px" BackColor="#1E8CBE"
                                        ForeColor="White"></asp:TextBox></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="IndustryLabel" runat="server" Text="<%$ Resources:Resource, IndustryLabel %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    <asp:DropDownList ID="IndustryDropDownList" runat="server" AutoPostBack="True" DataSourceID="CategoryObjectDataSource"
                                        DataTextField="CategoryName" DataValueField="CategoryID" Width="230px" BackColor="#1E8CBE"
                                        ForeColor="White">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="CategoryObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetCategory" TypeName="SpecializationDataSetTableAdapters.GetCategoryTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="ProfessionLabel" runat="server" Text="<%$ Resources:Resource, Profession %>"></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="ProfessionTextBox" runat="server" Height="137px" Width="236px" BackColor="#1E8CBE"
                                        ForeColor="White" TextMode="MultiLine"></asp:TextBox>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="StartDateLabel" runat="server" Text="<%$ Resources:Resource, StartDateLabel %>"></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="StartDateTextBox" runat="server" Width="230px" BackColor="#1E8CBE"
                                        ForeColor="White"></asp:TextBox>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="EndDateLabel" runat="server" Text="<%$ Resources:Resource, EndDateLabel %>"></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="EndDateTextBox" runat="server" Width="230px" BackColor="#1E8CBE"
                                        ForeColor="White"></asp:TextBox>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                             <asp:Button ID="SaveAdButton" runat="server" 
                                    Text="<%$ Resources:Resource, Save %>" Width="121px" 
                                    onclick="SaveAdButton_Click" />
                               
                            </td>
                            <td align="right" style="text-align: center">
                                 <asp:Button ID="EditAdButton" runat="server" Text="<%$ Resources:Resource, Edit %>"
                                    Width="121px" OnClick="EditAdButtonClick" />
                            </td>
                        </tr>
                        <tr>
                            <td  colspan="2" style="text-align: center">  <asp:Button ID="PlaceAdButton" runat="server" Text="<%$ Resources:Resource, OrderAd %>"
                                    Width="121px" onclick="PlaceAdButtonClick" />
                                
                            </td>
                        </tr>
                    </table>
                    <span class="clear"></span>
                </div>
                <div class="box-bottom">
                </div>
                <span class="clear"></span>
            </div>
            <span class="clear"></span>
        </div>
        <div id="footer1">
            <LowerNavigationButtons:NavigationButtons runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
