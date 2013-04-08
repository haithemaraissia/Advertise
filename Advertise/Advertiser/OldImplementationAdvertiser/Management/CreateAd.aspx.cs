using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdDatabaseModel;


namespace Admanagment.Advertiser.Management
{
    public partial class CreateAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var userKey = Membership.GetUser().ProviderUserKey;
            if (userKey != null)
            {
                Guid UserID =  (Guid)userKey;


                using (var context =
                      new AdDatabaseEntities())
                    context.CreateAd("httooe", 50, 50, "dgfd", "test", "erfer", 40,
                                     Convert.ToDateTime(DateTime.Now.ToString()),
                                     Convert.ToDateTime(DateTime.Now.ToString()),true
                                     , 1, 1, "test",
                                     UserID);

                //ADId is the  maximum + 1 in Entity from Audience Table
                // and createad2
            }
        }
    }
}