using System;
using System.Globalization;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI.WebControls;


public partial class Register : System.Web.UI.Page
{
    // CreatedUser event is called when a new user is successfully created
    public void SignUpCreateWizardCreatedUser(object sender, EventArgs e)
    {
        // Create an empty Profile for the newly created user
        ProfileCommon p = (ProfileCommon)ProfileCommon.Create(SignUpCreateWizard.UserName, true);
        ProfileCommon MyProfile = (ProfileCommon)ProfileBase.Create(SignUpCreateWizard.UserName);

        // Populate some Profile properties off of the create user wizard
        p.FirstName = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FirstName")).Text;
        p.LastName = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("LastName")).Text;
        p.Email = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Email")).Text;
        p.Gender = ((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Gender")).SelectedValue;
        p.Age = Int32.Parse(((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Age")).Text).ToString(CultureInfo.InvariantCulture);
        p.CountryID = Convert.ToInt32(((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryDropDownList")).SelectedValue);
        p.Country = ((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryDropDownList")).SelectedItem.Text;
        p.RegionID = Convert.ToInt32(((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("RegionsDropDownList")).SelectedValue);
        p.Region = ((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("RegionsDropDownList")).SelectedItem.Text;
        var givenCity = ((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CitiesDropDownList"));
        if (givenCity.SelectedIndex == -1)
        {
            p.CityID = 0;
            p.City = "";
        }
        else
        {
            p.CityID = Convert.ToInt32(givenCity.SelectedValue);
            p.City = ((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CitiesDropDownList")).SelectedItem.Text;
        }

        var givenzipcode = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Zipcode")).Text ?? "";
        p.Zipcode = Admanagment.Helpers.Utility.GetZipcode(p.CountryID, p.RegionID,p.City, givenzipcode);
        p.MaritalStatus = ((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("MaritalStatus")).SelectedValue;
        p.Language = ((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Language")).SelectedValue;
        p.Question = ((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Question")).SelectedValue;
        p.Answer = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Answer")).Text;
        p.Cellphone = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Cellphone")).Text;
        p.Facebook = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Facebook")).Text;
        p.LinkedIn = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("LinkedIn")).Text;
        p.Twitter = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Twitter")).Text;
        var givenindustry =
            ((DropDownList)
             SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("IndustryDropDownList"));
        if (givenindustry.SelectedIndex == -1)
        {
            p.Industry = givenindustry.Items[0].Value;
        }
        else
        {
            p.Industry = givenindustry.SelectedValue;
        }
        var specialityListBox1 =
            ((ListBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("SpecialityListBox1"));
        var specialityListBox2 =
            ((ListBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("SpecialityListBox2"));
        var specialityListBox3 =
            ((ListBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("SpecialityListBox3"));
        p.Profession = Admanagment.Helpers.Utility.GetProfession(specialityListBox1,specialityListBox2,specialityListBox3);
        p.ProfessionID = Admanagment.Helpers.Utility.GetProfessionID(specialityListBox1, specialityListBox2, specialityListBox3);
        p.CompanyURL = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CompanyURL")).Text;
        p.Description = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Description")).Text;
        var gender = Convert.ToInt32((((DropDownList)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Gender")).SelectedValue));
        if (gender == 1)
        {
            p.Picture1 = "~/Advertiser/Profile/Photo/add-male-user.png";
            p.Picture2 = "~/Advertiser/Profile/Photo/add-male-user.png";
            p.Picture3 = "~/Advertiser/Profile/Photo/add-male-user.png";
            p.Picture4 = "~/Advertiser/Profile/Photo/add-male-user.png";
        }
        if (gender == 2)
        {
            p.Picture1 = "~/Advertiser/Profile/Photo/add-female-user.png";
            p.Picture2 = "~/Advertiser/Profile/Photo/add-female-user.png";
            p.Picture3 = "~/Advertiser/Profile/Photo/add-female-user.png";
            p.Picture4 = "~/Advertiser/Profile/Photo/add-female-user.png";
        }
        p.Save();
        FormsAuthentication.SetAuthCookie(SignUpCreateWizard.UserName, false /* createPersistentCookie */);
        var continueUrl = SignUpCreateWizard.ContinueDestinationPageUrl;
        if (String.IsNullOrEmpty(continueUrl))
        {
            continueUrl = "~/";
        }
        Roles.AddUserToRole(SignUpCreateWizard.UserName, "Advertiser");
        var user = Membership.GetUser();
        if (user != null)
        {
            var userKey = user.ProviderUserKey;
            if (userKey != null)
                App_code.Logic.InsertAdvertiserId((Guid) userKey);
        }
        Response.Redirect(continueUrl);
    }

    // Deactivate event fires when user hits "next" in the CreateUserWizard 
    public void AssignUserToRolesDeactivate(object sender, EventArgs e)
    {
        Roles.AddUserToRole(SignUpCreateWizard.UserName, "Advertiser");
    }

}


