using System;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using Admanagment.Helpers;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace Advertiser.Report.Current.IFrame
{
    public partial class AdvertiserReportCurrentIFramePlatformDownload : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var t1 = Request.QueryString["t1"];
            var t2 = Request.QueryString["t2"];

            if (!string.IsNullOrEmpty(t1) && !string.IsNullOrEmpty(t2))
            {
                dsdetails.SelectCommand =
                    "SELECT DISTINCT TOP (10000) AdGeneral.AdName, AdStats.EntryDate, AdGeneral.ImageUrl, VisitorPlatform.AdId, " +
                    "VisitorPlatform.BrowserType, VisitorPlatform.BrowserName, VisitorPlatform.BrowserPlatform, VisitorPlatform.DeviceType, " +
                    "VisitorPlatform.UserLanguage, VisitorPlatform.MobileDeviceModel FROM  AdGeneral INNER JOIN AdStats ON AdGeneral.AdID = " +
                    "AdStats.AdId INNER JOIN VisitorPlatform ON AdGeneral.AdID = VisitorPlatform.AdId " +
                    "WHERE (AdStats.EntryDate BETWEEN '" + t2 + "' AND '" + t1 + "') AND AdGeneral.UserID = '" + Utility.GetUserID() +
                    "' AND AdGeneral.IsActive = 1 AND AdGeneral.Completed = 0 ORDER BY AdStats.EntryDate";
            }
            else
            {
                var user = Utility.GetUserID();
                if (user != null)
                {
                    var userID = (Guid)user;
                    dsdetails.SelectParameters[0].DefaultValue = userID.ToString();
                }
            }
            dsdetails.DataBind();
            PrintPDF();
        }

        public void PrintPDF()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=PlatformReport.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            var sw = new StringWriter();
            var hw = new HtmlTextWriter(sw);

            gvdetails.DataBind();
            gvdetails.RenderControl(hw);

            var pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
            var htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            var gridString = sw.ToString();

            //Header//
            var sb = new StringBuilder("<div><p style='color: #800000; text-align:center'><strong>");
            sb.Append(Resources.Resource.PlatformReport);
            sb.Append("</strong></p><br/>");
            sb.Append("<div><p style='color: #336699; text-align:center'>");
            sb.Append(Resources.Resource.Latest10000Visits);
            sb.Append("</div><br/>");
            sb.Append(gridString);
            gridString = sb.ToString();
            //Header//

            //Images//
            var gridString2 = Server.MapPath("../Advertiser/Ads/").ToString(CultureInfo.InvariantCulture);
            gridString = gridString.Replace("../Advertiser/Ads/", gridString2);
            //Images//

            var gridStringReader = new StringReader(gridString);

            pdfDoc.Open();
            htmlparser.Parse(gridStringReader);

            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
        }
    }
}

