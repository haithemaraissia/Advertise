<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            Profile Settings for:
            <asp:LoginName ID="LoginName1" runat="server" />
        </h1>
        <table>
            <tr>
                <td>
                    FirstName:
                </td>
                <td>
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    LastName:
                </td>
                <td>
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Gender:
                </td>
                <td>
                    <asp:TextBox ID="GenderTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Age:
                </td>
                <td>
                    <asp:TextBox ID="AgeTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Industry:
                </td>
                <td>
                    <asp:TextBox ID="IndustryTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    EmailAddress:
                </td>
                <td>
                    <asp:TextBox ID="EmailAddressTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    CompanyWebsite:
                </td>
                <td>
                    <asp:TextBox ID="CompanyWebsiteTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Country:
                </td>
                <td>
                    <asp:TextBox ID="CountryTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Region:
                </td>
                <td>
                    <asp:TextBox ID="RegionTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    City:
                </td>
                <td>
                    <asp:TextBox ID="CityTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Zipcode:
                </td>
                <td>
                    <asp:TextBox ID="ZipcodeTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Martial Status
                </td>
                <td>
                    <asp:TextBox ID="MartialStatusTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td>
                    Picture1:
                </td>
                <td>
                    <asp:TextBox ID="Picture1TextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Picture2:
                </td>
                <td>
                    <asp:TextBox ID="Picture2TextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Picture3:
                </td>
                <td>
                    <asp:TextBox ID="Picture3TextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Picture4:
                </td>
                <td>
                    <asp:TextBox ID="Picture4TextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Language:
                </td>
                <td>
                    <asp:TextBox ID="LanguageTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    LCID:
                </td>
                <td>
                    <asp:TextBox ID="LCIDTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Description:
                </td>
                <td>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    CellPhone:
                </td>
                <td>
                    <asp:TextBox ID="CellPhoneTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Facebook:
                </td>
                <td>
                    <asp:TextBox ID="FacebookTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    LinkedIn:
                </td>
                <td>
                    <asp:TextBox ID="LinkedInTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Twitter:
                </td>
                <td>
                    <asp:TextBox ID="TwitterTextBox" runat="server" Text="Label"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1Click" Text="Update Profile" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
