using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using Resources;

public partial class Paypal_Start : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            //if (Request.QueryString["ID"] == null || Request.QueryString["ID"] == "")
            //{
            //    Login();
            //}
            //else
            //{
            //    CurrencyDropDownList.SelectedIndex = 5;
            //    //CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable;
            //    //GetValue(out CustomerPaymentDueTable);
            //    InitAmount();
            //}
            InitAmount();
        }

    }


    protected void PayPalImageButton_Click(object sender, ImageClickEventArgs e)
    {
        const string Server_URL = "https://www.sandbox.paypal.com/cgi-bin/webscr";
        const string return_URL = "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Compaign/Payment/Paypal/PDTSuccess.aspx";
        const string cancelreturn_URL = "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Compaign/Payment/Paypal/CancelPayment.aspx";
        const string notify_url = "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Compaign/Payment/Paypal/Handler.aspx";
        const string cmd = "_xclick";

        //CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable;
        //GetValue(out CustomerPaymentDueTable);
        const string business = "sellpr_1346179874_biz@yahoo.com";


       // string item_name = CustomerPaymentDueTable.Rows[0]["ProjectTitle"].ToString();
        string item_name = "AdName";
        string Ad_ID = "100";
       string Advertiser_ID = GetAdvertiserID();
       // string Ad_ID = Request.QueryString["ID"].ToString();
      //  string Advertiser_ID = GetAdvertiserID();
        
        //if (PaymentMade(Advertiser_ID, Ad_ID) == false)
        //{
       string redirect = "";
       redirect += Server_URL;
       redirect += "?cmd=" + cmd;
       redirect += "&business=" + business;
       redirect += "&item_name=" + item_name;
       redirect += "&item_number=" + "120";
       redirect += "&amount=" + Amount.Text.ToString();
       redirect += "&currency_code=" + CurrencyDropDownList.SelectedValue.ToString();
       redirect += "&payer_id=" + Advertiser_ID.ToString();
       redirect += "&receiver_email=" + "admin_1329938514_biz@yahoo.com";
       redirect += "&custom=" + Ad_ID;
       redirect += "&notify_url" + notify_url;
       redirect += "&return=" + return_URL;
       redirect += "&cancel_return" + cancelreturn_URL;

            //CustomerPDTDataSetTableAdapters.QueriesTableAdapter CustomerPDT = new CustomerPDTDataSetTableAdapters.QueriesTableAdapter();
            //CustomerPDT.CustomerStartPayment(Convert.ToInt32(Ad_ID), Convert.ToDouble(Amount.Text.ToString()), CurrencyDropDownList.SelectedValue.ToString(), Convert.ToInt32(Advertiser_ID));

            //Redirect to the payment page
            Response.Redirect(redirect);
        //}
    }

    public string GetAdvertiserID()
    {
        return "100";
        //string Advertiser_ID ="";
        //if (!String.IsNullOrEmpty(Session["CustomerId"].ToString()))
        //{
        //    Advertiser_ID = Session["CustomerId"].ToString();
        //}
        //else
        //{
        //    Response.Redirect("CustomerProfile.aspx");
        //}
        //return Advertiser_ID;
    }

    protected void InitAmount()
    {
        double Percentage = 0;

        //USAmount from database on US Dollar
        //CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable;
        //GetValue(out CustomerPaymentDueTable);
        //double USAmount = (double)CustomerPaymentDueTable.Rows[0]["ProjectAmount"];
        double USAmount = 200;
        CurrencyWebService CurrencyService = new CurrencyWebService();
        decimal ToUSRate = CurrencyService.Convert(1.000m, CurrencyDropDownList.SelectedValue.ToString(), "USD");

        //Amount from the Database in US
        //IF Not paid in US  
        Amount.Text = (Math.Round(USAmount, 2)).ToString();

    }

    protected void Currency_SelectedIndexChanged(object sender, EventArgs e)
    {
        double InternationalFixedFee = 0;
        double Percentage = 0;

        //USAmount from database on US Dollar
       // CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable;
        //GetValue(out CustomerPaymentDueTable);
       // var usAmount = (double)CustomerPaymentDueTable.Rows[0]["ProjectAmount"];

        var usAmount = 500.01;
        var currencyService = new CurrencyWebService();
        decimal toUSRate = currencyService.Convert(1.000m, CurrencyDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture), "USD");

        //Amount from the Database in US
        //IF Not paid in US  
        if (CurrencyDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture) != "USD")
        {
            InternationalFixedFee = (double)((decimal)usAmount * toUSRate);
            usAmount = usAmount + InternationalFixedFee;
        }
        Amount.Text = (Math.Round(usAmount, 2)).ToString(CultureInfo.InvariantCulture);
    }



    //protected bool PaymentMade(string CustomerID, string ProjectID)
    //{
    //    bool result = false;
    //    //// Checking if Payment for this project were already submitted by Customer ////
    //    CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter CustomerCheckAdapter = new CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter();
    //    CustomerPDTDataSet.CustomerSuccessfulPDTDataTable CustomerCheckTable = new CustomerPDTDataSet.CustomerSuccessfulPDTDataTable();
    //    CustomerCheckAdapter.FillCheck(CustomerCheckTable, Convert.ToInt32(CustomerID.ToString()), Convert.ToInt32(ProjectID.ToString()));

    //    //There can be only 1 row or 0 row
    //    if (CustomerCheckTable.Rows.Count == 1)
    //    {
    //        if ((string.Equals(CustomerCheckTable.Rows[0]["CurrencyCode"].ToString(), CurrencyDropDownList.SelectedValue.ToString())) && (string.Equals(CustomerCheckTable.Rows[0]["GrossTotal"].ToString(), Amount.Text.ToString())))
    //        {
    //            string sucessmessage = CustomerCheckTable.Rows[0]["FirstName"].ToString() +
    //                                   CustomerCheckTable.Rows[0]["LastName"].ToString() + ",<br/>";
    //            sucessmessage += Resource.ThankPayment + "<br/>";
    //            sucessmessage += Resource.PaymentOf + CustomerCheckTable.Rows[0]["CurrencyCode"].ToString() +
    //                             CustomerCheckTable.Rows[0]["GrossTotal"].ToString() + Resource.PaymentProcessed + "<br/><br/>";
    //            sucessmessage += Resource.Sincerely + "<br/>";
    //            sucessmessage += Resource.YourSideJobTeam + "<br/>";
    //            HiddenLabel.Text = sucessmessage;
    //            result = true;
    //        }
    //        else
    //        {
    //            string failuremessage = CustomerCheckTable.Rows[0]["FirstName"].ToString() +
    //                                   CustomerCheckTable.Rows[0]["LastName"].ToString() + ",<br/>";
    //            failuremessage += Resource.FailedTransaction + "<br/>";
    //            failuremessage += Resource.FailurePDT;
    //            HiddenLabel.Text = failuremessage;
    //            result = false;
    //        }
    //    }
    //    else if (CustomerCheckTable.Rows.Count > 1)
    //    {
    //        EmailAdmin(String.Format("Multiple Payment from Customer {0} for Projet {1}", CustomerID.ToString(),
    //                     ProjectID.ToString()), "Check CustomerSuccessfulPDT Table", "yoursidjob@yahoo.com");
    //        result = true;
    //    }
    //    return result;
    //}



    //public void GetValue(out CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable)
    //{
    //    CustomerPDTDataSetTableAdapters.CustomerPaymentDueTableAdapter CustomerPaymentDue =
    //        new CustomerPDTDataSetTableAdapters.CustomerPaymentDueTableAdapter();
    //    CustomerPaymentDueTable = new CustomerPDTDataSet.CustomerPaymentDueDataTable();
    //    CustomerPaymentDue.FillCustomerPaymentDue(CustomerPaymentDueTable, Convert.ToInt32(Session["CustomerId"].ToString()),
    //                                              Convert.ToInt32(Request.QueryString["ID"].ToString()));
    //}













































    private void Login()
    {
        Response.Redirect(string.Format("~/Account/Login.aspx?ReturnUrl={0}", HttpContext.Current.Request.Url.AbsoluteUri));
    }

    private void EmailAdmin(string subject, string message, string EmailAddress)
    {
        MailMessage mailObj = new MailMessage();
        mailObj.From = new MailAddress("yoursidjob@yahoo.com");
        mailObj.Subject = subject;
        mailObj.Body = message;
        mailObj.To.Add(new MailAddress(EmailAddress));
        mailObj.IsBodyHtml = true;
        SmtpClient SmtpMail = new SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("postmaster@haithemaraissia.com", "haithem759163");
        SmtpMail.Host = "mail.haithemaraissia.com";
        SmtpMail.UseDefaultCredentials = false;
        SmtpMail.Credentials = basicAuthenticationInfo;
        try
        {
            SmtpMail.Send(mailObj);
        }
        catch (Exception)
        {
            Response.Redirect(Request.Url.ToString());
            throw;
        }
    }

    public enum CurrencyCode
    {
        AUD,
        CAD,
        CZK,
        DKK,
        EUR,
        HKD,
        HUF,
        ILS,
        JPY,
        MXN,
        NZD,
        NOK,
        PHP,
        PLN,
        SGD,
        SEK,
        CHF,
        TWD,
        THB,
        GBP
    }

    public static double CurrencyCharge(string Chosen)
    {
        double charge = 0;
        CurrencyCode SelectedCurrency = (CurrencyCode)Enum.Parse(typeof(CurrencyCode), Chosen);
        switch (SelectedCurrency)
        {
            case CurrencyCode.AUD:
                charge = 0.30;
                break;
            case CurrencyCode.CAD:
                charge = 0.30;
                break;
            case CurrencyCode.CZK:
                charge = 10.00;
                break;
            case CurrencyCode.DKK:
                charge = 2.60;
                break;
            case CurrencyCode.EUR:
                charge = 0.35;
                break;
            case CurrencyCode.GBP:
                charge = 0.20;
                break;
            case CurrencyCode.HKD:
                charge = 2.35;
                break;
            case CurrencyCode.HUF:
                charge = 90;
                break;
            case CurrencyCode.ILS:
                charge = 1.20;
                break;
            case CurrencyCode.JPY:
                charge = 40;
                break;
            case CurrencyCode.MXN:
                charge = 4.00;
                break;
            case CurrencyCode.NOK:
                charge = 2.80;
                break;
            case CurrencyCode.NZD:
                charge = 0.45;
                break;
            case CurrencyCode.PHP:
                charge = 15.00;
                break;
            case CurrencyCode.PLN:
                charge = 1.35;
                break;
            case CurrencyCode.SEK:
                charge = 3.25;
                break;
            case CurrencyCode.SGD:
                charge = 0.50;
                break;
            case CurrencyCode.THB:
                charge = 11;
                break;
            case CurrencyCode.TWD:
                charge = 10;
                break;
        }
        return charge;
    }


}