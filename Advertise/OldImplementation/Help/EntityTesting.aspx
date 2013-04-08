<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntityTesting.aspx.cs" Inherits="Admanagment.EntityTesting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Maximum Row" 
            style="font-weight: 700"></asp:Label>  &nbsp;&nbsp;&nbsp;
        <asp:Label ID="MaximumRowLabel" runat="server" Text="Label"></asp:Label>
    
      
    
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1Click" Text="Get it" />
    
      
        <br />
        <br />

    
        ==========<br />
        <br />
        Insert a Temp Ad:<br />
        <asp:Button ID="Button2" runat="server" onclick="Button2Click" Text="Insert to TempAd" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="MaximumRowLabel2" runat="server" Text="Label"></asp:Label>

    
    </div>
    
    <div id="Other Function">
        <asp:Label ID="Zipcode" runat="server">Testing Zipcode Function</asp:Label>
        <br />
        <asp:Label ID="ZipcodeResult" runat="server"></asp:Label>
        
    <br />
    ============<br />
    <asp:Label ID="CountryCode" runat="server">CountryCode</asp:Label>
    <br />
    <asp:Label ID="CountryCodeResult" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
