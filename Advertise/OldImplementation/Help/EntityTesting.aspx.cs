using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admanagment
{
    public partial class EntityTesting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Helpers.Utility.GetAudienceAdID();
            MaximumRowLabel2.Text = Helpers.Utility.GetTempAdID().ToString(CultureInfo.InvariantCulture);
            GetZipCode();
            GetCountryCode();
        }

        private static int GetAdID()
        {
            int adID;
            var context = new AdDatabaseModel.AdDatabaseEntities();
            var max = context.AdAudiences.OrderByDescending(s => s.AdID).FirstOrDefault();

            if (max == null)
            { 
                adID = 0;
            }
            else
            {
                adID = max.AdID + 1;
            }
            return adID;
        }

        protected void Button1Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();
            if (user != null)
            {
                var userKey = user.ProviderUserKey;

                if (userKey != null)
                {
                    var userID = (Guid)userKey;

                    using (var context2 =
                        new AdDatabaseModel.AdDatabaseEntities())
                        context2.CreateNewAd(1, 1, 1, "yahoo.com", 1, "../Advertiser/Ads/Ad1.gif", "hello ther", "keyword", 55, 50, 100,
                                             Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture)),
                                             Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture)),
                                             false, userID, 1, 1, 1, 256, "USA", 126, "Overland", null, null, "66203",
                                             25, "Profession",
                                             Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture)),
                                             Helpers.Utility.GetAudienceAdID(), "AdName", 2,"US", Helpers.Utility.GetFlagPath(256), "5,15,20,74");

                }
            }
        }


        protected void Button2Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();
            if (user != null)
            {
                var userKey = user.ProviderUserKey;

                if (userKey != null)
                {
                    var userID = (Guid) userKey;

                    using (var context2 = new AdDatabaseModel.AdDatabaseEntities())

                        context2.AddTempAd(Helpers.Utility.GetTempAdID(), 2, 3, 4, "Http://www.google.com", 3, "imageurl", "text", "Home", 200, 300, 100,
                                            Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture)),
                                            Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture)),
                                           userID, 1, 2, 3,256, "usa",128,"OverlandPark",null,null, "zipcode", 300,
                                           4, "Painter,Mechanic,doctor,eletrician",
                                           Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture)), "adName", 3, "US", Helpers.Utility.GetFlagPath(256), "5,15,20,74");


                             
                        //context2.AddTempAd( 2, "facebook.com", 2, 3, "http://www.google.com", 2, "imageurl",
                        //                   "alternativetext", "keyword", 50, 200, 700,
                        //                   Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture))
                        //                   , Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture)),
                        //                   false,
                        //                   userID, 1, 1, 1, "country", 200, "code", "region", "city", "zipcode", 2, 4,
                        //                   "Painter,Electrician,doctor,Mecanic",
                        //                   Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture))
                        //                   , 5, "adName");

                  
                }
            }
        }

        //public static int GetID()
        //{
        //    int adID;
        //    var context = new AdDatabaseEntities();
        //    var max = context.TempAds.OrderByDescending(s => s.ID).FirstOrDefault();

        //    if (max == null)
        //    {
        //        adID = 0;
        //    }
        //    else
        //    {
        //        adID = max.ID + 1;
        //    }
        //    return adID;
        //}

        protected void GetZipCode()
        {
            ZipcodeResult.Text =
                Helpers.Utility.GetZipcode(254, 133, "Kahului", "6659");


        }

        protected void GetCountryCode()
        {
            CountryCodeResult.Text = Helpers.Utility.GetCountryCode(254);
        }
    }
}