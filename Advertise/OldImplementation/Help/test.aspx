<%@ Page Title='' Language='C#' MasterPageFile='~/Plain.master' AutoEventWireup='true' CodeFile='test.aspx.cs' Inherits='Admanagment.test1' %>
<%@ Register Assembly='AdControl' Namespace='AdControl' TagPrefix='BannerRotator' %>
<asp:Content ID='Content1' ContentPlaceHolderID='HeadContent' runat='server'>
    <style type='text/css'>
        html
        {
            background-color: silver;
        }
        .content
        {
            background-color: white;
            padding: 10px;
            border: solid 1px black;
            margin: auto;
            width: 860px;
            text-align: center;
        }
        .box
        {
            float: right;
            padding: 10px;
            border-left: solid 1px black;
        }
        .clear
        {
            clear: both;
        }
    </style>
    <script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
    <script type='text/javascript'>
        $(document).ready(function () {
            setInterval(function () {
                $('#banner').load(location.href + ' #banner', '' + Math.random() + '');
            }, 4000);
            setInterval(function () {
                $('#box').load(location.href + ' #box', '' + Math.random() + '');
            }, 4000);
        });
    </script>
</asp:Content>
<asp:Content ID='Content2' ContentPlaceHolderID='MainContent' runat='server'>
    <asp:ScriptManager ID='ScriptManager1' runat='server' EnablePartialRendering='true' />
    Home Keyword : 728 by 90
    <br />
    <br />
    <div id='banner'>
        <BannerRotator:BannerRotator ID='BannerRotator1' DataSourceID='SqlDataSource1' Target='_blank'
            OnAdCreated='AdRotator1AdCreated' KeywordFilter='Home' CssClass='banner' runat='server' />

        <asp:SqlDataSource ID='SqlDataSource1' ConnectionString='<%$ ConnectionStrings:AdDatabaseConnectionString1 %>'
            SelectCommand='SELECT Id, ImageUrl, Width, Height, NavigateUrl, AlternateText,
 Keyword, Impressions
            FROM AdList' InsertCommand='INSERT INTO AdStats(AdId, EntryDate, Type) VALUES (@AdId, GETDATE(), 0)'
            runat='server'>
            <InsertParameters>
                <asp:Parameter Name='AdId' Type='int32' />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <br />
    Doctor Keyword 300 by 250
    <div id='box'>
        <BannerRotator:BannerRotator ID='BannerRotator2' DataSourceID='SqlDataSource2' Target='_blank'
            OnAdCreated='AdRotator2AdCreated' KeywordFilter='Doctor' CssClass='banner' runat='server' />
        <asp:SqlDataSource ID='SqlDataSource2' ConnectionString='<%$ ConnectionStrings:AdDatabaseConnectionString1 %>'
            SelectCommand='SELECT Id, ImageUrl, Width, Height, NavigateUrl, AlternateText,
 Keyword, Impressions
            FROM AdList' InsertCommand='INSERT INTO AdStats(AdId, EntryDate, Type) VALUES (@AdId, GETDATE(), 0)'
            runat='server'>
            <InsertParameters>
                <asp:Parameter Name='AdId' Type='int32' />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <br />
    <br class='clear' />
    <asp:HyperLink ID='BackToHomeHyperLink' runat='server' NavigateUrl='~/Advertiser/Home.aspx'>Back</asp:HyperLink>

<hr />

    <br />
    <br />
    
    <hr />
    <asp:FileUpload ID='FileUpload1' runat='server' />

    <br />
    <br />
    <asp:Button ID='Button1' runat='server' onclick='Button1_Click' Text='Button' />

</asp:Content>



