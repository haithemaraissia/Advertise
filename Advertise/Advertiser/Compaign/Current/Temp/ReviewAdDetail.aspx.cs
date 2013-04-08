using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Advertiser_ReviewAdDetail : System.Web.UI.Page
{
    protected override void InitializeCulture()
    {
        string lang = Request.QueryString["l"];
        if (lang != null | !string.IsNullOrEmpty(lang))
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
            Session["LCID"] = Admanagment.Helpers.Utility.GetLCID(lang);
        }
        else
        {
            if (Session["LCID"] != null)
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(Admanagment.Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Admanagment.Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
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
        if (Request.QueryString["P"] != "C")
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

    private void BannerKeywords()
    {
        var adListKeywordAdapter = new AdDatabaseDataSetTableAdapters.AdListTableAdapter();
        var adListKeyworDataTable = new AdDatabaseDataSet.AdListDataTable();
        adListKeywordAdapter.FillByKeyword(adListKeyworDataTable, "Test");

        if (adListKeyworDataTable.Rows.Count == 0)
        {
            BannerRotator1.KeywordFilter = "Home";
        }
    }

    protected void AdRotator1AdCreated(object sender, AdCreatedEventArgs e)
    {
        e.NavigateUrl = "~/Advertiser/AdHandler.ashx?id=" + e.AdProperties["ID"];
    }

    protected void GetAdProperties()
    {
        int y = GetAdID();
        using (var context1= new AdDatabaseModel.AdDatabaseEntities())
        {

            var adgeneral = (from ad in context1.AdGenerals
                             where ad.ID == y
                             select ad).ToList();

            int x = adgeneral[0].AdID;

            var adaudience = (from ad in context1.AdAudiences
                              where ad.AdID == x
                              select ad).ToList();

            NewCampaingTextBox.Text = Convert.ToString(adgeneral[0].AdName);
            SiteDropDownList.SelectedIndex = Convert.ToInt32(adgeneral[0].SiteID);
            SectionDropDownList.SelectedIndex = Convert.ToInt32(adgeneral[0].SectionID);
            LanguageDropDownList.SelectedIndex = Convert.ToInt32(adaudience[0].LanguageID);
            GenderDropDownList.SelectedIndex = Convert.ToInt32(adaudience[0].GenderID);
            AgeDropDownList.SelectedIndex = Convert.ToInt32(adaudience[0].AgeRangeID);
            CountryDropDownList.SelectedValue = Convert.ToInt32(adaudience[0].CountryID).ToString(CultureInfo.InvariantCulture);
            CountryDropDownList.DataBind();
            RegionsDropDownList.SelectedValue = Convert.ToInt32(adaudience[0].RegionID).ToString(CultureInfo.InvariantCulture);

            var id = adaudience[0].CityID;
            if (id != null)
            {
                CitiesDropDownList.SelectedIndex = Convert.ToInt32(adaudience[0].CityID);

            }
            else
            {
                CitiesDropDownList.SelectedIndex = -1;
            }
            ZipcodeTextBox.Text = Convert.ToString(adaudience[0].Zipcode.ToString(CultureInfo.InvariantCulture));
            IndustryDropDownList.SelectedIndex = Convert.ToInt32(adaudience[0].IndustryID);
            ProfessionTextBox.Text = Convert.ToString(adaudience[0].Profession.ToString(CultureInfo.InvariantCulture));
            ProfessionTextBox.ReadOnly = true;
            StartDateTextBox.Text = adgeneral[0].StartDate.ToShortDateString();
            EndDateTextBox.Text = adgeneral[0].EndDate.ToShortDateString();

            NewCampaingTextBox.ReadOnly = true;
            SiteDropDownList.Enabled = false;
            SectionDropDownList.Enabled = false;
            LanguageDropDownList.Enabled = false;
            GenderDropDownList.Enabled = false;
            AgeDropDownList.Enabled = false;
            CountryDropDownList.Enabled = false;
            RegionsDropDownList.Enabled = false;
            CitiesDropDownList.Enabled = false;
            ZipcodeTextBox.ReadOnly = true;
            IndustryDropDownList.Enabled = false;
        }
    }

    protected int GetAdID()
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
        Response.Redirect(string.Format("ChangeAdDetail.aspx?ID={0}&P=C", GetAdID()));
    }
}