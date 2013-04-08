using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Xml;
using System.Text;
using System.Xml.Linq;



public partial class SiteMapXMLSEO : System.Web.UI.Page
{


    protected void SiteMap()
    {
        Response.Clear();

        Response.ContentType = "text/xml";

        using (var writer = new XmlTextWriter(Response.OutputStream, Encoding.UTF8))
        {

            writer.WriteStartDocument();

            writer.WriteStartElement("urlset");

            writer.WriteAttributeString("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");

            writer.WriteStartElement("url");

            writer.WriteElementString("loc", "http://www.mikesdotnetting.com");

            writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", "3:30am 1/1/2001"));

            writer.WriteElementString("changefreq", "weekly");

            writer.WriteElementString("priority", "1.0");

            writer.WriteEndElement();

            writer.WriteEndElement();

            writer.WriteEndDocument();

            writer.Flush();

        }

        Response.End();

    }



    XmlDocument _xd;
    protected void Page_Load(object sender, EventArgs e)
    {
        string sSiteMapFilePath = HttpRuntime.AppDomainAppPath + "sitemap.xml";
        var fi = new FileInfo(sSiteMapFilePath);

        //if (fi.Exists && fi.LastWriteTime < DateTime.Now.AddHours(-1))
        //{ // only allow it to be written once an hour in case someone spams this page (so it doesnt crash the site)


        _xd = new XmlDocument();
        XmlNode rootNode = _xd.CreateElement("urlset");

        // add namespace
        var attrXmlNS = _xd.CreateAttribute("xmlns");
        attrXmlNS.InnerText = "http://www.sitemaps.org/schemas/sitemap/0.9";
        rootNode.Attributes.Append(attrXmlNS);

        //add img namespace
        var attrXmlNS2 = _xd.CreateAttribute("xmlns:image");
        attrXmlNS2.InnerText = "http://www.google.com/schemas/sitemap-image/1.1";
        rootNode.Attributes.Append(attrXmlNS2);








        // home page
        rootNode.AppendChild(GenerateUrlNode("http://www.how-to-asp.net", DateTime.Now, "hourly", "1.00", "http://myimage.com"));








        // ADD THE REST OF YOUR URL'S HERE

        // append all nodes to the xmldocument and save it to sitemap.xml
        _xd.AppendChild(rootNode);
        _xd.InsertBefore(_xd.CreateXmlDeclaration("1.0", "UTF-8", null), rootNode);
        _xd.Save(sSiteMapFilePath);

        // PING SEARCH ENGINES TO LET THEM KNOW YOU UPDATED YOUR SITEMAP
        // resubmit to google
        //System.Net.WebRequest reqGoogle = System.Net.WebRequest.Create("http://www.google.com/webmasters/tools/ping?sitemap=" + HttpUtility.UrlEncode("http://www.how-to-asp.net/sitemap.xml"));
        //reqGoogle.GetResponse();

        //// resubmit to ask
        //System.Net.WebRequest reqAsk = System.Net.WebRequest.Create("http://submissions.ask.com/ping?sitemap=" + HttpUtility.UrlEncode("http://www.how-to-asp.net/sitemap.xml"));
        //reqAsk.GetResponse();

        //// resubmit to yahoo
        //System.Net.WebRequest reqYahoo = System.Net.WebRequest.Create("http://search.yahooapis.com/SiteExplorerService/V1/updateNotification?appid=YahooDemo&url=" + HttpUtility.UrlEncode("http://www.how-to-asp.net/sitemap.xml"));
        //reqYahoo.GetResponse();

        //// resubmit to bing
        //System.Net.WebRequest reqBing = System.Net.WebRequest.Create("http://www.bing.com/webmaster/ping.aspx?siteMap=" + HttpUtility.UrlEncode("http://www.how-to-asp.net/sitemap.xml"));
        //reqBing.GetResponse();

    }




    private XmlNode GenerateUrlNode(string sLoc, DateTime dLastMod, string sChangeFreq, string sPriority, string image = "null", List<ImageAttribute> imgList = null)
    {
        XmlNode nodeUrl = _xd.CreateElement("url");

        XmlNode nodeLoc = _xd.CreateElement("loc");
        nodeLoc.InnerText = sLoc;
        nodeUrl.AppendChild(nodeLoc);

        XmlNode nodeLastMod = _xd.CreateElement("lastmod");
        nodeLastMod.InnerText = dLastMod.ToString("yyyy-MM-ddThh:mm:ss+00:00");
        nodeUrl.AppendChild(nodeLastMod);

        XmlNode nodeChangeFreq = _xd.CreateElement("changefreq");
        nodeChangeFreq.InnerText = sChangeFreq;
        nodeUrl.AppendChild(nodeChangeFreq);

        XmlNode nodePriority = _xd.CreateElement("priority");
        nodePriority.InnerText = sPriority;
        nodeUrl.AppendChild(nodePriority);

        if (!image.Equals("null"))
        {
            //Important Images
            //You can have 1000 image per page
            XNamespace ns = "http://www.sitemaps.org/schemas/sitemap/0.9";
            XNamespace nsImage = "http://www.google.com/schemas/sitemap-image/1.1";

            //var googleImage = new XAttribute(XNamespace.Xmlns + "image", nsImage.NamespaceName);

            //var elementtest = new XElement(ns + "url");
            //XmlNode nodePriority2 = _xd.CreateElement("image:url");
            //nodeUrl.AppendChild(nodePriority2);

        }

        return nodeUrl;
    }



}


public class ImageAttribute
{
    public string Loc { get; set; }
    public string Caption { get; set; }
    public string Title { get; set; }

    public ImageAttribute(string loc, string caption = "", string title = "")
    {
        Loc = loc;
        Caption = caption;
        Title = title;
    }
}