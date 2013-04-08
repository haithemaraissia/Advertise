using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class wetwet2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //get the current page name
        string pageName = Path.GetFileNameWithoutExtension(Request.Path);
        //display current page name
        Response.Write(pageName);
    }
}