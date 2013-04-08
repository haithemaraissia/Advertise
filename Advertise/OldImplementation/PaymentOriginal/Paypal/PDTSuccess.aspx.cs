using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Advertiser_Compaign_Payment_Paypal_PDTSuccess : System.Web.UI.Page
{
    string authToken, txToken, query;
    string strResponse;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Used parts from https://www.paypaltech.com/PDTGen/
            // Visit above URL to auto-generate PDT script

            authToken = WebConfigurationManager.AppSettings["PDTToken"];

            //read in txn token from querystring
            txToken = Request.QueryString.Get("tx");

            query = string.Format("cmd=_notify-synch&tx={0}&at={1}", txToken, authToken);

            // Create the request back
            string url = WebConfigurationManager.AppSettings["PayPalSubmitUrl"];
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);

            // Set values for the request back
            req.Method = "POST";
            req.ContentType = "application/x-www-form-urlencoded";
            req.ContentLength = query.Length;

            // Write the request back IPN strings
            StreamWriter stOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
            stOut.Write(query);
            stOut.Close();

             //Do the request to PayPal and get the response
            StreamReader stIn = new StreamReader(req.GetResponse().GetResponseStream());
            strResponse = stIn.ReadToEnd();
            stIn.Close();
            Response.Write(strResponse);
            //// string CustomerID = GetCustomerID();


            //FOR TESTING//

           // string strResponse =
             //   "SUCCESS mc_gross=200.00 protection_eligibility=Ineligible address_status=confirmed payer_id=2HYVUDMMKGAGA tax=0.00 address_street=1+Main+St payment_date=01%3A59%3A01+Aug+16%2C+2012+PDT payment_status=Pending charset=windows-1252 address_zip=95131 first_name=jack mc_fee=6.10 address_country_code=US address_name=jack+smitj custom=100 payer_status=verified business=sidejob_ad%40yahoo.com address_country=United+States address_city=San+Jose quantity=1 payer_email=adtest_1345105956_per%40yahoo.com txn_id=6WD472515B5252403 payment_type=instant last_name=smitj address_state=CA receiver_email=sidejob_ad%40yahoo.com payment_fee=6.10 receiver_id=YQD4A5GZGJSLS pending_reason=paymentreview txn_type=web_accept item_name=AdName mc_currency=USD item_number=120 residence_country=US handling_amount=0.00 transaction_subject=100 payment_gross=200.00 shipping=0.00";

            //

            AdPDTHolder pdt = AdPDTHolder.Parse(strResponse);

            //CustomerPDTDataSetTableAdapters.CustomerStartingPaymentTableAdapter CustomerPDTAdapter = new CustomerPDTDataSetTableAdapters.CustomerStartingPaymentTableAdapter();
            //CustomerPDTDataSet.CustomerStartingPaymentDataTable CustomerPDTTable = new CustomerPDTDataSet.CustomerStartingPaymentDataTable();
            //CustomerPDTAdapter.FillVerifyTransaction(CustomerPDTTable, Convert.ToInt32(pdt.Custom));


            //// If response was SUCCESS, parse response string and output details
            ////The payment is succesful
            //if (strResponse.StartsWith("SUCCESS"))
            //{
            //               //If there is no match
            //    //The customer close the windows.

            //    //If There is a match
            //    //The customer return back to the confirmation page.

            //    foreach (DataRow row in CustomerPDTTable)
            //    {
            //        CustomerPDTDataSetTableAdapters.QueriesTableAdapter CustomerPDT = new CustomerPDTDataSetTableAdapters.QueriesTableAdapter();

            //        if (pdt.Custom.ToString() == row["ProjectID"].ToString() && pdt.Currency.ToString() == row["CurrencyCode"].ToString() && (row["Amount"].ToString() == pdt.GrossTotal.ToString()))
            //        {
            //            //Insert it only 1 time
            //            ////Sucessful PDT////
            //            CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter CustomerSuccessfulPDTAdapter = new CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter();
            //            CustomerPDTDataSet.CustomerSuccessfulPDTDataTable CustomerSuccessfulPDTTable = new CustomerPDTDataSet.CustomerSuccessfulPDTDataTable();
            //            CustomerSuccessfulPDTAdapter.FillCustomerSuccededPDT(CustomerSuccessfulPDTTable, Convert.ToInt32(CustomerID), Convert.ToInt32(pdt.Custom.ToString()));

            //            if (CustomerSuccessfulPDTTable.Rows.Count == 0)
            //            {
            //                CustomerPDT.SuccessPDT(pdt.GrossTotal, pdt.InvoiceNumber, pdt.PaymentStatus, pdt.PayerFirstName, pdt.PayerLastName, pdt.PaymentFee, pdt.BusinessEmail, txToken
            //         , pdt.ReceiverEmail, pdt.ItemName, pdt.Currency, pdt.TransactionId, pdt.Custom, "no subscriber", Convert.ToInt32(CustomerID), Convert.ToInt32(pdt.Custom));

            //                CustomerPDT.AddCustomerPendingTransaction(Convert.ToInt32(CustomerID),
            //                                                          Convert.ToInt32(pdt.Custom));

            //                string sucessmessage = pdt.PayerFirstName + " " +
            //                    pdt.PayerFirstName + "<br/>";
            //                sucessmessage += Resources.Resource.PaymentOf + " ";
            //                sucessmessage += pdt.Currency + " " + pdt.GrossTotal +
            //                    Resources.Resource.PaymentProcessed + "<br/>";
            //                sucessmessage += Resources.Resource.Sincerely + "<br/>";
            //                sucessmessage += Resources.Resource.YourSideJobTeam + "<br/>";
            //            }
            //            else
            //            {
            //                HiddenLabel.Text = Resources.Resource.AlreadyPaid;
            //            }
            //        }
            //        else
            //        {
            //            //Potential Hack
            //            CustomerPDT.HackedPDT(pdt.GrossTotal, pdt.InvoiceNumber, pdt.PaymentStatus, pdt.PayerFirstName, pdt.PayerLastName, pdt.PaymentFee, pdt.BusinessEmail, txToken
            //              , pdt.ReceiverEmail, pdt.ItemName, pdt.Currency, pdt.TransactionId, pdt.Custom, "no subscriber", Convert.ToInt32(CustomerID), Convert.ToInt32(pdt.Custom));

            //            //Email The Hacker and Admin
            //            string failuremessage = pdt.PayerFirstName + " " +
            //                    pdt.PayerFirstName + "<br/>";
            //            failuremessage += Resources.Resource.FailedTransaction + "<br/>";
            //            failuremessage += Resources.Resource.FailurePDT;
            //            HiddenLabel.Text = failuremessage;

            //        }

            //    }
            //}
            //else
            //{
            //    string failuremessage = pdt.PayerFirstName + " " +
            //                     pdt.PayerFirstName + "<br/>";
            //    failuremessage += Resources.Resource.FailedTransaction + "<br/>";
            //    failuremessage += Resources.Resource.FailurePDT;
            //    HiddenLabel.Text = failuremessage;
            //}


            if (strResponse.StartsWith("SUCCESS"))
            {
                string sucessmessage = pdt.PayerFirstName + " " +
                    pdt.PayerFirstName + "<br/>";
                sucessmessage += Resources.Resource.PaymentOf + " ";
                sucessmessage += pdt.Currency + " " + pdt.GrossTotal +
                    Resources.Resource.PaymentProcessed + "<br/>";
                sucessmessage += Resources.Resource.Sincerely + "<br/>";
                sucessmessage += Resources.Resource.YourSideJobTeam + "<br/>";

            }
            else
            {
                string failuremessage = pdt.PayerFirstName + " " +
                                 pdt.PayerFirstName + "<br/>";
                failuremessage += Resources.Resource.FailedTransaction + "<br/>";
                failuremessage += Resources.Resource.FailurePDT;
                HiddenLabel.Text = failuremessage;
            }
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