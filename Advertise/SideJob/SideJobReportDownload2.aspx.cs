using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using Table = System.Web.UI.WebControls.Table;


public partial class SideJobReportDownload2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ReportProperties();
        ProjectImage2.Src =
    "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Ads/Ad1.gif";
        DownloadPDF();

    }


    protected void DownloadPDF()
    {

        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=UserDetails.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        StringWriter sw2 = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        HtmlTextWriter hw2 = new HtmlTextWriter(sw2);
        Report.RenderControl(hw);


        // StringWriter sw2 = new StringWriter();
        // HtmlTextWriter hw2 = new HtmlTextWriter(sw2);
        // NonDisclosureAgreement.RenderControl(hw2);

        Document pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

        NonDisclosureAgreement.RenderControl(hw2);
        string myString = sw.ToString().Trim();

        //string myString3 = NonDisclosureAgreement.InnerHtml;
        string myString3 = sw2.ToString();
        //Header//
        //StringBuilder sb = new StringBuilder();

        //sb.Append(myString);
        //sb.Insert(0, '<div>  <p style='color: #800000; text-align:center'><strong>EXECUTIVE REPORT</strong></p><div><br/><br/>');
        //myString = sb.ToString();
        //Header//


        //////// AS EXAMPLE // ONLY REPLACE THE IMAGES FOR STATIC IMAGES LIKE COUNTRIES://////////////////
        ///  The next 4 lines made it work////          
        // string myString2 = Server.MapPath("Advertiser/Ads/").ToString(CultureInfo.InvariantCulture);
        //string myString2 = Server.MapPath("Advertiser/images/").ToString(CultureInfo.InvariantCulture);
        //myString = myString.Replace("Advertiser/Ads/", myString2.ToString());
        //myString3 = myString.Replace("Advertiser/Ads/", myString3.ToString());

        //myString = Strings.Replace(myString, '<th', '<th align='center'');

        ///  The next 4 lines made it work////



        StringReader str = new StringReader(myString);
        StringReader str2 = new StringReader(myString3);
        pdfDoc.Open();

        htmlparser.Parse(str);

        // step 4: we create a table and add it to the document
       // BuyerTable2(pdfDoc);


        pdfDoc.NewPage();
        htmlparser.Parse(str2);


        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }

    //public void BuyerTable2(Document pdfDoc)
    //{
    //    PdfPTable table = new PdfPTable(2);

    //    PdfPCell cell = new PdfPCell();
    //    cell.HorizontalAlignment = Element.ALIGN_CENTER;

    //    cell.Colspan = 3;
    //    cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
    //    table.AddCell(cell);
    //    table.AddCell(Resources.Resource.BuyerSideJobIDLabel);
    //    table.AddCell("Col 2 Row 1");
    //    table.AddCell("Col 1 Row 2");
    //    table.AddCell("Col 2 Row 2");
    //    table.AddCell("Col 3 Row 2");
    //    pdfDoc.Add(table);
    //}

    protected void ReportProperties()
    {
        var contractID = "2";
        ContractIDLabel.Text = "ContractID: 2";
        //  ContractID.Text = contractID;

        Page1();
        var buyerId = "3";
        var buyerUserName = "sdfsdwerwe";
        var buyerFirstName = "sdfgd";
        var buyerLastName = "srferf";
        var buyerCountryRegionCity = "Overland Park, KS, USA";
        var buyeraddress = "12340 stret name ";

        BuyerID2.Text = buyerId;
        BuyerUserName.Text = buyerUserName;
        BuyerFirstName.Text = buyerFirstName;
        BuyerLastName.Text = buyerLastName;
        BuyerCountryRegionCityLabel.Text = buyerCountryRegionCity;
        BuyerAddress.Text = buyeraddress;

        var serviceproviderId = "4";
        var posterUserName = "Sellersdf";
        var posterFirstName = "sdfd";
        var posterLastName = "df";
        var posterCountryRegionCity = "Overland Park, KS, USA";
        var posterAddress = "12340 stret name ";

        PosterID.Text = serviceproviderId;
        PosterUserName.Text = posterUserName;
        PosterFirstName.Text = posterFirstName;
        PosterLastNameLabel.Text = posterLastName;
        PosterCountryRegionCity.Text = posterCountryRegionCity;
        PosterAddress.Text = posterAddress;


        var projectId = "5";
        var projectTitle = "Project Title";
        var projectAmount = "12.54";
        var projectcurrency = "dollars";
        var projectexperience = " 2 to 5 years";
        var projectCrewNumber = "3";
        var projectLicensed = "Yes";
        var projectInsured = "Yes";
        var projectStartDate = "1/1/2991";
        var projectEndDate = "23/3/2321";
        var projectDescription = "ProjectDescription";
        var projectSpecialNote = "SpecialNotes";
        var projectCounryRegionCity = "Overland Park, KS, USA";
        var projectAddress = "12340 stret name ";

        ProjectID.Text = projectId;
        ProjectTitle.Text = projectTitle;
        ProjectAmount.Text = projectAmount;
        ProjectCurrency.Text = projectcurrency;
        ProjectExperience.Text = projectexperience;
        ProjectCrewNumber.Text = projectCrewNumber;
        ProjectLicensed.Text = projectLicensed;
        ProjectInsured.Text = projectInsured;
        ProjectStartDate.Text = projectStartDate;
        ProjectEndDate.Text = projectEndDate;
        ProjectDescription.Text = projectDescription;
        ProjectSpecialNotes.Text = projectSpecialNote;
        ProjectCountryRegionCity.Text = projectCounryRegionCity;
        ProjectAddress.Text = projectAddress;



        //   ServiceProvider.Text = serviceproviderId;


        //    Project.Text = projectId;




    }


    protected void Page1()
    {
        string test =
    @"<div align='left'><b>THIS PROJECT AGREEMENT AND STATEMENT OF WORK</b>: <br/>this “<b>Agreement</b>” is entered into by and between the undersigned Buyer and
                        Service Provider as of the Effective Date. The Buyer and Service Provider are sometimes
                        referred to collectively herein as the “<b>Parties</b>” and individually as a “<b>Party</b>.”
                        This Agreement is made in pursuance of the Project described herein, on the marketplace
                        for services owned by MY-SIDE-JOB.COM, Inc. (“<b>MY-SIDE-JOB</b>”) at the domain
                        and sub-domains of www.MY-SIDE-JOB.com (the “<b>Site</b>”). All capitalized terms
                        not defined in this Agreement have the meanings given to such terms in the Terms
                        of Service Agreement (“<b>Terms of Service</b>”) available at the Site, unless the
                        context requires otherwise.</div>";
        ProjectAgreementandStatementofWorkPart2Label.Text = test;

        string test2 =
            @"<p style='text-indent: .5in'>
                <b>
                    <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                        <span id='BuyerIsLabel'>1.1 The “Buyer” is:</span>
                    </span>
                    <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #800000'>
                         <span id='BuyerID'>3</span> 
                       </span> 
               </b>
            </p>";


        string test3 =
            @" <table width='700'  border='1' cellspacing='0' cellpadding='0' style='border-collapse: collapse;
                border: none' align='center'>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div align='center'>
                                <span id='BuyerSideJobIDLabel'>Buyer ID:</span></div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='BuyerID2'>3</span>
                             </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='BuyerUserNameLabel'>Username:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='BuyerUserName'>sdfsdwerwe</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='BuyerFirstNameLabel'>First Name:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='BuyerFirstName'>sdfgd</span></span></div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='BuyerLastNameLabel'>Last Name:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='BuyerLastName'>srferf</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='BuyerCountryRegionCityLabel'>Overland Park, KS, USA</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='BuyerCountryRegionCity'></span>
                            </span>
                        </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='BuyerAddressLabel'>Address:</span>
                        </div> 
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='BuyerAddress' style='display:inline-block;width:200px;'>12340 stret name </span>
                            </span>
                       </div>
                    </td>
                </tr>
                </table>";

        BuyerTable.Text = test3;
        string test4 =
            @"<p class='MsoNormal' style='margin-left: 86.25pt; text-indent: -45.25pt'>
                <b>
                    <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                        <span id='ServiceProviderIsLabel'>1.2 The “Service Provider” is: </span>
                     </span>
                    <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #800000'>
                        <span id='ServiceProvider'></span>
                    </span>
                </b>
            </p>
";


        string test5 = @"<table width='700'  border='1' cellspacing='0' cellpadding='0' style='border-collapse: collapse;
                border: none' align='center'>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='PosterIDLabel'>Poster ID:</span></div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='PosterID'>4</span>
                             </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='PosterUserNameLabel'>Username:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='PosterUserName'>Sellersdf</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='PosterFirstNameLabel'>First Name:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='PosterFirstName'>sdfd</span></span></div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='PosterLastNameLabel'>df</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='PoserLastName'></span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='PosterCountryRegionCityLabel'>Country/Region/City:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='PosterCountryRegionCity'>Overland Park, KS, USA</span>
                            </span>
                        </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='PosterAddressLabel'>Address:</span>
                        </div> 
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='PosterAddress' style='display:inline-block;width:200px;'>12340 stret name </span>
                            </span>
                       </div>
                    </td>
                </tr>
                </table>
";

        string test7 =
            @"            <p class='MsoNormal' style='text-indent: .5in'>
                <b>
                    <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                        <span id='ProjectIsLabel'>1.3 The “<b>Project</b>” is:</span>
                    </span>
                    <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #800000'>
                        <span id='Project'></span>
                    </span>
                </b>
            </p>
";


        string test8 = @"            <table width='700'  border='1' cellspacing='0' cellpadding='0' style='border-collapse: collapse;
                border: none' align='center'>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectIDLabel'>Project ID:</span></div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectID'>5</span>
                             </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectTitleLabel'>Project Title:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectTitle'>Project Title</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectAmountLabel'>Amount:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectAmount'>12.54</span></span></div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectCurrencyLabel'>Currency:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectCurrency'>dollars</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectExperienceLabel'>Experience:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectExperience'> 2 to 5 years</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectCrewNumberLabel'>Crew Number:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectCrewNumber'>3</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectLicensedLabel'>Licensed:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectLicensed'>Yes</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectInsuredLabel'>Insured:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectInsured'>Yes</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectStartDateLabel'>Start Date:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectStartDate'>1/1/2991</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectEndDateLabel'>End Date</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectEndDate'>23/3/2321</span>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectCountryRegionCityLabel'>Country/Region/City:</span>
                        </div>
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectCountryRegionCity'>Overland Park, KS, USA</span>
                            </span>
                        </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectAddressLabel'>Address:</span>
                        </div> 
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectAddress' style='display:inline-block;width:200px;'>12340 stret name </span>
                            </span>
                       </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectDescriptionLabel'>Description:</span>
                        </div> 
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectDescription' style='display:inline-block;width:200px;'>ProjectDescription</span>
                            </span>
                       </div>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px' class='bold'>
                        <div class='prop'>
                                <span id='ProjectSpecialNotesLabel'>Special Notes:</span>
                        </div> 
                    </td>
                    <td width='350px'>
                        <div>
                            <span style='font-size: 9.0pt; font-family: 'Arial','sans-serif'; color: #5A5858'>
                                <span id='ProjectSpecialNotes' style='display:inline-block;width:200px;'>SpecialNotes</span>
                            </span>
                       </div>
                    </td>
                </tr>
                </table>
            <br />
            <br />
";

        string test9 = @"            <table width='700' id='Photos' border='1' cellspacing='0' cellpadding='0' style='border-collapse: collapse;
                border: none' align='center'>
                <tr align='center'>
                    <td width='350px' colspan='2' style='width: 700px'>
                        <span id='Top6PhotosLabel'>Top 6 Photos</span>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px'>
                        <img id='ProjectImage1' width='50' height='50' />
                    </td>
                    <td width='350px'>
                        <p>
                            <br />
                            <br />
                        <img src='http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Ads/Ad1.gif' id='ProjectImage2' height='162' width='185' />
                        <br />
                            <br />
                        </p>
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px'>
                           <p>
                            <br />
                            <br />
                        <img src='http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/images/NivoSlider/toystory.jpg' id='ProjectImage3' height='162' width='185' />
                        <br />
                            <br />
                        </p>
                    </td>
                    <td width='350px'>
                        <img id='ProjectImage4' width='50' height='50' />
                    </td>
                </tr>
                <tr align='center'>
                    <td width='350px'>
                        <img id='ProjectImage5' width='50' height='50' />
                    </td>
                    <td width='350px'>
                        <img id='ProjectImage6' width='50' height='50' />
                    </td>
                </tr>
            </table>
            <br />
            <br />
";

    }
}