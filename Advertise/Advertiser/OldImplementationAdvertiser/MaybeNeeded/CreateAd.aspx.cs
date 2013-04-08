using System;
using System.Globalization;
using System.Threading;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;


namespace Admanagment.Advertiser
{
   
    public partial class CreateAd : System.Web.UI.Page
    {
        int _currentTempID;
        bool _flag = true;
        public Rectangle Rectangle;

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
                    Thread.CurrentThread.CurrentUICulture =
                        new CultureInfo(Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                    Thread.CurrentThread.CurrentCulture =
                        CultureInfo.CreateSpecificCulture(Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
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
        }

        protected void ValidateAdvertiser()
        {
            var user = Membership.GetUser();
            if (user == null)
            {
                Response.Redirect("../Account/Login.aspx");
            } 
        }

        protected void InsertNewTempAd(Guid userID)
        {
            ////////////////////Currently; providing regular compaing:Type 1/////////////////
            //If sponsorship arise in the feature, then will need to implement other adType
            const int adTypeID = 1;

            _currentTempID = Helpers.Utility.GetTempAdID();
            if (AsyncFileUpload1 != null)
            {
                var adPath = "Ads/" + User.Identity.Name + "/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
                    context2.AddTempAd(_currentTempID, SiteDropDownList.SelectedIndex,
                                       SectionDropDownList.SelectedIndex,
                                       Convert.ToInt32(Helpers.Utility.GetPosition(PositionDropDownList.SelectedIndex)),
                                       GetDestinationURL(), 
                                       FormatDropDownList.SelectedIndex, 
                                       adPath,
                                       AlternativeText(),
                                       GetKeywordString(),
                                       Helpers.Utility.GetImpression(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3),
                                       GetCreativeWidth(FormatDropDownList.SelectedIndex),
                                       GetCreativeHeight(FormatDropDownList.SelectedIndex),
                                       GetStartDate(),
                                       GetEndDate(),
                                       userID, 
                                       LanguageDropDownList.SelectedIndex, 
                                       GenderDropDownList.SelectedIndex, 
                                       AgeDropDownList.SelectedIndex,
                                       Convert.ToInt32(CountryDropDownList.SelectedValue), 
                                       CountryDropDownList.SelectedItem.Text,
                                       Convert.ToInt32(RegionsDropDownList.SelectedValue),
                                       RegionsDropDownList.SelectedItem.Text,
                                       CitiesDropDownList.SelectedIndex,
                                       GetCityName(),
                                       Helpers.Utility.GetZipcode(Convert.ToInt32(CountryDropDownList.SelectedValue), Convert.ToInt32(RegionsDropDownList.SelectedValue), GetCityName(), ZipcodeTextBox.Text),
                                       IndustryDropDownList.SelectedIndex,
                                       Helpers.Utility.GetNumberOfProfession(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3),
                                       Helpers.Utility.GetProfession( SpecialityListBox1,  SpecialityListBox2,  SpecialityListBox3),
                                       Convert.ToDateTime(DateTime.Now.ToString(CultureInfo.InvariantCulture)),
                                       NewCampaingTextBox.Text,
                                       adTypeID,
                                       Helpers.Utility.GetCountryCode(Convert.ToInt32(CountryDropDownList.SelectedValue)),
                                       Helpers.Utility.GetFlagPath(Convert.ToInt32(CountryDropDownList.SelectedValue)),
                                       Helpers.Utility.GetProfessionID(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3));
            }
        }

        protected void CreateAdButtonClick(object sender, EventArgs e)
        {
            var user = Membership.GetUser();
            if (user != null)
            {
                var userKey = user.ProviderUserKey;

                if (userKey != null)
                {
                    var userID = (Guid)userKey;
                    if (Page.IsValid)
                    {
                        InsertNewTempAd(userID);
                        SaveCreative();
                        Response.Redirect(string.Format("ReviewAd.aspx?ID={0}&P=Temp", _currentTempID));
                    }
                }
            }
            else
            {
                Response.Redirect("../Account/Login.aspx");
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
            if ( AsyncFileUpload1.HasFile)
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
            return HiddenToField.Value.ToString(CultureInfo.InvariantCulture) == "" ? DateTime.Now.Date : Convert.ToDateTime(HiddenFromField.Value.ToString(CultureInfo.InvariantCulture)).Date;
        }

        protected DateTime GetEndDate()
        {
            return HiddenToField.Value.ToString(CultureInfo.InvariantCulture) == "" ? DateTime.Now.Date : Convert.ToDateTime(HiddenToField.Value.ToString(CultureInfo.InvariantCulture)).Date;
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
            return  rootPath + username;
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
                         + Helpers.Utility.GetRegion(RegionsDropDownList) + ","
                         + GetCityID() + ","
                         +
                         Helpers.Utility.GetZipcode(Convert.ToInt32(CountryDropDownList.SelectedValue),
                                                    Convert.ToInt32(RegionsDropDownList.SelectedValue),
                                                    GetCityName(), ZipcodeTextBox.Text) + ","
                         + IndustryDropDownList.SelectedValue + ","
                         + Helpers.Utility.GetNumberOfProfession(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3) + ","
                         + Helpers.Utility.GetProfessionID(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3);
            return result;
        }

        protected string GetKeywordID()
        {
            var result = SiteDropDownList.SelectedIndex + ","
                         + SectionDropDownList.SelectedIndex + ","
                         + Helpers.Utility.GetPosition(PositionDropDownList.SelectedIndex) + ","
                         + LanguageDropDownList.SelectedIndex + ","
                         + GenderDropDownList.SelectedIndex + ","
                         + AgeDropDownList.SelectedIndex + ","
                         + CountryDropDownList.SelectedIndex + ","
                         + RegionsDropDownList.SelectedIndex + ","
                         + GetCityID() + ","
                         +
                         Helpers.Utility.GetZipcode(Convert.ToInt32(CountryDropDownList.SelectedValue),
                                                    Convert.ToInt32(RegionsDropDownList.SelectedValue),
                                                    GetCityName(), ZipcodeTextBox.Text) + ","
                         + IndustryDropDownList.SelectedValue + ","
                         + Helpers.Utility.GetNumberOfProfession(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3) + ","
                         + Helpers.Utility.GetProfessionID(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3);
            return result;
        }
    }
}


