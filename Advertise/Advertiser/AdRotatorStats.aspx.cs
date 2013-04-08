using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdManagment
{
    public partial class AdRotatorStats : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }




    //    Protected Sub DownloadLinkButton_Click(sender As Object, e As System.EventArgs)

    //    Dim CustomerContractAdapter As New ContractDataSetTableAdapters.ContractTableAdapter
    //    Dim CustomerContractTable As New ContractDataSet.ContractDataTable
    //    CustomerContractAdapter.FillContract(CustomerContractTable, Convert.ToInt32((GlobalContractGridView.SelectedDataKey.Value.ToString())))

    //    Dim CustomerReportDataSource As New ReportDataSource()
    //    CustomerReportDataSource.Name = "ContractDataSet"
    //    CustomerReportDataSource.Value = CustomerContractTable

    //    Dim CustomerContractDescriptionAdapter As New ContractDataSetTableAdapters.ContractDescriptionTableAdapter
    //    Dim CustomerContractDescriptionTable As New ContractDataSet.ContractDescriptionDataTable
    //    CustomerContractDescriptionAdapter.FillContractDescription(CustomerContractDescriptionTable, _language.ToString())

    //    Dim CustomerDescriptionReportDataSource As New ReportDataSource()
    //    CustomerDescriptionReportDataSource.Name = "ContractDescriptionDataSet"
    //    CustomerDescriptionReportDataSource.Value = CustomerContractDescriptionTable

    //    CustomerReportViewer.Visible = True
    //    CustomerReportViewer.LocalReport.DataSources.Clear()
    //    CustomerReportViewer.LocalReport.DataSources.Add(CustomerReportDataSource)
    //    CustomerReportViewer.LocalReport.DataSources.Add(CustomerDescriptionReportDataSource)
    //    CustomerReportViewer.LocalReport.Refresh()

    //    ' ''Export to PDF
    //    Dim mimeType As String
    //    Dim encoding As String
    //    Dim fileNameExtension As String
    //    Dim streams As String()
    //    Dim warnings As Warning()

    //    Dim pdfContent As Byte() = CustomerReportViewer.LocalReport.Render("PDF", Nothing, mimeType, encoding, fileNameExtension, streams, _
    //     warnings)

    //    'Return PDF
    //    Response.Clear()
    //    Response.ContentType = "application/pdf"
    //    Response.AddHeader("Content-disposition", "attachment; filename=Contract.pdf")
    //    Response.BinaryWrite(pdfContent)
    //    Response.[End]()

    //End Sub



    }
}