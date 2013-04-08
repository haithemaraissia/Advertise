using System;
using System.Globalization;
using System.Web.UI;

public partial class MyProfile : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        FirstNameTextBox.Text = Profile.FirstName;
        LastNameTextBox.Text = Profile.LastName;
        GenderTextBox.Text = Profile.Gender;
        AgeTextBox.Text = Profile.Age;
        IndustryTextBox.Text = Profile.Industry;
        EmailAddressTextBox.Text = Profile.Email;
        CompanyWebsiteTextBox.Text = Profile.CompanyURL;
        CountryTextBox.Text = Profile.Country;
        RegionTextBox.Text = Profile.Region;
        CityTextBox.Text = Profile.City;
        ZipcodeTextBox.Text = Profile.Zipcode;
        MartialStatusTextBox.Text = Profile.MaritalStatus;
        Picture1TextBox.Text = Profile.Picture1;
        Picture2TextBox.Text = Profile.Picture2;
        Picture3TextBox.Text = Profile.Picture3;
        Picture4TextBox.Text = Profile.Picture4;
        LanguageTextBox.Text = Profile.Language;
        LCIDTextBox.Text = Profile.LCID.ToString(CultureInfo.InvariantCulture);
        DescriptionTextBox.Text = Profile.Description;
        CellPhoneTextBox.Text = Profile.Cellphone;
        FacebookTextBox.Text = Profile.Facebook;
        LinkedInTextBox.Text = Profile.LinkedIn;
        TwitterTextBox.Text = Profile.Twitter;
    }
    protected void Button1Click(object sender, EventArgs e)
    {

        Profile.FirstName = FirstNameTextBox.Text;
        Profile.LastName = LastNameTextBox.Text;
        Profile.Gender = GenderTextBox.Text;
        Profile.Age = AgeTextBox.Text;
        Profile.Industry = IndustryTextBox.Text;
        Profile.Email = EmailAddressTextBox.Text;
        Profile.CompanyURL = CompanyWebsiteTextBox.Text;
        Profile.Country = CountryTextBox.Text;
        Profile.Region = RegionTextBox.Text;
        Profile.City = CityTextBox.Text;
        Profile.Zipcode = ZipcodeTextBox.Text;
        Profile.MaritalStatus = MartialStatusTextBox.Text;
        Profile.Picture1 = Picture1TextBox.Text;
        Profile.Picture2 = Picture2TextBox.Text;
        Profile.Picture3 = Picture3TextBox.Text;
        Profile.Picture4 = Picture4TextBox.Text;
        Profile.Language = LanguageTextBox.Text;
        Profile.LCID = Convert.ToInt32(LCIDTextBox.Text.ToString(CultureInfo.InvariantCulture));
        Profile.Description = DescriptionTextBox.Text;
        Profile.Cellphone = CellPhoneTextBox.Text;
        Profile.Facebook = FacebookTextBox.Text;
        Profile.LinkedIn = LinkedInTextBox.Text;
        Profile.Twitter = TwitterTextBox.Text;
        Profile.Save();
    }
}
