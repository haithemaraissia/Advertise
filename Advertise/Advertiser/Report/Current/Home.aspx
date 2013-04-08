<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="AdManagment._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table cellspacing="10px" style="margin 0 auto; width: 92%">
        <tr>
            <td>
                <ul>
                    <li style="padding-top: 0px"><a href="Advertiser.aspx">Advertiser</a></li>
                    <li style="padding-top: 30px"><a href="Executive.aspx">Executive</a></li>
                    <li style="padding-top: 30px"><a href="Geographic.aspx">Geographic</a></li>
                    <li style="padding-top: 30px"><a href="Platform.aspx">Platform</a></li>
                    <li style="padding-top: 30px"><a href="Profile.aspx">Profile</a></li>
                </ul>
            </td>
        </tr>
    </table>
</asp:Content>
