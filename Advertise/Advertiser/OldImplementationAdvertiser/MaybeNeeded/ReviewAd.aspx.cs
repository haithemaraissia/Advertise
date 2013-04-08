using System;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Admanagment
{
    public partial class ReviewAd : System.Web.UI.Page
    {

        protected override void InitializeCulture()
        {
            string lang = Request.QueryString["l"];
            if (lang != null | !string.IsNullOrEmpty(lang))
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
                Session["LCID"] = Helpers.Utility.GetLCID(lang);
            }
            else
            {
                if (Session["LCID"] != null)
                {
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
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

        protected void ValidateIncomingPost()
        {
            if (Request.QueryString["P"] != "Temp")
            {
                Response.Redirect("../Account/Login.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ValidateIncomingPost();
                GetAdProperties();
            }
        }

        protected void AdRotator1AdCreated(object sender, AdCreatedEventArgs e)
        {
            e.NavigateUrl = "~/Advertiser/TempAdHandler.ashx?id=" + e.AdProperties["ID"];
        }

        protected void GetAdProperties()
        {
            int y = GetTempAdID();
            using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
            {
                var adList = (from ad in context2.TempAds
                              where ad.ID == y
                              select ad).ToList();
                NewCampaingTextBox.Text = Convert.ToString(adList[0].AdName);
                NewCampaingTextBox.ReadOnly = true;
                SiteDropDownList.SelectedIndex = Convert.ToInt32(adList[0].SiteID);
                SiteDropDownList.Enabled = false;
                SectionDropDownList.SelectedIndex = Convert.ToInt32(adList[0].SectionID);
                SectionDropDownList.Enabled = false;
                LanguageDropDownList.SelectedIndex = Convert.ToInt32(adList[0].LanguageID);
                LanguageDropDownList.Enabled = false;
                GenderDropDownList.SelectedIndex = Convert.ToInt32(adList[0].GenderID);
                GenderDropDownList.Enabled = false;
                AgeDropDownList.SelectedIndex = Convert.ToInt32(adList[0].AgeRangeID);
                AgeDropDownList.Enabled = false;
                CountryDropDownList.SelectedValue = Convert.ToInt32(adList[0].CountryID).ToString(CultureInfo.InvariantCulture);
                CountryDropDownList.Enabled = false;
                CountryDropDownList.DataBind();
                RegionsDropDownList.SelectedValue = Convert.ToInt32(adList[0].RegionID).ToString(CultureInfo.InvariantCulture);
                RegionsDropDownList.Enabled = false;
                RegionsDropDownList.DataBind();
                var id = adList[0].CityID;
                if (id != null)
                {
                    CitiesDropDownList.SelectedIndex = Convert.ToInt32(adList[0].CityID);
                }
                else
                {
                    CitiesDropDownList.SelectedIndex = -1;
                }
                CitiesDropDownList.Enabled = false;
                ZipcodeTextBox.Text = Convert.ToString(adList[0].Zipcode.ToString(CultureInfo.InvariantCulture));
                ZipcodeTextBox.ReadOnly = true;
                IndustryDropDownList.SelectedIndex = Convert.ToInt32(adList[0].IndustryID);
                IndustryDropDownList.Enabled = false;
                ProfessionTextBox.Text = Convert.ToString(adList[0].Profession.ToString(CultureInfo.InvariantCulture));
                ProfessionTextBox.ReadOnly = true;
                StartDateTextBox.Text = adList[0].StartDate.ToShortDateString();
                EndDateTextBox.Text = adList[0].EndDate.ToShortDateString();
            }
        }

        protected int GetTempAdID()
        {
            if (Request.QueryString["ID"] == null)
            {
                Response.Redirect("../Account/Login.aspx");
                return 0;
            }
            return int.Parse(Request.QueryString["ID"]);
        }

        protected void EditAdButtonClick(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("ChangeAd.aspx?ID={0}&P=Temp", GetTempAdID()));
        }

        protected void PlaceAdButtonClick(object sender, EventArgs e)
        {
        }
}
}