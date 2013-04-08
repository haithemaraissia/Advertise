﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.VisualBasic;
using Roboblob.Utility;
using SidejobModel;


namespace Admanagment
{
    public partial class test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //BannerKeywords();
            GetGeoIP();
            //TestEntity();
        }

        private void BannerKeywords()
        {

            ///////////////////YOU WILL NEED TO ADJUST FOR TIME OVER HERE WHERE TIME START AND TIME FINISH//////////////////
            /// and Country and maybe even region /// 

            // Dim AdKeyword as new adDatabaseDataSetTableAdapters
            var adListKeywordAdapter = new AdDatabaseDataSetTableAdapters.AdListTableAdapter();
            var adListKeyworDataTable = new AdDatabaseDataSet.AdListDataTable();
            adListKeywordAdapter.FillByKeyword(adListKeyworDataTable, "Test");

            if (adListKeyworDataTable.Rows.Count == 0)
            {
                BannerRotator1.KeywordFilter = "Home";
                BannerRotator2.KeywordFilter = "Doctor";
            }

            //Dim CustomerContractDescriptionAdapter As New ContractDataSetTableAdapters.ContractDescriptionTableAdapter
            //Dim CustomerContractDescriptionTable As New ContractDataSet.ContractDescriptionDataTable
            //CustomerContractDescriptionAdapter.FillContractDescription(CustomerContractDescriptionTable, _language.ToString())
            //BannerRotator1.KeywordFilter = "Home";
            //BannerRotator2.KeywordFilter = "Doctor";
        }

        protected void AdRotator1AdCreated(object sender, AdCreatedEventArgs e)
        {
            // Update Impressions
            SqlDataSource1.InsertParameters["AdId"].DefaultValue = e.AdProperties["Id"].ToString();
            //SqlDataSource1.InsertParameters["UserId"].DefaultValue = "100";
            //SqlDataSource1.InsertParameters["UserRole"].DefaultValue = "PRO";
            SqlDataSource1.Insert();

            try
            {
                // Admanagment.ImpressionUtility.UpdateImpression();

                UpdateImpression(e.AdProperties["Id"].ToString(), 0);

            }
            catch
            {
                Response.Redirect(Request.Url.ToString());
            }
            //Change NavigateUrl to redirect page
            e.NavigateUrl = "~/Advertiser/AdHandler.ashx?id=" + e.AdProperties["Id"].ToString();

        }

        protected void AdRotator2AdCreated(object sender, AdCreatedEventArgs e)
        {
            // Update Impressions
            SqlDataSource2.InsertParameters["AdId"].DefaultValue = e.AdProperties["Id"].ToString();
            //SqlDataSource2.InsertParameters["UserId"].DefaultValue = "100";
            //SqlDataSource2.InsertParameters["UserRole"].DefaultValue = "PRO";
            SqlDataSource2.Insert();

            try
            {
                UpdateImpression(e.AdProperties["Id"].ToString(), 0);

            }
            catch
            {
                Response.Redirect(Request.Url.ToString());
            }
            //Change NavigateUrl to redirect page
            e.NavigateUrl = "~/Advertiser/AdHandler.ashx?id=" + e.AdProperties["Id"].ToString();
        }

        //protected void OnTimerTick(object sender, EventArgs e)
        //{
        //    UpdatePanel1.Update();
        //}

        public void GetGeoIP()
        {

            // Full path to GeoLiteCity.dat file
            string FullDBPath = Server.MapPath("App_Data/GeoLiteCity.dat");

            // Visitor"s IP address
            string VisitorIP = Request.ServerVariables["REMOTE_ADDR"];

            // Create objects needed for geo targeting
            Geotargeting.LookupService ls = new Geotargeting.LookupService(FullDBPath,
                                                                           Geotargeting.LookupService.GEOIP_STANDARD);
            //Geotargeting.Location visitorLocation = ls.getLocation(VisitorIP);

            //testing
            var visitorLocation = ls.getLocation("68.70.88.2");

            // Get geo targeting data
            Response.Write("Your IP Address: " + VisitorIP + "<br />");
            Response.Write("Your country: " + visitorLocation.countryName + "<br />");
            Response.Write("Your country code: " + visitorLocation.countryCode + "<br />");
            Response.Write("Your region: " + visitorLocation.region + "<br />");
            Response.Write("Your city: " + visitorLocation.city + "<br />");
            Response.Write("Your postal code: " + visitorLocation.postalCode + "<br />");
            Response.Write("Area code: " + visitorLocation.area_code + "<br />");
            Response.Write("dma: " + visitorLocation.dma_code + "<br />");
            Response.Write("Latitude: " + visitorLocation.latitude + "<br />");
            Response.Write("Longitude: " + visitorLocation.longitude + "<br />");


            //OnlineVisitorsUtility.Visitors.Values;
        }

        public void ShowOnline()
        {

            if (!Page.IsPostBack)
            {
                if (OnlineVisitorsUtility.Visitors != null)
                {
                    //  gvVisitors.DataSource = OnlineVisitorsUtility.Visitors.Values;
                    // gvVisitors.DataBind();
                }
            }

        }


        public void UpdateImpression(string adId, int type)
        {
            try
            {
                // Full path to GeoLiteCity.dat file
                string fullDBPath = Server.MapPath("App_Data/GeoLiteCity.dat");

                // Visitor"s IP address
                string visitorIP = Request.ServerVariables["REMOTE_ADDR"];

                // Create objects needed for geo targeting
                var ls = new Geotargeting.LookupService(fullDBPath, Geotargeting.LookupService.GEOIP_STANDARD);

                //Geotargeting.Location visitorLocation = ls.getLocation(VisitorIP);
                //testing
                var visitorLocation = ls.getLocation("68.70.88.2");

                var myWebVisitor = new WebsiteVisitor(HttpContext.Current);

                //YOU Need to account for NULL AND FOR LOWER CASE!!!!!!!!!!!!!!///////////////
                //YOU Need to account for NULL AND FOR LOWER CASE!!!!!!!!!!!!!!///////////////

                int countryID;
                int regionID;
                int cityID;
                using (var context = new SidejobEntities())
                {
                    try
                    {
                        var selectedCountryID =
                            from c in context.CountriesUpdates
                            where c.ISO2 == visitorLocation.countryCode
                            select c.CountryId;

                        countryID = selectedCountryID.FirstOrDefault();
                        if (countryID == 0)
                        {
                            //Default: US
                            countryID = 254;
                        }

                        var selectedRegionID =
                            from c in context.regionsUpdates
                            where c.Code == visitorLocation.region && c.CountryId == Convert.ToInt32(selectedCountryID)
                            select c.RegionId;
                        regionID = Convert.ToInt32(selectedRegionID);
                        if (regionID == 0)
                        {
                            //Default: NY
                            regionID = 154;
                        }

                        var selectedCityID =
                            from c in context.CitiesUpdates
                            where c.City == visitorLocation.city
                            select c.CityId;
                        cityID = Convert.ToInt32(selectedCityID);
                        if (cityID == 0)
                        {
                            //Default: NY
                            cityID = 10182;
                        }
                    }
                    catch (Exception)
                    {
                        //Default: US
                        countryID = 254;

                        //Default: NY
                        regionID = 154;

                        //Default: NY
                        cityID = 10182;
                    }
                }

                ///////////////
                string refURL = "Exception";
                ///////////////

                ImpressionUtility.UpdateImpression(Convert.ToInt32(adId),
                                                   Convert.ToDateTime(
                                                       DateTime.Today.ToString(
                                                           CultureInfo.InvariantCulture)),
                                                   type, visitorIP, visitorLocation.countryCode,
                                                   visitorLocation.region,
                                                   visitorLocation.postalCode,
                                                   visitorLocation.area_code, visitorLocation.dma_code,
                                                   visitorLocation.latitude,
                                                   visitorLocation.longitude,
                                                   refURL, myWebVisitor.BrowserType,
                                                   myWebVisitor.BrowserName,
                                                   myWebVisitor.BrowserPlatform,
                                                   myWebVisitor.UserHostAddress,
                                                   myWebVisitor.UserHostName,
                                                   myWebVisitor.UserLanguages,
                                                   myWebVisitor.MobileDeviceManufacturer,
                                                   myWebVisitor.MobileDeviceModel,
                                                   myWebVisitor.DeviceType,
                                                   100, "PRO", "haithem", "smith", "address", countryID,
                                                   visitorLocation.countryCode,
                                                   regionID, visitorLocation.region, cityID,
                                                   visitorLocation.city,
                                                   "91340605", 28, 1,
                                                   "emailAddress", "photoPath", 5, 52, 1);


                //// UpdateImpression(int adId, DateTime entryData, int type, string iPAddress, string countryCode, string region, string postalcode,
                //int areaCode, int metroCode, double latiture, double longitude, string refURL, string browserType, string browserName, string browserPlatform,  string userHostAddress,
                //string userHostName,
                //string userLanguage,string mobileDeviceManufacturer,
                // string mobileDeviceModel, string deviceType,  int userId, string userRole, string firstName,
                //string lastName, string address, int countryID, string countryName, int regionID,
                //string regionName, int cityID, string cityName, string phone, int age, int gender,
                //string emailAddress, string photoPath, int industryID, int professionID, int lcid)
            }
            catch (Exception)
            {
            }
        }


        public void TestEntity()
        {
            int CountryID = 0;
            int RegionID = 0;
            int CityID = 0;
            using (var context =
                new SidejobEntities())
            {
                context.Connection.Open(); 
                try
                {

                    var SelectedCountryID =
                        from c in context.CountriesUpdates
                        where c.ISO2 == "US"
                        select c.CountryId;
                    CountryID = Convert.ToInt32(SelectedCountryID);

                    var selectedRegionID =
                        from c in context.regionsUpdates
                        where c.Code == "KS" && c.CountryId == Convert.ToInt32(SelectedCountryID)
                        select c.RegionId;
                    RegionID = Convert.ToInt32(selectedRegionID);

                    var SelectedCityID =
                        from c in context.CitiesUpdates
                        where c.City == "Overland Park"
                        select c.CityId;
                    CityID = Convert.ToInt32(
                        SelectedCityID);

                    //                  SELECT [RegionId]
                    //FROM [SIDEJOBS].[dbo].[regionsUpdate]
                    //WHERE Code = "KS" and CountryID = 254



                    //    SELECT [RegionId]
                    //FROM [SIDEJOBS].[dbo].[regionsUpdate]
                    //WHERE Code = "KS" and CountryID = 254




                    //int soHeaderNumber = 43659;
                    //foreach (SalesOrderDetail order in
                    //          objCtx.GetOrderDetails(soHeaderNumber))
                    //    Console.WriteLine("Header#: {0} " +
                    //    "Order#: {1} ProductID: {2} Quantity: {3} Price: {4}",
                    //    soHeaderNumber, order.SalesOrderDetailID,
                    //    order.ProductID,
                    //    order.OrderQty, order.UnitPrice);

                }
                catch (Exception e)
                {
                    Console.WriteLine(e.ToString());
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Validate(FileUpload1))
            {
               CreateDirectory();
                //  string Username = User.Identity.Name;
                string Username = "jack";
                string rootPath = Server.MapPath("~/Advertiser/Photo/");
                string directoryString = rootPath + Username + "/";
                string photoPath = directoryString + FileUpload1.FileName;
                this.FileUpload1.SaveAs(photoPath);


               string virtualPath = "http://side/Authenticated/Customer/Images/" + Username + "/" + (FileUpload1.FileName).Trim();
            }



        }

        public void CreateDirectory()
        {
          //  string Username = User.Identity.Name;
            string Username = "jack";
            string rootPath = Server.MapPath("~/Advertiser/Photo/");
            string NewAdvertiserDirectory = rootPath + Username;

            if (Directory.Exists(NewAdvertiserDirectory) == false)
            {
                Directory.CreateDirectory(NewAdvertiserDirectory);
            }
            else
            {
                Directory.Delete(NewAdvertiserDirectory, true);
                Directory.CreateDirectory(NewAdvertiserDirectory);
            }
        }



        private static bool Validate(FileUpload Photo1)
        {
            bool flag = false;
            if (Photo1.HasFile)
            {
                flag = !(Photo1.PostedFile.ContentLength >= 4096000);
                string typeAllowed = null;
                var extension = System.IO.Path.GetExtension(Photo1.FileName);
                if (extension != null)
                    typeAllowed = extension.ToLower();
                if ((typeAllowed == ".jpg" | typeAllowed == ".jpeg" | typeAllowed == ".gif" | typeAllowed == ".png" | typeAllowed == ".swf" |
                     typeAllowed == ".bmp" | typeAllowed == ".tiff") == false)
                {
                    flag = false;
                }
            }
            return flag;
        }
    }
}