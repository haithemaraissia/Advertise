<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SideJobReport.aspx.cs" Inherits="SideJobReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-link:"Header Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-link:"Footer Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.FooterChar
	{mso-style-name:"Footer Char";
	mso-style-link:Footer;
	font-family:"Times New Roman","serif";}
span.HeaderChar
	{mso-style-name:"Header Char";
	mso-style-link:Header;
	font-family:"Times New Roman","serif";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
.MsoChpDefault
	{font-family:"Calibri","sans-serif";}
.MsoPapDefault
	{margin-bottom:10.0pt;
	line-height:115%;}
 /* Page Definitions */
 @page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in .5in 1.0in .5in;}
div.WordSection1
	{page:WordSection1;}
@page WordSection2
	{size:8.5in 11.0in;
	margin:1.0in .5in 1.0in .5in;}
div.WordSection2
	{page:WordSection2;}
 /* List Definitions */
 ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ImageButton ID="PrintButton" runat="server" ImageUrl="~/Advertiser/Report/images/PRINT.png"
            Width="32px" Height="32px" OnClientClick="Print();" OnClick="PrintButton_Click" />
        &nbsp;<asp:ImageButton ID="PDFButton" runat="server" ImageUrl="~/Advertiser/Report/images/PDF.jpg"
            Width="32px" Height="32px" OnClick="PDFButtonClick" />
    </div>
    </form>
</body>
</html>
