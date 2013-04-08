using System;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using SidejobModel;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

public partial class SideJobReportDownload3 : System.Web.UI.Page
{    
    protected override void InitializeCulture()
    {
        var lang = Request.QueryString["l"];
        if (lang != null | !string.IsNullOrEmpty(lang))
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
            Session["LCID"] = Admanagment.Helpers.Utility.GetLCID(lang);
        }
        else
        {
            if (Session["LCID"] != null)
            {
                Thread.CurrentThread.CurrentUICulture =
                    new CultureInfo(Admanagment.Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                Thread.CurrentThread.CurrentCulture =
                    CultureInfo.CreateSpecificCulture(Admanagment.Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DefaultLCID();
        ReportProperties();
        NonDisclosureProperties();
        DownloadPDF();
    }

    public void DefaultLCID()
    {
        if (Session["LCID"] == null)
        {
            Session["LCID"] = 1;
        }
    }

    protected void DownloadPDF()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=UserDetails.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        var reportstringwriter = new StringWriter();
        var nondisclosurestringwriter = new StringWriter();
        var reporthtmlwriter = new HtmlTextWriter(reportstringwriter);
        var nondisclosurehtmlwriter = new HtmlTextWriter(nondisclosurestringwriter);
        var pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
        var htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        Report.RenderControl(reporthtmlwriter);
        NonDisclosureAgreement.RenderControl(nondisclosurehtmlwriter);
        var reportstring = reportstringwriter.ToString();
        var nondisclosurestring = nondisclosurestringwriter.ToString();
        var reportstringreader = new StringReader(reportstring);
        var nondisclosurestringreader = new StringReader(nondisclosurestring);
        pdfDoc.Open();
        htmlparser.Parse(reportstringreader);
        pdfDoc.NewPage();
        htmlparser.Parse(nondisclosurestringreader);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }

    protected int GetContractID()
    {
        if (Request.QueryString["ID"] == null)
        {
            Response.Redirect("~/Home.aspx");
            return 0;
        }
        return int.Parse(Request.QueryString["ID"]);
    }

    protected void ReportProperties()
    {
        var contractID = GetContractID();
        ContractIDLabel.Text = Resources.Resource.ContractIDLabel + contractID;
        Page1();
        Page2();
        Page3();
        Page4();
        using (var context = new SidejobEntities())
        {
            var contract = (from c in context.Contracts
                            where c.ContractID == contractID
                            select c).FirstOrDefault();
            if (contract != null)
            {
                //Buyer
                var buyercountry = contract.PosterCountryName ?? "";
                var buyerregion = contract.PosterRegionName ?? "";
                var buyercity = contract.PosterCityName ?? "";
                var buyerlocation = buyercountry.ToString(CultureInfo.InvariantCulture) + buyerregion +
                                          buyercity.ToString(CultureInfo.InvariantCulture);
                BuyerID2.Text = contract.PosterID.ToString(CultureInfo.InvariantCulture);
                BuyerUserName.Text = contract.PosterUsername;
                BuyerFirstName.Text = contract.PosterFirstName;
                BuyerLastName.Text = contract.PosterLastName;
                BuyerCountryRegionCity.Text = buyerlocation;
                BuyerAddress.Text = contract.PosterAddress;

                //Service Provider
                var postercountry = contract.PosterCountryName ?? "";
                var posterregion = contract.PosterRegionName ?? "";
                var postercity = contract.PosterCityName ?? "";
                var posterlocation = postercountry.ToString(CultureInfo.InvariantCulture) + posterregion +
                                          postercity.ToString(CultureInfo.InvariantCulture);
                PosterID.Text = contract.BidderID.ToString(CultureInfo.InvariantCulture);
                PosterUserName.Text = contract.BidderUsername;
                PosterFirstName.Text = contract.BidderFirstName;
                PoserLastName.Text = contract.BidderLastName;
                PosterCountryRegionCity.Text = posterlocation;
                PosterAddress.Text = contract.BidderAddress;
            }

            //Project//  
            if (contract != null)
            {
                int projectID = contract.ProjectID;
                var archivedprojectrequirement = (from c in context.ArchievedCompletedProjectRequirements
                                                  where c.ProjectID == projectID
                                                  select c).FirstOrDefault();
                ProjectID.Text = projectID.ToString(CultureInfo.InvariantCulture);
                if (archivedprojectrequirement != null)
                {
                    ProjectTitle.Text = archivedprojectrequirement.ProjectTitle;
                    ProjectAmount.Text = archivedprojectrequirement.AmountOffered.ToString(CultureInfo.InvariantCulture);  
                    
                    //Archived Project Requirement
                    var currencyID = archivedprojectrequirement.CurrencyID;
                    var experienceID = archivedprojectrequirement.ExperienceID;
                    var crewnumberID = archivedprojectrequirement.CrewNumberID;
                    var licensedID = archivedprojectrequirement.LicensedID;
                    var insuredID = archivedprojectrequirement.InsuredID;
                    var relocationID = archivedprojectrequirement.RelocationID;
                    ProjectCurrency.Text = GetCurrency(currencyID).ToString(CultureInfo.InvariantCulture);
                    ProjectExperience.Text = GetExperience(experienceID, Convert.ToInt32(Session["LCID"].ToString())).ToString(CultureInfo.InvariantCulture);
                    ProjectCrewNumber.Text = GetCrewnumber(crewnumberID, Convert.ToInt32(Session["LCID"].ToString())).ToString(CultureInfo.InvariantCulture);
                    ProjectLicensed.Text = GetLicensed(licensedID, Convert.ToInt32(Session["LCID"].ToString())).ToString(CultureInfo.InvariantCulture);
                    ProjectInsured.Text = GetInsured(insuredID, Convert.ToInt32(Session["LCID"].ToString())).ToString(CultureInfo.InvariantCulture);
                    ProjectRelocation.Text = GetInsured(relocationID, Convert.ToInt32(Session["LCID"].ToString())).ToString(CultureInfo.InvariantCulture);
                    var projectcountry = archivedprojectrequirement.CountryName ?? "";
                    var projectregion = archivedprojectrequirement.RegionName ?? "";
                    var projectcity = archivedprojectrequirement.CityName ?? "";
                    var projectlocation = projectcountry.ToString(CultureInfo.InvariantCulture) + projectregion + projectcity.ToString(CultureInfo.InvariantCulture);
                    ProjectStartDate.Text = archivedprojectrequirement.StartDate.ToString(CultureInfo.InvariantCulture);
                    ProjectEndDate.Text = archivedprojectrequirement.EndDate.ToString(CultureInfo.InvariantCulture);
                    ProjectDescription.Text = archivedprojectrequirement.Description;
                    ProjectSpecialNotes.Text = archivedprojectrequirement.SpecialNotes;
                    ProjectCountryRegionCity.Text = projectlocation;
                    ProjectAddress.Text = archivedprojectrequirement.Address;
                    //Archived Project Requirement

                    GetProjectPicture(projectID);
                }
            }
        }
    }

    protected void GetProjectPicture( int projectID)
    {
        const string noprojectimagepath = "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Ads/Ad1.gif";
        using (var context = new SidejobEntities())
        {
            var photolist = from c in context.ProjectPhotoes
                            where c.ProjectID == projectID
                            select c;
            if (!photolist.Any())
            {
                ProjectImage1.Src = noprojectimagepath;
                ProjectImage2.Src = noprojectimagepath;
                ProjectImage3.Src = noprojectimagepath;
                ProjectImage4.Src = noprojectimagepath;
                ProjectImage5.Src = noprojectimagepath;
                ProjectImage6.Src = noprojectimagepath;
            }
            else if (photolist.Count() < 6)
            {
                CompletePhoto(photolist, photolist.Count());
            }
            else
            {
                var list = photolist.ToList();
                ProjectImage1.Src = list[0].PhotoPath;
                ProjectImage2.Src = list[1].PhotoPath;
                ProjectImage3.Src = list[2].PhotoPath;
                ProjectImage4.Src = list[3].PhotoPath;
                ProjectImage5.Src = list[4].PhotoPath;
                ProjectImage6.Src = list[5].PhotoPath;
            }
        }
    }

    public void CompletePhoto(IQueryable<ProjectPhoto> photolist, int count)
    {
        const string noprojectimagepath = "http://haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/Advertiser/Ads/Ad1.gif";
        var list = photolist.ToList();
        switch(count)
        {
            case 1:
                ProjectImage1.Src = list[0].PhotoPath;
                ProjectImage2.Src = noprojectimagepath;
                ProjectImage3.Src = noprojectimagepath;
                ProjectImage4.Src = noprojectimagepath;
                ProjectImage5.Src = noprojectimagepath;
                ProjectImage6.Src = noprojectimagepath;
                break;
            case 2:
                ProjectImage1.Src = list[0].PhotoPath;
                ProjectImage2.Src = list[1].PhotoPath; 
                ProjectImage3.Src = noprojectimagepath;
                ProjectImage4.Src = noprojectimagepath;
                ProjectImage5.Src = noprojectimagepath;
                ProjectImage6.Src = noprojectimagepath;
                break;
            case 3:
                ProjectImage1.Src = list[0].PhotoPath;
                ProjectImage2.Src = list[1].PhotoPath;
                ProjectImage3.Src = list[2].PhotoPath; 
                ProjectImage4.Src = noprojectimagepath;
                ProjectImage5.Src = noprojectimagepath;
                ProjectImage6.Src = noprojectimagepath;
                break;
            case 4:
                ProjectImage1.Src = list[0].PhotoPath;
                ProjectImage2.Src = list[1].PhotoPath;
                ProjectImage3.Src = list[2].PhotoPath;
                ProjectImage4.Src = list[3].PhotoPath; 
                ProjectImage5.Src = noprojectimagepath;
                ProjectImage6.Src = noprojectimagepath;
                break;
            case 5:
                ProjectImage1.Src = list[0].PhotoPath;
                ProjectImage2.Src = list[1].PhotoPath;
                ProjectImage3.Src = list[2].PhotoPath;
                ProjectImage4.Src = list[3].PhotoPath;
                ProjectImage5.Src = list[4].PhotoPath; 
                ProjectImage6.Src = noprojectimagepath;
                break;
            case 6:
                ProjectImage1.Src = list[0].PhotoPath;
                ProjectImage2.Src = list[1].PhotoPath;
                ProjectImage3.Src = list[2].PhotoPath;
                ProjectImage4.Src = list[3].PhotoPath;
                ProjectImage5.Src = list[4].PhotoPath;
                ProjectImage6.Src = list[5].PhotoPath; 
                break;
        }
    }

    protected void NonDisclosureProperties()
    {
        Page5();
    }

    protected void Page1()
    {
        var projectAgreement = "<div align='left'><b>" + Resources.Resource.ProjectAgreementandStatementofWorkPart1Label +
                         "</b><br/>" + Resources.Resource.ProjectAgreementandStatementofWorkPart2Label + "</div>";
        ProjectAgreementandStatementofWork.Text = projectAgreement;
    }

    protected void Page2()
    {
        var statementofwork = "<div align='left'><b>" + Resources.Resource.StatementofWorkPart1Label +
                 "</b><br/>" + Resources.Resource.StatementofWorkPart2Label + "</div>";
        StatementofWork.Text = statementofwork;

        var engagmentperformance = "<div align='left'><b>" + Resources.Resource.EngagmentandPerformanceofServicesPart1Label + "</b></div>";
        EngagmentandPerformance.Text = engagmentperformance;

        var projectwork = "<div align='left'><b>" + Resources.Resource.ProjectWorkLabel +
                 "</b><br/>" + Resources.Resource.EngagmentandPerformanceofServicesPart2Label + "</div>";
        ProjectWork.Text = projectwork;

        var performance = "<div align='left'><b>" + Resources.Resource.PerformanceLabelPart1 +
                 "</b><br/>" + Resources.Resource.PerformanceLabelPart2 + "</div>";
        Performance.Text = performance;

        var duration = "<div align='left'><b>" + Resources.Resource.DurationLabelPart1 +
         "</b><br/>" + Resources.Resource.DurationLabelPart2 + "</div>";
        Duration.Text = duration;

        var changecontrol = "<div align='left'><b>" + Resources.Resource.ChangeControlLabelPart1 +
    "</b><br/>" + Resources.Resource.ChangeControlLabelPart2 + Resources.Resource.ChangeControlLabelPart3 + "</div>";
        ChangeControl.Text = changecontrol;

        var changecontrol1 = "<div align='left'>" + Resources.Resource.ChangeRequestLabelPart1 + "</div>";
        ChangeControl1.Text = changecontrol1;

        var changecontrol2 = "<div align='left'>" + Resources.Resource.ChangeRequestLabelPart2 + "</div>";
        ChangeControl2.Text = changecontrol2;

        var changecontrol3 = "<div align='left'>" + Resources.Resource.ChangeRequestLabelPart3 + "</div>";
        ChangeControl3.Text = changecontrol3;

        var changecontrol4 = "<div align='left'>" + Resources.Resource.WritterCRLabel + "</div>";
        ChangeControl4.Text = changecontrol4;

        var compensation = "<div align='left'><b>" + Resources.Resource.CompensationPart1Label +
         "</b><br/>" + Resources.Resource.CompensationPart2Label + "</div>";
        Compensation.Text = compensation;

        var independentContractorRelationship = "<div align='left'><b>" + Resources.Resource.IndependentContractorRelationshipPart1Label +
         "</b><br/>" + Resources.Resource.IndependentContractorRelationshipPart2Label + "</div>";
        IndependentContractRelationship.Text = independentContractorRelationship;
    }

    protected void Page3()
    {
        var intellectualproperty = "<div align='left'><b>" + Resources.Resource.IntellectualPropertyLabel + "</b></div>";
        IntellectualProperty.Text = intellectualproperty;

        var intellectualpropertyrights = "<div align='left'><b>" + Resources.Resource.StatementofWorkPart1Label +
 "</b><br/>" + Resources.Resource.StatementofWorkPart2Label + "</div>";
        InventionsandIntellectualPropertyRights.Text = intellectualpropertyrights;

        var backgroundtechnology = "<div align='left'><b>" + Resources.Resource.BackgroundTechnologyPart1Label +
 "</b><br/>" + Resources.Resource.BackgroundTechnologyPart2Label + "</div>";
        BackgroundTechnology.Text = backgroundtechnology;

        var licensedtobackgroundtechnology = "<div align='left'><b>" + Resources.Resource.LicensetoBackgroundTechnologyPart1Label +
 "</b><br/>" + Resources.Resource.LicensetoBackgroundTechnologyPart2Label + "</div>";
        LicenseToBackgroundTechnology.Text = licensedtobackgroundtechnology;

        var ownershipandassignmentofworkproduct = "<div align='left'><b>" + Resources.Resource.OwnershipandAssignmentofWorkProductPart1Label +
 "</b><br/>" + Resources.Resource.OwnershipandAssignmentofWorkProductPart2Label + "</div>";
        OwnershipandAssignmentofWorkProduct.Text = ownershipandassignmentofworkproduct;

        var licensetorwaiverofotherrRights = "<div align='left'><b>" + Resources.Resource.LicensetoorWaiverofOtherRightsPart1Label +
 "</b><br/>" + Resources.Resource.LicensetoorWaiverofOtherRightsPart2Label + "</div>";
        LicensetorWaiverofOtherRights.Text = licensetorwaiverofotherrRights;

        var assitance = "<div align='left'><b>" + Resources.Resource.AssitancePart1Label +
 "</b><br/>" + Resources.Resource.AssitancePart2Label + "</div>";
        Assitance.Text = assitance;

        var competitiveorconflictingprojects = "<div align='left'><b>" + Resources.Resource.CompetitiveorConflictingProjectsPart1Label +
 "</b><br/>" + Resources.Resource.CompetitiveorConflictingProjectsPart2Label + "</div>";
        CompetitiveorConflictingProjects.Text = competitiveorconflictingprojects;

        var confidentialinformation = "<div align='left'><b>" + Resources.Resource.ConfidentialInformationPart1Label +
 "</b><br/>" + Resources.Resource.ConfidentialInformationPart2Label + "</div>";
        ConfidentialInformation.Text = confidentialinformation;

        var serviceproviderrepresentationsandwarranties = "<div align='left'><b>" + Resources.Resource.ServiceProviderRepresentationsandWarrantiesPart1Label +
 "</b><br/>" + Resources.Resource.ServiceProviderRepresentationsandWarrantiesPart2Label + "</div>";
        ServiceProviderRepresentationsandWarranties.Text = serviceproviderrepresentationsandwarranties;

        var indemnification = "<div align='left'><b>" + Resources.Resource.IndemnificationPart1Label +
 "</b><br/>" + Resources.Resource.IndemnificationPart2Label + "</div>";
        Indemnification.Text = indemnification;

        var insurance = "<div align='left'><b>" + Resources.Resource.InsurancePart1Label +
 "</b><br/>" + Resources.Resource.InsurancePart2Label + "</div>";
        Insurance.Text = insurance;

        var termination = "<div align='left'><b>" + Resources.Resource.TerminationPart1Label + "</b></div>";
        Termination.Text = termination;

        var terminationwithcause = "<div align='left'><b>" + Resources.Resource.TerminationwithCausePart1Label +
 "</b><br/>" + Resources.Resource.TerminationwithCausePart2Label + "</div>";
        TerminationwithCause.Text = terminationwithcause;

        var returnofproperty = "<div align='left'><b>" + Resources.Resource.ReturnofPropertyPart1Label +
 "</b><br/>" + Resources.Resource.ReturnofPropertyPart2Label + "</div>";
        ReturnofProperty.Text = returnofproperty;

        var survival = "<div align='left'><b>" + Resources.Resource.SurvivalPart1Label +
 "</b><br/>" + Resources.Resource.SurvivalPart2Label + "</div>";
        Survival.Text = survival;

        var mutiemployeeserviceprovider = "<div align='left'><b>" + Resources.Resource.MutiEmployeeServiceProviderPart1Label +
 "</b><br/>" + Resources.Resource.MutiEmployeeServiceProviderPart2Label + "</div>";
        MutiEmployeeServiceProvider.Text = mutiemployeeserviceprovider;

        var note = "<div align='left'><b>" + Resources.Resource.NotePart1Label +
 "</b><br/>" + Resources.Resource.NotePart2Label + "</div>";
        Note.Text = note;
    }

    protected void Page4()
    {
        var generalprovisions = "<div align='left'><b>" + Resources.Resource.GeneralProvisionsLabel + "</b></div>";
        GeneralProvisions.Text = generalprovisions;

        var governinglawandvenue = "<div align='left'><b>" + Resources.Resource.GoverningLawandVenuePart1Label +
 "</b><br/>" + Resources.Resource.GoverningLawandVenuePart2Label + "</div>";
        GoverningLawandVenue.Text = governinglawandvenue;

        var severability = "<div align='left'><b>" + Resources.Resource.SeverabilityPart1Label +
 "</b><br/>" + Resources.Resource.SeverabilityPart2Label + "</div>";
        Severability.Text = severability;

        var noAssignment = "<div align='left'><b>" + Resources.Resource.NoAssignmentPart1Label +
 "</b><br/>" + Resources.Resource.NoAssignmentPart2Label + "</div>";
        NoAssignment.Text = noAssignment;

        var notices = "<div align='left'><b>" + Resources.Resource.NoticesPart1Label +
 "</b><br/>" + Resources.Resource.NoticesPart2Label + "</div>";
        Notices.Text = notices;

        var injunctiverelief = "<div align='left'><b>" + Resources.Resource.InjunctiveReliefPart1Label +
 "</b><br/>" + Resources.Resource.InjunctiveReliefPart2Label + "</div>";
        InjunctiveRelief.Text = injunctiverelief;

        var waiver = "<div align='left'><b>" + Resources.Resource.WaiverPart1Label +
 "</b><br/>" + Resources.Resource.WaiverPart2Label + "</div>";
        Waiver.Text = waiver;

        var export = "<div align='left'><b>" + Resources.Resource.ExportPart1Label +
 "</b><br/>" + Resources.Resource.ExportPart2Label + "</div>";
        Export.Text = export;

        var executionandDelivery = "<div align='left'><b>" + Resources.Resource.ExecutionandDeliveryPart1Label +
 "</b><br/>" + Resources.Resource.ExecutionandDeliveryPart2Label + "</div>";
        ExecutionandDelivery.Text = executionandDelivery;

        var entireAgreement = "<div align='left'><b>" + Resources.Resource.EntireAgreementPart1Label +
 "</b><br/>" + Resources.Resource.EntireAgreementPart2Label + "</div>";
        EntireAgreement.Text = entireAgreement;

        var inwitnesswhereof = "<div align='left'><b>" + Resources.Resource.InWitnessWhereOfPart1Label +
 "</b><br/>" + Resources.Resource.InWitnessWhereOfPart2Label + "</div>";
        InWitnessWhereOf.Text = inwitnesswhereof;
    }

    protected void Page5()
    {
        var agreementdatelabel = "([" + DateTime.Now.Month + ", " + DateTime.Now.Day + ", " + DateTime.Now.Year + "])";
        AgreementDateLabel.Text = agreementdatelabel;

        var betweenparty = "<div align='left'><b>" + Resources.Resource.BetweenLabel + "</b>" + Resources.Resource.PartyALabel + Resources.Resource.PartyA + Resources.Resource.PartyBLabel
            + Resources.Resource.PartyB + Resources.Resource.PartyAB + "</div>"; ;
        BetweenParty.Text = betweenparty;

        var recitals = "<div align='left'><b>" + Resources.Resource.RecitalsPart1Label +"</b><br/>" + Resources.Resource.RecitalsPart2Label + "</div>";
        Recitals.Text = recitals;

        var operativeprovisionspart1 = "<div align='left'><b>" + Resources.Resource.OperativeProvisionsPart1Label +
                                       "</b><br/></div>";
        OperativeProvisionsPart1.Text = operativeprovisionspart1;

        var operativeprovisionspart2 = "<div align='left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + Resources.Resource.OneLabel + "." + Resources.Resource.OperativeProvisionsPart2Label + "</div>"; ;
        OperativeProvisionsPart2.Text = operativeprovisionspart2;

        var operativeprovisionspart3 = "<div align='left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + Resources.Resource.TwoLabel + "." + Resources.Resource.OperativeProvisionsPart3Label + "</div>"; ;
        OperativeProvisionsPart3.Text = operativeprovisionspart3;

        var operativeprovisionspart4 = "<div align='left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + Resources.Resource.ThreeLabel + "." + Resources.Resource.OperativeProvisionsPart4Label + "</div>"; ;
        OperativeProvisionsPart4.Text = operativeprovisionspart4;

        var operativeprovisionspart5 = "<div align='left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + Resources.Resource.FourLabel + "." + Resources.Resource.OperativeProvisionsPart5Label + "</div>"; ;
        OperativeProvisionsPart5.Text = operativeprovisionspart5;

        var operativeprovisionspart6 = "<div align='left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + Resources.Resource.FiveLabel + "." + Resources.Resource.OperativeProvisionsPart6Label + "</div>"; ;
        OperativeProvisionsPart6.Text = operativeprovisionspart6;

        var operativeprovisionspart7 = "<div align='left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + Resources.Resource.SixLabel + "." + Resources.Resource.OperativeProvisionsPart7Label + "</div>"; ;
        OperativeProvisionsPart7.Text = operativeprovisionspart7;

        var operativeprovisionspart8 = "<div align='left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + Resources.Resource.SevenLabel + "." + Resources.Resource.OperativeProvisionsPart8Label + "</div>"; ;
        OperativeProvisionsPart8.Text = operativeprovisionspart8;
    }

    public static string GetCurrency(int currencyID )
    {
        using (var context = new SidejobEntities())
        {
            var result = from c in context.Currencies
                         where c.CurrencyID == currencyID 
                         select c.CurrencyValue;
            return result.FirstOrDefault();
        }
    }

    public static string GetExperience(int experienceID, int lcid)
    {
        using (var context = new SidejobEntities())
        {
            var result = from c in context.Experiences
                         where c.ExperienceID == experienceID && c.LCID == lcid
                         select c.ExperienceValue;
            return result.FirstOrDefault();
        }
    }

    public static string GetLicensed(int licensedID, int lcid)
    {
        using (var context = new SidejobEntities())
        {
            var result = from c in context.Licenseds
                         where c.LicensedID == licensedID && c.LCID == lcid
                         select c.LicensedValue;
            return result.FirstOrDefault();
        }
    }

    public static string GetInsured(int insuredID, int lcid)
    {
        using (var context = new SidejobEntities())
        {
            var result = from c in context.Insureds
                         where c.InsuredID == insuredID && c.LCID == lcid
                         select c.InsuredValue;
            return result.FirstOrDefault();
        }
    }

    public static string GetCrewnumber(int crewnumberID, int lcid)
    {
        using (var context = new SidejobEntities())
        {
            var result = from c in context.CrewNumbers
                         where c.crewnumberID == crewnumberID && c.LCID == lcid
                         select c.crewnumberValue;
            return result.FirstOrDefault();
        }
    }

    public static string GetRelocation(int relocationID, int lcid)
    {
        using (var context = new SidejobEntities())
        {
            var result = from c in context.Relocations
                         where c.RelocationID == relocationID && c.LCID == lcid
                         select c.RelocationValue;
            return result.FirstOrDefault();
        }
    }
}