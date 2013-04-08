using System;
using System.IO;
using System.Web;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace Admanagment.Advertiser.IFrame
{
    public partial class AudienceDemographic : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string v = Request.QueryString["t1"];
            //if (v != null)
            //{
            //    Response.Write("t1 ");
            //    Response.Write(v);
            //}

            //string x = Request.QueryString["t2"];
            //if (x != null)
            //{
            //    Response.Write("t2");
            //}
        }

        protected void btnPDF_Click(object sender, ImageClickEventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=UserDetails.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            var sw = new StringWriter();
            var hw = new HtmlTextWriter(sw);
            gvdetails.AllowPaging = false;
            gvdetails.DataBind();
            gvdetails.RenderControl(hw);
            gvdetails.HeaderRow.Style.Add("width", "15%");
            gvdetails.HeaderRow.Style.Add("font-size", "10px");
            gvdetails.Style.Add("text-decoration", "none");
            gvdetails.Style.Add("font-family", "Arial, Helvetica, sans-serif;");
            gvdetails.Style.Add("font-size", "8px");
            var sr = new StringReader(sw.ToString());
            var pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
            var htmlparser = new HTMLWorker(pdfDoc);
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

        protected void FilterButton_Click(object sender, EventArgs e)
        {
            string t = String.Format("{0:MM/dd/yyyy}", Convert.ToDateTime(HiddenToField.Value));
            string t2 = String.Format("{0:MM/dd/yyyy}", Convert.ToDateTime(HiddenFromField.Value));


            if ((t != string.Empty) || (t2 != string.Empty))
            {
                dsdetails.SelectCommand =
                    "SELECT AdList.Id, AdList.ImageUrl, AdList.Impressions, AdList.StartDate, AdList.EndDate, AdList.IsActive, AdTotalStats.TotalImpression, AdTotalStats.TotalClick FROM AdList " +
                    "INNER JOIN AdTotalStats ON AdList.Id = AdTotalStats.id WHERE (DATEDIFF(dd, '" +
                    t2 + "', AdList.StartDate) < 0) AND (DATEDIFF(dd, '"
                    + t + "', AdList.EndDate) > 0)";


                gvdetails.DataBind();
            }


            //Control myControl1 = FindControl("ctl00$MainContent$HiddenFromField");
            //string instanceID = ((HiddenField)Page.FindControl("ctl00$MainContent$HiddenFromField")).Value;
        }

        protected void PDFButtonClick(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AdvertiserDownload.aspx");
        }

        protected void ViewAllAdImageButton_Click(object sender, ImageClickEventArgs e)
        {
            dsdetails.SelectCommand =
                "SELECT AdList.Id, AdList.ImageUrl, AdList.Impressions, AdList.StartDate, AdList.EndDate, AdList.IsActive, AdTotalStats.TotalImpression, AdTotalStats.TotalClick FROM AdList " +
                "INNER JOIN AdTotalStats ON AdList.Id = AdTotalStats.id ";

            gvdetails.DataBind();
        }
    }
}