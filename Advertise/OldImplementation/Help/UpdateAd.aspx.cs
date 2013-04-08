using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class UpdateAd : System.Web.UI.Page
{
    protected override void InitializeCulture()
    {
        string lang = Request.QueryString["l"];
        if (lang != null | !string.IsNullOrEmpty(lang))
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
            Session["LCID"] = Admanagment.Helpers.Utility.GetLCID(lang);
        }
        else
        {
            if (Session["LCID"] != null)
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(Admanagment.Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Admanagment.Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
            }
        }

    }

    protected void SEOSiteMap()
    {
        Page.Title = Resources.Resource.HomeTitle;

        System.Web.UI.WebControls.Literal nl1 = new System.Web.UI.WebControls.Literal();
        nl1.Text = Environment.NewLine;
        var Title = new HtmlMeta();
        Title.Name = "title";
        Title.Content = Resources.Resource.HomeTitle;
        Page.Header.Controls.AddAt(1, Title);

        HtmlMeta Description = new HtmlMeta();
        Description.Name = "description";
        Description.Content = Resources.Resource.HomeDescription;
        Page.Header.Controls.AddAt(2, Description);

        HtmlMeta keywords = new HtmlMeta();
        keywords.Name = "keywords";
        keywords.Content = Resources.Resource.HomeKeywords;
        Page.Header.Controls.AddAt(3, keywords);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SEOSiteMap();
        if (Session["LCID"] == null)
        {
            Session["LCID"] = 1;
        }

    }
}