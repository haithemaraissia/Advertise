<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeAd.aspx.cs" Inherits="Advertiser_Compaign_Saved_ChangeAd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../../common/TemplateMainLowerButtons.ascx" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, ChangeAd %>"></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="canonical" href="http://gravatar.com/beau" />
    <link rel="shortcut icon" href="http://en.gravatar.com/favicon.ico" />
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .HalfWidth
        {
            width: 410px;
        }
        .ProfessionStyle
        {
            width: 307px;
        }
        
        /*
            Set the Style for parent CSS Class
            of Calendar control
            Parent [CssClass] = myCalendar
        */
        .myCalendar
        {
            background-color: #efefef;
            width: 200px;
        }
        
        /*
            Common style declaration for hyper linked text
        */
        .myCalendar a
        {
            text-decoration: none;
        }
        
        /*
            Styles declaration for top title
            [TitleStyle] [CssClass] = myCalendarTitle
        */
        .myCalendar .myCalendarTitle
        {
            font-weight: bold;
        }
        
        /*
            Styles declaration for date cells
            [DayStyle] [CssClass] = myCalendarDay
        */
        .myCalendar td.myCalendarDay
        {
            border: solid 2px #fff;
            border-left: 0;
            border-top: 0;
        }
        
        /*
            Styles declaration for next/previous month links
            [NextPrevStyle] [CssClass] = myCalendarNextPrev
        */
        .myCalendar .myCalendarNextPrev
        {
            text-align: center;
        }
        
        /*
            Styles declaration for Week/Month selector links cells
            [SelectorStyle] [CssClass] = myCalendarSelector
        */
        .myCalendar td.myCalendarSelector
        {
            background-color: #dddddd;
        }
        
        .myCalendar .myCalendarDay a, .myCalendar .myCalendarSelector a, .myCalendar .myCalendarNextPrev a
        {
            display: block;
            line-height: 18px;
        }
        
        .myCalendar .myCalendarDay a:hover, .myCalendar .myCalendarSelector a:hover
        {
            background-color: #cccccc;
        }
        
        .myCalendar .myCalendarNextPrev a:hover
        {
            background-color: #fff;
        }
    </style>
    <script type="text/javascript">
        function uploadError(sender, args) {
            window.$get("SucessLabel").style.display = 'none';
            window.$get("FailureLabel").style.display = 'block';
            window.$get("ErrorFileTypeLabel").style.display = 'block';
            window.$get("ErrorFileSizeLabel").style.display = 'block';
        }

        function uploadComplete(sender, args) {

            var completeSuccess = true;

            /*Validation for file extension*/
            var fileName = args.get_fileName();

            // extract and store the file extension into another variable
            var fileExtension = fileName.substr(fileName.length - 3, 3);

            // array of allowed file type extensions
            // peg for jpeg  iff for tiff
            var validFileExtensions = new Array("jpg", "gif", "peg", "png", "bmp", "iff", "swf");

            var flag = false;
            // loop over the valid file extensions to compare them with uploaded file
            for (var index = 0; index < validFileExtensions.length; index++) {
                if (fileExtension.toLowerCase() == validFileExtensions[index].toString().toLowerCase()) {
                    flag = true;
                }
            }

            /*Validation for file size*/
            if (parseInt(args.get_length()) >= 4096000) {
                completeSuccess = false;
                flag = false;
                return;
            }
            /*Validation for file size*/

            if (flag == false) {
                window.$get("SucessLabel").style.display = 'none';
                window.$get("FailureLabel").style.display = 'block';
                window.$get("ErrorFileTypeLabel").style.display = 'block';
                completeSuccess = false;
                return;

            }

            if (flag == true) {
                window.$get("SucessLabel").style.display = 'block';
                window.$get("FailureLabel").style.display = 'none';
                window.$get("ErrorFileSizeLabel").style.display = 'none';
                window.$get("ErrorFileTypeLabel").style.display = 'none';
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div style="width: 100%; background: #1e8cbe;">
        <table align="center" style="margin: 0 auto;">
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
                <UpperNavigationButtons:NavigationButtons ID="NavigationButtons1" runat="server" />
            </div>
        </div>
        <div id="main">
            <div class="middle">
                <div class="box-top">
                </div>
                <div class="box">
                    <table style="font-size: 10pt; font-family: Verdana; text-align: center" width="820"
                        cellpadding="5px">
                        <tr>
                            <td colspan="2">
                                <h5 id="H5CreateAd" style="width: 820px;" align="center" class="CustomHeader">
                                    <asp:Label ID="CreateADLabel" runat="server" Text="<%$ Resources:Resource, CreateAd %>"
                                        Font-Bold="True" Font-Size="Large" Style="font-size: large; font-family: Andy;
                                        color: #FFFFFF;"></asp:Label></h5>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
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
                                    <asp:TextBox ID="NewCampaingTextBox" runat="server" Width="230px" MaxLength="250"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewCampaingRequired" runat="server" ControlToValidate="NewCampaingTextBox"
                                        ErrorMessage="<%$ Resources:Resource, CampaignNameRequiredFieldValidator %>"
                                        ToolTip="<%$ Resources:Resource, CampaignNameRequiredFieldValidator %>" Display="None">*</asp:RequiredFieldValidator>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="SiteLabel" runat="server" Text="<%$ Resources:Resource, Site %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    <asp:DropDownList ID="SiteDropDownList" runat="server" Width="230px">
                                        <asp:ListItem Value="1" Text="YourSideJob.com" Selected="true" />
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
                                    <asp:DropDownList ID="SectionDropDownList" runat="server" Width="230px" DataSourceID="SectionObjectDataSource"
                                        DataTextField="SectionName" DataValueField="SectionsID">
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
                                    <asp:Label ID="PositionLabel" runat="server" Text="<%$ Resources:Resource, Position %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    <asp:DropDownList ID="PositionDropDownList" runat="server" Width="230px" DataSourceID="PositionObjectDataSource"
                                        DataTextField="PositionName" DataValueField="PositionID">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="PositionObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetPositions" TypeName="AdUtilityTableAdapters.PositionsTableAdapter">
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
                                    <asp:Label ID="DestinationURLLabel" runat="server" Text="<%$ Resources:Resource, DestinationURL %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="DestinationURLTextBox" runat="server" Width="230px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="DestinationURLRegularExpressionValidator" runat="Server"
                                        ControlToValidate="DestinationURLTextBox" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                        ErrorMessage="<%$ Resources:Resource, URLValidation %>" Display="none" ToolTip="<%$ Resources:Resource, URLValidation %>">*</asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="DestinationURLRequiredFieldValidator" runat="server"
                                        ControlToValidate="DestinationURLTextBox" ErrorMessage="<%$ Resources:Resource, DestinationURLRequiredFieldValidator %>"
                                        ToolTip="<%$ Resources:Resource, DestinationURLRequiredFieldValidator %>" Display="None"
                                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="FormatLabel" runat="server" Text="<%$ Resources:Resource, Format %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    <asp:DropDownList ID="FormatDropDownList" runat="server" Width="230px">
                                        <asp:ListItem Value="1" Text="<%$ Resources:Resource, Image %>" Selected="true" />
                                        <asp:ListItem Value="2" Text="<%$ Resources:Resource, Flash %>" />
                                    </asp:DropDownList>
                                </p>
                            </td>
                        </tr>
                       <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="CreativeLabel" runat="server" Text="<%$ Resources:Resource, Creative %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    &nbsp;<asp:AsyncFileUpload OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete" 
                                        runat="server" ID="AsyncFileUpload1" Width="300px" UploaderStyle="Modern" UploadingBackColor="#CCFFFF"
                                        ThrobberID="myThrobber" FailedValidation="False" BorderWidth="0px" OnUploadedComplete="AsyncFileUploadUploadedComplete" PersistFile="true"  />
                                    <p>
                                        <asp:TextBox ID="AsyncFileUpload" runat="server" Height="0px" Width="0px"></asp:TextBox>
                                        <asp:Label ID="myThrobber" runat="server" Style="display: none; top: 10">
                                <img  alt="uploading" src="../images/uploading.gif" />
                                        </asp:Label>
                                        <asp:Label ID="SucessLabel" runat="server" Style="display: none; position: relative;
                                            top: 15px; z-index: 1; left: 10px" Width="20px">
                                <img alt="GreenCheckMark" src="../images/GreenCheckMark.gif" width="16" />
                                        </asp:Label>
                                        <asp:Label ID="FailureLabel" runat="server" Style="display: none; position: relative;
                                            z-index: 1; top: 15px; left: 10px" Width="20px">
                                <img alt="RedCheckMark" src="../images/RedCheckMark.gif"  width="16" />
                                        </asp:Label>
                                        <asp:Label ID="ErrorFileTypeLabel" runat="server" Font-Bold="True" Font-Names="Times New Roman"
                                            Font-Size="Small" ForeColor="Maroon" Height="52px" Style="display: none; overflow: visible;
                                            text-align: center; z-index: 2; top: -10px;" Text="<%$ Resources:Resource, ProjectRequirementContentTypeLabel %>"
                                            Width="113px"></asp:Label>
                                        <asp:Label ID="ErrorFileSizeLabel" runat="server" Font-Bold="True" Font-Names="Times New Roman"
                                            Font-Size="Small" ForeColor="Maroon" Style="display: none; position: relative;
                                            z-index: 100; top: 30px; left: 0px; text-align: center" Text="<%$ Resources:Resource, ProjectRequirementContentSizeLabel %>"
                                            Width="100px"></asp:Label>
                                    </p>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                            </td>
                            <td>
                                <asp:CustomValidator ID="AsyncFileUploadCustomValidator" ControlToValidate="AsyncFileUpload"
                                    Display="None" ErrorMessage="<%$ Resources:Resource, PleaseSelectCreative %>"
                                    SetFocusOnError="True" ValidateEmptyText="True" Font-Bold="True" runat="server"
                                    OnServerValidate="AsyncFileUploadCustomValidatorServerValidate"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="AlternativeTextLabel" runat="server" Text="<%$ Resources:Resource, AlternativeText %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="AlternativeTextTextBox" runat="server" Height="110px" Width="230px"
                                        MaxLength="300" TextMode="MultiLine"></asp:TextBox></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <br />
                                <br />
                                <asp:ValidatorCalloutExtender ID="NewCampaingValidatorCalloutExtender" runat="server"
                                    TargetControlID="NewCampaingRequired">
                                </asp:ValidatorCalloutExtender>
                                <asp:ValidatorCalloutExtender ID="DestinationURLRegularExpressionCalloutExtender"
                                    runat="server" TargetControlID="DestinationURLRegularExpressionValidator">
                                </asp:ValidatorCalloutExtender>
                                <asp:ValidatorCalloutExtender ID="DestinationURLValidatorCalloutExtender" runat="server"
                                    TargetControlID="DestinationURLRequiredFieldValidator">
                                </asp:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h5 id="H1" style="width: 820px;" align="center" class="CustomHeader">
                                    <asp:Label ID="ChooseyourAudienceLabel" runat="server" Text="<%$ Resources:Resource, ChooseyourAudience %>"
                                        Font-Bold="True" Font-Size="Large" Style="font-size: large; font-family: Andy;
                                        color: #FFFFFF;"></asp:Label></h5>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                            </td>
                            <td>
                                &nbsp;
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
                                    <asp:DropDownList ID="LanguageDropDownList" runat="server" Width="230px">
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
                                    <asp:DropDownList ID="GenderDropDownList" runat="server" Width="230px">
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
                                        DataTextField="AgeRangeValue" DataValueField="AgeRangeID">
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
                                            DataTextField="Title" DataValueField="CountryId" Font-Size="Small" Width="230px">
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
                                            DataTextField="Region" DataValueField="RegionId" Font-Size="Small" Width="230px">
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
                                            DataTextField="City" DataValueField="CityId" Width="230px">
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
                                    <asp:TextBox ID="ZipcodeTextBox" runat="server" Width="230px"></asp:TextBox></p>
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
                                        DataTextField="CategoryName" DataValueField="CategoryID" Width="260px">
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
                            <td colspan="2">
                                <table>
                                    <tr>
                                        <td class="ProfessionStyle">
                                            <div id="profession" style="left: 51px; position: relative; top: 0px;">
                                                <p>
                                                    <asp:Label ID="ProfessionLabel" runat="server" Text="<%$ Resources:Resource, Profession %>"></asp:Label>
                                                </p>
                                            </div>
                                        </td>
                                        <td>
                                            <asp:Panel ID="SpecialityPanel" runat="server" BackColor="White" BorderColor="Maroon"
                                                BorderWidth="0px" Height="243px" Style="left: 14px; position: relative" Width="387px"
                                                Wrap="False">
                                                <asp:UpdatePanel ID="SpecializationUpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:ListBox ID="SpecialityListBox1" runat="server" DataSourceID="SpecialtyList1ObjectDataSource"
                                                            DataTextField="JobTitle" DataValueField="JobID" Font-Size="8pt" Height="207px"
                                                            SelectionMode="Multiple" Style="left: 6px; position: absolute; top: 25px" Width="139px">
                                                        </asp:ListBox>
                                                        <asp:ObjectDataSource ID="SpecialtyList1ObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetFirstListSpeciality" TypeName="SpecializationDataSetTableAdapters.GetFirstListSpecialtyTableAdapter">
                                                            <SelectParameters>
                                                                <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                                                    PropertyName="SelectedValue" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                        &nbsp;
                                                        <asp:ListBox ID="SpecialityListBox2" runat="server" DataSourceID="SpecialtyList3ObjectDataSource"
                                                            DataTextField="JobTitle" DataValueField="JobID" Font-Size="8pt" Height="207px"
                                                            SelectionMode="Multiple" Style="left: 340px; position: absolute; top: 25px" Width="139px">
                                                        </asp:ListBox>
                                                        <asp:ObjectDataSource ID="SpecialtyList3ObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetThirdListSpeciality" TypeName="SpecializationDataSetTableAdapters.GetFirstListSpecialtyTableAdapter">
                                                            <SelectParameters>
                                                                <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                                                    PropertyName="SelectedValue" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                        &nbsp;
                                                        <asp:ListBox ID="SpecialityListBox3" runat="server" DataSourceID="SpecialtyList2ObjectDataSource"
                                                            DataTextField="JobTitle" DataValueField="JobID" Font-Size="8pt" Height="207px"
                                                            SelectionMode="Multiple" Style="left: 173px; position: absolute; top: 25px" Width="139px">
                                                        </asp:ListBox>
                                                        <asp:ObjectDataSource ID="SpecialtyList2ObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetSecondListSpeciality" TypeName="SpecializationDataSetTableAdapters.GetFirstListSpecialtyTableAdapter">
                                                            <SelectParameters>
                                                                <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                                                    PropertyName="SelectedValue" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                        &nbsp;
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="IndustryDropDownList" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <br />
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <br />
                                <br />
                            </td>
                            <td>
                                &nbsp;
                            </td>
&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h5 id="CompaignScheduleHeader" style="width: 820px;" align="center" class="CustomHeader">
                                    <asp:Label ID="H5CompaignScheduleLabel" runat="server" Text="<%$ Resources:Resource, CampaignSchedule %>"
                                        Font-Bold="True" Font-Size="Large" Style="font-size: large; font-family: Andy;
                                        color: #FFFFFF;"></asp:Label></h5>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="2">
                                <div>
                                    <div id="Time">
                                        <div id="TimeFrame" style="display: block">
                                            <asp:UpdatePanel ID="TimeFrameUpdatePanel" runat="server">
                                                <ContentTemplate>
                                                    <table width="800px" align="center">
                                                        <tr align="center">
                                                            <td>
                                                                <asp:Label ID="StartDateLabel" runat="server" Text="<%$ Resources:Resource, StartDate %>"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="EndDateLabel" runat="server" Text="<%$ Resources:Resource, EndDate %>"></asp:Label>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr align="center">
                                                            <td>
                                                                <p>
                                                                    <asp:Calendar ID="StartDateCalendar" runat="server" Height="90px" Width="250px" DayNameFormat="FirstTwoLetters"
                                                                        onchange="javascript:$find('LocationDelayModalPopupExtender').show();" onselecteddate="javascript:$find('LocationDelayModalPopupExtender').show();"
                                                                        CssClass="myCalendar" OnSelectionChanged="StartDateCalendarSelectionChanged">
                                                                        <NextPrevStyle CssClass="myCalendarNextPrev" />
                                                                        <SelectedDayStyle CssClass="myCalendarSelector" />
                                                                        <SelectorStyle CssClass="myCalendarSelector" />
                                                                        <DayStyle CssClass="myCalendarDay" />
                                                                        <DayHeaderStyle Width="10px" CssClass="myCalendarDay" />
                                                                        <TitleStyle Font-Bold="True" Font-Underline="False" CssClass="myCalendarTitle" />
                                                                    </asp:Calendar>
                                                                </p>
                                                            </td>
                                                            <td>
                                                                <p>
                                                                    <asp:Calendar ID="EndDateCalendar" runat="server" Height="90px" Width="250px" DayNameFormat="FirstTwoLetters"
                                                                        CssClass="myCalendar" OnSelectionChanged="EndDateCalendarSelectionChanged">
                                                                        <NextPrevStyle CssClass="myCalendarNextPrev" />
                                                                        <SelectedDayStyle CssClass="myCalendarSelector" />
                                                                        <SelectorStyle CssClass="myCalendarSelector" />
                                                                        <DayStyle CssClass="myCalendarDay" />
                                                                        <DayHeaderStyle Width="10px" CssClass="myCalendarDay" />
                                                                        <TitleStyle Font-Bold="True" Font-Underline="False" CssClass="myCalendarTitle" />
                                                                    </asp:Calendar>
                                                                </p>
                                                            </td>
                                                        </tr>
                                                        <tr align="center">
                                                            <td colspan="2">
                                                                <asp:TextBox ID="DateErrorTextBox" runat="server" AutoPostBack="True" CausesValidation="True"
                                                                    ReadOnly="True" Visible="False"></asp:TextBox>
                                                                <asp:CustomValidator ID="CalenderCustomValidator" ControlToValidate="DateErrorTextBox"
                                                                    Display="Dynamic" ErrorMessage="<%$ Resources:Resource, CalenderCustomValidator %>"
                                                                    SetFocusOnError="True" ValidateEmptyText="True" Font-Bold="True" runat="server"
                                                                    OnServerValidate="CalenderCustomValidatorServerValidate"></asp:CustomValidator>
                                                                &#160;
                                                            </td>
                                                        </tr>
                                                        <tr align="center">
                                                            <td>
                                                                <asp:Button ID="DeleteAddButton" runat="server" Text="<%$ Resources:Resource, DeleteAd %>"
                                                                    Width="121px" onclick="DeleteAddButton_Click" />
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="UpdateAdButton" runat="server" Text="<%$ Resources:Resource, UpdateAd %>"
                                                                    Width="121px" onclick="UpdateAdButtonClick" CausesValidation="False" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                &nbsp;
                            </td>
                            <td align="right">
                                &nbsp;
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
        <div id="footer">
            <LowerNavigationButtons:NavigationButtons ID="NavigationButtons2" runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
