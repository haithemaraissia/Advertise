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

namespace Advertiser.Report.Completed.IFrame
{
    public partial class AdvertiserDownload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var t1 = Request.QueryString["t1"];
            var t2 = Request.QueryString["t2"];

            if (!string.IsNullOrEmpty(t1) && !string.IsNullOrEmpty(t2))
            {
                dsdetails.SelectCommand =
                              "SELECT AdGeneral.adID, AdGeneral.ImageUrl, AdGeneral.Impressions, AdGeneral.StartDate, AdGeneral.EndDate, AdGeneral.IsActive, AdGeneral.AdName,  AdTotalStats.TotalImpression, AdTotalStats.TotalClick FROM AdGeneral " +
                              "INNER JOIN AdTotalStats ON AdGeneral.adID = AdTotalStats.adID WHERE (DATEDIFF(dd, '" +
                              t2 + "', AdGeneral.StartDate) >= 0 ) AND (DATEDIFF(dd, '"
                              + t1 + "', AdGeneral.EndDate) <= 0) AND AdGeneral.UserID = '" + Utility.GetUserID() + "'  AND AdGeneral.IsActive = 0 AND AdGeneral.Completed = 1";
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
            GetSumTable();
            PrintPDF();
        }

        public void GetSumTable()
        {
            var startDate = Request.QueryString["sd"];
            var endDate = Request.QueryString["ed"];
            var averageHit = Request.QueryString["ah"];
            var averageClick = Request.QueryString["ac"];
            var totalHit = Request.QueryString["th"];
            var totalClick = Request.QueryString["tc"];
            StartDate.Text = startDate;
            EndDate.Text = endDate;
            AverageHit.Text = averageHit;
            AverageClick.Text = averageClick;
            TotalHit.Text = totalHit;
            TotalClick.Text = totalClick;
        }

        public void PrintPDF()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=AdvertiserReport.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            var sw = new StringWriter();
            var sw2 = new StringWriter();
            var hw = new HtmlTextWriter(sw);
            var hw2 = new HtmlTextWriter(sw2);

            gvdetails.DataBind();
            gvdetails.RenderControl(hw);
            SumTable.RenderControl(hw2);

            var pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
            var htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            var gridString = sw.ToString();
            var sumTableString = sw2.ToString();

            //Header//
            var sb = new StringBuilder("<div><p style='color: #800000; text-align:center'><strong>");
            sb.Append(Resources.Resource.AdvertiserReport);
            sb.Append("</strong></p></div><br/>");
            sb.Append(sumTableString);
            sumTableString = sb.ToString();
            //Header//

            //Images//
            var gridString2 = Server.MapPath("../Advertiser/Ads/").ToString(CultureInfo.InvariantCulture);
            gridString = gridString.Replace("../Advertiser/Ads/", gridString2);
            //Images//

            var gridStringReader = new StringReader(gridString);
            var sumStringReader = new StringReader(sumTableString);

            pdfDoc.Open();
            htmlparser.Parse(sumStringReader);
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