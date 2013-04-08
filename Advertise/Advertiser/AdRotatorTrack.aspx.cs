using System;
using System.Web.UI.WebControls;

namespace Admanagment.Advertiser
{
    public partial class AdRotatorTrack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdRotator1AdCreated(object sender, AdCreatedEventArgs e)
        {
            // Update Impressions
            srcAds.InsertParameters["AdId"].DefaultValue = e.AdProperties["Id"].ToString();
            srcAds.Insert();

            //Change NavigateUrl to redirect page
            e.NavigateUrl = "~/Advertiser/AdHandler.ashx?id=" + e.AdProperties["Id"].ToString();
            
        }
    }
}