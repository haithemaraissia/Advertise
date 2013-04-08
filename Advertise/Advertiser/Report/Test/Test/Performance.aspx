﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Performance.aspx.cs" Inherits="Admanagment.Advertiser.Performance" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../../../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../../../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="AdControl" Namespace="AdControl" TagPrefix="BannerRotator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>MyTitle</title>
    <link rel="canonical" href="http://gravatar.com/beau" />
    <link rel="shortcut icon" href="http://en.gravatar.com/favicon.ico" />
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
  <%--  <asp:ContentPlaceHolder ID="HeadContent" runat="server">
    </asp:ContentPlaceHolder>--%>
      <style type="text/css">
        .gridHeader th a:link
        {
            color: #000000;
            text-decoration: none;
        }
        
        .gridHeader th a:active
        {
            color: #000000;
        }
        
        .gridHeader th a:visited
        {
            color: #000000;
        }
        
        .gridHeader th a:hover
        {
            color: #006633;
            text-decoration: underline;
        }
        
        .gridHeader td a:link
        {
            text-decoration: none;
        }
        
        .gridHeader th a:active
        {
        }
        
        .gridHeader th a:visited
        {
        }
        
        .gridHeader th a:hover
        {
            text-decoration: underline;
        }
        
        .a:link
        {
            text-decoration: none;
        }
        
        .a:hover
        {
            text-decoration: underline;
        }
        
        
        a.UnderlineLink
        {
            color: #000000;
            text-decoration: none;
        }
        
        a.UnderlineLink:hover
        {
            text-decoration: underline;
        }
        .gridHeader td a:hover
        {
            text-decoration: underline;
        }
        .pager span
        {
            text-decoration: underline;
        }
        input.button_add
        {
            background-image: url(../../images/Calendar_scheduleHS.png); /* 16px x 16px */
            background-color: transparent;
            background-repeat: no-repeat;
            border: none;
            cursor: pointer; /* make the cursor like hovering over an <a> element */
            height: 32px;
            padding-left: 32px; /* make text start to the right of the image */
            vertical-align: middle; /* align the text vertically centered */
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 100%; background: #1e8cbe;">
        <table style="margin: 0 auto;" align="center">
            <tr>
                <td>
                    <h2 id="H2SideJob" style="width: 960px;" align="center">
                        <asp:Label ID="H2SideJobLabel" runat="server" Text="Side Job" Font-Bold="True"
                            Font-Size="Large" Style="font-size: xx-large; font-family: Andy; color: #FFFFFF;"></asp:Label></h2>
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
                   <%-- <asp:ContentPlaceHolder ID="MainContent" runat="server">
                    </asp:ContentPlaceHolder>--%>
                    
                      <div>
        <link type="text/css" rel="stylesheet" href="../../../Styles/jquery-ui-1.8.12.custom.css" />
        <script type="text/javascript" src="../../../Scripts/jquery-1.5.1.min.js"></script>
        <script type="text/javascript" src="../../../Scripts/jquery-ui-1.8.12.custom.min.js"></script>
        <script type="text/javascript" language="javascript">
            $(document).ready(function () {
                $("#datepicker").datepicker({
                    minDate: -1000,
                    maxDate: "+1000D",
                    onSelect: function (selected) {
                        $("#datepicker2").datepicker("option", "minDate", selected);
                    }
                });
                $("#datepicker2").datepicker({
                    minDate: -1000,
                    maxDate: "+1000D",
                    onSelect: function (selected) {
                        $("#datepicker").datepicker("option", "maxDate", selected);
                    }
                });
                $('#TimeFilter').click(function () {
                    $('#timeFrame').toggle('slow');
                });
                $('#FilterButton').click(function () {
                    var date_ini = new Date($('#datepicker').val()).getTime();
                    var date_end = new Date($('#datepicker2').val()).getTime();

                    if (date_ini > date_end) {

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
            <div id="ViewAllAd">
                <input id="TimeFilter" type="button" title="Add row" class="button_add" style="position: relative;
                     top:-13px" />
                <asp:ImageButton ID="ViewAllAdImageButton" runat="server" ImageUrl="~/images/application_view_list.png"
                    Style="position: relative;  top: 0px" OnClick="ViewAllAdImageButton_Click" />
                    
                <div id="Utility" style="float: right">
            <asp:ImageButton ID="PrintButton" runat="server" ImageUrl="~/Advertiser/Report/images/PRINT.png"
                Width="32px" Height="32px" OnClientClick="Print();" />
            &nbsp;<asp:ImageButton ID="PDFButton" runat="server" ImageUrl="~/Advertiser/Report/images/PDF.jpg"
                Width="32px" Height="32px" OnClick="PDFButtonClick" />
        </div>    

            </div>
       
        <div id="timeFrame" style="display: none">
            <table>
                <tr>
                    <td>
                        <p>
                            Start Date:
                            <div id="datepicker">
                            </div>
                        </p>
                    </td>
                    <td>
                        <p>
                            End Date:
                            <div id="datepicker2">
                            </div>
                        </p>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <asp:Button ID="FilterButton" runat="server" Text="Filter" OnClick="FilterButton_Click" />
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
        <script type="text/javascript" language="javascript">
            function Print() {
                {
                    //                var f = window.frames[0];
                    //                f.focus();
                    //                f.print();
                    //                    window.print();


                    var documentContainer = document.getElementById('GridTable');
                    var windowObject = window.open('', "TrackHistoryData",
"width=740,height=325,top=200,left=250,toolbars=no,scrollbars=yes,status=no,resizable=no");
                    windowObject.document.writeln(documentContainer.innerHTML);
                    windowObject.document.close();
                    windowObject.focus();
                    windowObject.print();
                    windowObject.close();

                }

            }
        </script>
        <table width="830px" id="GridTable">
            <tr>
                <td>
                    <asp:GridView runat="server" ID="gvdetails" DataSourceID="dsdetails" AllowPaging="True"
                        Width="830px" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id"
                        OnSelectedIndexChanged="gvdetails_SelectedIndexChanged" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Style="text-align: center">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Height="10px" ForeColor="White"
                            CssClass="gridHeader" HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false"  />
                            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate"  DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" />
                            <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                            <asp:BoundField DataField="TotalImpression" HeaderText="Impression" SortExpression="TotalImpression" />
                            <asp:BoundField DataField="TotalClick" HeaderText="Click" SortExpression="TotalClick" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <BannerRotator:FlashControl ID="FlashControl1" runat="server" ViewStateMode="Enabled"
                                        FlashUrl='<%# Eval("ImageUrl", "{0}") %>' Width="50px" Height="50px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="dsdetails" runat="server" ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>"
            SelectCommand="SELECT AdList.Id, AdList.ImageUrl, AdList.Impressions, AdList.StartDate, AdList.EndDate, AdList.IsActive, AdTotalStats.TotalImpression, AdTotalStats.TotalClick FROM AdList INNER JOIN AdTotalStats ON AdList.Id = AdTotalStats.id">
        </asp:SqlDataSource>
    </div>
    <br />
    <table width="830px" style="background-color: red">
        <tr>
            <td>
                add The Company Name and Clause to determine which ad are quered 
            </td>
        </tr>
        <tr>
            <td>
                
              <p align="center">
                  Historical Performance
              </p>
 
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
            <LowerNavigationButtons:NavigationButtons ID="NavigationButtons2" runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
