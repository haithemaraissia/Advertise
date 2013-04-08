using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Advertiser_Compaign_Payment_Paypal_PDT_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var context = new AdDatabaseModel.AdDatabaseEntities();
        //var archivedpaymentid = (from archivedpayment in context.ArchivedAdvertiserPayments
        //                         where archivedpayment.PaymentDueID ==1
        //                         select archivedpayment).FirstOrDefault();
        Guid AdvertiserID = Guid.Parse("9b5dc3f5-54d2-413b-9803-1fbabe6770ac");
        var adgeneral = (from ad in context.AdGenerals
                         where ad.AdID == 80 && ad.UserID == AdvertiserID
                         select ad).FirstOrDefault();
        string itemName = adgeneral.AdName;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string url =
            "tx=32C45661CY392041R&st=Pending&amt=145.35&cc=USD&cm=80%2c9b5dc3f5-54d2-413b-9803-1fbabe6770ac&item_number=1";

        Response.Redirect("PDTSuccess.aspx?" + url);
    }
}