<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SideJobReportDownload.aspx.cs"
    Inherits="SideJobReportDownload" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .left
        {
            text-align: left;
        }
        .center
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server"> 
    <div id="Report" runat="server">
        <div>
            <p align="center" style='text-align: center; line-height: 180%; background: white'>
                <b><span style='font-size: 20.0pt; font-family: "Arial","sans-serif"; color: #8D2700'>
                    <asp:Label ID="ProjectAgreementLabel" runat="server" Text="<%$ Resources:Resource, ProjectAgreementLabel %>">
                    </asp:Label>
                </span></b>
                <br />
                <br />
                <b><span style='font-size: 15.0pt; font-family: "Arial","sans-serif"; color: #CC0000;
                    text-decoration: underline;'><asp:Label ID="ContractIDLabel" runat="server" Text="<%$ Resources:Resource, ContractIDLabel %>" /></span></b>
            </p>
            <p>
            <asp:Label ID="ProjectAgreementandStatementofWork" runat="server" Text=""></asp:Label>
            </p>
            <p>
                <span>
                    <b>
                        <asp:Label ID="BackgroundInitialObligationLabel" runat="server" Text="<%$ Resources:Resource, BackgroundInitialObligationLabel %>">
                        </asp:Label>
                        <br />
                    </b>
                 </span>
             </p>
            <p>
                <b>
                    <span >
                        <asp:Label ID="BuyerIsLabel" runat="server" Text="<%$ Resources:Resource, BuyerIslabel %>"></asp:Label>
                    </span>
                   
               </b>
            </p>
            <table border = "1" width = "700" cellpadding="20" cellspacing="20"  >
    <tr><td class="center"><span style="text-align: center"><asp:Label ID="BuyerSideJobIDLabel" runat="server" Text="<%$ Resources:Resource, BuyerSideJobIDLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="BuyerID2" runat="server" Text=""></asp:Label></span></td></tr>
        <tr><td class="center"><span style="text-align: center"><asp:Label ID="BuyerUserNameLabel" runat="server" Text="<%$ Resources:Resource, BuyerUserNameLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="BuyerUserName" runat="server" Text=""></asp:Label></span></td></tr>
            <tr><td class="center"><span style="text-align: center"><asp:Label ID="BuyerFirstNameLabel" runat="server" Text="<%$ Resources:Resource, BuyerFirstNameLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="BuyerFirstName" runat="server" Text=""></asp:Label></span></td></tr>
                <tr><td class="center"><span style="text-align: center"><asp:Label ID="BuyerLastNameLabel" runat="server" Text="<%$ Resources:Resource, BuyerLastNameLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="BuyerLastName" runat="server" Text=""></asp:Label></span></td></tr>
                    <tr><td class="center"><span style="text-align: center"><asp:Label ID="BuyerCountryRegionCityLabel" runat="server" Text="<%$ Resources:Resource, BuyerCountryRegionCityLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="BuyerCountryRegionCity" runat="server" Text=""></asp:Label></span></td></tr>
                        <tr><td class="center"><span style="text-align: center"><asp:Label ID="BuyerAddressLabel" runat="server" Text="<%$ Resources:Resource, BuyerAddressLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="BuyerAddress" runat="server" Text="" Width="200px"></asp:Label></span></td></tr>
                                   </table>
            <p>
                <b>
                    <span >
                        <asp:Label ID="ServiceProviderIsLabel" runat="server" Text="<%$ Resources:Resource, ServiceProviderIsLabel %>"></asp:Label>
                     </span>

                </b>
            </p>
            <table border = "1" width = "700" cellpadding="20" cellspacing="20"  >
    <tr><td class="center"><span style="text-align: center"><asp:Label ID="PosterIDLabel" runat="server" Text="<%$ Resources:Resource, PosterIDLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="PosterID" runat="server" Text=""></asp:Label></span></td></tr>
        <tr><td class="center"><span style="text-align: center"><asp:Label ID="PosterUserNameLabel" runat="server" Text="<%$ Resources:Resource, PosterUserNameLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="PosterUserName" runat="server" Text=""></asp:Label></span></td></tr>
            <tr><td class="center"><span style="text-align: center"><asp:Label ID="PosterFirstNameLabel" runat="server" Text="<%$ Resources:Resource, PosterFirstNameLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="PosterFirstName" runat="server" Text=""></asp:Label></span></td></tr>
                <tr><td class="center"><span style="text-align: center"><asp:Label ID="PosterLastNameLabel" runat="server" Text="<%$ Resources:Resource, PosterLastNameLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="PoserLastName" runat="server" Text=""></asp:Label></span></td></tr>
                    <tr><td class="center"><span style="text-align: center"><asp:Label ID="PosterCountryRegionCityLabel" runat="server" Text="<%$ Resources:Resource, PosterCountryRegionCityLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="PosterCountryRegionCity" runat="server" Text=""></asp:Label></span></td></tr>
                        <tr><td class="center"><span style="text-align: center"><asp:Label ID="PosterAddressLabel" runat="server" Text="<%$ Resources:Resource, PosterAddressLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="PosterAddress" runat="server" Text="" Width="200px"></asp:Label></span></td></tr>
                                   </table>
            <p>
                <b>
                    <span >
                        <asp:Label ID="ProjectIsLabel" runat="server" Text="<%$ Resources:Resource, ProjectIsLabel %>"></asp:Label>
                    </span>

                </b>
            </p>    
            <table border = "1" width = "700" cellpadding="20" cellspacing="20"  >
    <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectIDLabel" runat="server" Text="<%$ Resources:Resource, ProjectID %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectID" runat="server" Text=""></asp:Label></span></td></tr>
        <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectTitleLabel" runat="server" Text="<%$ Resources:Resource, ProjectTitleLabel2 %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectTitle" runat="server" Text=""></asp:Label></span></td></tr>
            <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectAmountLabel" runat="server" Text="<%$ Resources:Resource, ProjectAmountLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectAmount" runat="server" Text=""></asp:Label></span></td></tr>
                <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectCurrencyLabel" runat="server" Text="<%$ Resources:Resource, ProjectCurrencyLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectCurrency" runat="server" Text=""></asp:Label></span></td></tr>
                    <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectExperienceLabel" runat="server" Text="<%$ Resources:Resource, ProjectExperienceLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectExperience" runat="server" Text=""></asp:Label></span></td></tr>
                        <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectCrewNumberLabel" runat="server" Text="<%$ Resources:Resource, ProjectCrewNumberLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectCrewNumber" runat="server" Text=""></asp:Label></span></td></tr>
                                            <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectLicensedLabel" runat="server" Text="<%$ Resources:Resource, ProjectLicensedLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectLicensed" runat="server" Text=""></asp:Label></span></td></tr>
                                              <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectInsuredLabel" runat="server" Text="<%$ Resources:Resource, ProjectInsuredLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectInsured" runat="server" Text=""></asp:Label></span></td></tr></table>    
            <br /><br />
            <table border = "1" width = "700" cellpadding="20" cellspacing="20"  >
    <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectRelocationLabel" runat="server" Text="<%$ Resources:Resource, RelocationLabel2 %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectRelocation" runat="server" Text=""></asp:Label></span></td></tr><tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectStartDateLabel" runat="server" Text="<%$ Resources:Resource, ProjectStartDateLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectStartDate" runat="server" Text=""></asp:Label></span></td></tr>
        <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectEndDateLabel" runat="server" Text="<%$ Resources:Resource, ProjectEndDateLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectEndDate" runat="server" Text=""></asp:Label></span></td></tr>
            <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectCountryRegionCityLabel" runat="server" Text="<%$ Resources:Resource, ProjectCountryRegionCityLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectCountryRegionCity" runat="server" Text=""></asp:Label></span></td></tr>
                <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectAddressLabel" runat="server" Text="<%$ Resources:Resource, ProjectAddressLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectAddress" runat="server" Text="" Width="200px"></asp:Label></span></td></tr>
                    <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectDescriptionLabel" runat="server" Text="<%$ Resources:Resource, ProjectDescriptionLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectDescription" runat="server" Text="" Width="200px"></asp:Label></span></td></tr>
                        <tr><td class="center"><span style="text-align: center"><asp:Label ID="ProjectSpecialNotesLabel" runat="server" Text="<%$ Resources:Resource, ProjectSpecialNotesLabel %>"></asp:Label></span></td><td class="center"><span style="text-align: center"><asp:Label ID="ProjectSpecialNotes" runat="server" Text="" Width="200px"></asp:Label></span></td></tr>
                                   </table>
            <br />
            <table border = "1" width = "700" cellpadding="20" cellspacing="20"  >
    <tr><td class="center" colspan="2"><span style="text-align: center"><asp:Label ID="Top6PhotosLabel" runat="server" Text="<%$ Resources:Resource, Top6PhotosLabel %>"></asp:Label></span></td></tr>
    <tr><td class="center"><span style="text-align: center"><img id="ProjectImage1" runat="server" 
                                   src="" width="250" height="250" /></span></td><td class="center"><span style="text-align: center"><img id="ProjectImage2" runat="server" 
                                   src="" width="250" height="250" /></span></td></tr>
    <tr><td class="center"><span style="text-align: center"><img id="ProjectImage3" runat="server" 
                                   src="" width="250" height="250" /></span></td><td class="center"><span style="text-align: center"><img id="ProjectImage4" runat="server" 
                                   src="" width="250" height="250" /></span></td></tr>
    <tr><td class="center"><span style="text-align: center"><img id="ProjectImage5" runat="server" 
                                   src="" width="250" height="250" /></span></td><td class="center"><span style="text-align: center"><img id="ProjectImage6" runat="server" 
                                   src="" width="250" height="250" /></span></td></tr>
    </table>
            <br />
            <div id="ReportLabel">
                <asp:Label ID="StatementofWork" runat="server" Text=""></asp:Label>
                <asp:Label ID="EngagmentandPerformance" runat="server" Text=""></asp:Label>
                <asp:Label ID="ProjectWork" runat="server" Text=""></asp:Label>
                <asp:Label ID="Performance" runat="server" Text=""></asp:Label>
                <asp:Label ID="Duration" runat="server" Text=""></asp:Label>
                <asp:Label ID="ChangeControl" runat="server" Text=""></asp:Label>
                <asp:Label ID="ChangeControl1" runat="server" Text=""></asp:Label>
                <asp:Label ID="ChangeControl2" runat="server" Text=""></asp:Label>
                <asp:Label ID="ChangeControl3" runat="server" Text=""></asp:Label>
                <asp:Label ID="ChangeControl4" runat="server" Text=""></asp:Label>
                <asp:Label ID="Compensation" runat="server" Text=""></asp:Label>
                <asp:Label ID="IndependentContractRelationship" runat="server" Text=""></asp:Label>
                <asp:Label ID="IntellectualProperty" runat="server" Text=""></asp:Label>
                <asp:Label ID="InventionsandIntellectualPropertyRights" runat="server" Text=""></asp:Label>
                <asp:Label ID="BackgroundTechnology" runat="server" Text=""></asp:Label>
                <asp:Label ID="LicenseToBackgroundTechnology" runat="server" Text=""></asp:Label>
                <asp:Label ID="OwnershipandAssignmentofWorkProduct" runat="server" Text=""></asp:Label>
                <asp:Label ID="LicensetorWaiverofOtherRights" runat="server" Text=""></asp:Label>
                <asp:Label ID="Assitance" runat="server" Text=""></asp:Label>
                <asp:Label ID="CompetitiveorConflictingProjects" runat="server" Text=""></asp:Label>
                <asp:Label ID="ConfidentialInformation" runat="server" Text=""></asp:Label>
                <asp:Label ID="ServiceProviderRepresentationsandWarranties" runat="server" Text=""></asp:Label>
                <asp:Label ID="Indemnification" runat="server" Text=""></asp:Label><br /><br />
                <asp:Label ID="Insurance" runat="server" Text=""></asp:Label>
                <asp:Label ID="Termination" runat="server" Text=""></asp:Label>
                <asp:Label ID="TerminationwithCause" runat="server" Text=""></asp:Label>
                <asp:Label ID="ReturnofProperty" runat="server" Text=""></asp:Label>
                <asp:Label ID="Survival" runat="server" Text=""></asp:Label>
                <asp:Label ID="MutiEmployeeServiceProvider" runat="server" Text=""></asp:Label>
                <asp:Label ID="Note" runat="server" Text=""></asp:Label>
                <asp:Label ID="GeneralProvisions" runat="server" Text=""></asp:Label>
                <asp:Label ID="GoverningLawandVenue" runat="server" Text=""></asp:Label>
                <asp:Label ID="Severability" runat="server" Text=""></asp:Label>
                <asp:Label ID="NoAssignment" runat="server" Text=""></asp:Label>
                <asp:Label ID="Notices" runat="server" Text=""></asp:Label>
                <asp:Label ID="InjunctiveRelief" runat="server" Text=""></asp:Label>
                <asp:Label ID="Waiver" runat="server" Text=""></asp:Label>
                <asp:Label ID="Export" runat="server" Text=""></asp:Label>
                <asp:Label ID="ExecutionandDelivery" runat="server" Text=""></asp:Label>
                <asp:Label ID="EntireAgreement" runat="server" Text=""></asp:Label>
                <asp:Label ID="InWitnessWhereOf" runat="server" Text=""></asp:Label>
            </div>
            <table border="0" cellspacing="0" cellpadding="0" width="100%" style='width: 100.0%'>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            <b>
                                
                                    <asp:Label ID="BuyerLabel" runat="server" Text="<%$ Resources:Resource, BuyerLabel %>"></asp:Label>
                            </b>
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            <b>
                                
                                    <asp:Label ID="ServiceProviderLabel" runat="server" Text="<%$ Resources:Resource, ServiceProviderLabel %>"></asp:Label>
                            </b>
                        </p>
                        
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="BuyerFullNameLabel" runat="server" Text="<%$ Resources:Resource, BuyerFullNameLabel %>"></asp:Label>__________________________________________
                       </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="ServiceProviderFullNameLabel" runat="server" Text="<%$ Resources:Resource, ServiceProviderFullNameLabel %>"></asp:Label> __________________________________________
                            
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="BuyerCountryRegionLabel" runat="server" Text="<%$ Resources:Resource, BuyerCountryRegionLabel %>"></asp:Label>__________________________________________
                            
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="ServiceProviderCountryRegionLabel" runat="server" Text="<%$ Resources:Resource, ServiceProviderCountryRegionLabel %>"></asp:Label>__________________________________________
                                
                            
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="BuyerIdentificationNumberLabel" runat="server" 
                                Text="<%$ Resources:Resource, BuyerIdentificationNumberLabel %>"></asp:Label>
                            
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="SellerIdentificationNumberLabel" runat="server" Text="<%$ Resources:Resource, SellerIdentificationNumberLabel %>"></asp:Label>
                            
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="BuyerProjectAgreementDateLabel" runat="server" Text="<%$ Resources:Resource, DateLabel %>"></asp:Label>_________________________________________
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="SellerProjectAgreementDateLabel" runat="server" Text="<%$ Resources:Resource, DateLabel %>"></asp:Label>________________________________________
                            
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="NonDisclosureAgreement" runat="server">
       <p align="center" style='text-align: center; line-height: 180%; background: white'>
            <b><span style='font-size: 20.0pt; font-family: "Arial","sans-serif"; color: #8D2700'>
                <asp:Label ID="MutualNonDisclosureAgreementLabel" runat="server" Text="<%$ Resources:Resource, MutualNonDisclosureAgreementLabel %>"></asp:Label>
            </span></b>
        </p>
       <table border="0" cellspacing="0" cellpadding="0" width="100%" style="width: 100.0%">
            <tr>
                <td width="70%" style='width: 100%'>
                    <p style='line-height: 150%; text-align: right;'> <b><asp:Label ID="AgreementLabel" runat="server" Text="<%$ Resources:Resource, AgreementLabel %>"></asp:Label>  </b><asp:Label ID="IsMadeOnLabel" runat="server" Text="<%$ Resources:Resource, IsMadeOnLabel %>"></asp:Label>  <strong><asp:Label ID="AgreementDateLabel" runat="server" Text="[Month, day, year]"></asp:Label></strong> </p>
                </td>
            </tr>
        </table>
       <div id="NonDisclosurelabel">
            <asp:Label ID="BetweenParty" runat="server" Text=""></asp:Label>
            <asp:Label ID="Recitals" runat="server" Text=""></asp:Label>
            <asp:Label ID="OperativeProvisionsPart1" runat="server" Text=""></asp:Label>
            <asp:Label ID="OperativeProvisionsPart2" runat="server" Text=""></asp:Label>
            <asp:Label ID="OperativeProvisionsPart3" runat="server" Text=""></asp:Label>
            <asp:Label ID="OperativeProvisionsPart4" runat="server" Text=""></asp:Label>
            <asp:Label ID="OperativeProvisionsPart5" runat="server" Text=""></asp:Label>
            <asp:Label ID="OperativeProvisionsPart6" runat="server" Text=""></asp:Label>
            <asp:Label ID="OperativeProvisionsPart7" runat="server" Text=""></asp:Label>
            <asp:Label ID="OperativeProvisionsPart8" runat="server" Text=""></asp:Label>
        </div>
       <table border="0" cellspacing="0" cellpadding="0" width="100%" style='width: 100.0%'>
              <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            <b>
                                    <asp:Label ID="MutualNonDisclosureAgreementPartyALabel" runat="server" Text="<%$ Resources:Resource, MutualNonDisclosureAgreementPartyALabel %>"></asp:Label>
                            </b>
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            <b>
                                    <asp:Label ID="MutualNonDisclosureAgreementPartyBLabel" runat="server" Text="<%$ Resources:Resource, MutualNonDisclosureAgreementPartyBLabel %>"></asp:Label>
                            </b>
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="MutualNonDisclosureAgreementPartyAFullName" runat="server" Text="<%$ Resources:Resource, BuyerFullNameLabel %>"></asp:Label>__________________________________________
                       </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="MutualNonDisclosureAgreementPartyBFullName" runat="server" Text="<%$ Resources:Resource, ServiceProviderFullNameLabel %>"></asp:Label> __________________________________________
                            
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="MutualNonDisclosureAgreementPartyACountryRegionLabel" runat="server" Text="<%$ Resources:Resource, BuyerCountryRegionLabel %>"></asp:Label>__________________________________________
                            
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="MutualNonDisclosureAgreementPartyBCountryRegionLabel" runat="server" Text="<%$ Resources:Resource, ServiceProviderCountryRegionLabel %>"></asp:Label>__________________________________________
                                
                            
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="MutualNonDisclosureAgreementPartyAIdentificationNumberLabel" runat="server" 
                                Text="<%$ Resources:Resource, BuyerIdentificationNumberLabel %>"></asp:Label>
                            
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="MutualNonDisclosureAgreementPartyBIdentificationNumberLabel" runat="server" Text="<%$ Resources:Resource, SellerIdentificationNumberLabel %>"></asp:Label>
                            
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="MutualNonDisclosureAgreementPartyADateLabel" runat="server" Text="<%$ Resources:Resource, DateLabel %>"></asp:Label>_________________________________________
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p>
                            
                                <asp:Label ID="MutualNonDisclosureAgreementPartyBDateLabel" runat="server" Text="<%$ Resources:Resource, DateLabel %>"></asp:Label>________________________________________
                            
                        </p>
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
