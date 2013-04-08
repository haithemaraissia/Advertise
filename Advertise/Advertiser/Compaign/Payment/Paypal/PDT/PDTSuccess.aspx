<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PDTSuccess.aspx.cs" Inherits="PayPalTest_PDT_PDTSuccess" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../../../../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../../../../common/TemplateMainLowerButtons.ascx" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Payment</title>
    <link rel="canonical" href="http://gravatar.com/beau" />
    <link rel="shortcut icon" href="http://en.gravatar.com/favicon.ico" />
    <link href="../../../../../Styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var timer = null;
        function auto_reload() {
            window.location.reload();
        }
    </script>
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
                <UpperNavigationButtons:NavigationButtons runat="server" />
            </div>
        </div>
        <div id="main">
            <div class="middle">
                <div class="box-top">
                </div>
                <div class="box">
                    <table align="center" id="TemplateGlobalTable" style="vertical-align: middle" width="100%">
                        <tr align="center">
                            <td style="padding-bottom: 15px">
                                <asp:Panel ID="ResponsePayment" runat="server" Height="160px" Width="400px" Style="text-align: right;
                                    padding: 10px" BackColor="White">
                                    <table style="align: center; vertical-align: middle">
                                        <tr>
                                            <td>
                                                <asp:Label ID="HiddenLabel" runat="server" Text="<%$ Resources:Resource, Waiting %>"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:RoundedCornersExtender ID="Response_RoundedCornersExtender" runat="server" BorderColor="Maroon"
                                    Color="Maroon" Enabled="True" Radius="20" TargetControlID="ResponsePayment">
                                </asp:RoundedCornersExtender>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-bottom: 15px">
                                <div id="BackToProfile" style="text-align: right">
                                    <asp:LinkButton ID="BackToProfileLinkButton" runat="server" Text="<%$ Resources:Resource, BackToProfileLinkButton%>"
                                        Font-Bold="True" ForeColor="#003366" PostBackUrl="~/Home.aspx"></asp:LinkButton> 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
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
            <LowerNavigationButtons:NavigationButtons runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
