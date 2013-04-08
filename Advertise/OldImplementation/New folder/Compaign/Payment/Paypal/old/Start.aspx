<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="Start.aspx.cs" Inherits="Paypal_Start" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager> 
        <h4>Payment Process</h4>
    <table align="center">
        <tr>
            <td>
                           <asp:Panel ID="PaypalPayment" runat="server" Height="160px" Width="400px" Style="text-align: right;
                        padding: 10px" BackColor="#CCCCCC">
                        <div id="Paypal" runat="server" style="background-color: White; height: 158px; width: 398px">
                            <asp:UpdatePanel ID="PayPalUpdatePanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
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
                                    <asp:Label ID="HiddenLabel" runat="server" Text=""></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="CurrencyDropDownList" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:ImageButton ID="PayPalImageButton" runat="server" ImageUrl="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif"
                                OnClick="PayPalImageButton_Click" />
                        </div>
                    </asp:Panel>
           <asp:RoundedCornersExtender ID="PaypalPayment_RoundedCornersExtender"  BorderColor="Gray" Color="Gray" Enabled="True" Radius="20" 
               runat="server" TargetControlID="PaypalPayment">
           </asp:RoundedCornersExtender>
            </td>
        </tr>
    </table>

</asp:Content>
