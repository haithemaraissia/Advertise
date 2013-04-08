using System;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;



public partial class Advertiser_ChangeAdDetail : System.Web.UI.Page
{
    bool _flag = true;
    public Rectangle Rectangle;

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
            try
            {
                SEOSiteMap();
                if (Session["LCID"] == null)
                {
                    Session["LCID"] = 1;
                }
                ValidateIncomingPost();
                GetAdProperties();
            }
            catch (Exception)
            {
                Response.Redirect("../Account/Login.aspx");

            }
        }
    }

    protected void GetAdProperties()
    {
        int y = GetID();
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
            PositionDropDownList.SelectedIndex = Convert.ToInt32(Admanagment.Helpers.Utility.GetPositionSelectedIndex(Convert.ToInt32(adgeneral[0].PositionID))); ;
            DestinationURLTextBox.Text = Convert.ToString(adgeneral[0].NavigateUrl);
            FormatDropDownList.SelectedIndex = Convert.ToInt32(adgeneral[0].FormatID);
            AlternativeTextTextBox.Text = Convert.ToString(adgeneral[0].AlternateText);
            StartDateCalendar.SelectedDate = (Convert.ToDateTime(adgeneral[0].StartDate)).Date;
            EndDateCalendar.SelectedDate = (Convert.ToDateTime(adgeneral[0].EndDate)).Date;

            LanguageDropDownList.SelectedIndex = Convert.ToInt32(adaudience[0].LanguageID);
            GenderDropDownList.SelectedIndex = Convert.ToInt32(adaudience[0].GenderID);
            CountryDropDownList.SelectedValue = Convert.ToInt32(adaudience[0].CountryID).ToString(CultureInfo.InvariantCulture);
            CountryDropDownList.DataBind();
            RegionsDropDownList.SelectedValue = Convert.ToInt32(adaudience[0].RegionID).ToString(CultureInfo.InvariantCulture);
            RegionsDropDownList.DataBind();
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
            IndustryDropDownList.DataBind();
            SpecialityListBox1.DataBind();
            SpecialityListBox2.DataBind();
            SpecialityListBox3.DataBind();
            string[] professions = Convert.ToString(adaudience[0].ProfessionID).Split(',');
            foreach (var profession in professions)
            {
                SelectProfession(profession);
            }
        }       
    }

    protected void SelectProfession(string jobID)
    {
        foreach (ListItem lstItem in SpecialityListBox1.Items)
        {
            if (lstItem.Value == jobID)
            {
                lstItem.Selected = true;

            }
        }

        foreach (ListItem lstItem in SpecialityListBox2.Items)
        {
            if (lstItem.Value == jobID)
            {
                lstItem.Selected = true;

            }
        }

        foreach (ListItem lstItem in SpecialityListBox3.Items)
        {
            if (lstItem.Value == jobID)
            {
                lstItem.Selected = true;

            }
        }
    }

    protected int GetID()
    {
        if (Request.QueryString["ID"] == null)
        {
            Response.Redirect("../Account/Login.aspx");
            return 0;
        }
        return int.Parse(Request.QueryString["ID"]);
    }

    protected int GetAdID()
    {
        int y = GetID();
        int x;
        using (var context1 = new AdDatabaseModel.AdDatabaseEntities())
        {
            var adgeneral = (from ad in context1.AdGenerals
                             where ad.ID == y
                             select ad).ToList();

            x = adgeneral[0].AdID;
        }
        return x;
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

    public void CalenderCheck()
    {
        var result = DateTime.Compare(EndDateCalendar.SelectedDate.Date, StartDateCalendar.SelectedDate.Date);
        if (result < 1)
        {
            DateErrorTextBox.Text = "";
            CalenderCustomValidator.Validate();
        }
        else
        {
            DateErrorTextBox.Text = "";
        }
    }

    protected void EndDateCalendarSelectionChanged(object sender, EventArgs e)
    {
        CalenderCheck();
    }

    protected void StartDateCalendarSelectionChanged(object sender, EventArgs e)
    {
        CalenderCheck();
    }

    protected void CalenderCustomValidatorServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        var result = DateTime.Compare(EndDateCalendar.SelectedDate.Date, StartDateCalendar.SelectedDate.Date);
        args.IsValid = result >= 1;
    }

    protected void UpdateAdButtonClick(object sender, EventArgs e)
    {
        //All Validation except the Creative Validation
        if (Page.Validators[0].IsValid && Page.Validators[1].IsValid && Page.Validators[2].IsValid && Page.Validators[4].IsValid)
        {
            if (AsyncFileUpload1.HasFile)
            {
                if (Page.Validators[3].IsValid)
                {
                    var adPath = "Ads/" + User.Identity.Name + "/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                    UpdateAd(adPath, 1);
                    SaveCreative();
                    Response.Redirect(string.Format("ReviewAdDetail.aspx?ID={0}&P=C", GetID()));
                }
            }
            else
            {
                UpdateAd("", 0);
                Response.Redirect(string.Format("ReviewAdDetail.aspx?ID={0}&P=C", GetID()));
            }
        }
    }

    protected void UpdateAd(string adPath, int action)
    {
        //Set Active to false 
        //When Payment is complete
        //Set Active to true
        ////////////////////Currently; providing regular compaing:Type 1/////////////////
        //If sponsorship arise in the feature, then will need to implement other adType
        const int adTypeID = 1;

        using (var context = new AdDatabaseModel.AdDatabaseEntities())

            try
            {
                context.UpdateNewAd(GetID(), GetAdID(), SiteDropDownList.SelectedIndex,
                                SectionDropDownList.SelectedIndex,
                                Convert.ToInt32(Admanagment.Helpers.Utility.GetPosition(PositionDropDownList.SelectedIndex)),
                                GetDestinationURL(),
                                FormatDropDownList.SelectedIndex,
                                adPath,
                                AlternativeText(),
                                GetKeywordString(),
                                Admanagment.Helpers.Utility.GetImpression(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3),
                                GetCreativeWidth(FormatDropDownList.SelectedIndex),
                                GetCreativeHeight(FormatDropDownList.SelectedIndex),
                                GetStartDate(),
                                GetEndDate(),
                                false,
                                GetUserID(),
                                LanguageDropDownList.SelectedIndex,
                                GenderDropDownList.SelectedIndex,
                                AgeDropDownList.SelectedIndex,
                                Convert.ToInt32(CountryDropDownList.SelectedValue),
                                CountryDropDownList.SelectedItem.Text,
                                Convert.ToInt32(RegionsDropDownList.SelectedValue),
                                RegionsDropDownList.SelectedItem.Text,
                                CitiesDropDownList.SelectedIndex,
                                GetCityName(),
                                Admanagment.Helpers.Utility.GetZipcode(Convert.ToInt32(CountryDropDownList.SelectedValue), Convert.ToInt32(RegionsDropDownList.SelectedValue), GetCityName(), ZipcodeTextBox.Text),
                                IndustryDropDownList.SelectedIndex,
                                Admanagment.Helpers.Utility.GetProfession(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3),
                                Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture)),
                                NewCampaingTextBox.Text,
                                adTypeID,
                                Admanagment.Helpers.Utility.GetCountryCode(Convert.ToInt32(CountryDropDownList.SelectedValue)),
                                Admanagment.Helpers.Utility.GetFlagPath(Convert.ToInt32(CountryDropDownList.SelectedValue)),
                                Admanagment.Helpers.Utility.GetProfessionID(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3), action);
            }
            catch (Exception e)
            {


            }

    }

    protected int? GetCityID()
    {
        if (CitiesDropDownList.Items.Count == 0)
        {
            return null;
        }
        return CitiesDropDownList.SelectedIndex;
    }

    protected string GetCityName()
    {
        if (CitiesDropDownList.Items.Count == 0)
        {
            return "0";
        }
        return CitiesDropDownList.SelectedItem.Text.ToString(CultureInfo.InvariantCulture);
    }

    protected int GetCreativeWidth(int format)
    {
        var width = 100;

        if (AsyncFileUpload1.HasFile)
        {
            if (format == 0)
            {
                try
                {
                    System.Drawing.Image I = System.Drawing.Image.FromStream(AsyncFileUpload1.PostedFile.InputStream);
                    width = I.Width;
                }
                catch (Exception)
                {
                    width = 100;
                }
            }

            if (format == 1)
            {
                try
                {
                    var swfParser = new SwfParser();
                    Rectangle = swfParser.GetDimensions(AsyncFileUpload1.PostedFile.InputStream);
                    width = Rectangle.Width;
                }
                catch (Exception)
                {
                    width = 100;
                }

            }

        }
        return width;
    }

    protected int GetCreativeHeight(int format)
    {
        var height = 100;
        if (AsyncFileUpload1.HasFile)
        {
            if (format == 0)
            {
                try
                {
                    System.Drawing.Image I = System.Drawing.Image.FromStream(AsyncFileUpload1.PostedFile.InputStream);
                    height = I.Height;
                }
                catch (Exception)
                {
                    return height;
                }
            }

            if (format == 1)
            {
                try
                {
                    height = Rectangle.Height;
                }
                catch (Exception)
                {

                    height = 100;
                }

            }

        }
        return height;
    }

    protected DateTime GetStartDate()
    {
        return StartDateCalendar.SelectedDate.Date;
    }

    protected DateTime GetEndDate()
    {
        return EndDateCalendar.SelectedDate.Date;
    }

    public void ValidateDirectory()
    {
        if (Directory.Exists(GetAdvertiserDirectory()) == false)
        {
            Directory.CreateDirectory(GetAdvertiserDirectory());
        }
    }

    public string GetAdvertiserDirectory()
    {
        var username = User.Identity.Name;
        var rootPath = Server.MapPath("../Advertiser/Ads/");
        return rootPath + username;
    }

    protected void AsyncFileUploadUploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        _flag = true;
        if ((Convert.ToInt32(e.FileSize) >= 4096000))
        {
            _flag = false;
        }

        string typeAllowed = null;
        var extension = Path.GetExtension(e.FileName);
        if (extension != null)
            typeAllowed = extension.ToLower();
        if ((typeAllowed == ".jpg" | typeAllowed == ".jpeg" | typeAllowed == ".gif" | typeAllowed == ".png" | typeAllowed == ".bmp" | typeAllowed == ".tiff" | typeAllowed == ".swf") == false)
        {
            _flag = false;
        }
    }

    protected void SaveCreative()
    {
        if (_flag != true) return;
        ValidateDirectory();
        if (AsyncFileUpload1.FileName == null) return;
        string adPath = GetAdvertiserDirectory() + "/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
        AsyncFileUpload1.SaveAs(adPath);
    }

    protected void AsyncFileUploadCustomValidatorServerValidate(object source, ServerValidateEventArgs args)
    {
        if (AsyncFileUpload1.HasFile == false)
        {
            _flag = false;
        }

        args.IsValid = _flag;
    }

    protected string GetDestinationURL()
    {
        return DestinationURLTextBox.Text == null ? "" : DestinationURLTextBox.Text.ToString(CultureInfo.InvariantCulture);
    }

    protected string AlternativeText()
    {
        return AlternativeTextTextBox.Text == null ? "" : AlternativeTextTextBox.Text.ToString(CultureInfo.InvariantCulture);
    }

    protected string GetKeywordString()
    {
        var result = SiteDropDownList.SelectedValue + ","
                     + SectionDropDownList.SelectedValue + ","
                     + PositionDropDownList.SelectedValue + ","
                     + LanguageDropDownList.SelectedValue + ","
                     + GenderDropDownList.SelectedValue + ","
            //+ AgeDropDownList.SelectedValue + ","
                     + CountryDropDownList.SelectedValue + ","
                     + Admanagment.Helpers.Utility.GetRegion(RegionsDropDownList) + ","
                     + GetCityID() + ","
                     +
                     Admanagment.Helpers.Utility.GetZipcode(Convert.ToInt32(CountryDropDownList.SelectedValue),
                                                Convert.ToInt32(RegionsDropDownList.SelectedValue),
                                                GetCityName(), ZipcodeTextBox.Text) + ","
                     + IndustryDropDownList.SelectedValue + ","
                     + Admanagment.Helpers.Utility.GetNumberOfProfession(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3) + ","
                     + Admanagment.Helpers.Utility.GetProfessionID(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3);
        return result;
    }

    protected string GetKeywordID()
    {
        var result = SiteDropDownList.SelectedIndex + ","
                     + SectionDropDownList.SelectedIndex + ","
                     + Admanagment.Helpers.Utility.GetPosition(PositionDropDownList.SelectedIndex) + ","
                     + LanguageDropDownList.SelectedIndex + ","
                     + GenderDropDownList.SelectedIndex + ","
                     + AgeDropDownList.SelectedIndex + ","
                     + CountryDropDownList.SelectedIndex + ","
                     + RegionsDropDownList.SelectedIndex + ","
                     + GetCityID() + ","
                     +
                     Admanagment.Helpers.Utility.GetZipcode(Convert.ToInt32(CountryDropDownList.SelectedValue),
                                                Convert.ToInt32(RegionsDropDownList.SelectedValue),
                                                GetCityName(), ZipcodeTextBox.Text) + ","
                     + IndustryDropDownList.SelectedValue + ","
                     + Admanagment.Helpers.Utility.GetNumberOfProfession(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3) + ","
                     + Admanagment.Helpers.Utility.GetProfessionID(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3);
        return result;
    }

}