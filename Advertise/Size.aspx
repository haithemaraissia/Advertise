<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="Size.aspx.cs" Inherits="AdManagment.AdRotatorXML1" %>

<%@ Register Assembly="AdControl" Namespace="AdControl" TagPrefix="BannerRotator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
        html
        {
            background-color:silver;
        }
        .content
        {

            background-color:white;
            padding:10px;
            border:solid 1px black;
            margin:auto;
            width:860px;
            text-align:center;
        }
        .box
        {
            float:right;
            padding:10px;
            border-left:solid 1px black;
        }
        .clear
        {
            clear:both;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">

    <BannerRotator:BannerRotator
        id="AdRotator1"
        AdvertisementFile="~/App_Data/AdList.xml"
        KeywordFilter="banner"
        CssClass="banner"
        Runat="server" />

    <br /><br /><br />
    
    
    
<noscript>
<a href="http://servedby.flashtalking.com/click/3/20469;285571;0;209;0/?url=1633983" target="_blank">
<img border="0" src="http://servedby.flashtalking.com/imp/3/20469;285571;205;gif;FoodBusinessNews;Homepage300x250/?"></a>
</noscript>
<script language="Javascript1.1" type="text/javascript">
    var ftClick = "";
    var ftX = "";
    var ftY = "";
    var ftZ = "";
    var ftContent = "";
    var ftCustom = "";
    var ft300x250_OOBclickTrack = "";
    var ftRandom = Math.random() * 1000000;
    var ftBuildTag1 = "<scr";
    var ftBuildTag2 = "</";
    var ftTag = ftBuildTag1 + 'ipt language="javascript1.1" type="text/javascript" ';
    ftTag += 'src="http://servedby.flashtalking.com/imp/3/20469;285571;201;js;FoodBusinessNews;Homepage300x250/?click=' + ftClick + '&ftx=' + ftX + '&fty=' + ftY + '&ftadz=' + ftZ + '&ftscw=' + ftContent + '&ft_custom=' + ftCustom
+ '&cachebuster=' + ftRandom + '" id="ftscript_300x250" name="ftscript_300x250"';
    ftTag += '">' + ftBuildTag2 + 'script>';
    document.write(ftTag);
</script>


    <div class="box">
        <BannerRotator:BannerRotator
            id="AdRotator2"
            AdvertisementFile="~/App_Data/AdList.xml"
            KeywordFilter="box"
            Runat="server" />
        <br /><br />
        <BannerRotator:BannerRotator
            id="AdRotator3"
            AdvertisementFile="~/App_Data/AdList.xml"
            KeywordFilter="box"

            Runat="server" />
    </div>

    <br />Here is the body text in the page.
    <br />Here is the body text in the page.
    <br />Here is the body text in the page.
    <br />Here is the body text in the page.

    <br class="clear" />
    </div>
</asp:Content>

