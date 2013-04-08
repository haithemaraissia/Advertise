using System.Globalization;
using System;
using System.Linq;
using System.Threading;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using Admanagment.Helpers;
using Resources;

namespace Admanagment.Advertiser
{
    public partial class Executive : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            string lang = Request.QueryString["l"];
            if (lang != null | !string.IsNullOrEmpty(lang))
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
                Session["LCID"] = Utility.GetLCID(lang);
            }
            else
            {
                if (Session["LCID"] != null)
                {
                    Thread.CurrentThread.CurrentUICulture =
                        new CultureInfo(Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                    Thread.CurrentThread.CurrentCulture =
                        CultureInfo.CreateSpecificCulture(Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                }
            }
        }

        protected void SEOSiteMap()
        {
            Page.Title = Resource.HomeTitle;

            var nl1 = new System.Web.UI.WebControls.Literal { Text = Environment.NewLine };
            var title = new HtmlMeta { Name = "title", Content = Resource.HomeTitle };
            Page.Header.Controls.AddAt(1, title);

            var description = new HtmlMeta { Name = "description", Content = Resource.HomeDescription };
            Page.Header.Controls.AddAt(2, description);

            var keywords = new HtmlMeta { Name = "keywords", Content = Resource.HomeKeywords };
            Page.Header.Controls.AddAt(3, keywords);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidateAdvertiser();
            SEOSiteMap();
            if (Session["LCID"] == null)
            {
                Session["LCID"] = 1;
            }
            if (!Page.IsPostBack)
            {
                var user = Utility.GetUserID();
                if (user != null)
                {
                    var userID = (Guid)user;
                    dsdetails.SelectParameters[0].DefaultValue = userID.ToString();
                    dsdetails.DataBind();
                    CurrentMonthLabel.Text = GetMonthName(DateTime.Today) + Resource._ + DateTime.Today.Year.ToString(CultureInfo.InvariantCulture);
                    FilterButtonClick();
                }
            }
        }

        protected void ValidateAdvertiser()
        {
            var user = Membership.GetUser();
            if (user == null)
            {
                Response.Redirect("../../../Account/Login.aspx?ReturnUrl=../Advertiser/Report/Current/Executive.aspx");
            }
        }

        protected void FilterButtonClick()
        {
            var t = String.Format("{0:MM/dd/yyyy}", FirstDayOfMonthFromDateTime(DateTime.Now.Date));
            var t2 = String.Format("{0:MM/dd/yyyy}", LastDayOfMonthFromDateTime(DateTime.Now.Date));
            dsdetails.SelectCommand =
                          "SELECT AdGeneral.AdID, AdGeneral.ImageUrl, AdGeneral.Impressions, AdGeneral.StartDate, AdGeneral.EndDate, AdGeneral.IsActive, AdGeneral.AdName,  AdTotalStats.TotalImpression, AdTotalStats.TotalClick FROM AdGeneral " +
                          "INNER JOIN AdTotalStats ON AdGeneral.adID = AdTotalStats.adID WHERE (DATEDIFF(dd, '" +
                          t + "', AdGeneral.StartDate) >= 0 ) AND (DATEDIFF(dd, '"
                          + t2 + "', AdGeneral.EndDate) <= 0) AND AdGeneral.UserID = '" + Utility.GetUserID() + "'  AND AdGeneral.IsActive = 0 AND AdGeneral.Completed = 1";
            gvdetails.DataBind();
            Sum(Convert.ToDateTime(t), Convert.ToDateTime(t2));
        }

        protected void PDFButtonClick(object sender, ImageClickEventArgs e)
        {
            var t = String.Format("{0:MM/dd/yyyy}", FirstDayOfMonthFromDateTime(DateTime.Now.Date));
            var t2 = String.Format("{0:MM/dd/yyyy}", LastDayOfMonthFromDateTime(DateTime.Now.Date));

            Response.Redirect("IFrame/ExecutiveDownload.aspx?t1=" + t + "&t2=" + t2 + "&ah=" + AverageHit.Text + "&ac=" + AverageClick.Text + "&th=" + TotalHits.Text +
                          "&tc=" + TotalClicks.Text);
        }

        protected void Sum(DateTime? t1, DateTime? t2)
        {
            using (var context = new AdDatabaseModel.AdDatabaseEntities())
            {
                Guid id = Utility.GetGuidUserID();
                var totalHit = 0;
                var totalClick = 0;
                var y = (from g in context.AdGenerals
                         join s in context.AdTotalStats
                             on g.AdID equals s.AdId
                         where g.UserID == id && (bool)g.Completed && (!g.IsActive)
                         select new ExecutiveReport
                         {
                             ID = g.AdID,
                             ImageUrl = g.ImageUrl,
                             StartDate = g.StartDate,
                             EndDate = g.EndDate,
                             IsActive = g.IsActive,
                             TotalImpression = (int)s.TotalImpression,
                             TotalClick = (int)s.TotalClick,
                             AdName = g.AdName
                         }).ToList();

                if (!(t1 == null || t2 == null))
                {
                    y = (from g in context.AdGenerals
                         join s in context.AdTotalStats
                             on g.AdID equals s.AdId
                         where g.StartDate >= t1 && g.EndDate <= t2 && g.UserID == id && (bool)g.Completed && (!g.IsActive)
                         select new ExecutiveReport
                         {
                             ID = g.AdID,
                             ImageUrl = g.ImageUrl,
                             StartDate = g.StartDate,
                             EndDate = g.EndDate,
                             IsActive = g.IsActive,
                             TotalImpression = (int)s.TotalImpression,
                             TotalClick = (int)s.TotalClick,
                             AdName = g.AdName
                         }).ToList();
                }

                foreach (var x in y)
                {
                    totalHit += x.TotalImpression;
                    totalClick += x.TotalClick;
                }
                TotalHits.Text = totalHit.ToString(CultureInfo.InvariantCulture);
                TotalClicks.Text = totalClick.ToString(CultureInfo.InvariantCulture);

                if (y.Count == 0)
                {
                    AverageHit.Text = Resource.Zero;
                    AverageClick.Text = Resource.Zero;
                }
                else
                {
                    //Retrieve Minimum Date
                    var minDate = (from d in y select d.StartDate).Min();

                    //Retrieve Maximum Date
                    var maxDate = (from d in y select d.EndDate).Max();

                    var numberofDays = (maxDate - minDate).TotalDays;
                    AverageHit.Text = Math.Round((totalHit / numberofDays), 2).ToString(CultureInfo.InvariantCulture);
                    AverageClick.Text = Math.Round((totalClick / numberofDays), 2).ToString(CultureInfo.InvariantCulture);
                }
            }
        }

        public DateTime FirstDayOfMonthFromDateTime(DateTime dateTime)
        {
            return new DateTime(dateTime.Year, dateTime.Month, 1);
        }

        public DateTime LastDayOfMonthFromDateTime(DateTime dateTime)
        {
            var firstDayOfTheMonth = new DateTime(dateTime.Year, dateTime.Month, 1);
            return firstDayOfTheMonth.AddMonths(1).AddDays(-1);
        }

        public static string GetMonthName(DateTime givenDate)
        {
            var formatInfoinfo = new DateTimeFormatInfo();
            string[] monthName = formatInfoinfo.MonthNames;
            return monthName[givenDate.Month - 1];
        }
    }

    public class ExecutiveReport
    {
        public int ID { get; set; }
        public string ImageUrl { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public bool IsActive { get; set; }
        public int TotalImpression { get; set; }
        public int TotalClick { get; set; }
        public string AdName { get; set; }
    }
}