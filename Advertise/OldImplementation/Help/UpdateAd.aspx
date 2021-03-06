﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="UpdateAd.aspx.cs" Inherits="UpdateAd" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        .HalfWidth
        {
            width: 410px;
        }
        .ProfessionStyle
        {
            width: 307px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
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
                                    <asp:TextBox ID="NewCampaingTextBox" runat="server" Width="230px" 
                                        MaxLength="250"></asp:TextBox>
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
                                        <asp:ListItem Value="1" Text="YourSideJob.com" Selected="true"  />
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
                                    <asp:FileUpload ID="CreativeFileUpload" runat="server" Width="230px" /></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="HalfWidth">
                                <p>
                                    <asp:Label ID="AlternativeTextLabel" runat="server" Text="<%$ Resources:Resource, AlternativeText %>"></asp:Label></p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="AlternativeTextTextBox" runat="server" Height="110px" 
                                        Width="230px" MaxLength="300" TextMode="MultiLine"></asp:TextBox></p>
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
                                                        <asp:ListBox ID="SpecialityListBox3" runat="server" DataSourceID="SpecialtyList3ObjectDataSource"
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
                                                        <asp:ListBox ID="SpecialityListBox2" runat="server" DataSourceID="SpecialtyList2ObjectDataSource"
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
                                    <link type="text/css" rel="stylesheet" href="Styles/jquery-ui-1.8.12.custom.css" />
                                    <script type="text/javascript" src="Scripts/jquery-1.5.1.min.js"></script>
                                    <script type="text/javascript" src="Scripts/jquery-ui-1.8.12.custom.min.js"></script>
                                    <script type="text/javascript" language="javascript">
                                        $(document).ready(function () {
                                            $("#datepicker").datepicker({
                                                minDate: -1000,
                                                maxDate: "+1000000D",
                                                onSelect: function (selected) {
                                                    $("#datepicker2").datepicker("option", "minDate", selected);
                                                }
                                            });
                                            $("#datepicker2").datepicker({
                                                minDate: -1000,
                                                maxDate: "+1000000D",
                                                onSelect: function (selected) {
                                                    $("#datepicker").datepicker("option", "maxDate", selected);
                                                }
                                            });
                                            $('#TimeFilter').click(function () {
                                                $('#timeFrame').toggle('slow');
                                            });
                                            $('#FilterButton').click(function () {
                                                var dateIni = new Date($('#datepicker').val()).getTime();
                                                var dateEnd = new Date($('#datepicker2').val()).getTime();

                                                if (dateIni > dateEnd) {
                                                    alert(new Date($('#datepicker').val()) + ' > ' + new Date($('#datepicker2').val()));
                                                }
                                                else {
                                                    $('#HiddenToField').val($('#datepicker2').val());
                                                    $('#HiddenFromField').val($('#datepicker').val());
                                                    var query = 't1?=' + $('#datepicker').val() + '&t2?= ' + $('#datepicker2').val();
                                                    $('myFrame').attr('src', window.location.href + query);
                                                    window.location.href = window.location.href + query;
                                                    $('#timeFrame').hide('slow');
                                                }
                                            });
                                        });
                                    </script>
                                    <div id="Time">
                                        <div id="TimeFrame" style="display: block">
                                            <table width="800px">
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td>
                                                        <p>
                                                            <asp:Label ID="StartDateLabel" runat="server" Text="<%$ Resources:Resource, StartDate %>"></asp:Label>
                                                            <div id="datepicker">
                                                            </div>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <p>
                                                            <asp:Label ID="EndDateLabel" runat="server" Text="<%$ Resources:Resource, EndDate %>"></asp:Label>
                                                            <div id="datepicker2">
                                                            </div>
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:HiddenField ID="HiddenFromField" runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:HiddenField ID="HiddenToField" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
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
                                <asp:Button ID="FilterButton" runat="server" Text="<%$ Resources:Resource, CreateAd %>"
                                    Width="121px" />
                            </td>
                        </tr>
                    </table>
</asp:Content>

