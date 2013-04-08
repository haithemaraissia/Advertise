using System.Globalization;
using System;
using System.Linq;
using System.Threading;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using Admanagment.Helpers;
using Resources;

namespace Advertiser.Report.Current
{
    public partial class Advertiser : Page
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
            Page.Title = Resources.Resource.HomeTitle;

            var nl1 = new System.Web.UI.WebControls.Literal { Text = Environment.NewLine };
            var title = new HtmlMeta { Name = "title", Content = Resources.Resource.HomeTitle };
            Page.Header.Controls.AddAt(1, title);

            var description = new HtmlMeta { Name = "description", Content = Resources.Resource.HomeDescription };
            Page.Header.Controls.AddAt(2, description);

            var keywords = new HtmlMeta { Name = "keywords", Content = Resources.Resource.HomeKeywords };
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
                    Sum(null, null);
                }
            }
        }

        protected void ValidateAdvertiser()
        {
            var user = Membership.GetUser();
            if (user == null)
            {
                Response.Redirect("../../../Account/Login.aspx?ReturnUrl=../Advertiser/Report/Current/Advertiser.aspx");
            }
        }

        protected void FilterButtonClick(object sender, EventArgs e)
        {
            var t = String.Format("{0:MM/dd/yyyy}", Convert.ToDateTime(HiddenToField.Value.ToString(CultureInfo.InvariantCulture)));
            var t2 = String.Format("{0:MM/dd/yyyy}", Convert.ToDateTime(HiddenFromField.Value.ToString(CultureInfo.InvariantCulture)));
            dsdetails.SelectCommand =
                          "SELECT AdGeneral.adID, AdGeneral.ImageUrl, AdGeneral.Impressions, AdGeneral.StartDate, AdGeneral.EndDate, AdGeneral.IsActive, AdGeneral.AdName,  AdTotalStats.TotalImpression, AdTotalStats.TotalClick FROM AdGeneral " +
                          "INNER JOIN AdTotalStats ON AdGeneral.adID = AdTotalStats.adID WHERE (DATEDIFF(dd, '" +
                          t2 + "', AdGeneral.StartDate) >= 0 ) AND (DATEDIFF(dd, '"
                          + t + "', AdGeneral.EndDate) <= 0) AND AdGeneral.UserID = '" + Utility.GetUserID() + "' And (AdGeneral.IsActive = 1)";
            gvdetails.DataBind();
            Sum(Convert.ToDateTime(t), Convert.ToDateTime(t2));
        }

        protected void PDFButtonClick(object sender, ImageClickEventArgs e)
        {
            var t = string.Empty;
            var t2 = string.Empty;
            if ((!string.IsNullOrEmpty(HiddenToField.Value.ToString(CultureInfo.InvariantCulture))))
            {
                t = String.Format("{0:MM/dd/yyyy}", Convert.ToDateTime(HiddenToField.Value.ToString(CultureInfo.InvariantCulture)));
            }

            if ((!string.IsNullOrEmpty(HiddenFromField.Value.ToString(CultureInfo.InvariantCulture))))
            {
                t2 = String.Format("{0:MM/dd/yyyy}", Convert.ToDateTime(HiddenFromField.Value.ToString(CultureInfo.InvariantCulture)));
            }
            Response.Redirect("IFrame/AdvertiserDownload.aspx?t1=" + t + "&t2=" + t2 + "&sd=" + StartDate.Text + "&ed=" +
                          EndDate.Text + "&ah=" + AverageHit.Text + "&ac=" + AverageClick.Text + "&th=" + TotalHits.Text +
                          "&tc=" + TotalClicks.Text);
        }

        protected void ViewAllAdImageButtonClick(object sender, ImageClickEventArgs e)
        {
            dsdetails.SelectCommand = "SELECT AdGeneral.AdId, AdGeneral.ImageUrl, AdGeneral.Impressions, AdGeneral.StartDate, AdGeneral.EndDate, AdGeneral.IsActive,AdGeneral.AdName, AdTotalStats.TotalImpression, AdTotalStats.TotalClick FROM AdGeneral " +
                   "INNER JOIN AdTotalStats ON AdGeneral.AdID = AdTotalStats.AdID AND AdGeneral.UserID = '" + Utility.GetUserID().ToString() + "' And (AdGeneral.IsActive = 1)";
            gvdetails.DataBind();
            HiddenToField.Value = string.Empty;
            HiddenFromField.Value = string.Empty;
            Sum(null, null);
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
                         where g.UserID == id && g.IsActive
                         select new AdvertiserReport
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
                         where g.StartDate >= t2 && g.EndDate <= t1 && g.UserID == id && g.IsActive
                         select new AdvertiserReport
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
                    StartDate.Text = String.Format("{0:MM/dd/yyyy}", t2);
                    EndDate.Text = String.Format("{0:MM/dd/yyyy}", t1);
                    AverageHit.Text = Resource.Zero;
                    AverageClick.Text = Resource.Zero;
                }
                else
                {
                    //Retrieve Minimum Date
                    var minDate = (from d in y select d.StartDate).Min();
                    StartDate.Text = minDate.ToShortDateString();

                    //Retrieve Maximum Date
                    var maxDate = (from d in y select d.EndDate).Max();
                    EndDate.Text = maxDate.ToShortDateString();

                    var numberofDays = (maxDate - minDate).TotalDays;
                    AverageHit.Text = Math.Round((totalHit / numberofDays), 2).ToString(CultureInfo.InvariantCulture);
                    AverageClick.Text = Math.Round((totalClick / numberofDays), 2).ToString(CultureInfo.InvariantCulture);
                }
            }
        }
    }
    public class AdvertiserReport
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