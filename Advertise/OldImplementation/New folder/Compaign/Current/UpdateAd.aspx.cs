using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Advertiser_Compaign_Current_UpdateAd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != null)
        {
            int AdID = Convert.ToInt32(TextBox1.Text);


            using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
            {
                context2.PendNewAd(AdID);
            }

        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != null)
        {
            int AdID = Convert.ToInt32(TextBox1.Text);

            using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
            {
                var r = (from c in context2.TempAds
                         where c.ID == AdID
                         select c).FirstOrDefault();
                //Success notification
                //Think about successful payment and denied payment table
                //If successful than call approve method

                context2.ApproveNewAd(AdID, r.SiteID, r.SectionID, r.PositionID, r.NavigateUrl, r.FormatID, r.ImageUrl,
                                      r.AlternateText, r.Keyword, r.Impressions, r.Width, r.Height, r.StartDate,
                                      r.EndDate, true, r.UserID,
                                      r.LanguageID, r.GenderID, r.AgeRangeID, r.CountryID, r.CountryName, r.RegionID,
                                      r.RegionName, r.CityID,
                                      r.CityName, r.Zipcode, r.IndustryID, r.Profession, r.DateCreated, AdID, r.AdName,
                                      r.AdTypeID, r.CountryCode,
                                      r.FlagPath, r.ProfessionID);
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //Pending Exsiting Ad so update from the user

        if (TextBox1.Text != null)
        {
            int AdID = Convert.ToInt32(TextBox1.Text);


            using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
            {


                int n = (Admanagment.Helpers.Utility.GetNumberofProfessionFromCurrent(AdID));


            var adgeneral = (from ad in context2.AdGenerals
                             where ad.AdID == AdID
                             select ad).ToList();

            var adaudience = (from ad in context2.AdAudiences
                              where ad.AdID == AdID
                              select ad).ToList();


            context2.PendExistingAd(AdID, adgeneral[0].SiteID, adgeneral[0].SectionID,
                                        adgeneral[0].PositionID, adgeneral[0].NavigateUrl,
                                        adgeneral[0].FormatID, adgeneral[0].ImageUrl, adgeneral[0].AlternateText,
                                        adgeneral[0].Keyword, adgeneral[0].Impressions, adgeneral[0].Width,
                                        adgeneral[0].Height, adgeneral[0].StartDate, adgeneral[0].EndDate,
                                        adgeneral[0].AdTypeID, adgeneral[0].UserID, adgeneral[0].AdName,
                                        adaudience[0].LanguageID,
                                        adaudience[0].GenderID, adaudience[0].AgeRangeID, adaudience[0].Zipcode,
                                        adaudience[0].IndustryID, n, adaudience[0].Profession, adaudience[0].DateCreated,
                                        adaudience[0].CountryID, adaudience[0].CountryName, adaudience[0].RegionID,
                                        adaudience[0].RegionName, adaudience[0].CityID, adaudience[0].CityName,
                                        adaudience[0].CountryCode, adaudience[0].FlagPath, adaudience[0].ProfessionID);





            }

        }

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //Success notification
        //Think about successful payment and denied payment table
        //If successful than call approve method
        if (TextBox1.Text != null)
        {
            int AdID = Convert.ToInt32(TextBox1.Text);

            using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
            {
                var r = (from c in context2.PendingAds
                         where c.ID == AdID
                         select c).FirstOrDefault();
                //Success notification
                //Think about successful payment and denied payment table
                //If successful than call approve method

                context2.ApproveExistingAd(AdID, r.SiteID, r.SectionID, r.PositionID, r.NavigateUrl, r.FormatID, r.ImageUrl,
                                      r.AlternateText, r.Keyword, r.Impressions, r.Width, r.Height, r.StartDate,
                                      r.EndDate, true, r.UserID,
                                      r.LanguageID, r.GenderID, r.AgeRangeID, r.CountryID, r.CountryName, r.RegionID,
                                      r.RegionName, r.CityID,
                                      r.CityName, r.Zipcode, r.IndustryID, r.Profession, r.DateCreated, AdID, r.AdName,
                                      r.AdTypeID, r.CountryCode,
                                      r.FlagPath, r.ProfessionID);
            }
        }

    }
}
