using System;
using System.Linq;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using SidejobModel;

namespace SideJob
{
    public partial class SideJobSEOPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Regular();
            //CustomerPage();
            //ProfessionalPage();
            AdvertiserPage();

            //Make these functions more static and embedded so that you have less code in the page with a class or something
        }

        protected void SEOSiteMap()
        {
            Page.Title = Resources.Resource.HomeTitle;

            var nl1 = new System.Web.UI.WebControls.Literal {Text = Environment.NewLine};
            var title = new HtmlMeta {Name = "title", Content = Resources.Resource.HomeTitle};
            Page.Header.Controls.AddAt(1, title);

            var description = new HtmlMeta {Name = "description", Content = Resources.Resource.HomeDescription};
            Page.Header.Controls.AddAt(2, description);

            var keywords = new HtmlMeta {Name = "keywords", Content = Resources.Resource.HomeKeywords};
            Page.Header.Controls.AddAt(3, keywords);
        }

        protected void Regular()
        {
            //Regular page
            //Not Authenticated
            SEOSiteMap();
        }

        protected void ProfessionalPage()
        {

            ///////////////CLEAN THIS MORE///////////////

            //Example: 
            //Authenticated
            //Customer Profile 

            using (var context = new SidejobEntities())
            {
                var professional = (from c in context.ProfessionalGenerals
                                    where c.ProID == 85
                                    select c).FirstOrDefault();

                var professionalportfolio = (from c in context.ProfessionalPortfolios
                                             where c.ProID == 85
                                             select c).FirstOrDefault();

                if (professional != null)
                {
                    var customertitle = professional.FirstName + " " + professional.LastName + " " +
                                        professional.CountryName + "," +
                                        professional.RegionName
                                        + "," + professional.CityName;

                    //Page Title  + Page Attributes like Profile, photo, add photo
                    Page.Title = professional.FirstName + " " + professional.LastName + "Profile or Images";
                    var nl1 = new System.Web.UI.WebControls.Literal {Text = Environment.NewLine};

                    //Title
                    var title = new HtmlMeta {Name = "title", Content = CrawlerStringLimit(customertitle)};
                    Page.Header.Controls.AddAt(1, title);

                    //Description
                    if (professionalportfolio != null)
                    {
                        var customerdescription = professionalportfolio.About;
                        var description = new HtmlMeta
                                              {Name = "description", Content = CrawlerStringLimit(customerdescription)};
                        Page.Header.Controls.AddAt(2, description);
                    }

                    //username +   + Page Attributes like Profile, photo, add photo
                    var keyword = professional.UserName + Resources.Resource.HomeKeywords;
                    var keywords = new HtmlMeta {Name = "keywords", Content = CrawlerStringLimit(keyword)};
                    Page.Header.Controls.AddAt(3, keywords);

                    //Author
                    var customerauthor = professional.FirstName + " " + professional.LastName;
                    var author = new HtmlMeta {Name = "auhtor", Content = CrawlerStringLimit(customerauthor)};
                    Page.Header.Controls.AddAt(4, author);
                }
            }
        }

        protected void CustomerPage()
        {

            ///////////////CLEAN THIS MORE///////////////

            //Example: 
            //Authenticated
            //Customer Profile 

            using (var context = new SidejobEntities())
            {
                var customer = (from c in context.CustomerGenerals
                                where c.CustomerID == 85
                                select c).FirstOrDefault();

                var customerportfolio = (from c in context.CustomerPortfolios
                                         where c.CustomerID == 85
                                         select c).FirstOrDefault();

                if (customer != null)
                {
                    var customertitle = customer.FirstName + " " + customer.LastName + " " + customer.CountryName + "," +
                                        customer.RegionName
                                        + "," + customer.CityName;

                    //Page Title  + Page Attributes like Profile, photo, add photo
                    Page.Title = customer.FirstName + " " + customer.LastName + "Profile or Images";
                    var nl1 = new System.Web.UI.WebControls.Literal {Text = Environment.NewLine};

                    //Title
                    var title = new HtmlMeta {Name = "title", Content = CrawlerStringLimit(customertitle)};
                    Page.Header.Controls.AddAt(1, title);

                    //Description
                    if (customerportfolio != null)
                    {
                        var customerdescription = customerportfolio.About;
                        var description = new HtmlMeta
                                              {Name = "description", Content = CrawlerStringLimit(customerdescription)};
                        Page.Header.Controls.AddAt(2, description);
                    }


                    //username +   + Page Attributes like Profile, photo, add photo
                    var keyword = customer.UserName + Resources.Resource.HomeKeywords;
                    var keywords = new HtmlMeta {Name = "keywords", Content = CrawlerStringLimit(keyword)};
                    Page.Header.Controls.AddAt(3, keywords);

                    //Author
                    var customerauthor = customer.FirstName + " " + customer.LastName;
                    var author = new HtmlMeta {Name = "auhtor", Content = CrawlerStringLimit(customerauthor)};
                    Page.Header.Controls.AddAt(4, author);
                }
            }
        }

        protected string CrawlerStringLimit(string c)
        {
            return c.Length >= 160 ? c.Substring(0, 160) : c;
        }

        protected void AdvertiserPage()
        {
            //Example: 
            //Authenticated
            //Advertiser Profile 

            ///////////////CLEAN THIS MORE///////////////
            // DELETE WHEN TEST IS COMPLETE//
            var user = Membership.GetUser();
            if (user != null)
            {
                var userKey = user.ProviderUserKey;

                if (userKey != null)
                {
                    // DELETE WHEN TEST IS COMPLETE//
                    var city = Profile.City;

                    if (Profile.City != "null" || Profile.City != "-1")
                    {
                        city = "";
                    }

                    var customtitle = Profile.FirstName + " " + Profile.LastName + Profile.Country + "," +
                                      Profile.Region + "," + city;
                    //Page Title  + Page Attributes like Profile, photo, add photo
                    Page.Title = Profile.FirstName + " " + Profile.LastName + "Profile or Images";

                    //Title
                    var title = new HtmlMeta {Name = "title", Content = CrawlerStringLimit(customtitle)};
                    Page.Header.Controls.AddAt(1, title);

                    var description = new HtmlMeta{Name = "description", Content = CrawlerStringLimit(Profile.Description)};
                    Page.Header.Controls.AddAt(2, description);

                    //username +   + Page Attributes like Profile, photo, add photo
                    var keyword = Profile.UserName + Resources.Resource.HomeKeywords;
                    var keywords = new HtmlMeta {Name = "keywords", Content = CrawlerStringLimit(keyword)};
                    Page.Header.Controls.AddAt(3, keywords);

                    //Author
                    var advertiser = Profile.FirstName + " " + Profile.LastName;
                    var author = new HtmlMeta {Name = "auhtor", Content = CrawlerStringLimit(advertiser)};
                    Page.Header.Controls.AddAt(4, author);
                }
            }
        }

    }
}