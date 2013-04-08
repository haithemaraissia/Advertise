using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Net;
using System.IO;
public partial class PayPalTest_PDT_PDTSuccess : System.Web.UI.Page
{
  string authToken, txToken, query;
        string strResponse;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Used parts from https://www.paypaltech.com/PDTGen/
                // Visit above URL to auto-generate PDT script

                authToken = WebConfigurationManager.AppSettings["ADPDTToken"];

                //read in txn token from querystring
                txToken = Request.QueryString.Get("tx");


                query = string.Format("cmd=_notify-synch&tx={0}&at={1}", txToken, authToken);

                // Create the request back
                string url = WebConfigurationManager.AppSettings["PayPalSubmitUrl"];
                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                Response.Write(req.ToString());
                // Set values for the request back
                req.Method = "POST";
                req.ContentType = "application/x-www-form-urlencoded";
                req.ContentLength = query.Length;

                // Write the request back IPN strings
                StreamWriter stOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
                stOut.Write(query);
                stOut.Close();

                // Do the request to PayPal and get the response
                StreamReader stIn = new StreamReader(req.GetResponse().GetResponseStream());
                strResponse = stIn.ReadToEnd();
                stIn.Close();

                // sanity check
                Label2.Text = strResponse;
                Response.Write(url);
                // If response was SUCCESS, parse response string and output details
                if (strResponse.StartsWith("SUCCESS"))
                {
                    PDTHolder pdt = PDTHolder.Parse(strResponse);
                    Label1.Text = string.Format("Thank you {0} {1} [{2}] for your payment of {3} {4}!",
                        pdt.PayerFirstName, pdt.PayerLastName, pdt.PayerEmail, pdt.GrossTotal, pdt.Currency);
                }
                else
                {
                    Label1.Text = "Oooops, something went wrong...";
                }
            }
        }

}

public class PDTHolder
{
    public double GrossTotal { get; set; }
    public int InvoiceNumber { get; set; }
    public string PaymentStatus { get; set; }
    public string PayerFirstName { get; set; }
    public double PaymentFee { get; set; }
    public string BusinessEmail { get; set; }
    public string PayerEmail { get; set; }
    public string TxToken { get; set; }
    public string PayerLastName { get; set; }
    public string ReceiverEmail { get; set; }
    public string ItemName { get; set; }
    public string Currency { get; set; }
    public string TransactionId { get; set; }
    public string SubscriberId { get; set; }
    public string Custom { get; set; }

    public static PDTHolder Parse(string postData)
    {
        String sKey, sValue;
        PDTHolder ph = new PDTHolder();

        try
        {
            //split response into string array using whitespace delimeter
            String[] StringArray = postData.Split('\n');

            // NOTE:
            /*
            * loop is set to start at 1 rather than 0 because first
            string in array will be single word SUCCESS or FAIL
            Only used to verify post data
            */

            // use split to split array we already have using "=" as delimiter
            int i;
            for (i = 1; i < StringArray.Length - 1; i++)
            {
                String[] StringArray1 = StringArray[i].Split('=');

                sKey = StringArray1[0];
                sValue = HttpUtility.UrlDecode(StringArray1[1]);

                // set string vars to hold variable names using a switch
                switch (sKey)
                {
                    case "mc_gross":
                        ph.GrossTotal = Convert.ToDouble(sValue);
                        break;

                    case "invoice":
                        ph.InvoiceNumber = Convert.ToInt32(sValue);
                        break;

                    case "payment_status":
                        ph.PaymentStatus = Convert.ToString(sValue);
                        break;

                    case "first_name":
                        ph.PayerFirstName = Convert.ToString(sValue);
                        break;

                    case "mc_fee":
                        ph.PaymentFee = Convert.ToDouble(sValue);
                        break;

                    case "business":
                        ph.BusinessEmail = Convert.ToString(sValue);
                        break;

                    case "payer_email":
                        ph.PayerEmail = Convert.ToString(sValue);
                        break;

                    case "Tx Token":
                        ph.TxToken = Convert.ToString(sValue);
                        break;

                    case "last_name":
                        ph.PayerLastName = Convert.ToString(sValue);
                        break;

                    case "receiver_email":
                        ph.ReceiverEmail = Convert.ToString(sValue);
                        break;

                    case "item_name":
                        ph.ItemName = Convert.ToString(sValue);
                        break;

                    case "mc_currency":
                        ph.Currency = Convert.ToString(sValue);
                        break;

                    case "txn_id":
                        ph.TransactionId = Convert.ToString(sValue);
                        break;

                    case "custom":
                        ph.Custom = Convert.ToString(sValue);
                        break;

                    case "subscr_id":
                        ph.SubscriberId = Convert.ToString(sValue);
                        break;
                }
            }

            return ph;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public class AdPDTHolder
    {
        public double GrossTotal { get; set; }
        public int InvoiceNumber { get; set; }
        public string PaymentStatus { get; set; }
        public string PayerFirstName { get; set; }
        public double PaymentFee { get; set; }
        public string BusinessEmail { get; set; }
        public string PayerEmail { get; set; }
        public string TxToken { get; set; }
        public string PayerLastName { get; set; }
        public string ReceiverEmail { get; set; }
        public string ItemName { get; set; }
        public string Currency { get; set; }
        public string TransactionId { get; set; }
        public string SubscriberId { get; set; }
        public string Custom { get; set; }

        public static AdPDTHolder Parse(string postData)
        {
            String sKey, sValue;
            AdPDTHolder ph = new AdPDTHolder();

            try
            {
                //split response into string array using whitespace delimeter
                String[] StringArray = postData.Split(' ');

                // NOTE:
                /*
                * loop is set to start at 1 rather than 0 because first
                string in array will be single word SUCCESS or FAIL
                Only used to verify post data
                */

                // use split to split array we already have using "=" as delimiter
                int i;
                for (i = 1; i < StringArray.Length - 2; i++)
                {
                    String[] StringArray1 = StringArray[i].Split('=');

                    sKey = StringArray1[0];
                    sValue = HttpUtility.UrlDecode(StringArray1[1]);

                    // set string vars to hold variable names using a switch
                    switch (sKey)
                    {
                        case "mc_gross":
                            ph.GrossTotal = Convert.ToDouble(sValue);
                            break;

                        case "invoice":
                            ph.InvoiceNumber = Convert.ToInt32(sValue);
                            break;

                        case "payment_status":
                            ph.PaymentStatus = Convert.ToString(sValue);
                            break;

                        case "first_name":
                            ph.PayerFirstName = Convert.ToString(sValue);
                            break;

                        case "mc_fee":
                            ph.PaymentFee = Convert.ToDouble(sValue);
                            break;

                        case "business":
                            ph.BusinessEmail = Convert.ToString(sValue);
                            break;

                        case "payer_email":
                            ph.PayerEmail = Convert.ToString(sValue);
                            break;

                        case "Tx Token":
                            ph.TxToken = Convert.ToString(sValue);
                            break;

                        case "last_name":
                            ph.PayerLastName = Convert.ToString(sValue);
                            break;

                        case "receiver_email":
                            ph.ReceiverEmail = Convert.ToString(sValue);
                            break;

                        case "item_name":
                            ph.ItemName = Convert.ToString(sValue);
                            break;

                        case "mc_currency":
                            ph.Currency = Convert.ToString(sValue);
                            break;

                        case "txn_id":
                            ph.TransactionId = Convert.ToString(sValue);
                            break;

                        case "custom":
                            ph.Custom = Convert.ToString(sValue);
                            break;

                        case "subscr_id":
                            ph.SubscriberId = Convert.ToString(sValue);
                            break;
                    }
                }

                return ph;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}