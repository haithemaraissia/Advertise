using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.VisualBasic;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace Admanagment.Advertiser.IFrame
{
    public partial class _2GridDownload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string t1 = Request.QueryString["t1"];
            string t2 = Request.QueryString["t2"];

            if (!string.IsNullOrEmpty(t1) && !string.IsNullOrEmpty(t2))
            {
                dsdetails.SelectCommand = "SELECT AdList.Id, AdList.ImageUrl, AdList.Impressions, AdList.StartDate, AdList.EndDate, AdList.IsActive, AdTotalStats.TotalImpression, AdTotalStats.TotalClick FROM AdList " +
                   "INNER JOIN AdTotalStats ON AdList.Id = AdTotalStats.id WHERE (DATEDIFF(dd, '" +
                    t2.ToString() + "', AdList.StartDate) < 0) AND (DATEDIFF(dd, '"
                   + t1.ToString() + "', AdList.EndDate) > 0)";
            }

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=UserDetails.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            gvdetails.AllowPaging = false;
            gvdetails.DataBind();
            gvdetails.RenderControl(hw);
            hw.RenderBeginTag("p");
            hw.RenderEndTag();
            hw.RenderBeginTag("p");
            hw.RenderEndTag();
            hw.RenderBeginTag("p");
            hw.RenderEndTag();
            //if (gvdetails.Rows.Count > 0)
            //{
            //    gvdetails.HeaderRow.Style.Add("width", "15%");
            //    gvdetails.HeaderRow.Style.Add("font-size", "10px");
            //    gvdetails.HeaderRow.Style.Add("text-align", "right");
            //}
            gvdetails.Style.Add("text-decoration", "none");
            gvdetails.Style.Add("font-family", "Arial, Helvetica, sans-serif;");
            gvdetails.Style.Add("font-size", "8px");

            hw.RenderBeginTag("br");
            hw.RenderEndTag();
            hw.RenderBeginTag("br");
            hw.RenderEndTag();
            hw.RenderBeginTag("br");
            hw.RenderEndTag();
            /////SECOND GRID////
            GridView1.AllowPaging = false;
            GridView1.DataBind();
            GridView1.RenderControl(hw);

            GridView1.Style.Add("text-decoration", "underline");
            GridView1.Style.Add("font-family", "Arial, Helvetica, sans-serif;");
            GridView1.Style.Add("font-size", "8px");

            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            string myString = sw.ToString();


            //Header//
            StringBuilder sb = new StringBuilder();

            sb.Append(myString);
            sb.Insert(0, "<div>  <p style='color: #800000; text-align:center'><strong>EXECUTIVE REPORT</strong></p><div><br/><br/>");
            myString = sb.ToString();
            //Header//


            //////// AS EXAMPLE // ONLY REPLACE THE IMAGES FOR STATIC IMAGES LIKE COUNTRIES://////////////////
            ///  The next 4 lines made it work////          
            string myString2 = Server.MapPath("../Advertiser/Ads/").ToString(CultureInfo.InvariantCulture);
            myString = myString.Replace( "../Advertiser/Ads/", myString2.ToString());
            //myString = Strings.Replace(myString, "<th", "<th align='center'");

            ///  The next 4 lines made it work////


            StringReader str = new StringReader(myString);
            pdfDoc.Open();
            htmlparser.Parse(str);

            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnPDF_Click(object sender, ImageClickEventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=UserDetails.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            gvdetails.AllowPaging = false;
            gvdetails.DataBind();
            gvdetails.RenderControl(hw);
            gvdetails.HeaderRow.Style.Add("width", "15%");
            gvdetails.HeaderRow.Style.Add("font-size", "10px");
            gvdetails.Style.Add("text-decoration", "none");
            gvdetails.Style.Add("font-family", "Arial, Helvetica, sans-serif;");
            gvdetails.Style.Add("font-size", "8px");
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        protected void gvdetails_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}