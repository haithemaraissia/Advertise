using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PayPalTest_PDT_PDTStart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (Request.QueryString["ID"] == null || Request.QueryString["ID"] == "")
            {
                //Response.Redirect("../Account/Login.aspx");
                Response.Redirect(Request.Url.ToString() + "?ID=1");

            }
            else
            {
                if (CheckPreviousPayment())
                {
                    CurrencyDropDownList.SelectedIndex = 5;
                    InitAmount();
                }
                else
                {
                    //PaymentAlreadyMade
                    PaypalPayment.Visible = false;
                    HiddenLabel.Text = string.Format("Thank you {0} {1} !. Our records indicate that you already had made the payment",
                              Profile.FirstName, Profile.LastName);
                }                
            }
        }
    }

    protected void PayPalImageButtonClick(object sender, ImageClickEventArgs e)
    {
        const string serverURL = "https://www.sandbox.paypal.com/cgi-bin/webscr";
        const string returnURL = "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Compaign/Payment/Paypal/PDT/PDTSuccess.aspx";
        const string cancelreturnURL = "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Compaign/Payment/Paypal/PDT/CancelPayment.aspx";
        const string notifyURL = "http://haithem-araissia.com/AdvertisePaypal/IPN/IPNHandler.aspx";
        const string cmd = "_xclick";
        const string business = "sellpr_1346179874_biz@yahoo.com";
        int paymentID = GetPaymentID();
        var context = new AdDatabaseModel.AdDatabaseEntities();
        var payment = (from payments in context.AdvertiserPaymentDues
                       where payments.PaymentDueID == paymentID
                       select payments).FirstOrDefault();
        Guid advertiserID = Guid.Parse(payment.AdvertiserID.ToString());
        int AdID = int.Parse(payment.AdID.ToString());
        var adgeneral = (from ad in context.AdGenerals
                         where ad.AdID == 80 && ad.UserID == advertiserID
                         select ad).FirstOrDefault();
        string itemName = adgeneral.AdName;
        string adID = payment.AdID.ToString(CultureInfo.InvariantCulture);
        string custom = adID + "," + adgeneral.UserID + "," + paymentID;
        string redirect = "";
        redirect += serverURL;
        redirect += "?cmd=" + cmd;
        redirect += "&business=" + business;
        redirect += "&item_name=" + itemName;
        redirect += "&item_number=" + payment.PaymentDueID;
        redirect += "&amount=" + Amount.Text.ToString(CultureInfo.InvariantCulture);
        redirect += "&currency_code=" + "USD";
        redirect += "&payer_id=" + adgeneral.UserID;
        redirect += "&receiver_email=" + Profile.Email;
        redirect += "&custom=" + custom;
        redirect += "&notify_url" + notifyURL;
        redirect += "&return=" + returnURL;
        redirect += "&cancel_return" + cancelreturnURL;
        Response.Redirect(redirect);
    }

    protected void InitAmount()
    {
        double Percentage = 0;

        //USAmount from database on US Dollar
        double USAmount = GetPaymentDue();
        CurrencyWebService CurrencyService = new CurrencyWebService();
        decimal ToUSRate = CurrencyService.Convert(1.000m, CurrencyDropDownList.SelectedValue.ToString(), "USD");

        //Amount from the Database in US
        //If Not paid in US  
        Amount.Text = (Math.Round(USAmount, 2)).ToString();
    }

    protected void Currency_SelectedIndexChanged(object sender, EventArgs e)
    {
        double InternationalFixedFee = 0;
        double Percentage = 0;

        //USAmount from database on US Dollar
        var usAmount = GetPaymentDue();
        var currencyService = new CurrencyWebService();
        decimal toUSRate = currencyService.Convert(1.000m, CurrencyDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture), "USD");

        //Amount from the Database in US
        //If Not paid in US  
        if (CurrencyDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture) != "USD")
        {
            InternationalFixedFee = (double)((decimal)usAmount * toUSRate);
            usAmount = usAmount + InternationalFixedFee;
        }
        Amount.Text = (Math.Round(usAmount, 2)).ToString(CultureInfo.InvariantCulture);
    }

    protected double GetPaymentDue()
    {
        var context = new AdDatabaseModel.AdDatabaseEntities();
        int paymentdue = GetPaymentID();
        var payment = (from payments in context.AdvertiserPaymentDues
                       where payments.PaymentDueID == paymentdue
                       select payments).FirstOrDefault();
        return payment.PaymentDue;
    }




















    protected bool CheckPreviousPayment()
    {
            int payment = GetPaymentID();
            var context = new AdDatabaseModel.AdDatabaseEntities();
            var archivedpaymentid = (from archivedpayment in context.ArchivedAdvertiserPayments
                                     where archivedpayment.PaymentDueID == payment
                                     select archivedpayment.PaymentDueID).FirstOrDefault();
            if (archivedpaymentid == 0)
            {
                return true;
            }
            else
            {
                return false;
            }  
    }

    protected int GetPaymentID()
    {
        return int.Parse(Request.QueryString["ID"]);
    }
}