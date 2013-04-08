<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Geographic.aspx.cs" Inherits="Advertiser.Report.Current.AdvertiserReportCurrentGeographic" %>

<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="AdControl" Namespace="AdControl" TagPrefix="BannerRotator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title id="AdvertiserTitle" runat="server" title="<%$ Resources:Resource, GeographicReport %>">
    </title>
    <link href="../../../Styles/Site.css" rel="stylesheet" type="text/css" />
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
                                    var dateIni = new Date($('#datepicker').val()).getTime();
                                    var dateEnd = new Date($('#datepicker2').val()).getTime();
                                    if (dateIni > dateEnd) {

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
                                <input id="TimeFilter" type="button" class="button_add" style="position: relative;
                                    top: -12px" />
                                <asp:ImageButton ID="ViewAllAdImageButton" runat="server" ImageUrl="~/images/application_view_list.png"
                                    Style="position: relative; top: 0px" OnClick="ViewAllAdImageButtonClick" />
                                <div id="Utility" style="float: right">
                                    <asp:ImageButton ID="PrintButton" runat="server" ImageUrl="~/Advertiser/Report/images/PRINT.png"
                                        Width="32px" Height="32px" OnClientClick="Print();" />
                                    &nbsp;<asp:ImageButton ID="PDFButton" runat="server" ImageUrl="~/Advertiser/Report/images/PDF.jpg"
                                        Width="32px" Height="32px" OnClick="PDFButtonClick" />&nbsp;&nbsp;
                                </div>
                            </div>
                            <div id="timeFrame" style="display: none">
                                <table>
                                    <tr>
                                        <td>
                                            <p>
                                                <asp:Label ID="StartDateLabel2" runat="server" Text="<%$ Resources:Resource, StartDate %>" />
                                                <div id="datepicker">
                                                </div>
                                            </p>
                                        </td>
                                        <td>
                                            <p>
                                                <asp:Label ID="EndDateLabel2" runat="server" Text="<%$ Resources:Resource, EndDate %>" />
                                                <div id="datepicker2">
                                                </div>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td colspan="2">
                                            <asp:Button ID="FilterButton" runat="server" Text="<%$ Resources:Resource, Filter %>"
                                                OnClick="FilterButtonClick" />
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
                                    var documentContainer = document.getElementById('PrintView');
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
                        <div id="PrintView">
                            <table width="850px" id="GridTable">
                                <tr align="center">
                                    <td>
                                        <p align="center" style="color: rgb(0, 0, 0); font-family: 'Times New Roman'; font-size: medium;
                                            font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                                            line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                                            widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;">
                                            <font face="Arial" size="3"><b>
                                                <br />
                                                <asp:Label ID="VisitorDemographicLabel" runat="server" Text="<%$ Resources:Resource, VisitorsDemographic %>"></asp:Label>
                                                <br />
                                            </b>
                                                <br />
                                            </font><font face="Arial">
                                                <asp:Label ID="Latest10000Label" runat="server" Text="<%$ Resources:Resource, Latest10000Visits %>"
                                                    ForeColor="#336699"></asp:Label>
                                            </font>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView runat="server" ID="gvdetails" DataSourceID="dsdetails" AllowPaging="True"
                                            Width="845px" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
                                            ForeColor="#333333" GridLines="None" Style="text-align: center">
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <Columns>
                                                <asp:BoundField DataField="AdName" HeaderText="<%$ Resources:Resource, Name %>" SortExpression="AdName" />
                                                <asp:BoundField DataField="CountryName" HeaderText="<%$ Resources:Resource, CountryName %>"
                                                    SortExpression="CountryName" />
                                                <asp:BoundField DataField="Region" HeaderText="<%$ Resources:Resource, RegionName %>"
                                                    SortExpression="Region" />
                                                <asp:BoundField DataField="CityName" HeaderText="<%$ Resources:Resource, CityName %>"
                                                    SortExpression="CityName" />
                                                <asp:BoundField DataField="PostalCode" HeaderText="<%$ Resources:Resource, PostalCode %>"
                                                    SortExpression="PostalCode" />
                                                <asp:BoundField DataField="AreaCode" HeaderText="<%$ Resources:Resource, AreaCode %>"
                                                    SortExpression="AreaCode" />
                                                <asp:BoundField DataField="MetroCode" HeaderText="<%$ Resources:Resource, MetroCode %>"
                                                    SortExpression="MetroCode" />
                                                <asp:BoundField DataField="EntryDate" HeaderText="<%$ Resources:Resource, Date %>"
                                                    SortExpression="EntryDate" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <BannerRotator:FlashControl ID="FlashControl1" runat="server" ViewStateMode="Enabled"
                                                            FlashUrl='<%# Eval("ImageUrl", "{0}") %>' Width="50px" Height="50px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Height="10px" ForeColor="White"
                                                CssClass="gridHeader" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                            <asp:SqlDataSource ID="dsdetails" runat="server" ConnectionString="<%$  ConnectionStrings:AdDatabaseConnectionString1 %>"
                                SelectCommand="SELECT DISTINCT TOP (10000) VisitorGeo.AdId, AdGeneral.AdName, VisitorGeo.CountryName, VisitorGeo.Region,  VisitorGeo.CityName, VisitorGeo.PostalCode, VisitorGeo.AreaCode,  VisitorGeo.MetroCode, AdStats.EntryDate, AdGeneral.ImageUrl FROM  AdGeneral INNER JOIN VisitorGeo ON AdGeneral.AdId = VisitorGeo.AdId INNER JOIN AdStats ON AdGeneral.adID = AdStats.AdId WHERE  AdGeneral.UserID = @UserID AND (AdGeneral.Completed = 0) And (AdGeneral.IsActive = 1) ORDER BY AdStats.EntryDate ">
                                <SelectParameters>
                                    <asp:Parameter Name="UserID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
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
