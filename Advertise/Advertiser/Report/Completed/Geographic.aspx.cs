using System.Globalization;
using System;
using System.Threading;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using Admanagment.Helpers;

namespace Advertiser.Report.Completed
{
    public partial class AdvertiserReportCompletedGeographic : Page
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
                }
            }
        }

        protected void ValidateAdvertiser()
        {
            var user = Membership.GetUser();
            if (user == null)
            {
                Response.Redirect("../../../Account/Login.aspx?ReturnUrl=../Advertiser/Report/Current/Geographic.aspx");
            }
        }

        protected void FilterButtonClick(object sender, EventArgs e)
        {
            var t = String.Format("{0:MM/dd/yyyy}",
                                  Convert.ToDateTime(HiddenToField.Value.ToString(CultureInfo.InvariantCulture)));
            var t2 = String.Format("{0:MM/dd/yyyy}",
                                   Convert.ToDateTime(HiddenFromField.Value.ToString(CultureInfo.InvariantCulture)));
            dsdetails.SelectCommand =
                "SELECT DISTINCT TOP (10000) VisitorGeo.AdId, AdGeneral.AdName, VisitorGeo.CountryName, VisitorGeo.Region, VisitorGeo.CityName, VisitorGeo.PostalCode, VisitorGeo.AreaCode,  VisitorGeo.MetroCode, " +
                "AdStats.EntryDate, AdGeneral.ImageUrl FROM  AdGeneral INNER JOIN VisitorGeo ON AdGeneral.AdId = VisitorGeo.AdId INNER JOIN AdStats ON AdGeneral.AdId = AdStats.AdId " +
                "WHERE (AdStats.EntryDate BETWEEN '" + t2 + "' AND '" + t + "') AND AdGeneral.UserID = '" + Utility.GetUserID() +
                "' AND AdGeneral.IsActive = 0 AND AdGeneral.Completed = 1 ORDER BY AdStats.EntryDate";
            gvdetails.DataBind();
        }

        protected void PDFButtonClick(object sender, ImageClickEventArgs e)
        {
            var t = string.Empty;
            var t2 = string.Empty;
            if ((!string.IsNullOrEmpty(HiddenToField.Value.ToString(CultureInfo.InvariantCulture))))
            {
                t = String.Format("{0:MM/dd/yyyy}",
                                  Convert.ToDateTime(HiddenToField.Value.ToString(CultureInfo.InvariantCulture)));
            }

            if ((!string.IsNullOrEmpty(HiddenFromField.Value.ToString(CultureInfo.InvariantCulture))))
            {
                t2 = String.Format("{0:MM/dd/yyyy}",
                                   Convert.ToDateTime(HiddenFromField.Value.ToString(CultureInfo.InvariantCulture)));
            }
            Response.Redirect("IFrame/GeographicDownload.aspx?t1=" + t + "&t2=" + t2);
        }

        protected void ViewAllAdImageButtonClick(object sender, ImageClickEventArgs e)
        {
            dsdetails.SelectCommand =
                "SELECT DISTINCT TOP (10000) VisitorGeo.AdId, AdGeneral.AdName, VisitorGeo.CountryName, VisitorGeo.Region,VisitorGeo.CityName, VisitorGeo.PostalCode, VisitorGeo.AreaCode,  VisitorGeo.MetroCode, AdStats.EntryDate, AdGeneral.ImageUrl " +
                "FROM  AdGeneral INNER JOIN VisitorGeo ON AdGeneral.AdId = VisitorGeo.AdId INNER JOIN AdStats ON AdGeneral.AdId = AdStats.AdId WHERE AdGeneral.UserID = '" +
                Utility.GetUserID() + "' AND AdGeneral.IsActive = 0 AND AdGeneral.Completed = 1 ORDER BY AdStats.EntryDate";
            gvdetails.DataBind();
            HiddenToField.Value = string.Empty;
            HiddenFromField.Value = string.Empty;
        }
    }
}