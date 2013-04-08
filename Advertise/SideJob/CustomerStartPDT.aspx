<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerStartPDT.aspx.cs" Inherits="CustomerStartPDT" %>


<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="~/common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="~/common/TemplateMainLowerButtons.ascx" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.51116.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>MyTitle</title>
    <link rel="canonical" href="http://gravatar.com/beau" />
    <link rel="shortcut icon" href="http://en.gravatar.com/favicon.ico" />
    <link href="../../../../../Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
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
                <uppernavigationbuttons:navigationbuttons ID="Navigationbuttons1" runat="server" />
            </div>
        </div>
        <div id="main">
            <div class="middle">
                <div class="box-top">
                    <h2 id="H2SideJob" style="width: 960px">
                        <asp:Label ID="HowDoesitWorkLabel" runat="server" Text="<%$ Resources:Resource, PaymentProcess %>"
                            Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                </div>
                <div class="box">
                    <div align="center">
                    </div>
                    <table align="center" width="960px">
                        <tr>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <div align="center">
                                    <br />
                                    <br />
                                    <asp:Panel ID="PaypalPayment" runat="server" Height="160px" Width="400px" Style="text-align: right;
                                        padding: 10px" BackColor="#CCCCCC">
                                        <div id="Paypal" runat="server" style="background-color: White; height: 158px; width: 398px">
                                            <asp:UpdatePanel ID="PayPalUpdatePanel" runat="server" UpdateMode="Conditional">
                                                <contenttemplate>
                                <table cellpadding="5px" cellspacing="5px">
                                    <tr>
                                        <td colspan="4">
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="CurrencyLabel" runat="server" Text="<%$ Resources:Resource, CurrencyLabel %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="CurrencyDropDownList" runat="server" OnSelectedIndexChanged="Currency_SelectedIndexChanged"
                                                AutoPostBack="True">
                                                <asp:ListItem Value="AUD" Text="<%$ Resources:Resource, AustralianDollar %>"></asp:ListItem>
                                                <asp:ListItem Value="CAD" Text="<%$ Resources:Resource, CanadianDollar %>"></asp:ListItem>
                                                <asp:ListItem Value="EUR" Text="<%$ Resources:Resource, Euro %>"></asp:ListItem>
                                                <asp:ListItem Value="GBP" Text="<%$ Resources:Resource, BritishPound %>"></asp:ListItem>
                                                <asp:ListItem Value="JPY" Text="<%$ Resources:Resource, JapaneseYen %>"></asp:ListItem>
                                                <asp:ListItem Value="USD" Text="<%$ Resources:Resource, USDollar %>" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="NZD" Text="<%$ Resources:Resource, NewZealandDollar %>"></asp:ListItem>
                                                <asp:ListItem Value="CHF" Text="<%$ Resources:Resource, SwissFranc %>"></asp:ListItem>
                                                <asp:ListItem Value="HKD" Text="<%$ Resources:Resource, HongKongDollar %>"></asp:ListItem>
                                                <asp:ListItem Value="SGD" Text="<%$ Resources:Resource, SingaporeDollar %>"></asp:ListItem>
                                                <asp:ListItem Value="SEK" Text="<%$ Resources:Resource, SwedishKrona %>"></asp:ListItem>
                                                <asp:ListItem Value="DKK" Text="<%$ Resources:Resource, DanishKrone %>"></asp:ListItem>
                                                <asp:ListItem Value="PLN" Text="<%$ Resources:Resource, PolishZłoty %>"></asp:ListItem>
                                                <asp:ListItem Value="NOK" Text="<%$ Resources:Resource, NorwegianKrone %>"></asp:ListItem>
                                                <asp:ListItem Value="HUF" Text="<%$ Resources:Resource, HungarianForint %>"></asp:ListItem>
                                                <asp:ListItem Value="CZK" Text="<%$ Resources:Resource, CzechKoruna %>"></asp:ListItem>
                                                <asp:ListItem Value="ILS" Text="<%$ Resources:Resource, IsraeliNewShekel %>"></asp:ListItem>
                                                <asp:ListItem Value="MXN" Text="<%$ Resources:Resource, MexicanPeso %>"></asp:ListItem>
                                                <asp:ListItem Value="PHP" Text="<%$ Resources:Resource, PhilippinePeso %>"></asp:ListItem>
                                                <asp:ListItem Value="TWD" Text="<%$ Resources:Resource, NewTaiwanDollar %>"></asp:ListItem>
                                                <asp:ListItem Value="THB" Text="<%$ Resources:Resource, ThaiBaht %>"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="FeesLabel" runat="server" Text="<%$ Resources:Resource, Fees %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="Amount" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </contenttemplate>
                                                <triggers>
                                <asp:AsyncPostBackTrigger ControlID="CurrencyDropDownList" EventName="SelectedIndexChanged" />
                            </triggers>
                                            </asp:UpdatePanel>
                                            <asp:ImageButton ID="PayPalImageButton" runat="server" ImageUrl="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif"
                                                OnClick="PayPalImageButtonClick" />
                                        </div>
                                       
                                    </asp:Panel>
                                    <asp:RoundedCornersExtender ID="PaypalPayment_RoundedCornersExtender" BorderColor="Gray"
                                        Color="Gray" Enabled="True" Radius="20" runat="server" TargetControlID="PaypalPayment">
                                    </asp:RoundedCornersExtender> 
                                    <asp:Label ID="HiddenLabel" runat="server"></asp:Label>
                                </div>
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
            <lowernavigationbuttons:navigationbuttons ID="Navigationbuttons2" runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
