<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExtendAd.aspx.cs" Inherits="Advertiser_Compaign_Completed_Extend" %>

<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../../common/TemplateMainLowerButtons.ascx" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, ExtendAd %>"></title>
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
    <form id="form2" runat="server">
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
                                <h5 id="CompaignScheduleHeader" style="width: 820px;" align="center" class="CustomHeader">
                                    <asp:Label ID="H5CompaignScheduleLabel" runat="server" Text="<%$ Resources:Resource, ExtendAd %>"
                                        Font-Bold="True" Font-Size="Large" Style="font-size: large; font-family: Andy;
                                        color: #FFFFFF;"></asp:Label></h5>
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
                                                                        CssClass="myCalendar" 
                                                                        OnSelectionChanged="StartDateCalendarSelectionChanged" 
                                                                        ondayrender="StartDateCalendar_DayRender">
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
                                                                        CssClass="myCalendar" OnSelectionChanged="EndDateCalendarSelectionChanged" 
                                                                        ondayrender="EndDateCalendar_DayRender">
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
                                                              
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="ExtendAdButton" runat="server" Text="<%$ Resources:Resource, Extend %>"
                                                                    Width="121px" onclick="ExtendAdButton_Click" />
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
