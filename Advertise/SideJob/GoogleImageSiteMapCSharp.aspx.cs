using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;


public partial class GoogleImageSiteMapCSharp : System.Web.UI.Page
{
    private void WriteImageSitemap(IDictionary<string, IEnumerable<string>> urls)
    {
        const string smNs = "http://www.sitemaps.org/schemas/sitemap/0.9";
        const string imgNs = "http://www.google.com/schemas/sitemap-image/1.1";
        const string imgPf = "image";


        using (XmlWriter xw = XmlWriter.Create(Response.Output, new XmlWriterSettings { Indent = true }))
        {
            xw.WriteStartDocument();
            xw.WriteStartElement("urlset", smNs);
            xw.WriteAttributeString("xmlns", imgPf, "http://www.w3.org/2000/xmlns/", imgNs);
            foreach (string url in urls.Keys)
            {
                xw.WriteStartElement("url", smNs);
                xw.WriteElementString("loc", smNs, url);
                foreach (string img in urls[url])
                {
                    xw.WriteStartElement(imgPf, "image", imgNs);
                    xw.WriteElementString(imgPf, "loc", imgNs, img);
                    xw.WriteEndElement();
                }
                xw.WriteEndElement();
            }
            xw.WriteEndElement();
            xw.WriteEndDocument();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        Dictionary<string, IEnumerable<string>> smData = new Dictionary<string, IEnumerable<string>>();
        List<string> imgList = new List<string>();
        imgList.Add("http://example.com/image.jpg");
        imgList.Add("http://example.com/photo.jpg");
        smData.Add("http://example.com/sample.html", imgList);
        Response.ContentType = "application/xml";



        WriteImageSitemap(smData);
        Response.End();
    }
}