using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;


namespace GEOIP
{
    public class GeoIP
    {
        public double Longitude { get; set; }
        public double Latitude { get; set; }
        public int DmaCode { get; set; }
        public int AreaCode { get; set; }
        public string PostalCode { get; set; }
        public string City { get; set; }
        public string Region { get; set; }
        public string CountryCode { get; set; }
        public string CountryName { get; set; }
        public string VisitorIP { get; set; }



        public GeoIP()
        {
            // Full path to GeoLiteCity.dat file
            string fullDBPath = System.Web.HttpContext.Current.Server.MapPath("App_Data/GeoLiteCity.dat");

            // Visitor's IP address
            string visitorIP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];

            //Create objects needed for geo targeting
            var ls = new Geotargeting.LookupService(fullDBPath,
                                                    Geotargeting.LookupService.GEOIP_STANDARD);


            //Geotargeting.Location visitorLocation = ls.getLocation(visitorIP);
            //testing

            try
            {



                Geotargeting.Location visitorLocation = new Geotargeting.Location();
                visitorLocation = ls.getLocation("68.70.88.2");


            // Get geo targeting data
            VisitorIP = visitorIP;
            CountryName = visitorLocation.countryName;
            CountryCode = visitorLocation.countryCode;
            Region = visitorLocation.region;
            City = visitorLocation.city;
            PostalCode = visitorLocation.postalCode;
            AreaCode = visitorLocation.area_code;
            DmaCode = visitorLocation.dma_code;
            Latitude = visitorLocation.latitude;
            Longitude = visitorLocation.longitude;
}
            catch (Exception e)
            {
                    
                throw;
            }
            //Response.Write("Your IP Address: " + visitorIP + "<br />");
            //Response.Write("Your country: " + visitorLocation.countryName + "<br />");
            //Response.Write("Your country code: " + visitorLocation.countryCode + "<br />");
            //Response.Write("Your region: " + visitorLocation.region + "<br />");
            //Response.Write("Your city: " + visitorLocation.city + "<br />");
            //Response.Write("Your postal code: " + visitorLocation.postalCode + "<br />");
            //Response.Write("Area code: " + visitorLocation.area_code + "<br />");
            //Response.Write("dma: " + visitorLocation.dma_code + "<br />");
            //Response.Write("Latitude: " + visitorLocation.latitude + "<br />");
            //Response.Write("Longitude: " + visitorLocation.longitude + "<br />");


            //SessionId = ip;
        }



    }
}