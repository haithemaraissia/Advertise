<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PDTSuccess.aspx.cs" Inherits="Advertiser_Compaign_Payment_Paypal_PDTSuccess" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../../../../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../../../../common/TemplateMainLowerButtons.ascx" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head2" runat="server">
    <title id="Title2" runat="server" title="<%$ Resources:Resource, ChangeAd %>"></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="canonical" href="http://gravatar.com/beau" />
    <link rel="shortcut icon" href="http://en.gravatar.com/favicon.ico" />
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
     var timer = null;
     function auto_reload() {
         window.location.reload();
     }
    </script>
</head>
<body onload="timer = setTimeout('auto_reload()',10000);">
    <form id="form2" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
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
                      <asp:Panel ID="ResponsePayment" runat="server" Height="160px" Width="400px" Style="text-align: right;
                        padding: 10px" BackColor="White">
                        <table style="align:center; vertical-align:middle">
                            <tr>
                                <td>
                                    <asp:Label ID="HiddenLabel" runat="server" Text="<%$ Resources:Resource, Waiting %>"></asp:Label> 
                                </td>
                            </tr>

                        </table>
                       
                    </asp:Panel>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server"
                        BorderColor="Maroon" Color="Maroon" Enabled="True" Radius="20" TargetControlID="ResponsePayment">
                    </asp:RoundedCornersExtender>
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




