using System;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Advertiser_Compaign_Completed_ReviewAd : System.Web.UI.Page
{

    //protected override void InitializeCulture()
    //{
    //    string lang = Request.QueryString["l"];
    //    if (lang != null | !string.IsNullOrEmpty(lang))
    //    {
    //        Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
    //        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
    //        Session["LCID"] = Admanagment.Helpers.Utility.GetLCID(lang);
    //    }
    //    else
    //    {
    //        if (Session["LCID"] != null)
    //        {
    //            Thread.CurrentThread.CurrentUICulture = new CultureInfo(Admanagment.Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
    //            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Admanagment.Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
    //        }
    //    }

    //}

    //protected void SEOSiteMap()
    //{
    //    Page.Title = Resources.Resource.HomeTitle;

    //    var nl1 = new System.Web.UI.WebControls.Literal { Text = Environment.NewLine };
    //    var title = new HtmlMeta { Name = "title", Content = Resources.Resource.HomeTitle };
    //    Page.Header.Controls.AddAt(1, title);

    //    var description = new HtmlMeta { Name = "description", Content = Resources.Resource.HomeDescription };
    //    Page.Header.Controls.AddAt(2, description);

    //    var keywords = new HtmlMeta { Name = "keywords", Content = Resources.Resource.HomeKeywords };
    //    Page.Header.Controls.AddAt(3, keywords);
    //}

    //protected void ValidateIncomingPost()
    //{
    //    if (Request.QueryString["P"] != "Temp")
    //    {
    //        Response.Redirect("../Account/Login.aspx");
    //    }
    //}

    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if (!Page.IsPostBack)
    //    {
    //        ValidateIncomingPost();
    //        GetAdProperties();
    //    }
    //}

    //protected void AdRotator1AdCreated(object sender, AdCreatedEventArgs e)
    //{
    //    e.NavigateUrl = "~/Advertiser/TempAdHandler.ashx?id=" + e.AdProperties["ID"];
    //}

    //protected void GetAdProperties()
    //{
    //    int y = GetTempAdID();
    //    using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
    //    {
    //        var adList = (from ad in context2.TempAds
    //                      where ad.ID == y
    //                      select ad).ToList();
    //        NewCampaingTextBox.Text = Convert.ToString(adList[0].AdName);
    //        NewCampaingTextBox.ReadOnly = true;
    //        SiteDropDownList.SelectedIndex = Convert.ToInt32(adList[0].SiteID);
    //        SiteDropDownList.Enabled = false;
    //        SectionDropDownList.SelectedIndex = Convert.ToInt32(adList[0].SectionID);
    //        SectionDropDownList.Enabled = false;
    //        LanguageDropDownList.SelectedIndex = Convert.ToInt32(adList[0].LanguageID);
    //        LanguageDropDownList.Enabled = false;
    //        GenderDropDownList.SelectedIndex = Convert.ToInt32(adList[0].GenderID);
    //        GenderDropDownList.Enabled = false;
    //        AgeDropDownList.SelectedIndex = Convert.ToInt32(adList[0].AgeRangeID);
    //        AgeDropDownList.Enabled = false;
    //        CountryDropDownList.SelectedValue = Convert.ToInt32(adList[0].CountryID).ToString(CultureInfo.InvariantCulture);
    //        CountryDropDownList.Enabled = false;
    //        CountryDropDownList.DataBind();
    //        RegionsDropDownList.SelectedValue = Convert.ToInt32(adList[0].RegionID).ToString(CultureInfo.InvariantCulture);
    //        RegionsDropDownList.Enabled = false;
    //        RegionsDropDownList.DataBind();
    //        var id = adList[0].CityID;
    //        if (id != null)
    //        {
    //            CitiesDropDownList.SelectedIndex = Convert.ToInt32(adList[0].CityID);
    //        }
    //        else
    //        {
    //            CitiesDropDownList.SelectedIndex = -1;
    //        }
    //        CitiesDropDownList.Enabled = false;
    //        ZipcodeTextBox.Text = Convert.ToString(adList[0].Zipcode.ToString(CultureInfo.InvariantCulture));
    //        ZipcodeTextBox.ReadOnly = true;
    //        IndustryDropDownList.SelectedIndex = Convert.ToInt32(adList[0].IndustryID);
    //        IndustryDropDownList.Enabled = false;
    //        ProfessionTextBox.Text = Convert.ToString(adList[0].Profession.ToString(CultureInfo.InvariantCulture));
    //        ProfessionTextBox.ReadOnly = true;
    //        StartDateTextBox.Text = adList[0].StartDate.ToShortDateString();
    //        EndDateTextBox.Text = adList[0].EndDate.ToShortDateString();
    //    }
    //}

    //protected int GetTempAdID()
    //{
    //    if (Request.QueryString["ID"] == null)
    //    {
    //        Response.Redirect("../Account/Login.aspx");
    //        return 0;
    //    }
    //    return int.Parse(Request.QueryString["ID"]);
    //}

    //protected void EditAdButtonClick(object sender, EventArgs e)
    //{
    //    Response.Redirect(string.Format("ChangeAd.aspx?ID={0}&P=Temp", GetTempAdID()));
    //}

    //protected void PlaceAdButtonClick(object sender, EventArgs e)
    //{
    //}
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
        if (Request.QueryString["ID"] == null)
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
        using (var context1 = new AdDatabaseModel.AdDatabaseEntities())
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
        Response.Redirect(string.Format("ChangeAd.aspx?ID={0}", GetAdID()));
    }

    protected void PlaceAdButtonClick(object sender, EventArgs e)
    {
        SaveAd();
        if (AlreadyExist())
        {
            Response.Redirect(string.Format("../Payment/PayPal/PDT/PDTStart.aspx?ID={0}&AD=" + GetAdID(), GetSavedPaymentID()));
        }else
        {
            
        
        Response.Redirect(string.Format("../Payment/PayPal/PDT/PDTStart.aspx?ID={0}&AD=" + GetAdID(), (Admanagment.Helpers.Utility.GetPaymentID() - 1)));
        }
    }

    protected void SaveAdButton_Click(object sender, EventArgs e)
    {
        try
        {
            SaveAd();
            Response.Redirect("../Saved/Inventory.aspx");
        }
        catch (Exception)
        {

            Response.Redirect("../Saved/Inventory.aspx");
        }
    }

    protected void SaveAd()
    {
        Payment();
    }

    protected Guid? GetUserID()
    {
        var user = Membership.GetUser();
        if (user != null)
        {
            var userKey = user.ProviderUserKey;

            if (userKey != null)
            {
                var userID = (Guid)userKey;
                return userID;
            }
            else
            {
                Response.Redirect("../Account/Login.aspx");
                return null;
            }
        }
        else
        {
            Response.Redirect("../Account/Login.aspx");
            return null;
        }
    }

    protected void Payment()
    {
        //PaymentDue
        int y = int.Parse(GetAdID().ToString());
        Guid userid = Guid.Parse(GetUserID().ToString());
        var context = new AdDatabaseModel.AdDatabaseEntities();
        AdDatabaseModel.AdvertiserPaymentDue updatepayment =
            (from ad in context.AdvertiserPaymentDues where ad.AdID == y && ad.AdvertiserID == userid select ad).FirstOrDefault();

        if (updatepayment == null)
        {
            var advertiserPaymentDue = new AdDatabaseModel.AdvertiserPaymentDue
            {
                AdvertiserID = GetUserID(),
                PaymentDueID = Admanagment.Helpers.Utility.GetPaymentID(),
                AdID = y,
                AdAmount = PaymentDue(),
                Date = DateTime.Now.Date,
                CurrencyCode = "USA",
                PaymentDue = PaymentDue()
            };
            context.AddToAdvertiserPaymentDues(advertiserPaymentDue);
            context.SaveChanges();
        }else
        {
             updatepayment.Date = DateTime.Now.Date;
            updatepayment.AdAmount = PaymentDue();
            updatepayment.PaymentDue = PaymentDue();
         context.SaveChanges();
        }
      
    }

    protected double PaymentDue()
    {
        //Formual Prospective
        //Sections * Industry * Profession * Date

        //Current Forumla
        //Profession * date
        double professionPrice = 50;
        int y = GetAdID();
        using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
        {
            var adgeneral = (from ad in context2.AdGenerals
                          where ad.ID == y
                          select ad).FirstOrDefault();

            var number = ProfessionTextBox.Text;
            int numberofprofession = number.Count(f => f == ',');
            int numberofdays = (int)(adgeneral.EndDate - adgeneral.StartDate).TotalDays;
            return numberofprofession * numberofdays * professionPrice;
        }

    }

    protected bool AlreadyExist()
    {
         return (Request.QueryString["P"] == "Saved");
    }

    protected int GetSavedPaymentID()
    {
       int y = int.Parse(GetAdID().ToString());
        Guid userid = Guid.Parse(GetUserID().ToString());
        var context = new AdDatabaseModel.AdDatabaseEntities();
        AdDatabaseModel.AdvertiserPaymentDue updatepayment =
            (from ad in context.AdvertiserPaymentDues where ad.AdID == y && ad.AdvertiserID == userid select ad).FirstOrDefault();
        return updatepayment.PaymentDueID;

    }
}

  //protected void EditAdButtonClick(object sender, EventArgs e)
  //  {
  //      Response.Redirect(string.Format("ChangeAd.aspx?ID={0}", GetTempAdID()));
  //  }

  //  protected void PlaceAdButtonClick(object sender, EventArgs e)
  //  {
  //      SaveAd();
  //      Response.Redirect(string.Format("../Payment/PayPal/PDT/PDTStart.aspx?ID={0}&AD=" + GetTempAdID(), (Admanagment.Helpers.Utility.GetPaymentID() - 1)));
  //  }

  //  protected void SaveAdButton_Click(object sender, EventArgs e)
  //  {
  //      SaveAd();
  //      Response.Redirect("../Saved/Inventory.aspx");
  //  }

  //  protected void SaveAd()
  //  {
  //      int y = GetTempAdID();
  //      using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
  //      {
  //          if (!AlreadyExist())
  //          {
  //               var tempad = (from ad in context2.TempAds
  //                        where ad.ID == y
  //                        select ad).FirstOrDefault();

  //              context2.CreateNewAd(tempad.SiteID, tempad.SectionID, tempad.PositionID, tempad.NavigateUrl,
  //                               tempad.FormatID,
  //                               tempad.ImageUrl, tempad.AlternateText, tempad.Keyword, tempad.Impressions,
  //                               tempad.Width, tempad.Height, tempad.StartDate, tempad.EndDate
  //                               , false, GetUserID(), tempad.LanguageID, tempad.GenderID, tempad.AgeRangeID,
  //                               tempad.CountryID, tempad.CountryName, tempad.RegionID,
  //                               tempad.RegionName, tempad.CityID, tempad.CityName, tempad.Zipcode,
  //                               tempad.IndustryID, tempad.Profession, tempad.DateCreated, GetTempAdID(),
  //                               tempad.AdName, tempad.AdTypeID, tempad.CountryCode, tempad.FlagPath,
  //                               tempad.ProfessionID); 
  //          }
  //      }
  //      Payment();
  //  }

  //  protected Guid? GetUserID()
  //  {
  //      var user = Membership.GetUser();
  //      if (user != null)
  //      {
  //          var userKey = user.ProviderUserKey;

  //          if (userKey != null)
  //          {
  //              var userID = (Guid)userKey;
  //              return userID;
  //          }
  //          else
  //          {
  //              Response.Redirect("../Account/Login.aspx");
  //              return null;
  //          }
  //      }
  //      else
  //      {
  //          Response.Redirect("../Account/Login.aspx");
  //          return null;
  //      }
  //  }

  //  protected void Payment()
  //  {
  //      //PaymentDue
  //      var context = new AdDatabaseModel.AdDatabaseEntities();
  //      var advertiserPaymentDue = new AdDatabaseModel.AdvertiserPaymentDue
  //      {
  //          AdvertiserID = GetUserID(),
  //          PaymentDueID = Admanagment.Helpers.Utility.GetPaymentID(),
  //          AdID = GetTempAdID(),
  //          AdAmount = PaymentDue(),
  //          Date = DateTime.Now.Date,
  //          CurrencyCode = "USA",
  //          PaymentDue = PaymentDue()
  //      };
  //      context.AddToAdvertiserPaymentDues(advertiserPaymentDue);
  //      context.SaveChanges();
  //  }

  //  protected double PaymentDue()
  //  {
  //      //Formual Prospective
  //      //Sections * Industry * Profession * Date

  //      //Current Forumla
  //      //Profession * date
  //      double professionPrice = 50;
  //      int y = GetTempAdID();
  //      using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
  //      {
  //          var tempad = (from ad in context2.TempAds
  //                        where ad.ID == y
  //                        select ad).FirstOrDefault();


  //          int numberofprofession = int.Parse(tempad.NumberofProfession.ToString(CultureInfo.InvariantCulture));
  //          int numberofdays = (int)(tempad.EndDate - tempad.StartDate).TotalDays;
  //          return numberofprofession * numberofdays * professionPrice;
  //      }

  //  }

  //  protected bool AlreadyExist()
  //  {
  //       return (Request.QueryString["P"] == "Saved");
  //  }