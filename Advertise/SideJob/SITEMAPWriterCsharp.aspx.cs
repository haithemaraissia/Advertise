using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Web;
using System.Xml;
using SidejobModel;
using System.Linq;

namespace SideJob
{
    public partial class SITEMAPWriterCsharp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            const string smNs = "http://www.sitemaps.org/schemas/sitemap/0.9";
            const string imgNs = "http://www.google.com/schemas/sitemap-image/1.1";
            const string imgPf = "image";

            //SideJob
            if (HourlyPush("/SiteJob/SiteMap.xml"))
            {
                //Check for Images when pages are live
                ProcessSideJob(smNs, imgPf, imgNs, "/SiteJob/SiteMap.xml", "http://www.how-to-asp.net/sitemap.xml");
            }


            //Advertise
            if (HourlyPush("/SiteMap/SiteMap.xml"))
            {
                //Check for Images when pages are live
                ProcessSideJob(smNs, imgPf, imgNs, "/SiteMap/SiteMap.xml", "http://www.how-to-asp.net/sitemap.xml");
            }

            ProcessAdvertise(smNs, imgPf, imgNs, "/SiteMap/SiteMap.xml", "http://www.how-to-asp.net/sitemap.xml");

        }

        public static bool HourlyPush(string path)
        {
            var sSiteMapFilePath = HttpRuntime.AppDomainAppPath + path;
            var fi = new FileInfo(sSiteMapFilePath);

            if (fi.Exists && fi.LastWriteTime < DateTime.Now.AddHours(-1))
            {
                // only allow it to be written once an hour in case someone spams this page (so it doesnt crash the site)
                return false;
            }
            return true;
        }

        private static void ProcessSideJob(string smNs, string imgPf, string imgNs, string path, string destination)
        {
            //Do the PageSeo to ovveride the file every hour
            var sSiteMapFilePath = HttpRuntime.AppDomainAppPath + path;
            var writer = XmlWriter.Create(sSiteMapFilePath, new XmlWriterSettings { Indent = true });

            writer.WriteStartDocument();
            writer.WriteStartElement("urlset", smNs);
            writer.WriteAttributeString("xmlns", imgPf, "http://www.w3.org/2000/xmlns/", imgNs);

            //////Not Authenticated//////
            /// Check the Images ///
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/aboutus.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/apidocumentation.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/benefits.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/business.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/contactus.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/eblast.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/findjob.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/findprofessional.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/help.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/howdoesitwork.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/index.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/jobsearchresult.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/index.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/lockeduser.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/newsletter.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/newsletter2.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/passwordrecovery.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/privacy.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/product.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/professionalresult.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/signup.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/signin.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/sitemap.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/subscribe.aspx",
                       new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });

            //////Authenticated//////

            //Customer//
            //ViewCustomerProfile//
            Customer(writer, "1", "daily", "http://www.my-side-job.com/authenticated/viewcustomerprofile.aspx");

            //Professional//
            //ViewProfessionalProfile//
            Professional(writer, "1", "daily", "http://www.my-side-job.com/authenticated/viewprofessionalprofile.aspx");

            //Projects
            //ViewProject//
            Project(writer, "1", "daily", "http://www.my-side-job.com/authenticated/ViewProject.aspx");

            writer.WriteEndDocument();
            writer.Close();


            //// PING SEARCH ENGINES TO LET THEM KNOW YOU UPDATED YOUR SITEMAP
            //// resubmit to google
            //System.Net.WebRequest reqGoogle =
            //    System.Net.WebRequest.Create("http://www.google.com/webmasters/tools/ping?sitemap=" +
            //                                 HttpUtility.UrlEncode(destination));
            //reqGoogle.GetResponse();

            ////// resubmit to ask
            //System.Net.WebRequest reqAsk =
            //    System.Net.WebRequest.Create("http://submissions.ask.com/ping?sitemap=" +
            //                                 HttpUtility.UrlEncode(destination));
            //reqAsk.GetResponse();

            ////// resubmit to yahoo
            //System.Net.WebRequest reqYahoo =
            //    System.Net.WebRequest.Create(
            //        "http://search.yahooapis.com/SiteExplorerService/V1/updateNotification?appid=YahooDemo&url=" +
            //        HttpUtility.UrlEncode(destination));
            //reqYahoo.GetResponse();

            ////// resubmit to bing
            //System.Net.WebRequest reqBing =
            //    System.Net.WebRequest.Create("http://www.bing.com/webmaster/ping.aspx?siteMap=" +
            //                                 HttpUtility.UrlEncode(destination));
            //reqBing.GetResponse();
        }

        private static void ProcessAdvertise(string smNs, string imgPf, string imgNs, string path, string destination)
        {
            //Do the PageSeo to ovveride the file every hour
            var sSiteMapFilePath = HttpRuntime.AppDomainAppPath + path;
            var writer = XmlWriter.Create(sSiteMapFilePath, new XmlWriterSettings { Indent = true });

            writer.WriteStartDocument();
            writer.WriteStartElement("urlset", smNs);
            writer.WriteAttributeString("xmlns", imgPf, "http://www.w3.org/2000/xmlns/", imgNs);

            //////Not Authenticated//////
            /// Check the Images ///
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/home.aspx",
                        new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Help.aspx",
                        new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/help/help.aspx",
                        new List<string> { "http://example.com/image.jpg", "http://example.com/photo.jpg" });
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/help/aboutus.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/help/whiteboard.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/notauthenticated/help/contactus.aspx", null);

            //////Authenticated//////

            //Payment 
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Payment/Payments.aspx", null);

            //Advertisement//
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Advertiser.aspx", null);
            
            //Advertisement/ Current
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Current/Home.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Current/New.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Current/Inventory.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Current/Edit.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Current/Delete.aspx", null);

            //Advertisement/ Saved
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Saved/Home.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Saved/Inventory.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Saved/Edit.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Saved/Delete.aspx", null);

            //Advertisement/ Completed
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Completed/Home.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Completed/Inventory.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Completed/Extend.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Compaign/Completed/Delete.aspx", null);


            //Report 
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Report.aspx", null);

            //Current
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Current/Home.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Current/Executive.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Current/Advertiser.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Current/Geographic.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Current/Platform.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Current/Profile.aspx", null);

            //Completed
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Completed/Home.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Completed/Executive.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Completed/Advertiser.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Completed/Geographic.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Completed/Platform.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Report/Completed/Profile.aspx", null);

            //Account
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Account.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Profile/ViewProfile.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Account/EditProfile.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Account/DeleteProfile.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Account/ManagePhoto.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Account/ChangePassword.aspx", null);
            SinglePage(writer, "1", "daily", "http://www.my-side-job.com/Advertise/Advertiser/Account/LogOut.aspx", null);

            writer.WriteEndDocument();
            writer.Close();


            //// PING SEARCH ENGINES TO LET THEM KNOW YOU UPDATED YOUR SITEMAP
            //// resubmit to google
            //System.Net.WebRequest reqGoogle =
            //    System.Net.WebRequest.Create("http://www.google.com/webmasters/tools/ping?sitemap=" +
            //                                 HttpUtility.UrlEncode(destination));
            //reqGoogle.GetResponse();

            ////// resubmit to ask
            //System.Net.WebRequest reqAsk =
            //    System.Net.WebRequest.Create("http://submissions.ask.com/ping?sitemap=" +
            //                                 HttpUtility.UrlEncode(destination));
            //reqAsk.GetResponse();

            ////// resubmit to yahoo
            //System.Net.WebRequest reqYahoo =
            //    System.Net.WebRequest.Create(
            //        "http://search.yahooapis.com/SiteExplorerService/V1/updateNotification?appid=YahooDemo&url=" +
            //        HttpUtility.UrlEncode(destination));
            //reqYahoo.GetResponse();

            ////// resubmit to bing
            //System.Net.WebRequest reqBing =
            //    System.Net.WebRequest.Create("http://www.bing.com/webmaster/ping.aspx?siteMap=" +
            //                                 HttpUtility.UrlEncode(destination));
            //reqBing.GetResponse();
        }
        
        private static void WriteTagSiteMap(string priority, string freq, string navigation, XmlWriter myWriter)
        {
            myWriter.WriteStartElement("url");

            myWriter.WriteStartElement("loc");
            myWriter.WriteValue(navigation);
            myWriter.WriteEndElement();

            myWriter.WriteStartElement("lastmod");
            myWriter.WriteValue( DateTime.Now.ToString("yyyy-MM-ddThh:mm:sszzz"));
            myWriter.WriteEndElement();

            myWriter.WriteStartElement("changefreq");
            myWriter.WriteValue(freq);
            myWriter.WriteEndElement();

            myWriter.WriteStartElement("priority");
            myWriter.WriteValue(priority);
            myWriter.WriteEndElement();

            myWriter.WriteEndElement();
        }

        private static void WriteImageSitemap(IDictionary<string, IEnumerable<string>> urls, XmlWriter myWriter)
        {
            const string smNs = "http://www.sitemaps.org/schemas/sitemap/0.9";
            const string imgNs = "http://www.google.com/schemas/sitemap-image/1.1";
            const string imgPf = "image";

            foreach (var url in urls.Keys)
            {
                myWriter.WriteStartElement("url", smNs);
                myWriter.WriteElementString("loc", smNs, url);
                foreach (var img in urls[url])
                {
                    myWriter.WriteStartElement(imgPf, "image", imgNs);
                    myWriter.WriteElementString(imgPf, "loc", imgNs, img);
                    myWriter.WriteEndElement();
                }
                myWriter.WriteEndElement();
            }
        }

        private static void Customer(XmlWriter writer, string priority, string freq, string url)
        {
            using (var context = new SidejobEntities())
            {
                var result = (from c in context.CustomerGenerals
                              select c).ToList();
                if (result.Count == 0) return;
                foreach (var customer in result)
                {
                    var customurl = url + "?CID=" + customer.CustomerID.ToString(CultureInfo.InvariantCulture);
                    var customerimagelist = new List<string> {customer.PhotoPath};
                    var customerphotoes = Customerphoto(customer.CustomerID);
                    if (customerphotoes != null)
                    {
                        customerimagelist.AddRange(customerphotoes);
                    }
                    Authenticated(writer, priority, freq, customurl, customerimagelist);
                }
            }
        }

        private static IEnumerable<string> Customerphoto (int customerId)
        {
            using (var context = new SidejobEntities())
            {
                var result = (from c in context.CustomerPhotoes
                              where c.CustomerID == customerId
                              select c.PhotoPath).ToList();
                return result.Count != 0 ? result : null;
            }
        }

        private static void Professional(XmlWriter writer, string priority, string freq, string url)
        {
            using (var context = new SidejobEntities())
            {
                var result = (from c in context.ProfessionalGenerals
                              select c).ToList();
                if (result.Count == 0) return;
                foreach (var professional in result)
                {
                    var customurl = url + "?PID=" + professional.ProID.ToString(CultureInfo.InvariantCulture);
                    var professionalimagelist = new List<string> {professional.PhotoPath};
                    var professionalphotoes = Professionalphoto(professional.ProID);
                    if (professionalphotoes != null)
                    {
                        professionalimagelist.AddRange(professionalphotoes);
                    }
                    var professionalworkphotoes = Professionalworkphoto(professional.ProID);
                    if (professionalworkphotoes != null)
                    {
                        professionalimagelist.AddRange(professionalworkphotoes);
                    }
                    Authenticated(writer, priority, freq, customurl, professionalimagelist);
                }
            }
        }

        private static IEnumerable<string> Professionalphoto(int professionalId)
        {
            using (var context = new SidejobEntities())
            {
                var result = (from c in context.ProfessionalPhotoes
                              where c.PhotoID == professionalId
                              select c.PhotoPath).ToList();
                return result.Count != 0 ? result : null;
            }
        }

        private static IEnumerable<string> Professionalworkphoto(int professionalId)
        {
            using (var context = new SidejobEntities())
            {
                var result = (from c in context.ProfessionalWorkPhotoes
                              where c.PhotoID == professionalId
                              select c.PhotoPath).ToList();
                return result.Count != 0 ? result : null;
            }
        }

        private static void Authenticated(XmlWriter writer, string priority, string freq, string url, ICollection<string> imgList)
        {
            //////////////////////////////Prototype////////////////////////////////
            //URL
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(url), writer);
            //Localization
                //English
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}&l=en-US", url)),
                            writer);
                //French
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}&l=fr", url)),
                            writer);
                //Spanish
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}&l=es", url)),
                            writer);
                //Chinese
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}&l=zh-CN", url)),
                            writer);
                //Russian
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}&l=ru", url)),
                            writer);
                //Arabic
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}&l=ar", url)),
                            writer);
                //Japanese
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}&l=ja", url)),
                            writer);
                //German
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}&l=de", url)),
                            writer);
            //Image
            if (imgList == null || imgList.Count < 0) return;
            var smData = new Dictionary<string, IEnumerable<string>> { { url, imgList } };
            WriteImageSitemap(smData, writer);
            //////////////////////////////Prototype////////////////////////////////
        }

        private static void Project(XmlWriter writer, string priority, string freq, string url)
        {
            using (var context = new SidejobEntities())
            {
                var result = (from c in context.Projects
                              select c).ToList();
                if (result.Count == 0) return;
                foreach (var project in result)
                {
                    var customurl = url + "?PRID=" + project.ProjectID.ToString(CultureInfo.InvariantCulture);
                    var projectimagelist = new List<string>();
                    var projectphotoes = Projectphoto(project.ProjectID);
                    if (projectphotoes != null)
                    {
                        projectimagelist.AddRange(projectphotoes);
                    }
                    Authenticated(writer, priority, freq, customurl, projectimagelist);
                }
            }
        }

        private static IEnumerable<string> Projectphoto(long projectId)
        {
            using (var context = new SidejobEntities())
            {
                var result = (from c in context.ProjectPhotoes
                              where c.ProjectID == projectId
                              select c.PhotoPath).ToList();
                return result.Count != 0 ? result : null;
            }
        }

        private static void SinglePage(XmlWriter writer, string priority, string freq, string url, ICollection<string> imgList)
        {
            //////////////////////////////Prototype////////////////////////////////
            //URL
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(url), writer);
            //Localization
            //English
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}?l=en-US", url)),
                            writer);
            //French
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}?l=fr", url)),
                            writer);
            //Spanish
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}?l=es", url)),
                            writer);
            //Chinese
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}?l=zh-CN", url)),
                            writer);
            //Russian
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}?l=ru", url)),
                            writer);
            //Arabic
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}?l=ar", url)),
                            writer);
            //Japanese
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}?l=ja", url)),
                            writer);  
            //German
            WriteTagSiteMap(priority, freq, HttpUtility.HtmlEncode(string.Format("{0}?l=de", url)),
                            writer);
            //Image
            if (imgList == null || imgList.Count < 0) return;
            var smData = new Dictionary<string, IEnumerable<string>> {{url, imgList}};
            WriteImageSitemap(smData, writer);
            //////////////////////////////Prototype////////////////////////////////
        }
    }
}