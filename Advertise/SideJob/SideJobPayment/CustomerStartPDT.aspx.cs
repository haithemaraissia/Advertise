using System;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Web.UI;
using Admanagment.Helpers;
using Resources;
using SidejobModel;

namespace SideJob.SideJobPayment
{
    public partial class SideJobPaymentCustomerStartPDT : Page
    {
        /// <summary>
        /// NEED TO TEST THIS.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ID"] == null || Request.QueryString["ID"] == "")
                {
                    Response.Redirect("../CustomerProfile.aspx");
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
                        var currentCustomer = GetCustomerAttributes();
                        HiddenLabel.Text =
                            string.Format(
                                "Thank you {0} {1} !. Our records indicate that you already had made the payment<br/><br/> {2} {3}",
                                currentCustomer.FirstName, currentCustomer.LastName, Resource.Sincerely + "<br/>", Resource.YourSideJobTeam + "<br/>");
                    }
                }
            }
        }

        protected void PayPalImageButtonClick(object sender, ImageClickEventArgs e)
        {
            const string serverURL = "https://www.sandbox.paypal.com/cgi-bin/webscr";
            const string returnURL =
                "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Authenticated/Customer/Paypal/PDTSuccess.aspx";
            const string cancelreturnURL =
                "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Authenticated/Customer/Paypal/CancelPayment.aspx";
            const string notifyURL =
                "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Authenticated/Customer/Paypal/Handler.aspx";
            const string cmd = "_xclick";
            const string business = "admin_1329938514_biz@yahoo.com";
            var custom = GetProjectID() + "," + GetCustomerID() + "," + GetPaymentID();
            var customerID = GetCustomerID();
            var redirect = "";
            redirect += serverURL;
            redirect += "?cmd=" + cmd;
            redirect += "&business=" + business;
            redirect += "&item_name=" + GetProjectTitle(GetProjectID());
            redirect += "&item_number=" + GetProjectID();
            redirect += "&amount=" + Amount.Text.ToString(CultureInfo.InvariantCulture);
            redirect += "&currency_code=" + CurrencyDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture);
            redirect += "&payer_id=" + customerID.ToString(CultureInfo.InvariantCulture);
            redirect += "&receiver_email=" + "admin_1329938514_biz@yahoo.com";
            redirect += "&custom=" + custom;
            redirect += "&notify_url" + notifyURL;
            redirect += "&return=" + returnURL;
            redirect += "&cancel_return" + cancelreturnURL;
            Response.Redirect(redirect);
        }

        protected void InitAmount()
        {
            //USAmount from database on US Dollar
            var usAmount = GetPaymentDue();
            var currencyService = new CurrencyWebService();
            var toUSRate = currencyService.Convert(1.000m, CurrencyDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture), "USD");

            //Amount from the Database in US
            //IF Not paid in US  
            var percentage = GetSideJobPercentage(usAmount);
            usAmount = usAmount + (usAmount*percentage);
            Amount.Text = (Math.Round(usAmount, 2)).ToString(CultureInfo.InvariantCulture);

        }

        protected void CurrencySelectedIndexChanged(object sender, EventArgs e)
        {
            double percentage = 0;

            //USAmount from database on US Dollar
            var usAmount = GetPaymentDue();
            var currencyService = new CurrencyWebService();
            decimal toUSRate = currencyService.Convert(1.000m, CurrencyDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture), "USD");

            //Amount from the Database in US
            //IF Not paid in US  
            percentage = GetSideJobPercentage(usAmount);
            if (CurrencyDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture) != "USD")
            {
                var internationalFixedFee = (double) ((decimal) usAmount*toUSRate);
                usAmount = usAmount + (usAmount*percentage) + internationalFixedFee;
            }
            else
            {
                usAmount = usAmount + (usAmount*percentage);
            }
            Amount.Text = (Math.Round(usAmount, 2)).ToString(CultureInfo.InvariantCulture);
        }        
      
        private void EmailAdmin(string subject, string message, string emailAddress)
        {
            MailMessage mailObj = new MailMessage();
            mailObj.From = new MailAddress("yoursidjob@yahoo.com");
            mailObj.Subject = subject;
            mailObj.Body = message;
            mailObj.To.Add(new MailAddress(emailAddress));
            mailObj.IsBodyHtml = true;
            SmtpClient SmtpMail = new SmtpClient();
            System.Net.NetworkCredential basicAuthenticationInfo =
                new System.Net.NetworkCredential("postmaster@programmingfundamental.com", "haithem759163");
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

        public static double CurrencyCharge(string chosen)
        {
            double charge = 0;
            var selectedCurrency = (CurrencyCode) Enum.Parse(typeof (CurrencyCode), chosen);
            switch (selectedCurrency)
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

        public double GetSideJobPercentage(double usAmount)
        {
            double sideJobPercentage = 0;
            //SideJob Percentage: Domestic
            if ((usAmount > 0) && (usAmount <= 100.00))
            {
                sideJobPercentage = 0.20;
            }
            if ((usAmount > 100.01) && (usAmount <= 1000.00))
            {
                sideJobPercentage = 0.17;
            }
            if ((usAmount > 1000.01) && (usAmount <= 10000.00))
            {
                sideJobPercentage = 0.12;
            }
            if ((usAmount > 10000.01) && (usAmount <= 100000.00))
            {
                sideJobPercentage = 0.8;
            }
            if (usAmount > 100000.01)
            {
                sideJobPercentage = 0.3;
            }
            //SideJob Percentage: International
            if (CurrencyDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture) != "USD")
            {
                sideJobPercentage += 0.02;
            }
            return sideJobPercentage;
        }

        public string GetCustomerID()
        {
            var currentCustomer = GetCustomerAttributes();
            return currentCustomer.CustomerID.ToString(CultureInfo.InvariantCulture);
        }

        public int GetProjectID()
        {
            return int.Parse(Request.QueryString["ID"]);
        }

        protected int GetPaymentID()
        {
            return int.Parse(Request.QueryString["PID"]);
        }

        public CustomerGeneral GetCustomerAttributes()
        {
            using (var context = new SidejobEntities())
            {
                return (from c in context.CustomerGenerals
                        join cus in context.Customers
                            on c.CustomerID equals cus.CustomerID
                        where cus.UserID == Utility.GetUserID()
                        select c).FirstOrDefault();
            }
        }

        public string GetProjectTitle(int projectId)
        {
            using (var context = new SidejobEntities())
            {
                return (from p in context.ProjectRequirements
                        where p.ProjectID == projectId
                        select p.ProjectTitle.FirstOrDefault()).ToString();
            }
        }

        protected double GetPaymentDue()
        {
            using (var context = new SidejobEntities())
            {
                int customerId = int.Parse(GetCustomerID());
                var payment = (from p in context.CustomerPaymentDues
                               where p.PaymentDueID == GetPaymentID() && p.CustomerID == customerId && p.ProjectID == GetProjectID()
                               select p).FirstOrDefault();
                return payment.PaymentDue;  
            }     
        }

        protected bool CheckPreviousPayment()
        {
            using (var context = new SidejobEntities())
            {
                int customerId = int.Parse(GetCustomerID());
                var archivedpaymentid = (from p in context.ArchivedCustomerPayments
                               where p.PaymentDueID == GetPaymentID() && p.CustomerID == customerId && p.ProjectID == GetProjectID()
                               select p).FirstOrDefault();
                return archivedpaymentid == null;
            }     
        }

        ////////////////SUre//////////////////////////////
















        



        /// <summary>
        /// ////////////////////////////////////////////////////////////////////////////////////
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        //From AD



        //protected void PayPalImageButtonClick(object sender, ImageClickEventArgs e)
        //{
        //    AdGeneral adgeneral;
        //    const string serverURL = "https://www.sandbox.paypal.com/cgi-bin/webscr";
        //    const string returnURL =
        //        "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Compaign/Payment/Paypal/PDT/PDTSuccess.aspx";
        //    const string cancelreturnURL =
        //        "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Compaign/Payment/Paypal/PDT/CancelPayment.aspx";
        //    const string notifyURL = "http://haithem-araissia.com/AdvertisePaypal/IPN/IPNHandler.aspx";
        //    const string cmd = "_xclick";
        //    const string business = "sellpr_1346179874_biz@yahoo.com";
        //    int paymentID = GetPaymentID();
        //    var context = new AdDatabaseModel.AdDatabaseEntities();
        //    var payment = (from payments in context.AdvertiserPaymentDues
        //                   where payments.PaymentDueID == paymentID
        //                   select payments).FirstOrDefault();
        //    Guid advertiserID = Guid.Parse(payment.AdvertiserID.ToString());
        //    int AdID = int.Parse(payment.AdID.ToString());

        //    //if (SavedAd())
        //    //{
        //    //     adgeneral = (from ad in context.AdGenerals
        //    //                 where ad.ID == AdID && ad.UserID == advertiserID
        //    //                 select ad).FirstOrDefault();
        //    //}
        //    //else
        //    //{
        //    //    adgeneral = (from ad in context.AdGenerals
        //    //                     where ad.AdID == AdID && ad.UserID == advertiserID
        //    //                     select ad).FirstOrDefault();
        //    //}

        //    adgeneral = (from ad in context.AdGenerals
        //                 where ad.AdID == AdID && ad.UserID == advertiserID
        //                 select ad).FirstOrDefault();
        //    string itemName = adgeneral.AdName;
        //    string adID = payment.AdID.ToString(CultureInfo.InvariantCulture);
        //    string custom = adID + "," + adgeneral.UserID + "," + paymentID;
        //    string redirect = "";
        //    redirect += serverURL;
        //    redirect += "?cmd=" + cmd;
        //    redirect += "&business=" + business;
        //    redirect += "&item_name=" + itemName;
        //    redirect += "&item_number=" + payment.PaymentDueID;
        //    redirect += "&amount=" + Amount.Text.ToString(CultureInfo.InvariantCulture);
        //    redirect += "&currency_code=" + "USD";
        //    redirect += "&payer_id=" + adgeneral.UserID;
        //    redirect += "&receiver_email=" + Profile.Email;
        //    redirect += "&custom=" + custom;
        //    redirect += "&notify_url" + notifyURL;
        //    redirect += "&return=" + returnURL;
        //    redirect += "&cancel_return" + cancelreturnURL;
        //    Response.Redirect(redirect);
        //}


















        ////////////////SUre////////////////////////////

















        //Need to see if you need in any other function
        /// protected bool PaymentMade(string CustomerID, string ProjectID)
        //{
        //    bool result = false;
        //    //// Checking if Payment for this project were already submitted by Customer ////
        //    CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter CustomerCheckAdapter =
        //        new CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter();
        //    CustomerPDTDataSet.CustomerSuccessfulPDTDataTable CustomerCheckTable =
        //        new CustomerPDTDataSet.CustomerSuccessfulPDTDataTable();
        //    CustomerCheckAdapter.FillCheck(CustomerCheckTable, Convert.ToInt32(CustomerID.ToString()),
        //                                   Convert.ToInt32(ProjectID.ToString()));

        //    //There can be only 1 row or 0 row
        //    if (CustomerCheckTable.Rows.Count == 1)
        //    {
        //        if (
        //            (string.Equals(CustomerCheckTable.Rows[0]["CurrencyCode"].ToString(),
        //                           CurrencyDropDownList.SelectedValue.ToString())) &&
        //            (string.Equals(CustomerCheckTable.Rows[0]["GrossTotal"].ToString(), Amount.Text.ToString())))
        //        {
        //            string sucessmessage = CustomerCheckTable.Rows[0]["FirstName"].ToString() +
        //                                   CustomerCheckTable.Rows[0]["LastName"].ToString() + ",<br/>";
        //            sucessmessage += Resource.ThankPayment + "<br/>";
        //            sucessmessage += Resource.PaymentOf + CustomerCheckTable.Rows[0]["CurrencyCode"].ToString() +
        //                             CustomerCheckTable.Rows[0]["GrossTotal"].ToString() + Resource.PaymentProcessed +
        //                             "<br/><br/>";
        //            sucessmessage += Resource.Sincerely + "<br/>";
        //            sucessmessage += Resource.YourSideJobTeam + "<br/>";
        //            HiddenLabel.Text = sucessmessage;
        //            result = true;
        //        }
        //        else
        //        {
        //            string failuremessage = CustomerCheckTable.Rows[0]["FirstName"].ToString() +
        //                                    CustomerCheckTable.Rows[0]["LastName"].ToString() + ",<br/>";
        //            failuremessage += Resource.FailedTransaction + "<br/>";
        //            failuremessage += Resource.FailurePDT;
        //            HiddenLabel.Text = failuremessage;
        //            result = false;
        //        }
        //    }
        //    else if (CustomerCheckTable.Rows.Count > 1)
        //    {
        //        EmailAdmin(String.Format("Multiple Payment from Customer {0} for Projet {1}", CustomerID.ToString(),
        //                                 ProjectID.ToString()), "Check CustomerSuccessfulPDT Table",
        //                   "yoursidjob@yahoo.com");
        //        result = true;
        //    }
        //    return result;
        //}

        //        public void GetValue(out CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable)
        //        {
        //            CustomerPDTDataSetTableAdapters.CustomerPaymentDueTableAdapter CustomerPaymentDue =
        //                new CustomerPDTDataSetTableAdapters.CustomerPaymentDueTableAdapter();
        //            CustomerPaymentDueTable = new CustomerPDTDataSet.CustomerPaymentDueDataTable();
        //            CustomerPaymentDue.FillCustomerPaymentDue(CustomerPaymentDueTable, Convert.ToInt32(Session["CustomerId"].ToString()),
        //                                                      Convert.ToInt32(Request.QueryString["ID"].ToString()));



        /////SELECT        CustomerPaymentDue.ProjectAmount, CustomerPaymentDue.CurrencyCode, CustomerPaymentDue.PaymentDue, CustomerPaymentDue.PaymentDueID, 
        /////                       ProjectRequirements.ProjectTitle
        // ///FROM            CustomerPaymentDue INNER JOIN
        /////                ProjectRequirements ON CustomerPaymentDue.ProjectID = ProjectRequirements.ProjectID
        /////WHERE        (CustomerPaymentDue.CustomerID = @CustomerID) AND (CustomerPaymentDue.ProjectID = @ProjectID)
        //        }
    }
}