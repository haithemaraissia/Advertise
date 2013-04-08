using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdDatabaseModel;
using SidejobModel;

public partial class SideJob_SideJobPayment_CustomerIPN_Handler : System.Web.UI.Page
{
    ////////////////////////////////////Resrouces////////////////////////////////////
    //https://developer.paypal.com/us/cgi-bin/devscr
    ///
    // See following url for more IPN code samples
    // https://cms.paypal.com/us/cgi-bin/?&cmd=_render-content&content_ID=developer/library_code_ipn_code_samples
    //Process Logic//
    //IF Process is verified and complete
    //ProcessIPN
    //IF Transaction is Successful
    //Email Payer
    //Email Admin
    //Start Time Up Procedure
    //IF Transaction is FAILED OR DENIED
    //Email Admin
    //IF Process FAIl or DENIED
    //Email Payer
    ////////////////////////////////////Resrouces////////////////////////////////////

    protected void Page_Load(object sender, EventArgs e)
    {
        string postUrl = ConfigurationManager.AppSettings["PayPalSubmitUrl"];
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(postUrl);

        //Set values for the request back
        req.Method = "POST";
        req.ContentType = "application/x-www-form-urlencoded";
        byte[] param = Request.BinaryRead(HttpContext.Current.Request.ContentLength);
        string strRequest = Encoding.ASCII.GetString(param);
        string ipnPost = strRequest;
        strRequest += "&cmd=_notify-validate";
        req.ContentLength = strRequest.Length;

        //for proxy
        //WebProxy proxy = new WebProxy(new Uri("http://url:port#"));
        //req.Proxy = proxy;

        //Send the request to PayPal and get the response
        StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
        streamOut.Write(strRequest);
        streamOut.Close();

        StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream());
        string strResponse = streamIn.ReadToEnd();
        streamIn.Close();
        //string strResponse = "VERIFIED";


        // logging ipn messages... be sure that you give write permission to process executing this code
        string logPathDir = ResolveUrl("Messages");
        string logPath = string.Format("{0}\\{1}.txt", Server.MapPath(logPathDir), DateTime.Now.Ticks);
        File.WriteAllText(logPath, ipnPost);
        //string test =
        //    "mc_gross=150.00&protection_eligibility=Ineligible&address_status=confirmed&payer_id=WJ3SRWX9PXP94&tax=0.00&address_street=1+Main+St&payment_date=12%3A42%3A55+Aug+31%2C+2012+PDT&payment_status=Completed&charset=windows-1252&address_zip=95131&first_name=sdgsd&mc_fee=4.65&address_country_code=US&address_name=sdgsd+sdgs&notify_version=3.6&custom=50,100&payer_status=verified&business=sellpr_1346179874_biz%40yahoo.com&address_country=United+States&address_city=San+Jose&quantity=1&verify_sign=An5ns1Kso7MWUdW4ErQKJJJ4qi4-AXUlABcSxNL1sI7WDvNCAh9SVlxC&payer_email=adver_1345188328_per%40yahoo.com&txn_id=88B19331YR741773E&payment_type=instant&last_name=sdgs&address_state=CA&receiver_email=sellpr_1346179874_biz%40yahoo.com&payment_fee=4.65&receiver_id=EVBLGJGBR8RL8&pending_reason=paymentreview&txn_type=web_accept&item_name=AdName&mc_currency=USD&item_number=120&residence_country=US&test_ipn=1&handling_amount=0.00&transaction_subject=100&payment_gross=150.00&shipping=0.00&ipn_track_id=c5efe665d8f7";


        // IPNHolder ipn = IPNHolder.Parse(test);
        IPNHolder ipn = IPNHolder.Parse(ipnPost);


        ////check the payment_status is Completed////
        ////check that txn_id has not been previously processed////
        ////check that receiver_email is your Primary PayPal email////
        ////check that payment_amount/payment_currency are correct////
        ////process payment////
        ////ASP.NET will send back a 200 automatically if your page executes successfully.////

        string customerIDString = GetCustomerID(ipn).ToString(CultureInfo.InvariantCulture);
        switch (strResponse)
        {
            case "VERIFIED":
                switch (ipn._paymentStatus)
                {
                    case "Completed":
                        if (ipn._receiverEmail == "admin_1329938514_biz@yahoo.com")
                        {
                            ////Sucess////
                            ProcessIpn(ipn, customerIDString);
                        }
                        else
                        {
                            try
                            {
                                UpdatePaymentStatus(ipn, GetCustomerID(ipn));
                                EmailAdmin("PayPal: Unknown order...please check your paypal account", ipn);
                            }
                            catch (Exception)
                            {
                                EmailAdmin("PayPal: Error Error order...please check your paypal account", ipn);

                            }

                        }
                        break;
                    case "Failed":
                        try
                        {
                            UpdatePaymentStatus(ipn, GetCustomerID(ipn));
                            EmailBuyer(Resources.Resource.PaypalFailedHeader, "Failed", ipn._payerEmail, ipn);
                            EmailAdmin("PayPal: Failed Payment", ipn);
                        }
                        catch (Exception)
                        {

                            EmailAdmin("PayPal: Error Error order...please check your paypal account", ipn);
                        }

                        break;
                    case "Denied":
                        try
                        {
                            UpdatePaymentStatus(ipn, GetCustomerID(ipn));
                            EmailBuyer(Resources.Resource.PaypalFailedHeader, "Denied", ipn._payerEmail, ipn);
                            EmailAdmin("PayPal: Denied Payment", ipn);

                        }
                        catch (Exception)
                        {

                            EmailAdmin("PayPal: Error Error order...please check your paypal account", ipn);
                        }

                        break;
                    default:
                        try
                        {
                            UpdatePaymentStatus(ipn, GetCustomerID(ipn));
                        }
                        catch (Exception)
                        {
                            EmailAdmin("PayPal: Error Error order...please check your paypal account", ipn);
                            throw;
                        }
                        break;

                }
                break;
            case "INVALID":
                EmailAdmin("PayPal: Invalid order, please review and investigate", ipn);
                break;
            default:
                EmailAdmin("PayPal: ERROR, response is " + this.Response, ipn);
                break;
        }
    }

    //From ProcessIpn to GetNextSuccessfulIPNID
    private void ProcessIpn(IPNHolder ipn, string advertiserID)
    {
        //   1  //check that receiver_email is your Primary PayPal email
        //   2  //check the payment_status is Completed
        //   3  //check that payment_amount/payment_currency are correct
        //   4  //check that txn_id has not been previously processed
        //   5  //process payment

        //   4  //check that txn_id has not been previously processed IPN
        using (var context = new SidejobEntities())
        {
            try
            {
                var result = from c in context.CustomerSuccesfulIPNs
                             where c.TransactionId == ipn._txnID
                             select c.TransactionId;

                var resultQuery = result.FirstOrDefault();
                if (resultQuery == null)
                {
                    //TransactionID doesn't Exist In IPN
                    //Custom for the Ad 
                    //Passing multiple variables into custom.

                    var Custom = ipn._custom.Split(',');
                    //var custom = GetProjectID() + "," + GetCustomerID() + "," + GetPaymentID();
                    int ProjectId = int.Parse(Custom[0]);
                    int CustomerId = int.Parse(Custom[1]);
                    int PaymentId = int.Parse(Custom[2]);

                    float paymentGross = float.Parse(ipn._paymentGross);
                    float paymentFees = float.Parse(ipn._paymentFee);
                    float paymentDue = paymentGross - paymentFees;


                    //3//check that payment_amount are correct
                    var result2 = from c in context.CustomerPaymentDues
                                  where c.CustomerID == CustomerId && c.ProjectID == ProjectId && Math.Abs(c.PaymentDue - paymentGross) < 0.00001
                                  select c.ProjectID;
                    var resultQuery2 = result2.FirstOrDefault();
                    if (resultQuery2 != 0)
                    {
                        //   4 b //check that txn_id has not been previously processed ipn
                        var result3 = from c in context.CustomerSuccessfulPDTs
                                      where c.TransactionId == ipn._txnID && c.PaymentStatus == "Completed"
                                      select c.PDTID;
                        var resultQuery3 = result3.FirstOrDefault();
                        if (resultQuery3 == 0)
                        {
                            double paymentGross1 = double.Parse(ipn._paymentGross);
                            double paymentFees1 = double.Parse(ipn._paymentFee);

                            //Insert into customeripn
                            var customeripn = new CustomerSuccesfulIPN
                            {
                                IPNID = GetNextSuccessfulIPNID(),
                                GrossTotal = paymentGross1,
                                Invoice = ipn._invoice,
                                PayerStatus = ipn._paymentStatus,
                                FirstName = ipn._firstName,
                                LastName = ipn._lastName,
                                PaymentFee = paymentFees1,
                                BusinessEmail = ipn._business,
                                ReceiverEmail = ipn._receiverEmail,
                                ItemName = ipn._itemName,
                                CurrencyCode = ipn._countryCode,
                                TransactionId = ipn._txnID,
                                Custom = ipn._custom,
                                CustomerID = CustomerId,
                                ProjectID = ProjectId,
                                TxType = ipn._txnType,
                                PendingReason = ipn._pendingReason,
                                SubscriberId = "",
                                PaymentDate = DateTime.Now.Date,
                                Address = ipn._address,
                                City = ipn._city,
                                State = ipn._state,
                                Zip = ipn._zip,
                                Country = ipn._country,
                                CountryCode = ipn._countryCode,
                                AddressStatus = ipn._addressStatus,
                                PaymentStatus = ipn._payerStatus,
                                PayerID = ipn._payerID,
                                PaymentType = ipn._paymentType,
                                NotifyVersion = ipn._notifyVersion,
                                PayerPhone = ipn._payerPhone,
                                Tax = ipn._tax,
                                PayerBusinessName = ipn._payerBusinessName
                            };

                            context.CustomerSuccesfulIPNs.AddObject(customeripn);
                            context.SaveChanges();

                            CustomerPaymentDue currentpaymentdue = (from c in context.CustomerPaymentDues
                                                                    where c.PaymentDueID == PaymentId
                                                                    select c).FirstOrDefault();
                            //Archived Payment Due

                            var archivedpaymentdue = new ArchivedCustomerPayment
                            {
                                CustomerID = currentpaymentdue.CustomerID,
                                PaymentDueID = currentpaymentdue.PaymentDueID,
                                ProjectID = currentpaymentdue.ProjectID,
                                ProjectAmount = currentpaymentdue.ProjectAmount,
                                Date = currentpaymentdue.Date,
                                StatusID = currentpaymentdue.StatusID,
                                CurrencyCode = currentpaymentdue.CurrencyCode,
                                PaymentDue = currentpaymentdue.PaymentDue,
                                PhaseStatus = currentpaymentdue.PhaseStatus,
                                PaymentProcess = currentpaymentdue.PaymentProcess
                            };
                            context.AddToArchivedCustomerPayments(archivedpaymentdue);
                            //Update PaymentDue
                            context.CustomerPaymentDues.DeleteObject(currentpaymentdue);
                            context.SaveChanges();


                            //invoke timeup for customerpayment
                            //Approve Ad
                            //ApproveAd(AdID);


                            //Insert into HistoryTransaction
                            //Delete from PaymentDue
                            //EmailBuyer
                            EmailBuyer(Resources.Resource.PaypalSuccessfulHeader, "Success",
                                       ipn._payerEmail, ipn);
                            //EmailAdmin
                            EmailAdmin(("Successful Payment"), ipn);
                        }

                    }
                }


            }
            catch (Exception e)
            {

            }
        }
    }



    //invoke timeup for customerpayment
    //Approve Ad
    //ApproveAd(AdID);


    //protected void ApproveAd(int AdID)
    //{
    //    var context = new AdDatabase();
    //    var approvedAd = (from ad in context.AdGenerals
    //                      where ad.AdID == AdID
    //                      select ad).FirstOrDefault();
    //    approvedAd.IsActive = true;
    //    context.SaveChanges();
    //}

    protected void UpdatePaymentStatus(IPNHolder ipn, string advertiserID)
    {
        try
        {
            using (var context = new SidejobEntities())
            {

                var result = from c in context.CustomerSuccesfulIPNs
                             where c.TransactionId == ipn._txnID
                             select c.TransactionId;

                var resultQuery = result.FirstOrDefault();
                if (resultQuery == null)
                {
                    //TransactionID doesn't Exist In IPN
                    //Custom for the Ad 
                    //Passing multiple variables into custom.

                    //int adID2 = int.Parse(adtemp[0]);
                    //  int PaymentDue = int.Parse(adtemp[2]);
                    //Guid advertiserID2 = Guid.Parse(adtemp[1]);
                    //float paymentGross = float.Parse(ipn._paymentGross);
                    //float paymentFees = float.Parse(ipn._paymentFee);
                    //float paymentDue = paymentGross - paymentFees;
                    var Custom = ipn._custom.Split(',');
                    //var custom = GetProjectID() + "," + GetCustomerID() + "," + GetPaymentID();
                    int PaymentId = int.Parse(Custom[2]);
                    CustomerPaymentDue currentpaymentdue = (from c in context.CustomerPaymentDues
                                                            where c.PaymentDueID == PaymentId
                                                            select c).FirstOrDefault();
                    currentpaymentdue.Status = ipn._paymentStatus;
                    currentpaymentdue.PaymentProcess = true;
                    context.SaveChanges();

                }
            }
        }
        catch (Exception)
        {
            EmailAdmin("PayPal: Error Error order...please check your paypal account", ipn);
        }
    }

    public static int GetNextSuccessfulIPNID()
    {
        int ID;
        var context = new SidejobEntities();
        var max = context.CustomerSuccesfulIPNs.OrderByDescending(s => s.IPNID).FirstOrDefault();

        if (max == null)
        {
            ID = 0;
        }
        else
        {
            ID = max.IPNID + 1;
        }
        return ID;
    }

    private void EmailBuyer(string subject, string reason, string PayerEmail, IPNHolder ipn)
    {
        MailMessage mailObj = new MailMessage();
        mailObj.From = new MailAddress("yoursidjob@yahoo.com");
        mailObj.Subject = subject;
        switch (reason)
        {
            case "Failed":
                mailObj.Body = Resources.Resource.PaypalFailedMessage;
                break;
            case "Denied":
                mailObj.Body = Resources.Resource.PaypalDeniedMessage;
                break;
            case "Success":
                mailObj.Body = ipn._firstName + " " +
                                ipn._lastName + "<br/>"
                                + Resources.Resource.PaymentOf + " "
                                + ipn._currency + " " + ipn._paymentGross
                                + Resources.Resource.SucessfullyCompleted + "<br/>"
                                + Resources.Resource.ConfirmationNumber + " " + ipn._txnID + "<br/>"
                                + Resources.Resource.Sincerely + "<br/>"
                                + Resources.Resource.YourSideJobTeam + "<br/>";
                break;
        }
        mailObj.To.Add(new MailAddress(PayerEmail));
        mailObj.IsBodyHtml = true;
        SmtpClient SmtpMail = new SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("postmaster@programmingfundamental.com", "haithem759163");
        SmtpMail.Host = "mail.programmingfundamental.com";
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


    private void EmailAdmin(string subject, IPNHolder pdt)
    {
        string strTo = "postmaster@haithem-araissia.com";
        MailMessage MailMsg = new MailMessage(new MailAddress("haithemaraissia@yahoo.com"), new MailAddress(strTo));
        MailMsg.BodyEncoding = Encoding.Default;
        MailMsg.Subject = subject.ToString();
        MailMsg.Body = "<br />"
     + "_paymentGross " + pdt._paymentGross + "<br />"
     + "Invoice: " + pdt._invoice + "<br />"
     + "Payment Status: " + pdt._paymentStatus + "<br />"
     + "First Name: " + pdt._firstName + "<br />"
     + "Last Name: " + pdt._lastName + "<br />"
     + "Payment Fee: " + pdt._paymentFee + "<br />"
     + "Business " + pdt._business + "<br />"
     + "Receiver Email: " + pdt._receiverEmail + "<br />"
     + "Item Name: " + pdt._itemName + "<br />"
     + "Currency: " + pdt._currency + "<br />"
     + "TransactionID: " + pdt._txnID + "<br />"
     + "Custom: " + pdt._custom + "<br />"
     + "No Subscriber" + "No Subscriber" + "<br />"
     + "Custom: " + pdt._custom + "<br />"
     + "Transaction Type:" + pdt._txnType + "<br />"
     + "Pending Reason: " + pdt._pendingReason + "<br />"
     + "Date" + System.DateTime.UtcNow + "<br/>"
     + "City: " + pdt._city + "<br />"
     + "State: " + pdt._state + "<br />"
     + "City: " + pdt._city + "<br />"
     + "Zip: " + pdt._zip + "<br />"
     + "Country: " + pdt._country + "<br />"
     + "_addressStatus: " + pdt._addressStatus + "<br />"
     + "_payerStatus: " + pdt._payerStatus + "<br />"
     + "_payerID " + pdt._payerID + "<br />"
     + "_paymentType: " + pdt._paymentType + "<br />"
     + "_notifyVersion: " + pdt._notifyVersion + "<br />"
     + "_payerPhone: " + pdt._payerPhone + "<br />"
     + "_tax: " + pdt._tax + "<br />"
     + "_payerBusinessName: " + pdt._payerBusinessName + "<br />"
     + "--Role--: Customer <br />"
     + "CustomerID" + GetCustomerID(pdt) + "<br />";
        MailMsg.Priority = MailPriority.High;
        MailMsg.IsBodyHtml = true;
        SmtpClient SmtpMail = new SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("postmaster@haithem-araissia.com", "haithem759163");
        SmtpMail.Host = "mail.haithem-araissia.com";
        SmtpMail.UseDefaultCredentials = false;
        SmtpMail.Credentials = basicAuthenticationInfo;
        SmtpMail.Send(MailMsg);
    }

    public string GetCustomerID(IPNHolder ipn)
    {
        var Custom = ipn._custom.Split(',');
        //var custom = GetProjectID() + "," + GetCustomerID() + "," + GetPaymentID();
        int ProjectId = int.Parse(Custom[0]);
        int CustomerId = int.Parse(Custom[1]);
        int PaymentId = int.Parse(Custom[2]);

        return CustomerId.ToString(CultureInfo.InvariantCulture);
    }
    //////////////////////////////////SURE//////////////////////////////////
    /// 
    /// 

}