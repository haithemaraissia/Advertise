using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SideJobReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PrintButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("IFrame/ExecutiveDownload.aspx?");
    }
    protected void PDFButtonClick(object sender, ImageClickEventArgs e)
    {

    }
}