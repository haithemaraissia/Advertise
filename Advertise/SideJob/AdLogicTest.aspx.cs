using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web.UI.WebControls;
using Admanagment.Helpers;
using SidejobModel;

public partial class Test2 : System.Web.UI.Page
{
    public const string DefaultIndustry = "1"; //Accommodation and Food Services
    public const string DefaultNumberofProfession = "1";
    public const string DefaultProfession = "1"; //Host
    public const string DefaultKeyword = "1,1,1,1,0,254,154,10182,10185,0,0,0";//Ad127



    private void BannerKeywords()
    {
        var keyword = "";
        using (var context = new AdDatabaseModel.AdDatabaseEntities())
        {
            //var t = KeywordFiltering();
            var t = KeywordFilteringTest("1","1");
            var queryKeywordFilter = (from k in context.AdGenerals
                                      where k.Keyword == t
                                      select k).ToList();

            if (queryKeywordFilter.Count == 0)
            {
                keyword = DefaultKeyword;
            }
            else
            {
               // keyword = KeywordFiltering();
                keyword = KeywordFilteringTest("1", "1");
 
            }

        }
        BannerRotator1.KeywordFilter = keyword;
    }



    protected string KeywordFilteringTest(string positionid, string sectionId)
    {
        var siteId = Utility.GetSideJobSiteID();
        var language = Utility.GetCurrentLCID(Request.QueryString["l"]);
        var sample = siteId + "," + sectionId + "," + positionid + "," + language + ",";



       // GetKeywordAttributes(Convert.ToInt32(sectionId));

        ///////////////////////////////////////Testing/////////////////////////////////
        //UnauthenticatedUser();
         //UnauthenticatedROSSectionUser();
        //////////////////////////////////////Authenticated///////////////////////////
        // CustomerKeywordTest(new Guid("63ab48c0-5c32-41b0-a6e8-8dc5349d7e84"));
        // CustomerROSKeywordTest(new Guid("63ab48c0-5c32-41b0-a6e8-8dc5349d7e84"));
        // ProfessionalKeywordTest(new Guid("e4cb5928-4bf0-428f-98d5-c8f8543299f4"));
         //ProfessionalROSKeywordTest(new Guid("e4cb5928-4bf0-428f-98d5-c8f8543299f4"));
        ///////////////////////////////////////Testing//////////////////////////////////

        sample += Gender +  "," + Country + "," + Region + "," + City + "," + Zipcode + ",";
        sample += Industry + "," + NumberofProfession + "," + Profession;

        return sample;
    }
    protected string KeywordFiltering()
    {

        //Need to construct the keyword
        //Get the Profession ID from AdAudience
        //Check if exist
        //Check if exist depending on the impression : higer impression first
        //IF exist use it,
        //IF doesn't exist, use the default

        //Think about how you going to get the different jobs,may be alter it in the new and edit the compaing
        //Don't forget to include the insert procedure to capture the other data for geo
        //UpdateImpression and Updateclicks are handled like the ones in JobresulTest example
        // UpdateImpression(e.AdProperties["Id"].ToString(), 0);
        //This will have to be if authenticate or not because they are some values in this procedure

        var siteId = Utility.GetSideJobSiteID();



        const string sectionId = "2";
        const string positionid = "2";
        GetKeywordAttributes(Convert.ToInt32(sectionId));



        var language = Utility.GetCurrentLCID(Request.QueryString["l"]);
        var sample = siteId + "," + sectionId + "," + positionid + "," + language + ",";
        GetKeywordAttributes(Convert.ToInt32(sectionId));
        sample += Gender + "," + Age + "," + Country + "," + Region + "," + City + "," + Zipcode + ",";
        sample += Industry + "," + NumberofProfession + "," + Profession;

        return sample;
    }












    public void CustomerKeyword()
    {
        try
        {
            using (var context = new SidejobEntities())
            {
                var customer = (from c in context.CustomerGenerals
                                join cus in context.Customers
                                    on c.CustomerID equals cus.CustomerID
                                where cus.UserID == Utility.GetUserID()
                                select c).FirstOrDefault();
                if (customer != null)
                {
                    //Check if each one is null or zero
                    Gender = customer.Gender.ToString(CultureInfo.InvariantCulture);
                    if (Gender == "null")
                    {
                        Gender = "0";
                    }
                    Country = customer.CountryID.ToString(CultureInfo.InvariantCulture);
                    if (Country == "null")
                    {
                        Country = "0";
                    }
                    Region = customer.RegionID.ToString(CultureInfo.InvariantCulture);
                    if (Region == "null")
                    {
                        Region = "0";
                    }
                    City = customer.CityID.ToString();
                    if (City == "null" || City == "-1")
                    {
                        City = "0";
                    }
                    Zipcode = customer.Zipcode.ToString(CultureInfo.InvariantCulture);
                    if (Zipcode == "null" || Zipcode == "       ")
                    {
                        Zipcode = "0";
                    }
                    Age = customer.Age.ToString(CultureInfo.InvariantCulture);
                    if (Age == "null")
                    {
                        Age = "0";
                    }
                    // Default Values since Customer don't have these fields.                    
                    Industry = DefaultIndustry;
                    NumberofProfession = DefaultNumberofProfession;
                    Profession = DefaultProfession;

                    if (Country == "0" && Region == "0" && City == "0" && Zipcode == "0")
                    {
                        GetInfoFromUserMachine();
                    }
                }
                else
                {
                    //Authenticated, but failted to get the Customer Property
                    GetInfoFromUserMachine();
                }
            }
        }
        catch (Exception)
        {
            GetInfoFromUserMachine();

        }
    }

    public void CustomerROSKeyword()
    {
        try
        {
            using (var context = new SidejobEntities())
            {
                var customer = (from c in context.CustomerGenerals
                                join cus in context.Customers
                                    on c.CustomerID equals cus.CustomerID
                                where cus.UserID == Utility.GetUserID()
                                select c).FirstOrDefault();
                if (customer != null)
                {
                    //Check if each one is null or zero
                    Gender = customer.Gender.ToString(CultureInfo.InvariantCulture);
                    if (Gender == "null")
                    {
                        Gender = "0";
                    }
                    Country = customer.CountryID.ToString(CultureInfo.InvariantCulture);
                    if (Country == "null")
                    {
                        Country = "0";
                    }
                    Region = customer.RegionID.ToString(CultureInfo.InvariantCulture);
                    if (Region == "null")
                    {
                        Region = "0";
                    }
                    City = customer.CityID.ToString();
                    if (City == "null" || City == "-1")
                    {
                        City = "0";
                    }
                    Zipcode = customer.Zipcode.ToString(CultureInfo.InvariantCulture);
                    if (Zipcode == "null" || Zipcode == "       ")
                    {
                        Zipcode = "0";
                    }
                    Age = customer.Age.ToString(CultureInfo.InvariantCulture);
                    if (Age == "null")
                    {
                        Age = "0";
                    }
                    // Default Values since Customer don't have these fields.                    
                    Industry = DefaultIndustry;
                    NumberofProfession = DefaultNumberofProfession;
                    Profession = DefaultProfession;

                    if (Country == "0" && Region == "0" && City == "0" && Zipcode == "0")
                    {
                        GetInfoFromUserMachine();
                    }
                }
                else
                {
                    //Authenticated, but failted to get the Customer Property
                    GetInfoFromUserMachine();
                }
            }
        }
        catch (Exception)
        {
            GetInfoFromUserMachine();

        }
    }

    public void ProfessionalKeyword()
    {
        try
        {
            using (var context = new SidejobEntities())
            {
                var professional = (from p in context.ProfessionalGenerals
                                join pr in context.Professionals
                                    on p.ProID equals pr.ProID
                                where pr.UserID == Utility.GetUserID()
                                select p).FirstOrDefault();
                if (professional != null)
                {
                    //Check if each one is null or zero
                    Gender = professional.Gender.ToString(CultureInfo.InvariantCulture);
                    if (Gender == "null")
                    {
                        Gender = "0";
                    }
                    Country = professional.CountryID.ToString(CultureInfo.InvariantCulture);
                    if (Country == "null")
                    {
                        Country = "0";
                    }
                    Region = professional.RegionID.ToString(CultureInfo.InvariantCulture);
                    if (Region == "null")
                    {
                        Region = "0";
                    }
                    City = professional.CityID.ToString();
                    if (City == "null" || City == "-1")
                    {
                        City = "0";
                    }
                    Zipcode = professional.Zipcode.ToString(CultureInfo.InvariantCulture);
                    if (Zipcode == "null" || Zipcode == "       ")
                    {
                        Zipcode = "0";
                    }
                    Age = professional.Age.ToString(CultureInfo.InvariantCulture);
                    if (Age == "null")
                    {
                        Age = "0";
                    }
                    // Custom Field
                    //Check to see if the professional has the industry and the profession
                    //Use Factorial Method to let the Advertisor chose N! * (N-1)! ways

                    //Get the first industry order by id since keyword only save first industry and if you save more, it will be a complex looping to get the right order
                    var userID = Utility.GetUserID();
                    if (userID != null) ProfessionalProfession((Guid)userID);
                    if (Country == "0" && Region == "0" && City == "0" && Zipcode == "0")
                    {
                        GetInfoFromUserMachine();
                    }

                }
                else
                {
                    GetInfoFromUserMachine();
                }
            }
        }
        catch (Exception)
        {
            GetInfoFromUserMachine();
        }
    }

    public void ProfessionalROSKeyword()
    {
        try
        {
            using (var context = new SidejobEntities())
            {
                var professional = (from p in context.ProfessionalGenerals
                                    join pr in context.Professionals
                                        on p.ProID equals pr.ProID
                                    where pr.UserID == Utility.GetUserID()
                                    select p).FirstOrDefault();
                if (professional != null)
                {
                    //Check if each one is null or zero
                    Gender = professional.Gender.ToString(CultureInfo.InvariantCulture);
                    if (Gender == "null")
                    {
                        Gender = "0";
                    }
                    Country = professional.CountryID.ToString(CultureInfo.InvariantCulture);
                    if (Country == "null")
                    {
                        Country = "0";
                    }
                    Region = professional.RegionID.ToString(CultureInfo.InvariantCulture);
                    if (Region == "null")
                    {
                        Region = "0";
                    }
                    City = professional.CityID.ToString();
                    if (City == "null" || City == "-1")
                    {
                        City = "0";
                    }
                    Zipcode = professional.Zipcode.ToString(CultureInfo.InvariantCulture);
                    if (Zipcode == "null" || Zipcode == "       ")
                    {
                        Zipcode = "0";
                    }
                    Age = professional.Age.ToString(CultureInfo.InvariantCulture);
                    if (Age == "null")
                    {
                        Age = "0";
                    }
                    // Custom Field
                    //Check to see if the professional has the industry and the profession
                    //Use Factorial Method to let the Advertisor chose N! * (N-1)! ways

                    //Get the first industry order by id since keyword only save first industry and if you save more, it will be a complex looping to get the right order
                    var userID = Utility.GetUserID();
                    if (userID != null) ProfessionalProfession((Guid) userID);
                    if (Country == "0" && Region == "0" && City == "0" && Zipcode == "0")
                    {
                        GetInfoFromUserMachine();
                    }
                }
                else
                {
                    //Authenticated, but failted to get the Customer Property
                    GetInfoFromUserMachine();
                }
            }
        }
        catch (Exception)
        {
            GetInfoFromUserMachine();
        }
    }

    public void ProfessionalProfession(Guid userID)
    {
        try
        {
            using (var context = new SidejobEntities())
            {
                var pId = ((from pr in context.Professionals
                            where pr.UserID == userID
                            select pr.ProID).FirstOrDefault());

                var professionquery = (from p in context.ProfessionalSkills
                                       join s in context.Skills
                                       on p.SkillID equals s.SkillID
                                       where p.ProID == pId
                                       orderby s.CategoryID
                                       select s).ToList();
                Profession = professionquery.Aggregate("", (current, t) => current + (t.JobID + ","));
                if (professionquery.Count > 0)
                {
                    Profession = Profession.Remove(Profession.Length - 1);
                }
                var category = professionquery.FirstOrDefault();
                Industry = category != null ? category.CategoryID.ToString(CultureInfo.InvariantCulture) : DefaultIndustry;
                NumberofProfession = professionquery.Count == 0 ? DefaultNumberofProfession : professionquery.Count.ToString(CultureInfo.InvariantCulture);
            }
        }
        catch (Exception)
        {
            Profession = DefaultProfession;
            Industry = DefaultIndustry;
            NumberofProfession = DefaultNumberofProfession;
        }
    }





    //////////////////////////USED FOR TESTING///////////////////////////

    public void CustomerKeywordTest(Guid UserID)
    {
        try
        {
            using (var context = new SidejobEntities())
            {
                var customer = (from c in context.CustomerGenerals
                                join cus in context.Customers
                                    on c.CustomerID equals cus.CustomerID
                                where cus.UserID == UserID
                                select c).FirstOrDefault();
                if (customer != null)
                {
                    //Check if each one is null or zero
                    Gender = customer.Gender.ToString(CultureInfo.InvariantCulture);
                    if (Gender == "null")
                    {
                        Gender = "0";
                    }
                    Country = customer.CountryID.ToString(CultureInfo.InvariantCulture);
                    if (Country == "null")
                    {
                        Country = "0";
                    }
                    Region = customer.RegionID.ToString(CultureInfo.InvariantCulture);
                    if (Region == "null")
                    {
                        Region = "0";
                    }
                    City = customer.CityID.ToString();
                    if (City == "null" || City == "-1")
                    {
                        City = "0";
                    }
                    Zipcode = customer.Zipcode.ToString(CultureInfo.InvariantCulture);
                    if (Zipcode == "null" || Zipcode == "       ")
                    {
                        Zipcode = "0";
                    }
                    Age = customer.Age.ToString(CultureInfo.InvariantCulture);
                    if (Age == "null")
                    {
                        Age = "0";
                    }
                    // Default Values since Customer don't have these fields.                    
                    Industry = DefaultIndustry;
                    NumberofProfession = DefaultNumberofProfession;
                    Profession = DefaultProfession;

                    if (Country == "0" && Region == "0" && City == "0" && Zipcode == "0")
                    {
                        GetInfoFromUserMachine();
                    }
                }
                else
                {
                    //Authenticated, but failted to get the Customer Property
                    GetInfoFromUserMachine();
                }
            }
        }
        catch (Exception)
        {
            GetInfoFromUserMachine();

        }
    }
    public void CustomerROSKeywordTest(Guid UserID)
    {
        try
        {
            using (var context = new SidejobEntities())
            {
                var customer = (from c in context.CustomerGenerals
                                join cus in context.Customers
                                    on c.CustomerID equals cus.CustomerID
                                where cus.UserID == UserID
                                select c).FirstOrDefault();
                if (customer != null)
                {
                    //Check if each one is null or zero
                    Gender = customer.Gender.ToString(CultureInfo.InvariantCulture);
                    if (Gender == "null")
                    {
                        Gender = "0";
                    }
                    Country = customer.CountryID.ToString(CultureInfo.InvariantCulture);
                    if (Country == "null")
                    {
                        Country = "0";
                    }
                    Region = customer.RegionID.ToString(CultureInfo.InvariantCulture);
                    if (Region == "null")
                    {
                        Region = "0";
                    }
                    City = customer.CityID.ToString();
                    if (City == "null" || City == "-1")
                    {
                        City = "0";
                    }
                    Zipcode = customer.Zipcode.ToString(CultureInfo.InvariantCulture);
                    if (Zipcode == "null" || Zipcode == "       ")
                    {
                        Zipcode = "0";
                    }
                    Age = customer.Age.ToString(CultureInfo.InvariantCulture);
                    if (Age == "null")
                    {
                        Age = "0";
                    }
                    // Default Values since Customer don't have these fields.                    
                    Industry = DefaultIndustry;
                    NumberofProfession = DefaultNumberofProfession;
                    Profession = DefaultProfession;

                    if (Country == "0" && Region == "0" && City == "0" && Zipcode == "0")
                    {
                        GetInfoFromUserMachine();
                    }
                }
                else
                {
                    //Authenticated, but failted to get the Customer Property
                    GetInfoFromUserMachine();
                }
            }
        }
        catch (Exception)
        {
            GetInfoFromUserMachine();

        }
    }
    public void ProfessionalKeywordTest(Guid UserID)
    {
        try
        {
            using (var context = new SidejobEntities())
            {
                var professional = (from p in context.ProfessionalGenerals
                                    join pr in context.Professionals
                                        on p.ProID equals pr.ProID
                                    where pr.UserID == UserID
                                    select p).FirstOrDefault();
                if (professional != null)
                {
                    //Check if each one is null or zero
                    Gender = professional.Gender.ToString(CultureInfo.InvariantCulture);
                    if (Gender == "null")
                    {
                        Gender = "0";
                    }
                    Country = professional.CountryID.ToString(CultureInfo.InvariantCulture);
                    if (Country == "null")
                    {
                        Country = "0";
                    }
                    Region = professional.RegionID.ToString(CultureInfo.InvariantCulture);
                    if (Region == "null")
                    {
                        Region = "0";
                    }
                    City = professional.CityID.ToString();
                    if (City == "null" || City == "-1")
                    {
                        City = "0";
                    }
                    Zipcode = professional.Zipcode.ToString(CultureInfo.InvariantCulture);
                    if (Zipcode == "null" || Zipcode == "       ")
                    {
                        Zipcode = "0";
                    }
                    Age = professional.Age.ToString(CultureInfo.InvariantCulture);
                    if (Age == "null")
                    {
                        Age = "0";
                    }
                    // Custom Field
                    //Check to see if the professional has the industry and the profession
                    //Use Factorial Method to let the Advertisor chose N! * (N-1)! ways

                    //Get the first industry order by id since keyword only save first industry and if you save more, it will be a complex looping to get the right order
                    ProfessionalProfession(new Guid("e4cb5928-4bf0-428f-98d5-c8f8543299f4"));
                    if (Country == "0" && Region == "0" && City == "0" && Zipcode == "0")
                    {
                        GetInfoFromUserMachine();
                    }


                }
                else
                {
                    GetInfoFromUserMachine();
                }
            }
        }
        catch (Exception)
        {
            GetInfoFromUserMachine();
        }
    }
    public void ProfessionalROSKeywordTest(Guid UserID)
    {
        try
        {
            using (var context = new SidejobEntities())
            {
                var professional = (from p in context.ProfessionalGenerals
                                    join pr in context.Professionals
                                        on p.ProID equals pr.ProID
                                    where pr.UserID == UserID
                                    select p).FirstOrDefault();
                if (professional != null)
                {
                    //Check if each one is null or zero
                    Gender = professional.Gender.ToString(CultureInfo.InvariantCulture);
                    if (Gender == "null")
                    {
                        Gender = "0";
                    }
                    Country = professional.CountryID.ToString(CultureInfo.InvariantCulture);
                    if (Country == "null")
                    {
                        Country = "0";
                    }
                    Region = professional.RegionID.ToString(CultureInfo.InvariantCulture);
                    if (Region == "null")
                    {
                        Region = "0";
                    }
                    City = professional.CityID.ToString();
                    if (City == "null" || City == "-1")
                    {
                        City = "0";
                    }
                    Zipcode = professional.Zipcode.ToString(CultureInfo.InvariantCulture);
                    if (Zipcode == "null" || Zipcode == "       ")
                    {
                        Zipcode = "0";
                    }
                    Age = professional.Age.ToString(CultureInfo.InvariantCulture);
                    if (Age == "null")
                    {
                        Age = "0";
                    }
                    // Custom Field
                    //Check to see if the professional has the industry and the profession
                    //Use Factorial Method to let the Advertisor chose N! * (N-1)! ways

                    //Get the first industry order by id since keyword only save first industry and if you save more, it will be a complex looping to get the right order
                    ProfessionalProfession(new Guid("e4cb5928-4bf0-428f-98d5-c8f8543299f4"));
                    if (Country == "0" && Region == "0" && City == "0" && Zipcode == "0")
                    {
                        GetInfoFromUserMachine();
                    }
                }
                else
                {
                    //Authenticated, but failted to get the Customer Property
                    GetInfoFromUserMachine();
                }
            }
        }
        catch (Exception)
        {
            GetInfoFromUserMachine();
        }
    }


    ////////////////////////////////////CORRECT///////////////////////////
    public string Gender { get; set; }
    public string Age { get; set; }
    public string Country { get; set; }
    public string Region { get; set; }
    public string City { get; set; }
    public string Zipcode { get; set; }
    public string Industry { get; set; }
    public string NumberofProfession { get; set; }
    public string Profession { get; set; }

    public void GetInfoFromUserMachine()
    {
        var lastresort = Utility.GetInfo();
        Gender = "0";
        Age = "0";
        Industry = "0";
        NumberofProfession = "0";
        Profession = "0";
        Country = lastresort.CountryID.ToString(CultureInfo.InvariantCulture);
        Region = lastresort.RegionID.ToString(CultureInfo.InvariantCulture);
        City = lastresort.CityID.ToString(CultureInfo.InvariantCulture);
        Zipcode = lastresort.Zipcode.ToString(CultureInfo.InvariantCulture);
    }    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        BannerKeywords();
    }

    protected string GetCurrentLCID()
    {
        var lang = Request.QueryString["l"];
        if (lang != null | !string.IsNullOrEmpty(lang))
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
            return Utility.GetLCID(lang).ToString(CultureInfo.InvariantCulture);
        }
        else
        {
            return "1";
        }

    }

    protected override void InitializeCulture()
    {
        var lang = Request.QueryString["l"];
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
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
            }
        }

    }    
    
    protected void AdRotator1AdCreated(object sender, AdCreatedEventArgs e)
    {
        e.NavigateUrl = "~/Advertiser/AdHandler.ashx?id=" + e.AdProperties["ID"];
    }

    protected void GetKeywordAttributes(int sectionid)
    {
        switch (sectionid)
        {
            case 1:
                if (User.Identity.IsAuthenticated)
                {
                    AuthenticatedROSSectionUser();
                }
                else
                {
                    UnauthenticatedROSSectionUser();
                }
                break;
            case 2 - 8:
                if (User.Identity.IsAuthenticated)
                {
                    AuthenticatedUser();
                }
                else
                {
                    UnauthenticatedUser();
                }
                break;
            default:
                if (User.Identity.IsAuthenticated)
                {
                    AuthenticatedUser();
                }
                else
                {
                    UnauthenticatedUser();
                }
                break;
        }
    }    
    
    protected void AuthenticatedUser()
    {
        if (User.IsInRole("Customer"))
        {
            CustomerKeyword();
        }

        if (User.IsInRole("Professional"))
        {
            ProfessionalKeyword();
        }
    }

    protected void UnauthenticatedUser()
    {
        GetInfoFromUserMachine();
    }

    protected void AuthenticatedROSSectionUser()
    {
        if (User.IsInRole("Customer"))
        {
            CustomerROSKeyword();
        }

        if (User.IsInRole("Professional"))
        {
            ProfessionalROSKeyword();
        }
    }

    protected void UnauthenticatedROSSectionUser()
    {
        GetInfoFromUserMachine();
    }


}



