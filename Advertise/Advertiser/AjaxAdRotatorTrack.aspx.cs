using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admanagment.Advertiser
{
    public partial class AjaxAdRotatorTrack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //    DisplayAd();

        }

        protected void AdRotator1AdCreated(object sender, AdCreatedEventArgs e)
        {
            // Update Impressions
            srcAds.InsertParameters["AdId"].DefaultValue = e.AdProperties["Id"].ToString();
            srcAds.Insert();

            //Change NavigateUrl to redirect page
            e.NavigateUrl = "~/Advertiser/AdHandler.ashx?id=" + e.AdProperties["Id"].ToString();

        }

        protected void OnTimerTick(object sender, EventArgs e)
        {
           // DisplayAd();
            UpdatePanel1.Update();
        }

        void DisplayAd()
        {
            AdRotator1.DataSource = srcAds;
            AdRotator1.DataBind();
        }

    }
}