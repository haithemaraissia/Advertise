<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SideJobReportDownload2.aspx.cs"
    Inherits="SideJobReportDownload2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div id="Report" runat="server">
        <div class="WordSection1">
            <div  align="center" style='text-align: center'>
                <b>
                    <span style='font-size: 15.0pt; font-family: "Arial","sans-serif"; color: #8D2700'>
                    <asp:Label ID="ProjectAgreementLabel" runat="server" Text="Project Agreement"></asp:Label>
                    </span>
                    <br /> <br />
                    <asp:Label ID="ContractIDLabel" runat="server" Text="Contract ID: 2" />
                     <br />
                </b>
             </div>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                         <asp:Label ID="ProjectAgreementandStatementofWorkPart1Label" runat="server" Text="445"></asp:Label> 
                    </span>
                    </b>
                    <span style='font-size: 11.0pt; font-family: "Arial","sans-serif"; color: #5A5858;'>
                        <asp:Label ID="ProjectAgreementandStatementofWorkPart2Label" runat="server" 
                        Text=""> </asp:Label>

                       </span>
             </p>
            <p >
                <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <b>
                        <asp:Label ID="BackgroundInitialObligationLabel" runat="server" Text="1. BACKGROUND AND INITIAL OBLIGATIONS."></asp:Label>
                    </b>
                 </span>
             </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858;'>
                        <asp:Label ID="BuyerIsLabel" runat="server" Text="1.1 The “Buyer” is:"></asp:Label>
                    </span>
               </b>
            </p>
            


            <asp:Literal ID="BuyerTable" runat="server"></asp:Literal>

            <table width="700"  border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; text-align:center;
                border: none' align="center">
                <tr align="center">
                    <td width="350px" class="bold">
                        <div align="center">
                                <asp:Label ID="BuyerSideJobIDLabel" runat="server" Text="<%$ Resources:Resource, BuyerSideJobIDLabel %>"></asp:Label>
                        </div>
                    </td>
                   <td width="350px" class="bold">
                        <div align="center">
                            
                                <asp:Label ID="BuyerID2" runat="server" Text=""></asp:Label>
                             
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="BuyerUserNameLabel" runat="server" Text="Username:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            
                                <asp:Label ID="BuyerUserName" runat="server" Text=""></asp:Label>
                         
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="BuyerFirstNameLabel" runat="server" Text="First Name:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            
                                <asp:Label ID="BuyerFirstName" runat="server" Text=""></asp:Label></div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="BuyerLastNameLabel" runat="server" Text="Last Name:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            
                                <asp:Label ID="BuyerLastName" runat="server" Text=""></asp:Label>
                            
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="BuyerCountryRegionCityLabel" runat="server" Text="Country/Region/City:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            
                                <asp:Label ID="BuyerCountryRegionCity" runat="server" Text=""></asp:Label>
                           
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="BuyerAddressLabel" runat="server" Text="Address:"></asp:Label>
                        </div> 
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            
                                <asp:Label ID="BuyerAddress" runat="server" Text="" Width="200px"></asp:Label>
                          
                       </div>
                    </td>
                </tr>
                </table>
            <p>
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ServiceProviderIsLabel" runat="server" Text="1.2 The “Service Provider” is: "></asp:Label>
                     </span>
                    
                        <asp:Label ID="ServiceProvider" runat="server" Text=""></asp:Label>
                   
                </b>
            </p>
            <table width="700"  border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse;
                border: none' align="center">
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="PosterIDLabel" runat="server" Text="Poster ID:"></asp:Label></div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="PosterID" runat="server" Text=""></asp:Label>
                             </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="PosterUserNameLabel" runat="server" Text="Username:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="PosterUserName" runat="server" Text=""></asp:Label>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="PosterFirstNameLabel" runat="server" Text="First Name:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="PosterFirstName" runat="server" Text=""></asp:Label></span></div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="PosterLastNameLabel" runat="server" Text="Last Name:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="PoserLastName" runat="server" Text=""></asp:Label>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="PosterCountryRegionCityLabel" runat="server" Text="Country/Region/City:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="PosterCountryRegionCity" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="PosterAddressLabel" runat="server" Text="Address:"></asp:Label>
                        </div> 
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="PosterAddress" runat="server" Text="" Width="200px"></asp:Label>
                            </span>
                       </div>
                    </td>
                </tr>
                </table>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ProjectIsLabel" runat="server" Text="1.3 The “<b>Project</b>” is:"></asp:Label>
                    </span>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #800000'>
                        <asp:Label ID="Project" runat="server" Text=""></asp:Label>
                    </span>
                </b>
            </p>
            <table width="700"  border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse;
                border: none' align="center">
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectIDLabel" runat="server" Text="Project ID:"></asp:Label></div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectID" runat="server" Text=""></asp:Label>
                             </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectTitleLabel" runat="server" Text="Project Title:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectTitle" runat="server" Text=""></asp:Label>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectAmountLabel" runat="server" Text="Amount:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectAmount" runat="server" Text=""></asp:Label></span></div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectCurrencyLabel" runat="server" Text="Currency:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectCurrency" runat="server" Text=""></asp:Label>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectExperienceLabel" runat="server" Text="Experience:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectExperience" runat="server" Text=""></asp:Label>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectCrewNumberLabel" runat="server" Text="Crew Number:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectCrewNumber" runat="server" Text=""></asp:Label>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectLicensedLabel" runat="server" Text="Licensed:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectLicensed" runat="server" Text=""></asp:Label>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectInsuredLabel" runat="server" Text="Insured:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectInsured" runat="server" Text=""></asp:Label>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectStartDateLabel" runat="server" Text="Start Date:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectStartDate" runat="server" Text=""></asp:Label>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectEndDateLabel" runat="server" Text="End Date"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectEndDate" runat="server" Text=""></asp:Label>
                            </span>
                         </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectCountryRegionCityLabel" runat="server" Text="Country/Region/City:"></asp:Label>
                        </div>
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectCountryRegionCity" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectAddressLabel" runat="server" Text="Address:"></asp:Label>
                        </div> 
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectAddress" runat="server" Text="" Width="200px"></asp:Label>
                            </span>
                       </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectDescriptionLabel" runat="server" Text="Description:"></asp:Label>
                        </div> 
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectDescription" runat="server" Text="" Width="200px"></asp:Label>
                            </span>
                       </div>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <div >
                                <asp:Label ID="ProjectSpecialNotesLabel" runat="server" Text="Special Notes:"></asp:Label>
                        </div> 
                    </td>
                    <td width="350px" class="bold">
                        <div>
                            <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="ProjectSpecialNotes" runat="server" Text="" Width="200px"></asp:Label>
                            </span>
                       </div>
                    </td>
                </tr>
                </table>
            <br />
            <br />
            <table width="700" id="Photos" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse;
                border: none' align="center">
                <tr align="center">
                    <td width="350px" colspan="2" style="width: 700px">
                        <asp:Label ID="Top6PhotosLabel" runat="server" Text="Top 6 Photos"></asp:Label>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <img id="ProjectImage1" runat="server" src="" width="50" height="50" />
                    </td>
                    <td width="350px" class="bold">
                        <p>
                            <br />
                            <br />
                        <img id="ProjectImage2" runat="server" src="" height="162" width="185" />
                        <br />
                            <br />
                        </p>
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                           <p>
                            <br />
                            <br />
                        <img id="ProjectImage3" runat="server" src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/WorkingCopy/Web/Advertise/images/NivoSlider/toystory.jpg" height="162" width="185" />
                        <br />
                            <br />
                        </p>
                    </td>
                    <td width="350px" class="bold">
                        <img id="ProjectImage4" runat="server" src="" width="50" height="50" />
                    </td>
                </tr>
                <tr align="center">
                    <td width="350px" class="bold">
                        <img id="ProjectImage5" runat="server" src="" width="50" height="50" />
                    </td>
                    <td width="350px" class="bold">
                        <img id="ProjectImage6" runat="server" src="" width="50" height="50" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            
            
            
            
            
            

            
            

            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="StatementofWorkPart1Label" runat="server" Text="1.4 Statement of Work"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="StatementofWorkPart2Label" runat="server" 
                        Text="If Buyer and Service Provider have agreed to a written statement of work, written
                        project plan, or other written communication to specify in more detail the Project
                        scope, required features or functionality, deliverables, milestones, development
                        methods, resources, communications, training, acceptance, change control, payment,
                        or other terms, such writing (“<b>SOW</b>”) is incorporated in and made a part of
                        this Agreement. The SOW may be appended to this Agreement as an Attachment."> </asp:Label>
                     </span>
            </p>
            <div >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="EngagmentandPerformanceofServicesPart1Label" runat="server" 
                            Text="2. ENGAGEMENT AND PERFORMANCE OF SERVICES."> </asp:Label>
                    </span>
                 </b>
             </div>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ProjectWorkLabel" runat="server" Text="2.1 Project Work Product"></asp:Label>
                    </span>
                </b>
                <span style='font-size: 9.0pt; font-family: "Arial","sans-serif";
                        color: #5A5858'>
                        <asp:Label ID="EngagmentandPerformanceofServicesPart2Label" runat="server" 
                        Text="Buyer hereby engages Service Provider to deliver the Work Product to Buyer, and
                        Buyer will pay Service Provider for the Project Work Product, in accordance with
                        the terms and conditions of this Agreement and the Terms of Service. As used in
                        this Agreement, the “<b>Work Product</b>” means any and all work product developed
                        by Service Provider as required to complete the Project and delivered to the Buyer
                        in the performance of the Project, as specified in the Business Terms, the SOW,
                        and this Agreement."> </asp:Label>
                 </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="PerformanceLabelPart1" runat="server" Text="2.2 Performance"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="PerformanceLabelPart2" runat="server" 
                        Text=" Service Provider will perform the services necessary to complete the Project in
                        accordance with the procedures described on the Site, in a timely and professional
                        manner, consistent with industry standards, at a location, place and time that Service
                        Provider deems appropriate, and all in accordance with the Business Terms, the SOW,
                        and this Agreement. The manner and means that Service Provider chooses to complete
                        the Project are in Service Provider’s sole discretion and control. In completing
                        the Project, Service Provider agrees to provide its own equipment, tools, and other
                        materials at its own expense."> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="DurationLabelPart1" runat="server" Text="2.3 Duration of Services"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif";color: #5A5858'>
                        <asp:Label ID="DurationLabelPart2" runat="server" 
                        Text=" The duration of performance of services under this Agreement commences on the Effective
                        Date and terminates on the Final Delivery Date set forth in <b>Section 1.4</b> above,
                        unless the Parties otherwise agree in a writing signed by both parties and uploaded
                        to the Private Message Board"> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="ChangeControlLabelPart1" runat="server" Text="2.4 Change Control"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ChangeControlLabelPart2" runat="server" 
                        Text="“Provider” will provide “Buyer” project management with comprehensive status reporting
                        on a regular basis. These reports will indicate the work activities performed, progress
                        against project milestones, as well as any expenses incurred in the furtherance
                        of this work to date."> </asp:Label>
                     </span>
            </p>
            <p >
                <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="ChangeControlLabelPart3" runat="server" Text="Material deviations
                    from the baseline scope and budget documented herein will be mutually reviewed and
                    agreed by Provider and Buyer. The following provides the process to be followed
                    for any such material change to the SOW:"> </asp:Label>
                </span>
            </p>
            <p  style='margin-left: 103.7pt;'>
                <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="ChangeRequestLabelPart1" runat="server" Text="1. A Change Request
                    (“CR”) will be the vehicle for requesting a change to the SOW. The CR will describe
                    the change, the rationale for the change, the impact on the implementation timeline,
                    and the impact on the Compensation. Both Provider and Buyer may initiate a CR."></asp:Label>
                </span>
            </p>
            <p  style='margin-left: 103.7pt;'>
                <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="ChangeRequestLabelPart2" runat="server" Text="2. The designated
                    Project Manager of the requesting party will review the CR and determine whether
                    to submit the CR to the other party."> </asp:Label>
                </span>
            </p>
            <p  style='margin-left: 103.7pt;'>
                <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="ChangeRequestLabelPart3" runat="server" Text="Label"></asp:Label>3. Both Project
                    Managers will review the proposed CR and either approve for further investigation
                    or reject. Provider may specify additional charges for such investigation. If the
                    investigation is authorized, the Project Managers will sign the estimation portion
                    of the CR, which constitutes authorization for the investigative changes. The investigation
                    will determine the effect that the implementation of the CR will have on compensation,
                    schedule and other terms and conditions of the Agreement.</span></p>
            <p  style='margin-left: 103.7pt;'>
                <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="WritterCRLabel" runat="server" Text="4. A written CR
                    must be signed by both Buyer and Provider to authorize implementation of the CR."></asp:Label></span></p>
            <p >
                <b><span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="CompensationPart1Label" runat="server" Text="3.COMPENSATION"></asp:Label></span></b><span
                        style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'><asp:Label
                            ID="CompensationPart2Label" runat="server" Text="Buyer will pay Service Provider the fee specified for the Project in accordance
                        with the Business Terms, any SOW, and the Terms of Service. Payment will be made
                        by Buyer to Service Provider through the Site in accordance with the MY-SIDE-JOB
                        Payment Service and, if applicable, the Escrow Terms and Conditions, promptly upon
                        each acceptance of the Project Work Product. Service Provider will be responsible
                        for all expenses incurred in performing services under this Agreement, except and
                        only to the extent expressly provided in this Agreement, the Business Terms, or
                        SOW."></asp:Label>
                        </span></p>
            <p >
                <b><span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="IndependentContractorRelationshipPart1Label" runat="server" Text="Label"></asp:Label>4.INDEPENDENT CONTRACTOR
                    RELATIONSHIP</span></b><span style='font-size: 9.0pt; font-family: "Arial","sans-serif";
                        color: #5A5858'><asp:Label ID="IndependentContractorRelationshipPart2Label" runat="server" Text="Label"></asp:Label>
                        Service Provider’s relationship with Buyer will be that of an independent contractor,
                        and nothing in this Agreement should be construed to create a partnership, joint
                        venture, or employer-employee relationship. Service Provider (a) is not the agent
                        of Buyer; (b) is not authorized to make any representation, contract, or commitment
                        on behalf of Buyer; (c) will not be entitled to any of the benefits that Buyer makes
                        available to its employees, such as group insurance, profit-sharing or retirement
                        benefits (and waives the right to receive any such benefits); and (d) will be solely
                        responsible for all tax returns and payments required to be filed with or made to
                        any federal, state, or local tax authority with respect to Service Provider’s performance
                        of services and receipt of fees under this Agreement. If applicable, Buyer will
                        report amounts paid to Service Provider by filing Form 1099-MISC with the Internal
                        Revenue Service, as required by law. Service Provider agrees to fill out form W-9
                        or W8-BEN, as applicable, and as required by Buyer. Service Provider agrees to accept
                        exclusive liability for complying with all applicable state and federal laws, including
                        laws governing self-employed individuals, if applicable, such as laws related to
                        payment of taxes, social security, disability, and other contributions based on
                        fees paid to Service Provider under this Agreement. Buyer will not withhold or make
                        payments for social security, unemployment insurance or disability insurance contributions,
                        or obtain workers’ compensation insurance on Service Provider’s behalf. Service
                        Provider hereby agrees to indemnify and defend Buyer against any and all such taxes
                        or contributions, including penalties and interest. Service Provider agrees to provide
                        proof of payment of appropriate taxes on any fees paid to Service Provider under
                        this Agreement upon reasonable request of Buyer. </span>
            </p>
            
            
            
            
            
            
            

            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="IntellectualPropertyLabel" runat="server" Text="5.INTELLECTUAL PROPERTY RIGHTS."></asp:Label>
                    </span>
                </b>
                </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="InventionsandIntellectualPropertyRightsPart1Label" runat="server" 
                            Text="5.1 Inventions and Intellectual Property Rights"> </asp:Label>
                    </span>
                </b>
                <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="InventionsandIntellectualPropertyRightsPart2Label" runat="server" 
                    Text="As used in this Agreement, the term “<b>Invention</b>” means any ideas, concepts,
                        information, materials, processes, data, programs, know-how, improvements, discoveries,
                        developments, designs, artwork, formulae, other copyrightable works, and techniques
                        and all Intellectual Property Rights therein. The term “<b>Intellectual Property Rights</b>”
                        means all trade secrets, copyrights, trademarks, mask work rights, patents and other
                        intellectual property rights recognized by the laws of any country. "> </asp:Label>
                </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="BackgroundTechnologyPart1Label" runat="server" Text="5.2 Background Technology"></asp:Label>
                    </span>
                </b>
                    <span  style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label  ID="BackgroundTechnologyPart2Label" runat="server" 
                            Text="As used in this Agreement, the term “<b>Background Technology</b>” means all Inventions
                        developed by Service Provider other than in the course of providing services to
                        Buyer hereunder and all Inventions acquired or licensed by Service Provider that
                        Service Provider uses in performing services under this Agreement or incorporates
                        into Work Product. Service Provider will disclose any Background Technology which
                        Service Provider proposes to use or incorporate. If Service Provider discloses no
                        Background Technology, Service Provider warrants that it will not use Background
                        Technology or incorporate it into Work Product provided pursuant thereto. Notwithstanding
                        the foregoing, unless otherwise agreed in the Project, Service Provider agrees that
                        it will not incorporate into Work Product or otherwise deliver to Buyer any software
                        code licensed under the GNU GPL or LGPL or any other license that by its terms requires,
                        or conditions the use or distribution of such code on, the disclosure, licensing,
                        or distribution of the Work Product or any source code owned or licensed by the
                        Buyer."> </asp:Label>
                     </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="LicensetoBackgroundTechnologyPart1Label" runat="server" Text="5.3 License to Background Technology"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif";
                        color: #5A5858'>
                        <asp:Label ID="LicensetoBackgroundTechnologyPart2Label" runat="server" 
                        Text="Service Provider hereby automatically upon receipt of payment from Buyer, grants
                        to Buyer a non-exclusive, perpetual, fully-paid and royalty-free, irrevocable and
                        world-wide right, with rights to sublicense through multiple levels of sublicensees,
                        to reproduce, make derivative works of, distribute, publicly perform, and publicly
                        display in any form or medium, whether now known or later developed, make, have
                        made, use, sell, import, offer for sale, and exercise any and all present or future
                        rights in the Background Technology incorporated or used in Work Product."> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="OwnershipandAssignmentofWorkProductPart1Label" runat="server" 
                        Text="5.4 Ownership and Assignment of Work Product"> </asp:Label>
                    </span>
               </b>
               <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                   <asp:Label ID="OwnershipandAssignmentofWorkProductPart2Label" runat="server" 
                        Text="Service Provider agrees that upon receipt of payment from Buyer, any and all Work
                        Product will be the sole and exclusive property of Buyer. If Service Provider has
                        any rights to the Work Product that are not owned by Buyer upon creation or embodiment,
                        Service Provider hereby automatically upon receipt of payment from Buyer irrevocably
                        assigns to such Buyer all right, title and interest worldwide in and to such Work
                        Product. Except as set forth below, Service Provider retains no rights to use the
                        Work Product and agrees not to challenge the validity of Buyer’s ownership in the
                        Work Product. "> </asp:Label>
               </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="LicensetoorWaiverofOtherRightsPart1Label" runat="server" 
                            Text="5.5 License to or Waiver of Other Rights"> </asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif";color: #5A5858'>
                        <asp:Label ID="LicensetoorWaiverofOtherRightsPart2Label" runat="server" 
                        Text="If Service Provider has any right to the Work Product that cannot be assigned by
                        Service Provider, Service Provider hereby automatically upon receipt of payment
                        from Buyer unconditionally and irrevocably grants to Buyer during the term of such
                        rights, an exclusive, even as to Service Provider, irrevocable, perpetual, worldwide,
                        fully paid and royalty-free license, with rights to sublicense through multiple
                        levels of sublicensees, to reproduce, make derivative works of, distribute, publicly
                        perform and publicly display in any form or medium, whether now known or later developed,
                        make, use, sell, import, offer for sale and exercise any and all such rights. If
                        Service Provider has any rights to the Work Product that cannot be assigned or licensed,
                        Service Provider hereby automatically upon receipt of payment from Buyer unconditionally
                        and irrevocably waives the enforcement of such rights, and all claims and causes
                        of action of any kind against Buyer or related to Buyer’s customers, with respect
                        to such rights, and agrees, at Buyer’s request and expense, to consent to and join
                        in any action to enforce such rights."> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="AssitancePart1Label" runat="server" Text="5.6 Assistance"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                       <asp:Label ID="AssitancePart2Label" runat="server" 
                            Text=" Service Provider agrees to assist Buyer in every way, both during and after the
                            term of this Agreement, to obtain and enforce United States and foreign Intellectual
                            Property Rights relating to Work Product in all countries."> </asp:Label>
                     </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="CompetitiveorConflictingProjectsPart1Label" runat="server" 
                        Text="6. Competitive or Conflicting Projects."></asp:Label>
                    </span>
                 </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="CompetitiveorConflictingProjectsPart2Label" runat="server" 
                        Text="Service Provider agrees, during the term of this Agreement, not to enter into a
                        contract or accept an obligation that is inconsistent or incompatible with Service
                        Provider’s obligations under this Agreement. Service Provider warrants that there
                        is no such contract or obligation in effect as of the Effective Date. Service Provider
                        further agrees not to disclose to, deliver to, or induce Buyer to use any confidential
                        information that belongs to anyone other than Buyer or Service Provider."> </asp:Label>
                </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ConfidentialInformationPart1Label" runat="server" Text="7. Confidential Information"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ConfidentialInformationPart2Label" runat="server" 
                        Text="Service Provider agrees that during the term of this Agreement and thereafter, except
                        as expressly authorized in writing by Buyer, it (a) will not use or permit the use
                        of Confidential Information (defined below) in any manner or for any purpose not
                        expressly set forth in this Agreement; (b) will not disclose, lecture upon, publish,
                        or permit others to disclose, lecture upon, or publish any such Confidential Information
                        to any third party without first obtaining Buyer’s express written consent on a
                        case-by-case basis; (c) will limit access to Confidential Information to Service
                        Provider personnel who need to know such information in connection with their work
                        for Buyer; and (d) will not remove any tangible embodiment of any Confidential Information
                        from Buyer’s premises without Buyer’s prior written consent. “<b>Confidential Information</b>”
                        includes, but is not limited to, all information related to Buyer’s business and
                        its actual or anticipated research and development, including without limitation
                        (i) trade secrets, inventions, ideas, processes, computer source and object code,
                        formulae, data, programs, other works of authorship, know-how, improvements, discoveries,
                        developments, designs, and techniques; (ii) information regarding products or plans
                        for research and development, marketing and business plans, budgets, financial statements,
                        contracts, prices, suppliers, and customers; (iii) information regarding the skills
                        and compensation of Buyer’s employees, contractors, and any other service providers;
                        (iv) the existence of any business discussions, negotiations, or agreements between
                        Buyer and any third party; and (v) all such information related to any third party
                        that is disclosed to Buyer or to Service Provider during the course of Buyer’s business
                        (“<b>Third Party Information</b>”). Notwithstanding the foregoing, it is understood
                        that Service Provider is free to use information that is generally known in the
                        trade or industry, information that is not gained as a result of a breach of this
                        Agreement, and Service Provider’s own skill, knowledge, know-how, and experience."> </asp:Label>
                    </span>
            </p>
            

            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ServiceProviderRepresentationsandWarrantiesPart1Label" runat="server" 
                        Text="8. SERVICE PROVIDER REPRESENTATIONS AND WARRANTIES."></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ServiceProviderRepresentationsandWarrantiesPart2Label" runat="server" 
                        Text=" Service Provider hereby represents and warrants that (a) the Work Product will be
                        an original work of Service Provider and any third parties will have executed assignment
                        of rights prior to being allowed to participate in the development of the Work Product;
                        (b) the Work Product will fully conform to the requirements and terms set forth
                        on the Site and in the Project; (c) neither the Work Product nor any element thereof
                        will infringe or misappropriate the Intellectual Property Rights of any third party;
                        (d) neither the Work Product nor any element thereof will be subject to any restrictions
                        or to any mortgages, liens, pledges, security interests, or encumbrances; (e) Service
                        Provider will not grant, directly or indirectly, any rights or interest whatsoever
                        in the Work Product to third parties; (f) Service Provider has full right and power
                        to enter into and perform this Agreement without the consent of any third party;
                        (g) Service Provider has an unqualified right to grant the license to all Background
                        Technology as set forth in the section titled “License to Background Technology”;
                        and (h) Service Provider will comply with all laws and regulations applicable to
                        Service Provider’s obligations under this Agreement. "> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="IndemnificationPart1Label" runat="server" Text="9. INDEMNIFICATION"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="IndemnificationPart2Label" runat="server" 
                        Text="Service Provider will defend, indemnify, and hold harmless Buyer against any damage,
                        cost, loss or expense arising from a claim, suit or proceeding brought against Buyer
                        alleging that any Work Product that Service Provider delivers pursuant to this Agreement
                        or the Project: (i) infringes upon any intellectual property rights or (ii) misappropriates
                        any trade secrets, of any third party."> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="InsurancePart1Label" runat="server" Text="10. INSURANCE"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="InsurancePart2Label" runat="server" 
                        Text="Service Provider, at its sole cost and expense, will maintain appropriate insurance
                        in accordance with industry standards. "> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="TerminationPart1Label" runat="server" Text="11. TERMINATION"></asp:Label>
                    </span>
                </b>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="TerminationwithCausePart1Label" runat="server" Text="11.1 Termination with Cause"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="TerminationwithCausePart2Label" runat="server" 
                        Text="Either party has the right to terminate this Agreement immediately in the event
                        that the other party has materially breached the Agreement and fails to cure such
                        breach within fifteen (15) days of receipt of notice by the non-breaching party,
                        setting forth in reasonable detail the nature of the breach. Buyer may also terminate
                        this Agreement immediately in its sole discretion in the event of Service Provider’s
                        material breach of the section titled “Intellectual Property Rights.”"> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ReturnofPropertyPart1Label" runat="server" Text="11.2 Return of Property"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ReturnofPropertyPart2Label" runat="server" 
                        Text="Upon termination of the Agreement or upon Buyer’s request at any other time, Service
                        Provider will deliver to Buyer all of Buyer’s property together with all copies
                        thereof, and any other material containing or disclosing any Work Product, Third
                        Party Information or Confidential Information."> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="SurvivalPart1Label" runat="server" Text="11.3 Survival"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="SurvivalPart2Label" runat="server" 
                            Text="The following provisions will survive termination of this Agreement: Sections titled
                            “Intellectual Property Rights,” “Confidential Information,” “Service Provider Representations
                            and Warranties,” “Indemnification,” “Return of Property,” “Survival,” and “General
                            Provisions.”"> </asp:Label>
                     </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="MutiEmployeeServiceProviderPart1Label" runat="server" 
                            Text="12. MULTI-EMPLOYEE SERVICE PROVIDER"> </asp:Label>
                   </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif";
                        color: #5A5858'>
                        <asp:Label ID="MutiEmployeeServiceProviderPart2Label" runat="server" 
                        Text="Before any Service Provider employee or agent performs services in connection with
                        this Agreement or has access to Confidential Information, the employee or agent
                        and Service Provider must have entered into a binding written agreement expressly
                        for the benefit of Buyer that contains provisions substantially equivalent to the
                        sections of this Agreement titled “Engagement and Performance of Services” and “Intellectual
                        Property Rights.” Service Provider agrees (a) that its employees and agents will
                        not be entitled to or eligible for any benefits that Buyer may make available to
                        its employees; (b) to limit access to the Confidential Information to employees
                        or agents of Service Provider who have a reasonable need to have such access in
                        order to perform the services pursuant to this Agreement; and (c) to be solely responsible
                        for all expenses incurred by any of its employees or agents in performing the services
                        or otherwise performing its obligations under this Agreement, except as set forth
                        in the Engagement. "> </asp:Label>
                    </span>
            </p>
            <p >
                <b><span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="NotePart1Label" runat="server" Text="Note:"></asp:Label></span></b>
                <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="NotePart2Label" runat="server" Text="This Template Project
                    Agreement and Statement of Work is a sample provided for your information only and
                    may not be relied upon as legal advice. This Template might not be appropriate for
                    your requirements. MY-SIDE-JOB makes no warranty about the suitability of this Template
                    and accepts no liability arising out of the use of this Template. Please consult
                    your legal or business advisor for further information or advice."> </asp:Label>
                </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="GeneralProvisionsLabel" runat="server" Text="13. GENERAL PROVISIONS"></asp:Label>
                    </span>
                </b>
             </p>
             
             
             
             
             
             
             
             
             
             
             
             
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="GoverningLawandVenuePart1Label" runat="server" Text="13.1 Governing Law and Venue"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="GoverningLawandVenuePart2Label" runat="server" 
                        Text=" This Agreement and any action related thereto will be governed, controlled, interpreted,
                        and defined by and under the laws of the State of California, without giving effect
                        to any conflicts of laws principles that require the application of the law of a
                        different jurisdiction. Service Provider hereby expressly consents to the personal
                        jurisdiction and venue in the state and federal courts for the county in which Buyer’s
                        or MY-SIDE-JOB’s principal place of business is located for any lawsuit filed there
                        against Service Provider by Buyer or MY-SIDE-JOB arising from or related to this
                        Agreement. "> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="SeverabilityPart1Label" runat="server" Text="13.2 Severability"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="SeverabilityPart2Label" runat="server" 
                        Text="If any provision of this Agreement is, for any reason, held to be invalid or unenforceable,
                        the other provisions of this Agreement will be unimpaired and the invalid or unenforceable
                        provision will be deemed modified so that it is valid and enforceable to the maximum
                        extent permitted by law."></asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="NoAssignmentPart1Label" runat="server" Text="13.3 No Assignment"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="NoAssignmentPart2Label" runat="server" 
                        Text="This Agreement, and the party’s rights and obligations herein, may not be assigned,
                        subcontracted, delegated, or otherwise transferred by either party without the other’s
                        prior written consent, and any attempted assignment, subcontract, delegation, or
                        transfer in violation of the foregoing will be null and void. The terms of this
                        Agreement will be binding upon assignees."> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="NoticesPart1Label" runat="server" Text="13.4 Notices"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="NoticesPart2Label" runat="server" 
                            Text="Each party must deliver all notices or other communications required or permitted
                            under this Agreement to the other party by posting it on the Private Message Board
                            for the Project."> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="InjunctiveReliefPart1Label" runat="server" Text="13.5 Injunctive Relief"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="InjunctiveReliefPart2Label" runat="server" 
                        Text="Service Provider acknowledges that, because its services are personal and unique
                        and because Service Provider will have access to Confidential Information of Buyer,
                        any breach of this Agreement by Service Provider would cause irreparable injury
                        to Buyer for which monetary damages would not be an adequate remedy and, therefore,
                        will entitle Buyer to injunctive relief (including specific performance). The rights
                        and remedies provided to each party in this Agreement are cumulative and in addition
                        to any other rights and remedies available to such party at law or in equity."> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="WaiverPart1Label" runat="server" Text="13.6 Waiver"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="WaiverPart2Label" runat="server" 
                        Text=" Any waiver or failure to enforce any provision of this Agreement on one occasion
                        will not be deemed a waiver of any other provision or of such provision on any other
                        occasion."> </asp:Label>
                    </span>
            </p>

            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ExportPart1Label" runat="server" Text="13.7 Export"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ExportPart2Label" runat="server" 
                            Text="Service Provider agrees not to export, directly or indirectly, any U.S. technical
                            data acquired from Buyer or any products utilizing such data, to countries outside
                            the United States, because such export could be in violation of the United States
                            export laws or regulations."> </asp:Label>
                   </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="ExecutionandDeliveryPart1Label" runat="server" 
                            Text="13.8 Execution and Delivery; Binding Effect"></asp:Label>
                        </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif";color: #5A5858'>
                        <asp:Label ID="ExecutionandDeliveryPart2Label" runat="server" 
                        Text="The parties will evidence execution and delivery of this Agreement with the intention
                        of becoming legally bound hereby, by completion of the following process on the
                        Site:"> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="EntireAgreementPart1Label" runat="server" Text="13.9 Entire Agreement"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="EntireAgreementPart2Label" runat="server" 
                        Text="This Agreement is the final, complete and exclusive agreement of the parties with
                        respect to the subject matters hereof and supersedes and merges all prior discussions
                        between the parties with respect to such subject matters. No modification of or
                        amendment to this Agreement, or any waiver of any rights under this Agreement, will
                        be effective unless in writing and signed by Service Provider and Buyer. The terms
                        of this Agreement will govern all Projects and services undertaken by Service Provider
                        for Buyer. In the event of any conflict between this Agreement and the express written
                        terms of an agreement applicable to an engagement, the express written terms of
                        such agreement will govern, but only to the extent and with respect to the services
                        set forth therein."> </asp:Label>
                    </span>
            </p>
            <p >
                <b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="InWitnessWhereOfPart1Label" runat="server" Text="IN WITNESS WHEREOF"></asp:Label>
                    </span>
                </b>
                    <span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; color: #5A5858'>
                        <asp:Label ID="InWitnessWhereOfPart2Label" runat="server" 
                        Text=", the parties have caused
                        this Agreement to be approved by their duly authorized representatives with the
                        intention of becoming legally bound hereby."> </asp:Label>
                    </span>
            </p>

            <table border="0" cellspacing="0" cellpadding="0" width="100%" style='width: 100.0%'>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <b>
                                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                    <asp:Label ID="BuyerLabel" runat="server" Text="[BUYER]"></asp:Label></span>
                            </b>
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <b>
                                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                    <asp:Label ID="ServiceProviderLabel" runat="server" Text="[SERVICE PROVIDER]"></asp:Label>
                                </span>
                            </b>
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                <asp:Label ID="BuyerFullNameLabel" runat="server" Text="Full Name:"></asp:Label>
                            </span>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>&nbsp;__________________________________________</span>
                       </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                <asp:Label ID="ServiceProviderFullNameLabel" runat="server" Text="Full Name:"> </asp:Label>
                                __________________________________________
                            </span>
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                <asp:Label ID="BuyerCountryRegionLabel" runat="server" Text="Country/Region:"></asp:Label>
                            &nbsp;</span><span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858; font-weight: 700;'>__________________________________________
                            </span>
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                <asp:Label ID="ServiceProviderCountryRegionLabel" runat="server" Text="Country/Region:"></asp:Label>
                                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                    color: #5A5858'>
                                    &nbsp;</span><span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858; font-weight: 700;'>__________________________________________
                                </span>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                <asp:Label ID="BuyerIdentificationNumberLabel" runat="server" 
                                Text="Identification Number:_________________________________"></asp:Label>
                            </span>
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                <asp:Label ID="SellerIdentificationNumberLabel" runat="server" 
                                Text="Identification Number: _________________________________"></asp:Label>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                <asp:Label ID="BuyerProjectAgreementDateLabel" runat="server" Text="Date:"></asp:Label>
                            </span>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: 
                                "Arial","sans-serif"; color: #5A5858'>&nbsp;__________________________________________</span>
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                <asp:Label ID="SellerProjectAgreementDateLabel" runat="server" Text="Date:"></asp:Label>
                            </span>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                             &nbsp;__________________________________________
                            </span>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    
    
    
    
    
    

    <div id="NonDisclosureAgreement" runat="server">
        <p align="center" style='text-align: center; line-height: 150%; background: white'>
            <span style='font-size: 15.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                color: #8D2700'>
                <asp:Label ID="MutualNonDisclosureAgreementLabel" runat="server" 
                    Text="Mutual Non-Disclosure Agreement"> </asp:Label>
            </span>
        </p>
        <table border="0" cellspacing="0" cellpadding="0" width="100%" style="width: 100.0%">
            <tr>
                <td width="70%" style='width: 100%'>
                    <p  style='line-height: 150%; text-align: right;'>
                        <b>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="AgreementLabel" runat="server" Text="THIS AGREEMENT"></asp:Label>
                            </span>
                        </b>
                        <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";color:#5A5858'>
                            <asp:Label ID="IsMadeOnLabel" runat="server" Text="is made on"></asp:Label>
                        </span>
                        <strong>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                                    <asp:Label ID="AgreementDateLabel" runat="server" Text="[Month, day, year]"></asp:Label>
                            </span>
                        </strong>
                    </p>
                </td>
            </tr>
        </table>
        <p  style='line-height: 150%; background: white'>
            <b>
                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                color: #5A5858'>
                    <asp:Label ID="BetweenLabel" runat="server" Text="BETWEEN"></asp:Label>
                </span>
            </b>
        </p>
        <p  style='margin-left: .5in; text-indent: -.25in; line-height: 150%;
            background: white'>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                color: #5A5858'>
                <asp:Label ID="OneLabel" runat="server" Text="1."></asp:Label>
                <span style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </span>
            <b>
                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                    color: #5A5858'>
                    <asp:Label ID="PartyALabel" runat="server" Text="[Party A],"></asp:Label>
                </span>
            </b>
                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                    color: #5A5858'>
                    <asp:Label ID="PartyA" runat="server" Text="(&quot;Party A&quot;); and"></asp:Label>
                     <b>
                         <asp:Label ID="PartyBLabel" runat="server" Text="[Party B],"></asp:Label>
                     </b>
                     <asp:Label ID="PartyB" runat="server" Text="(&quot;Party B&quot;),"></asp:Label>
                     <asp:Label ID="PartyAB" runat="server" 
                        Text=" collectively referred to as the &quot;Parties&quot;."></asp:Label>
                </span>
        </p>
        <p  style='line-height: 150%; background: white'>
            <b>
                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                color: #5A5858'>
                    <asp:Label ID="RecitalsPart1Label" runat="server" Text="RECITALS"></asp:Label>
                </span>
            </b>
        </p>
        <p  style='line-height: 150%; background: white'>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                color: #5A5858'>
                <asp:Label ID="RecitalsPart2Label" runat="server" 
                Text="Each undersigned party (the &quot;Receiving Party&quot;) understands and 
                acknowledges that the other party (the &quot;Disclosing Party&quot;) has disclosed 
                or may disclose information relating to, which to the extent previously, presently,
                or subsequently disclosed to the Receiving Party is hereinafter referred to as &quot;
                Proprietary Information&quot; of the Disclosing Party."> </asp:Label>
            </span>
        </p>
        <p  style='line-height: 150%; background: white'>
            <b>
                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="OperativeProvisionsPart1Label" runat="server" Text="OPERATIVE PROVISIONS"></asp:Label>
                </span>
            </b>
        </p>
        <p  style='margin-left: .5in; text-indent: -.25in; line-height: 150%;background: white'>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                <asp:Label ID="OneLabel2" runat="server" Text="1."></asp:Label>
                <span style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </span>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="OperativeProvisionsPart2Label" runat="server" 
                    Text="In consideration of the disclosure of Proprietary Information by the Disclosing Party, 
                    the Receiving Party hereby agrees: (i) to hold the Proprietary Information in strict confidence
                    and to take all reasonable precautions to protect such Proprietary Information (including,
                    without limitation, all precautions the Receiving Party employs with respect to
                    its own confidential materials), (ii) not to disclose any such Proprietary Information
                    or any information derived therefrom to any third person, (iii) not to make any
                    use whatsoever at any time of such Proprietary Information except to evaluate internally
                    its relationship with the Disclosing Party, and (iv) not to copy or reverse engineer
                    any such Proprietary Information. The Receiving Party shall procure that its employees,
                    agents and sub-contractors to whom Proprietary Information is disclosed or who have
                    access to Proprietary Information sign a nondisclosure or similar agreement in content
                    substantially similar to this Agreement"> </asp:Label>
            </span>
        </p>
        <p  style='margin-left: .5in; text-indent: -.25in; line-height: 150%; background: white'>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                <asp:Label ID="TwoLabel" runat="server" Text="2."></asp:Label>
                <span style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </span>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="OperativeProvisionsPart3Label" runat="server" 
                    Text="Without grantingany right or license, the Disclosing Party agrees that the foregoing 
                    shall not applywith respect to any information after five years following the disclosure
                    thereof or any information that the Receiving Party can document (i) is or becomes (through
                    no improper action or inaction by the Receiving Party or any affiliate, agent, consultant
                    or employee) generally available to the public, or (ii) was in its possession or
                    known by its prior to receipt from the Disclosing Party as evidenced in writing,
                    except to the extent that such information was unlawfully appropriated, or (iii)
                    was rightfully disclosed to it by a third party, or (iv) was independently developed
                    without use of any Proprietary Information of the Disclosing Party. The Receiving
                    Party may make disclosures required by law or court order provided the Receiving
                    Party uses diligent reasonable efforts to limit disclosure and has allowed the Disclosing
                    Party to seek a protective order."> </asp:Label>
           </span>
        </p>
        <p  style='margin-left: .5in; text-indent: -.25in; line-height: 150%; background: white'>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                <asp:Label ID="ThreeLabel" runat="server" Text="3."></asp:Label>
                <span style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </span>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="OperativeProvisionsPart4Label" runat="server" 
                    Text="Immediately upon the written request by the Disclosing Party at any time, 
                    the Receiving Party will return to the Disclosing Party all Proprietary Information 
                    and all documents or media containing any such Proprietary Information and any and all 
                    copies or extracts thereof, save that where such Proprietary Information is a form incapable 
                    of return or has been copied or transcribed into another document, it shall be destroyed or
                    erased, as appropriate. "> </asp:Label>
            </span>
        </p>
        <p  style='margin-left: .5in; text-indent: -.25in; line-height: 150%; background: white'>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                <asp:Label ID="FourLabel" runat="server" Text="4."></asp:Label>
                <span style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </span>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                <asp:Label ID="OperativeProvisionsPart5Label" runat="server" 
                    Text="The Receiving Party understands that nothing herein (i) requires the disclosure of 
                    any Proprietary Information or (ii) requires the Disclosing Party to proceed with any 
                    transaction or relationship."> </asp:Label>
            </span>
        </p>
        <p  style='margin-left: .5in; text-indent: -.25in; line-height: 150%; background: white'>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                <asp:Label ID="FiveLabel" runat="server" Text="5."></asp:Label>
                <span style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </span>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                 <asp:Label ID="OperativeProvisionsPart6Label" runat="server" 
                    Text="Each party further acknowledges and confirms to the other party that no representation 
                    or warranty, express or implied, is or will be made, and no responsibility or liability is or
                    will be accepted by either party, or by any of its respective directors, officers, employees, 
                    agents or advisers, as to, or in relation to, the accuracy of completeness of any Proprietary 
                    Information made available to the other party or its advisers; it is responsible for making 
                    its own evaluation of such Proprietary Information."> </asp:Label>
            </span>
        </p>
        <p  style='margin-left: .5in; text-indent: -.25in; line-height: 150%; background: white'>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                <asp:Label ID="SixLabel" runat="server" Text="6."></asp:Label>
                <span style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </span>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="OperativeProvisionsPart7Label" runat="server" 
                        Text="The failure of either party to enforce its rights under this Agreement at any
                         time for any period shall not be construed as a waiver of such rights. If any part, 
                         term or provision of this Agreement is held to be illegal or unenforceable neither 
                         the validity, nor enforceability of the remainder of this Agreement shall be affected. 
                         Neither Party shall assign or transfer all or any part of its rights under this Agreement without
                        the consent of the other Party. This Agreement may not be amended for any other
                        reason without the prior written agreement of both Parties. This Agreement constitutes
                        the entire understanding between the Parties relating to the subject matter hereof
                        unless any representation or warranty made about this Agreement was made fraudulently
                        and, save as may be expressly referred to or referenced herein, supersedes all prior
                        representations, writings, negotiations or understandings with respect hereto."> </asp:Label>
            </span>
        </p>
        <p  style='margin-left: .5in; text-indent: -.25in; line-height: 150%; background: white'>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                color: #5A5858'>
                <asp:Label ID="SevenLabel" runat="server" Text="7."></asp:Label>
                <span style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </span>
            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                    <asp:Label ID="OperativeProvisionsPart8Label" runat="server" 
                    Text="This Agreement shall be governed by the laws of the jurisdiction in which the 
                    Disclosing Party is located (or if the Disclosing Party is based in more than one country, 
                    the country in which its headquarters are located) (the &quot;Territory&quot;) and the parties
                    agree to submit disputes arising out of or in connection with this Agreement to the non-exclusive
                     of the courts in the Territory."> </asp:Label>
            </span>
        </p>
        <table border="0" cellspacing="0" cellpadding="0" width="100%" style='width: 100.0%'>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <b>
                                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";color: #5A5858'>
                                    <asp:Label ID="MutualNonDisclosureAgreementPartyALabel" runat="server" Text="[Party A]"> </asp:Label>
                                 </span>
                            </b>
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <b>
                                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color:#5A5858'>
                                    <asp:Label ID="MutualNonDisclosureAgreementPartyBLabel" runat="server" Text="[Party B]"> </asp:Label>
                                </span>
                            </b>
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";color: #5A5858'>
                                <asp:Label ID="MutualNonDisclosureAgreementPartyAFullName" runat="server" Text="Full Name:"> </asp:Label>
                            </span>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";color: #5A5858'>
                                &nbsp;__________________________________________
                            </span>
                       </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="MutualNonDisclosureAgreementPartyBFullName" runat="server" Text="Full Name:"> </asp:Label>
                                __________________________________________
                            </span>
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";color: #5A5858'>
                                <asp:Label ID="MutualNonDisclosureAgreementPartyACountryRegionLabel" runat="server" 
                                    Text="Country/Region:"> </asp:Label>&nbsp;
                            </span>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";color: #5A5858;                                         font-weight: 700;'> __________________________________________
                            </span>
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";color: #5A5858'>
                                <asp:Label ID="MutualNonDisclosureAgreementPartyBCountryRegionLabel" runat="server" 
                                    Text="Country/Region:"> </asp:Label>
                                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color:                                             #5A5858'>&nbsp;
                                </span>
                                <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                    color: #5A5858; font-weight: 700;'>__________________________________________
                                </span>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                <asp:Label ID="MutualNonDisclosureAgreementPartyAIdentificationNumberLabel" runat="server" 
                                Text="Identification Number:_________________________________"></asp:Label>
                            </span>
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";
                                color: #5A5858'>
                                <asp:Label ID="MutualNonDisclosureAgreementPartyBIdentificationNumberLabel" runat="server" 
                                Text="Identification Number: _________________________________"></asp:Label>
                            </span>
                        </p>
                    </td>
                </tr>
                <tr style='height: 30.0pt'>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                                <asp:Label ID="MutualNonDisclosureAgreementPartyADateLabel" runat="server" Text="Date:"></asp:Label>
                            </span>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                                &nbsp;__________________________________________
                             </span>
                        </p>
                    </td>
                    <td width="50%" valign="top" style='width: 50.0%; padding: 0in 0in 0in 0in; height: 30.0pt'>
                        <p  style='line-height: 150%'>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif";color: #5A5858' >                                   <asp:Label ID="MutualNonDisclosureAgreementPartyBDateLabel" runat="server" Text="Date:"></asp:Label>
                            </span>
                            <span style='font-size: 9.0pt; line-height: 150%; font-family: "Arial","sans-serif"; color: #5A5858'>
                                &nbsp;__________________________________________
                            </span>
                        </p>
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
