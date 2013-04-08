using System;
using System.Collections.Generic;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class General : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected override void InitializeCulture()
    {

        string lang = Request.QueryString["l"];
        if (lang != null | !string.IsNullOrEmpty(lang))
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
            Session["LCID"] = lang;
        }
        else
        {
            if (Session["LCID"] != null )
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(Session["LCID"].ToString());
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture((Session["LCID"].ToString()));
            }
        }
            base.InitializeCulture();
    }
}