using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var user = Membership.GetUser("haithem");
        if (user != null)
        {
            var id = user.ProviderUserKey;
        }


        // ProfileCommon p  = (ProfileCommon) ProfileCommon.Create("test", true);
        //HttpContext.Current.Profile.
        //HttpContext.Current.Profile.Properties.
    }
}