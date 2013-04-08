<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link rel="stylesheet" href="Styles/themes/default/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="Styles/themes/light/light.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="Styles/themes/dark/dark.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="Styles/themes/bar/bar.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="Styles/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="Styles/NivoSliderPage.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="wrapper">
        <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
                <img src="images/NivoSlider/toystory.jpg" data-thumb="images/NivoSlider/toystory.jpg"
                    alt="" />
                <a href="http://dev7studios.com">
                    <img src="images/NivoSlider/up.jpg" data-thumb="images/NivoSlider/up.jpg" alt=""
                        title="This is an example of a caption" /></a>
                <img src="images/NivoSlider/walle.jpg" data-thumb="images/NivoSlider/walle.jpg" alt=""
                    data-transition="slideInLeft" />
                <img src="images/NivoSlider/nemo.jpg" data-thumb="images/NivoSlider/nemo.jpg" alt=""
                    title="#htmlcaption" />
            </div>
            <div id="htmlcaption" class="nivo-html-caption">
                <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>.
            </div>
        </div>
    </div>
    <script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider();
        });
    </script>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/Register.aspx">SignUp Now!!</asp:HyperLink>
</asp:Content>
