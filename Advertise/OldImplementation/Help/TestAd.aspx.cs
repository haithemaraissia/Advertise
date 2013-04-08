using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test_TestAd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    private void BannerKeywords()
    {
       // BannerRotator1.KeywordFilter = "Site,Position,5,Language";
        BannerRotator1.KeywordFilter = "Good";
      //  BannerRotator1.KeywordFilter = "Home";
    }

    protected void AdRotator1AdCreated(object sender, AdCreatedEventArgs e)
    {
        e.NavigateUrl = "~/Advertiser/AdHandler.ashx?id=" + e.AdProperties["ID"].ToString();
        BannerKeywords();
    }
}