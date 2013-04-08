<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="TestWizard.aspx.cs" Inherits="test_TestWizard" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Reference Page="~/Account/Register.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, CreateNewAccount %>"></title>
    <style type="text/css">
        .ProfileRightColumn
        {
            width: 170px;
        }
        .ProfileLeftColumn2
        {
            width: 240px;
        }
        .ProfileRightColumn2
        {
            width: 170px;
        }
        .CustomizeExperienceRightColumn
        {
            width: 410px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:CreateUserWizard ID="SignUpCreateWizard" runat="server" ContinueDestinationPageUrl="~/Advertiser/UserProfile.aspx"
            DisableCreatedUser="false" Font-Names="Verdana" BackColor="white" Font-Size="10pt"
            CompleteSuccessText="The account has been successfully created." UnknownErrorMessage="The account was not created. Please try again."
            OnCreatedUser="SignUpCreateWizard_CreatedUser" ActiveStepIndex="0">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="Step 1: Profile Information">
                    <ContentTemplate>
                        <table style="font-size: 10pt; font-family: Verdana" border="0" width="820" cellpadding="5px">
                            <tr>
                                <td colspan="4">
                                    <h5 id="CreateProfileHeader" style="width: 820px;" align="center" class="CustomHeader">
                                        <asp:Label ID="ProfileHeaderLabel" runat="server" Text="<%$ Resources:Resource, ProfileInformation %>"
                                            Font-Bold="True" Font-Size="Large" Style="font-size: large; font-family: Andy;
                                            color: #FFFFFF;"></asp:Label></h5>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Text="<%$ Resources:Resource, UserName %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn">
                                    <asp:TextBox ID="UserName" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="<%$ Resources:Resource, UserNameRequiredFieldValidator %>" ToolTip="<%$ Resources:Resource, UserNameRequiredFieldValidator %>"
                                        ValidationGroup="SignUpCreateWizard" Display="None">*</asp:RequiredFieldValidator>
                                </td>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" Text="<%$ Resources:Resource, EmailAddress %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <asp:TextBox ID="Email" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                        ErrorMessage="<%$ Resources:Resource, EmailAddressRequiredFieldValidator %>"
                                        ToolTip="<%$ Resources:Resource, EmailAddressToolTip %>" ValidationGroup="SignUpCreateWizard"
                                        Display="None">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Text="<%$ Resources:Resource, Password %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn">
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="<%$ Resources:Resource, PasswordRequiredValidator %>" ToolTip="<%$ Resources:Resource, PasswordRequiredValidator %>"
                                        ValidationGroup="SignUpCreateWizard" Display="None">*</asp:RequiredFieldValidator>
                                </td>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword"
                                        Text="<%$ Resources:Resource, ConfirmNewPassword %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                        ErrorMessage="<%$ Resources:Resource, ConfirmNewPasswordRequiredValidator %>"
                                        ToolTip="<%$ Resources:Resource, ConfirmNewPasswordRequiredValidator %>" ValidationGroup="SignUpCreateWizard"
                                        Display="None">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn">
                                    <asp:Label ID="FirstNameLabel" runat="server" AssociatedControlID="FirstName" Text="<%$ Resources:Resource, FirstName %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn">
                                    <asp:TextBox ID="FirstName" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ControlToValidate="FirstName"
                                        ErrorMessage="<%$ Resources:Resource, FirstNameValidator %>" ToolTip="<%$ Resources:Resource, FirstNameToolTip %>"
                                        ValidationGroup="SignUpCreateWizard" Display="None" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                </td>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="LastNameLabel" runat="server" AssociatedControlID="LastName" Text="<%$ Resources:Resource, LastName %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <asp:TextBox ID="LastName" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ControlToValidate="LastName"
                                        ErrorMessage="<%$ Resources:Resource, LastNameRequiredFieldValidator %>" ToolTip="<%$ Resources:Resource, LastNameToolTip %>"
                                        ValidationGroup="SignUpCreateWizard" Display="None" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="GenderLabel" runat="server" AssociatedControlID="Gender" Text="<%$ Resources:Resource, Gender %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn">
                                    <asp:DropDownList ID="Gender" runat="server" Width="150px">
                                        <asp:ListItem Value="1" Text="<%$ Resources:Resource, Male %>"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="<%$ Resources:Resource, Female %>"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="AgeLabel" runat="server" AssociatedControlID="Age" Text="<%$ Resources:Resource, AgeLabel %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <asp:TextBox ID="Age" runat="server" MaxLength="3" Width="150px" Style="position: relative"
                                        Text="<%$ Resources:Resource, Eighteen %>"></asp:TextBox>
                                    <asp:RangeValidator ID="AgeRangeValidator" runat="server" ControlToValidate="Age"
                                        Display="Dynamic" ErrorMessage="<%$ Resources:Resource, AgeRequiredFieldValidator %>"
                                        MaximumValue="105" MinimumValue="18" SetFocusOnError="True" ToolTip="<%$ Resources:Resource, AgeLimitation %>"
                                        Type="Integer" ValidationGroup="SignUpCreateWizard" Style="position: relative">*</asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="AgeRequiredFieldValidator" runat="server" ControlToValidate="Age"
                                        Display="Dynamic" ErrorMessage="<%$ Resources:Resource, AgeRequiredFieldValidator %>"
                                        SetFocusOnError="True" ToolTip="<%$ Resources:Resource, AgeRequiredFieldValidator %>"
                                        ValidationGroup="SignUpCreateWizard" Style="position: relative">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn">
                                    <asp:Label ID="CountryLabel" runat="server" Text="<%$ Resources:Resource, CountryName %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn">
                                    <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" DataSourceID="CountriesDataSource"
                                        DataTextField="Title" DataValueField="CountryId" Font-Size="Small" Width="150px">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="CountriesDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetCountries" TypeName="LocationDataSetTableAdapters.CountriesUpdateTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="RegionLabel" runat="server" Text="<%$ Resources:Resource, RegionName2 %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <asp:DropDownList ID="RegionsDropDownList" runat="server" AutoPostBack="True" DataSourceID="RegionDataSource"
                                        DataTextField="Region" DataValueField="RegionId" Font-Size="Small" Width="150px">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="RegionDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetRegion" TypeName="LocationDataSetTableAdapters.regionsUpdateTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="CountryDropDownList" Name="CountryId" PropertyName="SelectedValue"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn">
                                    <asp:Label ID="CityLabel" runat="server" Text="<%$ Resources:Resource, CityLabel %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn">
                                    <asp:DropDownList ID="CitiesDropDownList" runat="server" AutoPostBack="True" DataSourceID="CitiesObjectDataSource"
                                        DataTextField="City" DataValueField="CityId" Width="150px">
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
                                </td>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="ZipcodeLabel" runat="server" AssociatedControlID="Zipcode" Text="<%$ Resources:Resource, Zipcode %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <asp:TextBox ID="Zipcode" runat="server" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn">
                                    <asp:Label ID="MaritalStatusLabel" runat="server" AssociatedControlID="MaritalStatus"
                                        Text="<%$ Resources:Resource, MaritalStatus %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn">
                                    <asp:DropDownList ID="MaritalStatus" runat="server" Width="150px">
                                        <asp:ListItem Value="Single" Text="<%$ Resources:Resource, Single %>" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="Married" Text="<%$ Resources:Resource, Married %>"></asp:ListItem>
                                        <asp:ListItem Value="Separated" Text="<%$ Resources:Resource, Separated %>"></asp:ListItem>
                                        <asp:ListItem Value="Divorced" Text="<%$ Resources:Resource, Divorced %>"></asp:ListItem>
                                        <asp:ListItem Value="Widowed" Text="<%$ Resources:Resource, Widowed %>"></asp:ListItem>
                                        <asp:ListItem Value="CivilUnion" Text="<%$ Resources:Resource, CivilUnion %>"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="LanguageLabel" runat="server" AssociatedControlID="Language" Text="<%$ Resources:Resource, Language %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <asp:DropDownList ID="Language" runat="server" Width="150px">
                                        <asp:ListItem Value="English" Text="<%$ Resources:Resource, English %>" Selected="true" />
                                        <asp:ListItem Value="French" Text="<%$ Resources:Resource, French %>" />
                                        <asp:ListItem Value="Spanish" Text="<%$ Resources:Resource, Spanish %>" />
                                        <asp:ListItem Value="Chinese" Text="<%$ Resources:Resource, Chinese %>" />
                                        <asp:ListItem Value="Russian" Text="<%$ Resources:Resource, Russian %>" />
                                        <asp:ListItem Value="Arabic" Text="<%$ Resources:Resource, Arabic %>" />
                                        <asp:ListItem Value="Japanese" Text="<%$ Resources:Resource, Japanese %>" />
                                        <asp:ListItem Value="German" Text="<%$ Resources:Resource, German %>" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" Text="<%$ Resources:Resource, SecretQuestion %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn">
                                    <asp:DropDownList ID="Question" runat="server" Width="150px">
                                        <asp:ListItem Text="<%$ Resources:Resource, FavoritePet %>" Selected="true" />
                                        <asp:ListItem Text="<%$ Resources:Resource, MotherMaidenName %>" />
                                        <asp:ListItem Text="<%$ Resources:Resource, Whowasyourchildhoodhero %>" />
                                        <asp:ListItem Text="<%$ Resources:Resource, Yourfavoritepasttime %>" />
                                        <asp:ListItem Text="<%$ Resources:Resource, Yourfirstcar %>" />
                                    </asp:DropDownList>
                                </td>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" Text="<%$ Resources:Resource, YourAnswer %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <asp:TextBox ID="Answer" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                        ErrorMessage="<%$ Resources:Resource, SecurityAnswerRequired %>" ToolTip="<%$ Resources:Resource, SecurityAnswerToolTip %>"
                                        ValidationGroup="SignUpCreateWizard" Display="None">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn">
                                    <asp:Label ID="CellphoneLabel" runat="server" AssociatedControlID="Cellphone" Text="<%$ Resources:Resource, Cellphone %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn">
                                    <asp:TextBox ID="Cellphone" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="MobilePhoneRegularExpressionValidator" runat="server"
                                        ControlToValidate="Cellphone" Display="None" ErrorMessage="<%$ Resources:Resource, MobilePhoneRegularExpressionValidator %>"
                                        SetFocusOnError="True" ToolTip="<%$ Resources:Resource, MobilePhoneToolTip %>"
                                        ValidationExpression="^\d{8,24}$" ValidationGroup="SignUpCreateWizard">*</asp:RegularExpressionValidator>
                                </td>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="FacebookLabel" runat="server" AssociatedControlID="Facebook" Text="<%$ Resources:Resource, Facebook %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <asp:TextBox ID="Facebook" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="FacebookRegularExpressionValidator" runat="Server"
                                        ControlToValidate="Facebook" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                        ErrorMessage="<%$ Resources:Resource, FacebookError %>" Display="none" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="LinkedInLabel" runat="server" AssociatedControlID="LinkedIn" Text="<%$ Resources:Resource, LinkedIn %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn">
                                    <asp:TextBox ID="LinkedIn" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="LinkedInRegularExpressionValidator" runat="Server"
                                        ControlToValidate="LinkedIn" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                        ErrorMessage="<%$ Resources:Resource, LinkedInError %>" Display="none" />
                                </td>
                                <td align="right" class="ProfileRightColumn2">
                                    <asp:Label ID="TwitterLabel" runat="server" AssociatedControlID="Twitter" Text="<%$ Resources:Resource, Twitter %>"></asp:Label>
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <asp:TextBox ID="Twitter" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="TwitterRegularExpressionValidator" runat="Server"
                                        ControlToValidate="Twitter" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                        ErrorMessage="<%$ Resources:Resource, TwitterError %>" Display="none" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="ProfileRightColumn">
                                    <asp:ValidatorCalloutExtender ID="UserNameValidatorCalloutExtender" runat="server"
                                        TargetControlID="UserNameRequired">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:ValidatorCalloutExtender ID="EmailValidatorCalloutExtender" runat="server" TargetControlID="EmailRequired">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:ValidatorCalloutExtender ID="PasswordValidatorCalloutExtender" runat="server"
                                        TargetControlID="PasswordRequired">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:ValidatorCalloutExtender ID="FirstNameValidatorCalloutExtender" runat="server"
                                        TargetControlID="FirstNameRequiredFieldValidator" HighlightCssClass="customCalloutStyle">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:ValidatorCalloutExtender ID="LastNameValidatorCalloutExtender" runat="server"
                                        TargetControlID="LastNameRequiredFieldValidator" HighlightCssClass="customCalloutStyle">
                                    </asp:ValidatorCalloutExtender>
                                    <%-- <asp:ValidatorCalloutExtender ID="AddressValidatorCalloutExtender" runat="server"
                                                    TargetControlID="AddressRequiredFieldValidator" HighlightCssClass="customCalloutStyle">
                                                </asp:ValidatorCalloutExtender>--%>
                                    <asp:ValidatorCalloutExtender ID="ConfirmPasswordValidatorCalloutExtender" runat="server"
                                        TargetControlID="ConfirmPasswordRequired">
                                    </asp:ValidatorCalloutExtender>
                                    <%--                                                <asp:ValidatorCalloutExtender ID="QuestionRequiredValidatorCalloutExtender" runat="server"
                                                    TargetControlID="QuestionRequired">
                                    </asp:ValidatorCalloutExtender>--%>
                                </td>
                                <td align="center" class="ProfileLeftColumn" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ErrorMessage="<%$ Resources:Resource, PasswordMatchMessage %>"
                                        ValidationGroup="SignUpCreateWizard" ControlToValidate="ConfirmPassword" ControlToCompare="Password"
                                        Display="Dynamic">
                                    </asp:CompareValidator>
                                    &nbsp;
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                    &nbsp;
                                </td>
                                <td class="ProfileLeftColumn2">
                                    <%-- <asp:ValidatorCalloutExtender ID="HomeTelephoneValidatorCalloutExtender" runat="server"
                                                    TargetControlID="HomeTelephoneRequiredFieldValidator" HighlightCssClass="customCalloutStyle">
                                                </asp:ValidatorCalloutExtender>
                                                <asp:ValidatorCalloutExtender ID="HomeTelephoneRegularExpressionValidatorCalloutExtender"
                                                    runat="server" TargetControlID="HomeTelephoneRegularExpressionValidator" HighlightCssClass="customCalloutStyle">
                                                </asp:ValidatorCalloutExtender>
                                                <asp:ValidatorCalloutExtender ID="MobilePhoneValidatorCalloutExtender" runat="server"
                                                    TargetControlID="MobilePhoneRegularExpressionValidator" HighlightCssClass="customCalloutStyle">
                                                </asp:ValidatorCalloutExtender>--%>
                                    <asp:ValidatorCalloutExtender ID="AnswerValidatorCalloutExtender" runat="server"
                                        TargetControlID="AnswerRequired">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                        </table>
                        <table style="font-size: 10pt; font-family: Verdana" border="0" width="820" cellpadding="10px">
                            <tr>
                                <td colspan="4">
                                    <h5 id="CustomizeExperienceHeader" style="width: 820px;" align="center" class="CustomHeader">
                                        <asp:Label ID="CustomizeExperienceHeaderLabel" runat="server" Text="<%$ Resources:Resource, HelpUsCustomizeYourExperience %>"
                                            Font-Bold="True" Font-Size="Large" Style="font-size: large; font-family: Andy;
                                            color: #FFFFFF;"></asp:Label></h5>
                                </td>
                            </tr>
                            <tr>
                                <td class="CustomizeExperienceRightColumn">
                                    <asp:Label ID="IndustryLabel" runat="server" Text="<%$ Resources:Resource, IndustryLabel %>"></asp:Label>
                                </td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="Industry" runat="server" Width="150px" Style="text-align: left"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="CustomizeExperienceRightColumn">
                                    <asp:Label ID="ProfessionLabel" runat="server" Text="<%$ Resources:Resource, Profession %>"></asp:Label>
                                </td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="Profession" runat="server" Style="text-align: left" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="CustomizeExperienceRightColumn">
                                    <asp:Label ID="CompanyURLLabel" runat="server" Text="<%$ Resources:Resource, CompanyWebsite %>"></asp:Label>
                                </td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="CompanyURL" runat="server" Style="text-align: left" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="CustomizeExperienceRightColumn">
                                    <asp:Label ID="Picture1Label" runat="server" Text="<%$ Resources:Resource, Photo1 %>"></asp:Label>
                                </td>
                                <td style="text-align: left">
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="CustomizeExperienceRightColumn">
                                    <asp:Label ID="Picture2Label" runat="server" Text="<%$ Resources:Resource, Photo2 %>"></asp:Label>
                                </td>
                                <td style="text-align: left">
                                    <asp:FileUpload ID="FileUpload2" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="CustomizeExperienceRightColumn">
                                    <asp:Label ID="Picture3Label" runat="server" Text="<%$ Resources:Resource, Photo3 %>"></asp:Label>
                                </td>
                                <td style="text-align: left">
                                     <asp:FileUpload ID="FileUpload3" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="CustomizeExperienceRightColumn">
                                    <asp:Label ID="Picture4Label" runat="server" Text="<%$ Resources:Resource, Photo4 %>"></asp:Label>
                                </td>
                                <td style="text-align: left">
                                    <asp:FileUpload ID="FileUpload4" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="CustomizeExperienceRightColumn">
                                    <asp:Label ID="DescriptionLabel" runat="server" Text="<%$ Resources:Resource, DescriptionLabel %>"></asp:Label>
                                </td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="Description" runat="server" Style="text-align: left" Width="353px"
                                        Height="170px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
            <TitleTextStyle Font-Bold="True" BackColor="#6B696B" ForeColor="White"></TitleTextStyle>
        </asp:CreateUserWizard>
    </center>
</asp:Content>