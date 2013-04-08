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
        const string return_URL = "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Compaign/PayPalTest/PayPalTest/PDT/PDTSuccess.aspx";
        const string cancelreturn_URL = "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Compaign/PayPalTest/PayPalTest/PDT/CancelPayment.aspx";
        const string notify_url = "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Compaign/PayPalTest/PayPalTest/IPN/IPNHandler.aspx";
        const string cmd = "_xclick";

        //CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable;
        //GetValue(out CustomerPaymentDueTable);
        const string business = "sellpr_1346179874_biz@yahoo.com";


        // string item_name = CustomerPaymentDueTable.Rows[0]["ProjectTitle"].ToString();
        string item_name = "AdName";
        string Ad_ID = "100";
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
        redirect += "&amount=" + "150";
        redirect += "&currency_code=" + "USD";
        redirect += "&payer_id=" + "100";
        redirect += "&receiver_email=" + "haithemtestd@yahoo.com";
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

}