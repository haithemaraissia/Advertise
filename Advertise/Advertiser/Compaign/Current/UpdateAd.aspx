<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="UpdateAd.aspx.cs" Inherits="Advertiser_Compaign_Current_UpdateAd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            color: #800000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <span class="style1"><strong>This is for new ad.
            <br />
        </strong></span>Different return for paypal OF course, we are doing Success but
        need to account for deny.
    </div>
    AdID:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    This will be passed by query string but for now direct testing.
    <br />
    <br />
    THis will be actived by the return of paypal : Success /Failure and by getting its
    ID and checking if it is already paid
    <div>
        When the user click on payment and go through the process of <strong>Pending</strong><asp:Button
            ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </div>
    <hr />
    <br />
    <div>
        When the response from Paypal with <strong>approval or deny</strong><asp:Button ID="Button2"
            runat="server" Text="Button" OnClick="Button2_Click" />
        <br />
        <br />
    </div>
    <hr />
    <div>
        <span class="style1"><strong>Existing Ads</strong></span>
        <br />
        <br />
        <br />
    </div>
    <div>
        Pending Process
        <br />
        <asp:Button ID="Button3" runat="server" Text="Button" onclick="Button3_Click" />
        <br/>
    </div>
    <br />
    <br />
    <div>
        Approval or denial
    </div>
    <br />
    <asp:Button ID="Button4" runat="server" Text="Button" 
    onclick="Button4_Click" />
    <br/>
</asp:Content>
