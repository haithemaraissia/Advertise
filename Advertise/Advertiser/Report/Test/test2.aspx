<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test2.aspx.cs" Inherits="Admanagment.Advertiser.test2" %>
<%@ Import Namespace="System.Drawing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.ForeColor = Color.PaleVioletRed;
            Label1.Font.Underline = true;
            Label1.Font.Bold = true;
            Label1.Font.Name = "Courier New";
            TextBox1.Font.Bold = true;
            TextBox1.ForeColor = Color.DarkOrange;
        }
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>Ajax CalendarExtender hover style css - how to use</title>
        <style type="text/css">
        	.CalendarCSS {
        		background-color: DeepPink;
        		color: Snow;
        	}

        	.ajax__calendar_hover {
        		font-style: italic;
        		font-weight: bold;
        		text-decoration: underline;
        	}

        	.ajax__calendar_header { background-color: HotPink; }

        	.ajax__calendar_footer {
        		background-color: Orange;
        		color: White;
        	}
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <h2 style="color: Green; font-style: italic;">
                    Ajax CalendarExtender Example: Using .ajax__calendar_hover</h2>
                <hr width="600" align="left" color="LightGreen" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:CalendarExtender ID="CalendarExtendar1" runat="server" CssClass="CalendarCSS"
                                      TargetControlID="TextBox1">
                </asp:CalendarExtender>
                <br />
                <asp:Label ID="Label1" runat="server" Text="Calendar with hover effect">  
                </asp:Label>
                <asp:TextBox ID="TextBox1" runat="server">  
                </asp:TextBox>
            </div>
        </form>
    </body>
</html>