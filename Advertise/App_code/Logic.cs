using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using AdDatabaseModel;
using Admanagment;
using Admanagment.Helpers;
using Org.BouncyCastle.Math;
using SidejobModel;

namespace App_code
{
    public class Logic
    {



        //public void SetCustomPageKeywordVariables(string i, string n, string p)
        //{
        //    Industry = i;
        //    NumberofProfession = n;
        //    Profession = p;
        //}

        //public void SetDefaultPageKeywordVariables()
        //{
        //    Industry = DefaultIndustry;
        //    NumberofProfession = DefaultNumberofProfession;
        //    Profession = DefaultProfession;
        //}





        //public void testFunction()
        //{
        //    var industryList = new List<int>();
        //    var jobList = new List<string>();

        //         using (var context = new SidejobEntities()) 
        //         {
        //            var professionquery = (from p in context.ProfessionalSkills
        //                           join s in context.ProfessionalSkills
        //                           on p.ProID equals s.ProID
        //                           where p.ProID == 75
        //                           select s).ToList();
        //            foreach (var l in professionquery)
        //            {
        //                int r = Convert.ToInt32(l.SkillID);
        //                var k = (from s1 in context.Skills
        //                         where s1.SkillID == r
        //                         select s1).FirstOrDefault();
        //                if (k != null) industryList.Add(k.CategoryID);
        //                jobList.Add(l.SkillID.ToString(CultureInfo.InvariantCulture));
        //            }
        //         }

        //    var lowestindustry = industryList.Min();



        //}








        //protected string GetKeywordString()
        //{
        //    var result = SiteDropDownList.SelectedValue + ","
        //                 + SectionDropDownList.SelectedValue + ","
        //                 + PositionDropDownList.SelectedValue + ","
        //                 + LanguageDropDownList.SelectedValue + ","
        //                 + GenderDropDownList.SelectedValue + ","
        //                 + AgeDropDownList.SelectedValue + ","
        //                 + CountryDropDownList.SelectedValue + ","
        //                 + Admanagment.Helpers.Utility.GetRegion(RegionsDropDownList) + ","
        //                 + GetCityID() + ","
        //                 +
        //                 Helpers.Utility.GetZipcode(Convert.ToInt32(CountryDropDownList.SelectedValue),
        //                                            Convert.ToInt32(RegionsDropDownList.SelectedValue),
        //                                            GetCityName(), ZipcodeTextBox.Text) + ","
        //                 + IndustryDropDownList.SelectedValue + ","
        //                 + Helpers.Utility.GetNumberOfProfession(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3) + ","
        //                 + Helpers.Utility.GetProfession(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3);
        //    return result;
        //}

        /*------------------------- Documentation - Section ID---------------------------*/

        private Dictionary<int, string> Sections = new Dictionary<int, string>
                                                       {
                                                           {1, "ROS"},
                                                           {2, "Job Result"},
                                                           {3, "Professional Result"},
                                                           {4, "Customer Profile"},
                                                           {5, "Professional Profile"},
                                                           {6, "Project  Profile"},
                                                           {7, "Find Job"},
                                                           {8, "Find Professional"},
                                                       };

        private Dictionary<int, string> ROSSection = new Dictionary<int, string>
                                                         {
                                                             {1, "Index"},
                                                             {2, "SignIn"},
                                                             {3, "SignUp"},
                                                             {4, "SiteMap"},
                                                             {5, "PasswordRecovery"},
                                                             {6, "Help"},
                                                             {7, "How does it work"},
                                                             {8, "Benefits"},
                                                             {9, "Privacy"},
                                                             {10, "AboutUS"},
                                                             {11, "ContactUS"},
                                                             {12, "Product"},
                                                             {13, "Subscribe"},
                                                             {14, "Newsletter"},
                                                             {15, "Newsletter2"},
                                                             {16, "Business"},
                                                             {17, "Eblast"},
                                                             {18, "LockedUser"},
                                                             {19, "APIDocumentation"},
                                                         };

        private Dictionary<int, string> JobResultSection = new Dictionary<int, string>
                                                               {
                                                                   {1, "Job result"},
                                                               };

        private Dictionary<int, string> ProfessionalResultSection = new Dictionary<int, string>
                                                                        {
                                                                            {1, "Professional Result"},
                                                                        };

        private Dictionary<int, string> CustomerProfileSection = new Dictionary<int, string>
                                                                     {
                                                                         {1, "ViewCustomerProfile"},
                                                                         {2, "CustomerProfile"},
                                                                         {3, "EditAlbum"},
                                                                         {4, "EditPhoto"},
                                                                         {5, "EditProfile"},
                                                                         {6, "RearrangePhoto"},
                                                                         {7, "UploadCustomerPhoto"},
                                                                     };

        private Dictionary<int, string> ProfessionalProfileSection = new Dictionary<int, string>
                                                                         {
                                                                             {1, "ViewProfessional"},
                                                                             {2, "EditAlbum"},
                                                                             {3, "EditPhoto"},
                                                                             {4, "EditProfile"},
                                                                             {5, "EditWorkAlbum"},
                                                                             {6, "EditWorkPhoto"},
                                                                             {7, "EditWorkShopProfile"},
                                                                             {8, "ProfessionalProfile"},
                                                                             {9, "ReaarrangePhoto"},
                                                                             {10, "ReaarrangeWorkPhoto"},
                                                                             {11, "UploadProfessionalPhoto"},
                                                                             {12, "UploadProfessionalWorkPhoto"},
                                                                         };

        private Dictionary<int, string> ProjectProfileSection = new Dictionary<int, string>
                                                                    {
                                                                        {1, "PostProject"},
                                                                        {2, "PostProjectDescription"},
                                                                        {3, "ProjectUpload"},
                                                                        {4, "ViewProject"},
                                                                    };

        private Dictionary<int, string> FindJobSection = new Dictionary<int, string>
                                                             {
                                                                 {1, "FindJob"},
                                                             };

        private Dictionary<int, string> FindProfessionalSection = new Dictionary<int, string>
                                                                      {
                                                                          {1, "FindProfessional"},
                                                                      };




















        /*------------------------- Documentation---------------------------*/
        /* Documentation - Section ID
    *  Top:1
    *  Middle:2
 */


        public static string Gender { get; set; }
        public static string Age { get; set; }
        public static string Country { get; set; }
        public static string Region { get; set; }
        public static string City { get; set; }
        public static string Zipcode { get; set; }
        public static string Industry { get; set; }
        public static string NumberofProfession { get; set; }
        public static string Profession { get; set; }
        public static string DefaultIndustry = "1"; //Accommodation and Food Services
        public static string DefaultNumberofProfession = "1";
        public static string DefaultProfession = "1"; //Host
        public static string CurrentLcid;

        /// <summary>
        /// ROS
        /// </summary>
        public static string DefaultTopNoAuthenticatedROSKeyword = "1,1,1,1,0,254,154,10182,10185,0,0,0"; //Ad177

        public static string DefaultRightNoAuthenticatedROSKeyword = "1,1,1,1,1,254,138,76,66051,1,1,2"; //Ad178

        public static string DefaultTopAuthenticatedCustomerROSKeyword = "1,1,1,1,1,254,138,76,66051,1,1,3"; //Ad1180
        public static string DefaultRightAuthenticatedCustomerROSKeyword = "1,1,1,1,1,254,138,76,66051,1,1,4"; //Ad181

        public static string DefaultTopAuthenticatedProfessionalROSKeyword = "1,1,1,1,1,254,138,76,66051,1,1,6";
                             //Ad1182

        public static string DefaultRightAuthenticatedProfessionalROSKeyword = "1,1,1,1,1,254,138,76,66051,1,1,5";
                             //Ad183

        public static string DefaultTopAuthenticatedAdvertiserROSKeyword = "1,1,1,1,1,254,138,76,66051,1,1,7"; //Ad1184
        public static string DefaultRightAuthenticatedAdvertiserROSKeyword = "1,1,1,1,1,254,138,76,66051,1,1,8"; //Ad185

        public static string GetDefaultTopKeyword(string sectionid)
        {
            switch (sectionid)
            {
                case "1":
                    return TopROS();
                default:
                    return DefaultTopNoAuthenticatedROSKeyword;
            }
        }

        public static string GetDefaultRightKeyword(string sectionid)
        {
            switch (sectionid)
            {
                case "1":
                    return RightROS();
                default:
                    return DefaultTopNoAuthenticatedROSKeyword;
            }
        }

        public static string TopROS()
        {
            var top = DefaultTopNoAuthenticatedROSKeyword;
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (HttpContext.Current.User.IsInRole("Customer"))
                {
                    top = DefaultTopAuthenticatedCustomerROSKeyword;
                }
                if (HttpContext.Current.User.IsInRole("Professional"))
                {
                    top = DefaultTopAuthenticatedProfessionalROSKeyword;
                }
                if (HttpContext.Current.User.IsInRole("Advertiser"))
                {
                    top = DefaultTopAuthenticatedAdvertiserROSKeyword;
                }
            }
            return top;
        }

        public static string RightROS()
        {
            var right = DefaultRightNoAuthenticatedROSKeyword;
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (HttpContext.Current.User.IsInRole("Customer"))
                {
                    right = DefaultRightAuthenticatedCustomerROSKeyword;
                }
                if (HttpContext.Current.User.IsInRole("Professional"))
                {
                    right = DefaultRightAuthenticatedProfessionalROSKeyword;
                }
                if (HttpContext.Current.User.IsInRole("Advertiser"))
                {
                    right = DefaultRightAuthenticatedAdvertiserROSKeyword;
                }
            }
            return right;
        }

        /// <summary>
        /// ROS
        /// </summary>
        public static void GetKeywordAttributes(int sectionid)
        {
            switch (sectionid)
            {
                case 1:
                    if (HttpContext.Current.User.Identity.IsAuthenticated)
                    {
                        AuthenticatedROSSectionUser();
                    }
                    else
                    {
                        UnauthenticatedROSSectionUser();
                    }
                    break;
                case 2 - 8:
                    if (HttpContext.Current.User.Identity.IsAuthenticated)
                    {
                        AuthenticatedUser();
                    }
                    else
                    {
                        UnauthenticatedUser();
                    }
                    break;
                case 10:
                    if (HttpContext.Current.User.Identity.IsAuthenticated)
                    {
                        AuthenticatedROSAdvertiserUser();
                    }
                    else
                    {
                        UnauthenticatedUser();
                    }
                    break;
                default:
                    if (HttpContext.Current.User.Identity.IsAuthenticated)
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

        public static void AuthenticatedUser()
        {
            if (HttpContext.Current.User.IsInRole("Customer"))
            {
                CustomerKeyword();
            }

            if (HttpContext.Current.User.IsInRole("Professional"))
            {
                ProfessionalKeyword();
            }
        }

        public static void UnauthenticatedUser()
        {
            GetInfoFromUserMachine();
        }

        public static void AuthenticatedROSSectionUser()
        {
            if (HttpContext.Current.User.IsInRole("Customer"))
            {
                CustomerROSKeyword();
            }

            if (HttpContext.Current.User.IsInRole("Professional"))
            {
                ProfessionalROSKeyword();
            }
        }

        public static void UnauthenticatedROSSectionUser()
        {
            GetInfoFromUserMachine();
        }

        public static void AuthenticatedROSAdvertiserUser()
        {
            if (HttpContext.Current.User.IsInRole("Advertiser"))
            {
                AdvertiserKeyword();
            }
        }

        public static void CustomerKeyword()
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
                        if (customer.CityID != null)
                            City = Convert.ToString(customer.CityID);
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
                        GetInfoFromUserMachine();
                    }
                }
            }
            catch (Exception)
            {
                GetInfoFromUserMachine();

            }
        }

        public static void AdvertiserKeyword()
        {
            try
            {
                Gender = HttpContext.Current.Profile["Gender"].ToString();
                Country = HttpContext.Current.Profile["CountryID"].ToString();
                Region = HttpContext.Current.Profile["RegionID"].ToString();
                City = HttpContext.Current.Profile["CityID"].ToString();
                Age = HttpContext.Current.Profile["Age"].ToString();
                Zipcode = HttpContext.Current.Profile["Zipcode"].ToString();
                Industry = HttpContext.Current.Profile["Industry"].ToString();
                Profession = HttpContext.Current.Profile["ProfessionID"].ToString();
                if (Gender == "null")
                {
                    Gender = "0";
                }
                if (Country == "null")
                {
                    Country = "0";
                }
                if (Region == "null")
                {
                    Region = "0";
                }
                if (City == "null" || City == "-1")
                {
                    City = "0";
                }
                if (Age == "null")
                {
                    Age = "0";
                }
                if (Zipcode == "null" || Zipcode == "       ")
                {
                    Zipcode = "0";
                }
                if (Industry == "null")
                {
                    Industry = "0";
                }
                if (Profession == "null")
                {
                    Profession = "0";
                }
                // Default Values since Customer don't have these fields.                    
                NumberofProfession = DefaultNumberofProfession;

                if (Country == "0" && Region == "0" && City == "0" && Zipcode == "0")
                {
                    GetInfoFromUserMachine();
                }
            }
            catch (Exception)
            {
                GetInfoFromUserMachine();

            }
        }

        public static void CustomerROSKeyword()
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
                        if (customer.CityID != null)
                            City = Convert.ToString(customer.CityID);
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

        public static void ProfessionalKeyword()
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
                        if (professional.CityID != null)
                            City = Convert.ToString(professional.CityID);
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
                        GetInfoFromUserMachine();
                    }
                }
            }
            catch (Exception)
            {
                GetInfoFromUserMachine();
            }
        }

        public static void ProfessionalROSKeyword()
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
                        if (professional.CityID != null)
                            City = Convert.ToString(professional.CityID);
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

        public static void ProfessionalProfession(Guid userID)
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
                    Industry = category != null
                                   ? category.CategoryID.ToString(CultureInfo.InvariantCulture)
                                   : DefaultIndustry;
                    NumberofProfession = professionquery.Count == 0
                                             ? DefaultNumberofProfession
                                             : professionquery.Count.ToString(CultureInfo.InvariantCulture);
                }
            }
            catch (Exception)
            {
                Profession = DefaultProfession;
                Industry = DefaultIndustry;
                NumberofProfession = DefaultNumberofProfession;
            }
        }

        public static void GetInfoFromUserMachine()
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



































        public static void ValidateUserImpression()
        {
            var user = Membership.GetUser();
            if (user == null)
            {
                UserImpression.NonAuthenticatedUserImpression();
            }
            else
            {
                if (HttpContext.Current.User.IsInRole("CUS"))
                {
                    CustomerUserImpression();
                }
                else if (HttpContext.Current.User.IsInRole("PRO"))
                {
                    ProfessionalUserImpression();
                }
                else if (HttpContext.Current.User.IsInRole("Advertiser"))
                {
                    if (user.ProviderUserKey != null)
                        AdvertiserUserImpression(GetAdvertiserId((Guid)user.ProviderUserKey));
                }
                else
                {
                    UserImpression.NonAuthenticatedUserImpression();
                }
            }
        }

        public static void CustomerUserImpression()
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
                    string city = customer.CityID != null
                                      ? customer.CityID.Value.ToString(CultureInfo.InvariantCulture)
                                      : "128";

                    UserImpression.AuthenticatedUserImpression(customer.CustomerID, "CUS", customer.FirstName,
                                                               customer.LastName, customer.Address,
                                                               customer.HomePhoneNumber,
                                                               customer.Age.ToString(
                                                                   CultureInfo.InvariantCulture),
                                                               customer.Gender, customer.EmailAddress,
                                                               customer.PhotoPath,
                                                               customer.CountryID.ToString(
                                                                   CultureInfo.InvariantCulture),
                                                               customer.RegionID.ToString(
                                                                   CultureInfo.InvariantCulture),
                                                               city, customer.Zipcode, 0, 0,
                                                               Convert.ToInt32(
                                                                   CurrentLcid.ToString(
                                                                       CultureInfo.InvariantCulture)));
                }
                else
                {
                    UserImpression.NonAuthenticatedUserImpression();
                }
            }
        }

        public static void ProfessionalUserImpression()
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
                    string city = professional.CityID != null
                                      ? professional.CityID.Value.ToString(CultureInfo.InvariantCulture)
                                      : "128";

                    UserImpression.AuthenticatedUserImpression(professional.ProID, "PRO", professional.FirstName,
                                                               professional.LastName, professional.Address,
                                                               professional.HomePhoneNumber,
                                                               professional.Age.ToString(CultureInfo.InvariantCulture),
                                                               professional.Gender, professional.EmailAddress,
                                                               professional.PhotoPath,
                                                               professional.CountryID.ToString(
                                                                   CultureInfo.InvariantCulture),
                                                               professional.RegionID.ToString(
                                                                   CultureInfo.InvariantCulture),
                                                               city, professional.Zipcode, 0, 0,
                                                               Convert.ToInt32(CurrentLcid));
                }
                else
                {
                    UserImpression.NonAuthenticatedUserImpression();
                }
            }
        }

        public static void AdvertiserUserImpression(int advertiserId)
        {
            using (new SidejobEntities())
            {
                try
                {
                    UserImpression.ImpressionUserID = advertiserId;
                    UserImpression.ImpressionUserRole = "Advertiser";
                    UserImpression.ImpressionFirstName =
                        (string)
                        (HttpContext.Current.Profile["FirstName"].ToString() == "null"
                             ? Resources.Resource.Unkown
                             : HttpContext.Current.Profile["FirstName"]);
                    UserImpression.ImpressionLastName =
                        (string)
                        (HttpContext.Current.Profile["LastName"].ToString() == "null"
                             ? Resources.Resource.Unkown
                             : HttpContext.Current.Profile["LastName"]);
                    UserImpression.ImpressionAddress =
                        Utility.GetAdvertiserLocation((string) HttpContext.Current.Profile["City"],
                                                      (string) HttpContext.Current.Profile["Region"],
                                                      (string) HttpContext.Current.Profile["Country"]);
                    UserImpression.ImpressionPhone =
                        (string)
                        (HttpContext.Current.Profile["Cellphone"].ToString() == "null"
                             ? Resources.Resource.Unkown
                             : HttpContext.Current.Profile["Cellphone"]);
                    UserImpression.ImpressionAge = HttpContext.Current.Profile["Age"] == null
                                                       ? 25
                                                       : Convert.ToInt32(HttpContext.Current.Profile["Age"].ToString());
                    UserImpression.ImpressionGender = HttpContext.Current.Profile["Gender"] == null
                                                          ? 1
                                                          : Convert.ToInt32(HttpContext.Current.Profile["Gender"]);
                    UserImpression.ImpressionPhotoPath = HttpContext.Current.Profile["Picture1"].ToString() == "null"
                                                             ? "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/Profile/unknowuser.png"
                                                             : HttpContext.Current.Profile["Picture1"].ToString();
                    UserImpression.ImpressionCountry = HttpContext.Current.Profile["CountryID"].ToString();
                    UserImpression.ImpressionRegion = HttpContext.Current.Profile["RegionID"].ToString();
                    UserImpression.ImpressionCity = HttpContext.Current.Profile["CityID"].ToString();
                    UserImpression.ImpressionZipcode =
                        (string)
                        (HttpContext.Current.Profile["Zipcode"].ToString() == "null"
                             ? "66203"
                             : HttpContext.Current.Profile["Zipcode"]);
                    UserImpression.ImpressionIndustryID = HttpContext.Current.Profile["Industry"] == null
                                                              ? 1
                                                              : Convert.ToInt32(HttpContext.Current.Profile["Industry"]);
                    UserImpression.ImpressionProfession =
                        Convert.ToInt32(
                            Utility.CleanUpProfessionId(HttpContext.Current.Profile["ProfessionID"].ToString()));
                    UserImpression.ImpressionLCID = Convert.ToInt32(CurrentLcid);
                }
                catch (Exception)
                {

                    UserImpression.NonAuthenticatedUserImpression();
                }

            }
        }

        public static int GetNextAdvertiserID()
        {
            int id;
            var context = new AdDatabaseEntities();
            var max = context.AdvertiserInfoes.OrderByDescending(s => s.AdvertiserID).FirstOrDefault();

            if (max == null)
            {
                id = 0;
            }
            else
            {
                id = max.AdvertiserID + 1;
            }
            return id;
        }

        public static int GetAdvertiserId(Guid userId)
        {
            using (var context = new AdDatabaseEntities())
            {

                var result = from c in context.AdvertiserInfoes
                             where c.AdvertiserGUI == userId
                             select c.AdvertiserID;
                return result.FirstOrDefault();
               
            }
        }

        public static void InsertAdvertiserId(Guid userId)
        {
            using (var context = new AdDatabaseEntities())
            {
                var newAdvertiserId = new AdvertiserInfo
                {
                    AdvertiserID = GetNextAdvertiserID(),
                    AdvertiserGUI = userId
                };
                context.AddToAdvertiserInfoes(newAdvertiserId);
            }
        }





    }
}
