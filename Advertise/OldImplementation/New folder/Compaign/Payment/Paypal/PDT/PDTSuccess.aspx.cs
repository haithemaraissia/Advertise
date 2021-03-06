﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Text;
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

            //string strResponse = "SUCCESS mc_gross=145.35 protection_eligibility=Ineligible address_status=confirmed payer_id=WJ3SRWX9PXP94 tax=0.00 address_street=1+Main+St payment_date=07%3A13%3A35+Sep+06%2C+2012+PDT payment_status=Pending terminal_id= charset=windows-1252 address_zip=95131 first_name=sdgsd receipt_reference_number= mc_fee=4.52 address_country_code=US address_name=sdgsd+sdgs custom=80%2C9b5dc3f5-54d2-413b-9803-1fbabe6770ac payer_status=verified business=sellpr_1346179874_biz%40yahoo.com address_country=United+States address_city=San+Jose quantity=1 payer_email=adver_1345188328_per%40yahoo.com txn_id=059835996R2655052 payment_type=instant last_name=sdgs address_state=CA receiver_email=sellpr_1346179874_biz%40yahoo.com store_id= payment_fee=4.52 receiver_id=EVBLGJGBR8RL8 pending_reason=paymentreview pos_transaction_type= txn_type=web_accept item_name=ewtwet num_offers=0 mc_currency=USD item_number=1 residence_country=US handling_amount=0.00 transaction_subject=80%2C9b5dc3f5-54d2-413b-9803-1fbabe6770ac payment_gross=145.35 shipping=0.00 ";
            // sanity check

            //Response.Write(strResponse);
            PDTHolder pdt = PDTHolder.Parse(strResponse);


            // If response was SUCCESS, parse response string and output details
            if (strResponse.StartsWith("SUCCESS"))
            {
                using (var context = new AdDatabaseModel.AdDatabaseEntities())
                {
                    try
                    {
                        var Custom = pdt.Custom.Split(',');
                        int AdID = int.Parse(Custom[0]);
                        var result2 = from c in context.AdGenerals
                                      where c.AdID == AdID
                                      select c.UserID;
                        Guid userID = Guid.Parse(result2.FirstOrDefault().ToString());
                        var result = from c in context.AdvertiserSuccessfulPDTs
                                     where (c.AdID == AdID && c.AdvertiserID == userID && c.GrossTotal.Equals(pdt.GrossTotal) && c.CurrencyCode == pdt.Currency)
                                     select c.TransactionId;
                        var resultQuery = result.FirstOrDefault();
                        if (resultQuery == null)
                        {
                            HiddenLabel.Text = string.Format("Thank you {0} {1} [{2}] for your payment of {3} {4}!",
                                pdt.PayerFirstName, pdt.PayerLastName, pdt.PayerEmail, pdt.GrossTotal, pdt.Currency);

                            //Insert into Successful PDT 
                            var advertiserSuccessfulPDT = new AdDatabaseModel.AdvertiserSuccessfulPDT
                            {
                                PDTID = Admanagment.Helpers.Utility.GetNextSuccessfulPDTID(),
                                GrossTotal = pdt.GrossTotal,
                                Invoice = pdt.InvoiceNumber,
                                PaymentStatus = pdt.PaymentStatus,
                                FirstName = pdt.PayerFirstName,
                                LastName = pdt.PayerLastName,
                                PaymentFee = pdt.PaymentFee,
                                BusinessEmail = pdt.BusinessEmail,
                                TxToken = Request.QueryString.Get("tx"),
                                ReceiverEmail = pdt.ReceiverEmail,
                                ItemName = pdt.ItemName,
                                CurrencyCode = pdt.Currency,
                                TransactionId = pdt.TransactionId,
                                Custom = pdt.Custom,
                                subscriberId = pdt.SubscriberId,
                                AdvertiserID = userID,
                                AdID = int.Parse(Custom[0])
                            };

                            var PaymentID = int.Parse(Custom[2]);
                            AdDatabaseModel.AdvertiserPaymentDue currentpaymentdue = (from c in context.AdvertiserPaymentDues
                                                                                      where c.PaymentDueID == PaymentID
                                                                                      select c).FirstOrDefault();
                            if (pdt.PaymentStatus == "Completed")
                            {
                                //Archived PDT
                                var archivedadvertiserSuccessfulPDT = new AdDatabaseModel.ArchivedAdvertiserSuccessfulPDT
                                {
                                    PDTID = Admanagment.Helpers.Utility.GetNextSuccessfulPDTID(),
                                    GrossTotal = pdt.GrossTotal,
                                    Invoice = pdt.InvoiceNumber,
                                    PaymentStatus = pdt.PaymentStatus,
                                    FirstName = pdt.PayerFirstName,
                                    LastName = pdt.PayerLastName,
                                    PaymentFee = pdt.PaymentFee,
                                    BusinessEmail = pdt.BusinessEmail,
                                    TxToken = Request.QueryString.Get("tx"),
                                    ReceiverEmail = pdt.ReceiverEmail,
                                    ItemName = pdt.ItemName,
                                    CurrencyCode = pdt.Currency,
                                    TransactionId = pdt.TransactionId,
                                    Custom = pdt.Custom,
                                    subscriberId = pdt.SubscriberId,
                                    AdvertiserID = userID,
                                    AdID = int.Parse(Custom[0])
                                };
                                context.AddToArchivedAdvertiserSuccessfulPDTs(archivedadvertiserSuccessfulPDT);
                                //Archived Payment Due
                                var archivedpaymentdue = new AdDatabaseModel.ArchivedAdvertiserPayment
                                                             {
                                                                 AdvertiserID = currentpaymentdue.AdvertiserID,
                                                                 PaymentDueID = currentpaymentdue.PaymentDueID,
                                                                 AdID = currentpaymentdue.AdID,
                                                                 AdAmount = currentpaymentdue.AdAmount,
                                                                 Date = currentpaymentdue.Date,
                                                                 CurrencyCode = currentpaymentdue.CurrencyCode,
                                                                 PaymentDue = currentpaymentdue.PaymentDue
                                                             };
                                context.AddToArchivedAdvertiserPayments(archivedpaymentdue);
                                //Update PaymentDue
                                context.AdvertiserPaymentDues.DeleteObject(currentpaymentdue);


                                //Approve Ad
                                ApproveAd(AdID);
                            }
                            if (pdt.PaymentStatus == "Pending")
                            {
                                //Update PaymentDue
                                context.AdvertiserPaymentDues.DeleteObject(currentpaymentdue);

                                //PendingAdvertiser
                                var pendingpaymentdue = new AdDatabaseModel.PendingAdvertiserPayment
                                {
                                    AdvertiserID = currentpaymentdue.AdvertiserID,
                                    PaymentDueID = currentpaymentdue.PaymentDueID,
                                    AdID = currentpaymentdue.AdID,
                                    AdAmount = currentpaymentdue.AdAmount,
                                    Date = currentpaymentdue.Date,
                                    CurrencyCode = currentpaymentdue.CurrencyCode,
                                    PaymentDue = currentpaymentdue.PaymentDue
                                };
                                context.AddToPendingAdvertiserPayments(pendingpaymentdue);
                            }
                            context.AddToAdvertiserSuccessfulPDTs(advertiserSuccessfulPDT);
                            context.SaveChanges();
                        }
                        else
                        {
                            HiddenLabel.Text = Resources.Resource.AlreadyPaid;

                        }
                    }
                    catch (Exception e1)
                    {

                        string failuremessage = pdt.PayerFirstName + " " +
                        pdt.PayerLastName + "<br/>";
                        failuremessage += Resources.Resource.FailedTransaction + "<br/>";
                        failuremessage += Resources.Resource.FailurePDT;
                        HiddenLabel.Text = failuremessage;
                    }

                }

            }
            else
            {
                using (var context = new AdDatabaseModel.AdDatabaseEntities())
                {
                    try
                    {
                        string[] Custom = pdt.Custom.Split(',');
                        int AdID = (int.Parse(Custom[0]));
                        var result2 = from c in context.AdGenerals
                                      where c.AdID == AdID
                                      select c.UserID;
                        Guid userID = Guid.Parse(result2.FirstOrDefault().ToString());

                        //Insert into HackedPDT
                        var advertiserHackedPDT = new AdDatabaseModel.AdvertiserHackedPDT
                        {
                            PDTID = Admanagment.Helpers.Utility.GetNextSuccessfulPDTID(),
                            GrossTotal = pdt.GrossTotal,
                            Invoice = pdt.InvoiceNumber,
                            PaymentStatus = pdt.PaymentStatus,
                            FirstName = pdt.PayerFirstName,
                            LastName = pdt.PayerLastName,
                            PaymentFee = pdt.PaymentFee,
                            BusinessEmail = pdt.BusinessEmail,
                            TxToken = Request.QueryString.Get("tx"),
                            ReceiverEmail = pdt.ReceiverEmail,
                            ItemName = pdt.ItemName,
                            CurrencyCode = pdt.Currency,
                            TransactionId = pdt.TransactionId,
                            Custom = pdt.Custom,
                            SubscriberId = pdt.SubscriberId,

                            AdvertiserID = userID,
                            AdID = int.Parse(pdt.Custom)
                        };
                        context.AddToAdvertiserHackedPDTs(advertiserHackedPDT);
                        context.SaveChanges();

                        //Email Admin
                        EmailAdmin("HackedPDT", Admanagment.Helpers.Utility.GetNextSuccessfulPDTID());
                        string failuremessage = pdt.PayerFirstName + " " +
                                                pdt.PayerFirstName + "<br/>";
                        failuremessage += Resources.Resource.FailedTransaction + "<br/>";
                        failuremessage += Resources.Resource.FailurePDT;
                        HiddenLabel.Text = failuremessage;
                    }
                    catch (Exception e1)
                    {
                        EmailAdmin("HackedPDT", Admanagment.Helpers.Utility.GetNextSuccessfulPDTID());
                        string failuremessage = pdt.PayerFirstName + " " +
                        pdt.PayerFirstName + "<br/>";
                        failuremessage += Resources.Resource.FailedTransaction + "<br/>";
                        failuremessage += Resources.Resource.FailurePDT;
                        HiddenLabel.Text = failuremessage;
                    }
                }
            }
        }
    }

    private void EmailAdmin(string subject, int PDTID)
    {
        string strTo = "postmaster@haithem-araissia.com";
        MailMessage MailMsg = new MailMessage(new MailAddress("haithemaraissia@yahoo.com"), new MailAddress(strTo));
        MailMsg.BodyEncoding = Encoding.Default;
        MailMsg.Subject = subject;
        MailMsg.Body = "<br />"
                       + "Hacked PDTID " + PDTID.ToString(CultureInfo.InvariantCulture) + "<br />";
        MailMsg.Priority = MailPriority.High;
        MailMsg.IsBodyHtml = true;
        SmtpClient SmtpMail = new SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("postmaster@haithem-araissia.com", "haithem759163");
        SmtpMail.Host = "mail.haithem-araissia.com";
        SmtpMail.UseDefaultCredentials = false;
        SmtpMail.Credentials = basicAuthenticationInfo;
        SmtpMail.Send(MailMsg);
    }


    protected void ApproveAd(int AdID)
    {
        var context = new AdDatabaseModel.AdDatabaseEntities();
        var approvedAd = (from ad in context.AdGenerals
                          where ad.AdID == AdID
                          select ad).FirstOrDefault();
        approvedAd.IsActive = true;
        context.SaveChanges();
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
            //String[] StringArray = postData.Split(' ');
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

}