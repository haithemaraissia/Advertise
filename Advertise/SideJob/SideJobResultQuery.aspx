<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SideJobResultQuery.aspx.cs" Inherits="SideJobResultQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Contract Table<br />
        ===========================</div>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ContractID" 
        DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            ContractID:
            <asp:Label ID="ContractIDLabel1" runat="server" 
                Text='<%# Eval("ContractID") %>' />
            <br />
            ProjectID:
            <asp:TextBox ID="ProjectIDTextBox" runat="server" 
                Text='<%# Bind("ProjectID") %>' />
            <br />
            ContractDate:
            <asp:TextBox ID="ContractDateTextBox" runat="server" 
                Text='<%# Bind("ContractDate") %>' />
            <br />
            BidderID:
            <asp:TextBox ID="BidderIDTextBox" runat="server" 
                Text='<%# Bind("BidderID") %>' />
            <br />
            BidderRole:
            <asp:TextBox ID="BidderRoleTextBox" runat="server" 
                Text='<%# Bind("BidderRole") %>' />
            <br />
            BidderUsername:
            <asp:TextBox ID="BidderUsernameTextBox" runat="server" 
                Text='<%# Bind("BidderUsername") %>' />
            <br />
            BidderFirstName:
            <asp:TextBox ID="BidderFirstNameTextBox" runat="server" 
                Text='<%# Bind("BidderFirstName") %>' />
            <br />
            BidderLastName:
            <asp:TextBox ID="BidderLastNameTextBox" runat="server" 
                Text='<%# Bind("BidderLastName") %>' />
            <br />
            BidderAddress:
            <asp:TextBox ID="BidderAddressTextBox" runat="server" 
                Text='<%# Bind("BidderAddress") %>' />
            <br />
            BidderCountryID:
            <asp:TextBox ID="BidderCountryIDTextBox" runat="server" 
                Text='<%# Bind("BidderCountryID") %>' />
            <br />
            BidderCountryName:
            <asp:TextBox ID="BidderCountryNameTextBox" runat="server" 
                Text='<%# Bind("BidderCountryName") %>' />
            <br />
            BidderRegionID:
            <asp:TextBox ID="BidderRegionIDTextBox" runat="server" 
                Text='<%# Bind("BidderRegionID") %>' />
            <br />
            BidderRegionName:
            <asp:TextBox ID="BidderRegionNameTextBox" runat="server" 
                Text='<%# Bind("BidderRegionName") %>' />
            <br />
            BidderCityID:
            <asp:TextBox ID="BidderCityIDTextBox" runat="server" 
                Text='<%# Bind("BidderCityID") %>' />
            <br />
            BidderCityName:
            <asp:TextBox ID="BidderCityNameTextBox" runat="server" 
                Text='<%# Bind("BidderCityName") %>' />
            <br />
            BidderZipcode:
            <asp:TextBox ID="BidderZipcodeTextBox" runat="server" 
                Text='<%# Bind("BidderZipcode") %>' />
            <br />
            BidderHomePhoneNumber:
            <asp:TextBox ID="BidderHomePhoneNumberTextBox" runat="server" 
                Text='<%# Bind("BidderHomePhoneNumber") %>' />
            <br />
            BidderMobilePhoneNumber:
            <asp:TextBox ID="BidderMobilePhoneNumberTextBox" runat="server" 
                Text='<%# Bind("BidderMobilePhoneNumber") %>' />
            <br />
            PosterID:
            <asp:TextBox ID="PosterIDTextBox" runat="server" 
                Text='<%# Bind("PosterID") %>' />
            <br />
            PosterRole:
            <asp:TextBox ID="PosterRoleTextBox" runat="server" 
                Text='<%# Bind("PosterRole") %>' />
            <br />
            PosterUsername:
            <asp:TextBox ID="PosterUsernameTextBox" runat="server" 
                Text='<%# Bind("PosterUsername") %>' />
            <br />
            PosterFirstName:
            <asp:TextBox ID="PosterFirstNameTextBox" runat="server" 
                Text='<%# Bind("PosterFirstName") %>' />
            <br />
            PosterLastName:
            <asp:TextBox ID="PosterLastNameTextBox" runat="server" 
                Text='<%# Bind("PosterLastName") %>' />
            <br />
            PosterAddress:
            <asp:TextBox ID="PosterAddressTextBox" runat="server" 
                Text='<%# Bind("PosterAddress") %>' />
            <br />
            PosterCountryID:
            <asp:TextBox ID="PosterCountryIDTextBox" runat="server" 
                Text='<%# Bind("PosterCountryID") %>' />
            <br />
            PosterCountryName:
            <asp:TextBox ID="PosterCountryNameTextBox" runat="server" 
                Text='<%# Bind("PosterCountryName") %>' />
            <br />
            PosterRegionID:
            <asp:TextBox ID="PosterRegionIDTextBox" runat="server" 
                Text='<%# Bind("PosterRegionID") %>' />
            <br />
            PosterRegionName:
            <asp:TextBox ID="PosterRegionNameTextBox" runat="server" 
                Text='<%# Bind("PosterRegionName") %>' />
            <br />
            PosterCityID:
            <asp:TextBox ID="PosterCityIDTextBox" runat="server" 
                Text='<%# Bind("PosterCityID") %>' />
            <br />
            PosterCityName:
            <asp:TextBox ID="PosterCityNameTextBox" runat="server" 
                Text='<%# Bind("PosterCityName") %>' />
            <br />
            PosterZipcode:
            <asp:TextBox ID="PosterZipcodeTextBox" runat="server" 
                Text='<%# Bind("PosterZipcode") %>' />
            <br />
            PosterHomePhoneNumber:
            <asp:TextBox ID="PosterHomePhoneNumberTextBox" runat="server" 
                Text='<%# Bind("PosterHomePhoneNumber") %>' />
            <br />
            PosterMobilePhoneNumber:
            <asp:TextBox ID="PosterMobilePhoneNumberTextBox" runat="server" 
                Text='<%# Bind("PosterMobilePhoneNumber") %>' />
            <br />
            LCID:
            <asp:TextBox ID="LCIDTextBox" runat="server" Text='<%# Bind("LCID") %>' />
            <br />
            ProjectCategoryID:
            <asp:TextBox ID="ProjectCategoryIDTextBox" runat="server" 
                Text='<%# Bind("ProjectCategoryID") %>' />
            <br />
            ProjectCategoryName:
            <asp:TextBox ID="ProjectCategoryNameTextBox" runat="server" 
                Text='<%# Bind("ProjectCategoryName") %>' />
            <br />
            ProjectJobID:
            <asp:TextBox ID="ProjectJobIDTextBox" runat="server" 
                Text='<%# Bind("ProjectJobID") %>' />
            <br />
            ProjectJobTitle:
            <asp:TextBox ID="ProjectJobTitleTextBox" runat="server" 
                Text='<%# Bind("ProjectJobTitle") %>' />
            <br />
            ProjectExperienceID:
            <asp:TextBox ID="ProjectExperienceIDTextBox" runat="server" 
                Text='<%# Bind("ProjectExperienceID") %>' />
            <br />
            ProjectCrewNumberID:
            <asp:TextBox ID="ProjectCrewNumberIDTextBox" runat="server" 
                Text='<%# Bind("ProjectCrewNumberID") %>' />
            <br />
            ProjectLicensedID:
            <asp:TextBox ID="ProjectLicensedIDTextBox" runat="server" 
                Text='<%# Bind("ProjectLicensedID") %>' />
            <br />
            ProjectInsuredID:
            <asp:TextBox ID="ProjectInsuredIDTextBox" runat="server" 
                Text='<%# Bind("ProjectInsuredID") %>' />
            <br />
            ProjectRelocationID:
            <asp:TextBox ID="ProjectRelocationIDTextBox" runat="server" 
                Text='<%# Bind("ProjectRelocationID") %>' />
            <br />
            ProjectTitle:
            <asp:TextBox ID="ProjectTitleTextBox" runat="server" 
                Text='<%# Bind("ProjectTitle") %>' />
            <br />
            ProjectStartDate:
            <asp:TextBox ID="ProjectStartDateTextBox" runat="server" 
                Text='<%# Bind("ProjectStartDate") %>' />
            <br />
            ProjectEndDate:
            <asp:TextBox ID="ProjectEndDateTextBox" runat="server" 
                Text='<%# Bind("ProjectEndDate") %>' />
            <br />
            ProjectDescription:
            <asp:TextBox ID="ProjectDescriptionTextBox" runat="server" 
                Text='<%# Bind("ProjectDescription") %>' />
            <br />
            ProjectSpecialNotes:
            <asp:TextBox ID="ProjectSpecialNotesTextBox" runat="server" 
                Text='<%# Bind("ProjectSpecialNotes") %>' />
            <br />
            ProjectAddress:
            <asp:TextBox ID="ProjectAddressTextBox" runat="server" 
                Text='<%# Bind("ProjectAddress") %>' />
            <br />
            ProjectCountryID:
            <asp:TextBox ID="ProjectCountryIDTextBox" runat="server" 
                Text='<%# Bind("ProjectCountryID") %>' />
            <br />
            ProjectCountryName:
            <asp:TextBox ID="ProjectCountryNameTextBox" runat="server" 
                Text='<%# Bind("ProjectCountryName") %>' />
            <br />
            ProjectRegionID:
            <asp:TextBox ID="ProjectRegionIDTextBox" runat="server" 
                Text='<%# Bind("ProjectRegionID") %>' />
            <br />
            ProjectRegionName:
            <asp:TextBox ID="ProjectRegionNameTextBox" runat="server" 
                Text='<%# Bind("ProjectRegionName") %>' />
            <br />
            ProjectCityID:
            <asp:TextBox ID="ProjectCityIDTextBox" runat="server" 
                Text='<%# Bind("ProjectCityID") %>' />
            <br />
            ProjectCityName:
            <asp:TextBox ID="ProjectCityNameTextBox" runat="server" 
                Text='<%# Bind("ProjectCityName") %>' />
            <br />
            ProjectZipcode:
            <asp:TextBox ID="ProjectZipcodeTextBox" runat="server" 
                Text='<%# Bind("ProjectZipcode") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            ProjectID:
            <asp:TextBox ID="ProjectIDTextBox" runat="server" 
                Text='<%# Bind("ProjectID") %>' />
            <br />
            ContractDate:
            <asp:TextBox ID="ContractDateTextBox" runat="server" 
                Text='<%# Bind("ContractDate") %>' />
            <br />
            BidderID:
            <asp:TextBox ID="BidderIDTextBox" runat="server" 
                Text='<%# Bind("BidderID") %>' />
            <br />
            BidderRole:
            <asp:TextBox ID="BidderRoleTextBox" runat="server" 
                Text='<%# Bind("BidderRole") %>' />
            <br />
            BidderUsername:
            <asp:TextBox ID="BidderUsernameTextBox" runat="server" 
                Text='<%# Bind("BidderUsername") %>' />
            <br />
            BidderFirstName:
            <asp:TextBox ID="BidderFirstNameTextBox" runat="server" 
                Text='<%# Bind("BidderFirstName") %>' />
            <br />
            BidderLastName:
            <asp:TextBox ID="BidderLastNameTextBox" runat="server" 
                Text='<%# Bind("BidderLastName") %>' />
            <br />
            BidderAddress:
            <asp:TextBox ID="BidderAddressTextBox" runat="server" 
                Text='<%# Bind("BidderAddress") %>' />
            <br />
            BidderCountryID:
            <asp:TextBox ID="BidderCountryIDTextBox" runat="server" 
                Text='<%# Bind("BidderCountryID") %>' />
            <br />
            BidderCountryName:
            <asp:TextBox ID="BidderCountryNameTextBox" runat="server" 
                Text='<%# Bind("BidderCountryName") %>' />
            <br />
            BidderRegionID:
            <asp:TextBox ID="BidderRegionIDTextBox" runat="server" 
                Text='<%# Bind("BidderRegionID") %>' />
            <br />
            BidderRegionName:
            <asp:TextBox ID="BidderRegionNameTextBox" runat="server" 
                Text='<%# Bind("BidderRegionName") %>' />
            <br />
            BidderCityID:
            <asp:TextBox ID="BidderCityIDTextBox" runat="server" 
                Text='<%# Bind("BidderCityID") %>' />
            <br />
            BidderCityName:
            <asp:TextBox ID="BidderCityNameTextBox" runat="server" 
                Text='<%# Bind("BidderCityName") %>' />
            <br />
            BidderZipcode:
            <asp:TextBox ID="BidderZipcodeTextBox" runat="server" 
                Text='<%# Bind("BidderZipcode") %>' />
            <br />
            BidderHomePhoneNumber:
            <asp:TextBox ID="BidderHomePhoneNumberTextBox" runat="server" 
                Text='<%# Bind("BidderHomePhoneNumber") %>' />
            <br />
            BidderMobilePhoneNumber:
            <asp:TextBox ID="BidderMobilePhoneNumberTextBox" runat="server" 
                Text='<%# Bind("BidderMobilePhoneNumber") %>' />
            <br />
            PosterID:
            <asp:TextBox ID="PosterIDTextBox" runat="server" 
                Text='<%# Bind("PosterID") %>' />
            <br />
            PosterRole:
            <asp:TextBox ID="PosterRoleTextBox" runat="server" 
                Text='<%# Bind("PosterRole") %>' />
            <br />
            PosterUsername:
            <asp:TextBox ID="PosterUsernameTextBox" runat="server" 
                Text='<%# Bind("PosterUsername") %>' />
            <br />
            PosterFirstName:
            <asp:TextBox ID="PosterFirstNameTextBox" runat="server" 
                Text='<%# Bind("PosterFirstName") %>' />
            <br />
            PosterLastName:
            <asp:TextBox ID="PosterLastNameTextBox" runat="server" 
                Text='<%# Bind("PosterLastName") %>' />
            <br />
            PosterAddress:
            <asp:TextBox ID="PosterAddressTextBox" runat="server" 
                Text='<%# Bind("PosterAddress") %>' />
            <br />
            PosterCountryID:
            <asp:TextBox ID="PosterCountryIDTextBox" runat="server" 
                Text='<%# Bind("PosterCountryID") %>' />
            <br />
            PosterCountryName:
            <asp:TextBox ID="PosterCountryNameTextBox" runat="server" 
                Text='<%# Bind("PosterCountryName") %>' />
            <br />
            PosterRegionID:
            <asp:TextBox ID="PosterRegionIDTextBox" runat="server" 
                Text='<%# Bind("PosterRegionID") %>' />
            <br />
            PosterRegionName:
            <asp:TextBox ID="PosterRegionNameTextBox" runat="server" 
                Text='<%# Bind("PosterRegionName") %>' />
            <br />
            PosterCityID:
            <asp:TextBox ID="PosterCityIDTextBox" runat="server" 
                Text='<%# Bind("PosterCityID") %>' />
            <br />
            PosterCityName:
            <asp:TextBox ID="PosterCityNameTextBox" runat="server" 
                Text='<%# Bind("PosterCityName") %>' />
            <br />
            PosterZipcode:
            <asp:TextBox ID="PosterZipcodeTextBox" runat="server" 
                Text='<%# Bind("PosterZipcode") %>' />
            <br />
            PosterHomePhoneNumber:
            <asp:TextBox ID="PosterHomePhoneNumberTextBox" runat="server" 
                Text='<%# Bind("PosterHomePhoneNumber") %>' />
            <br />
            PosterMobilePhoneNumber:
            <asp:TextBox ID="PosterMobilePhoneNumberTextBox" runat="server" 
                Text='<%# Bind("PosterMobilePhoneNumber") %>' />
            <br />
            LCID:
            <asp:TextBox ID="LCIDTextBox" runat="server" Text='<%# Bind("LCID") %>' />
            <br />
            ProjectCategoryID:
            <asp:TextBox ID="ProjectCategoryIDTextBox" runat="server" 
                Text='<%# Bind("ProjectCategoryID") %>' />
            <br />
            ProjectCategoryName:
            <asp:TextBox ID="ProjectCategoryNameTextBox" runat="server" 
                Text='<%# Bind("ProjectCategoryName") %>' />
            <br />
            ProjectJobID:
            <asp:TextBox ID="ProjectJobIDTextBox" runat="server" 
                Text='<%# Bind("ProjectJobID") %>' />
            <br />
            ProjectJobTitle:
            <asp:TextBox ID="ProjectJobTitleTextBox" runat="server" 
                Text='<%# Bind("ProjectJobTitle") %>' />
            <br />
            ProjectExperienceID:
            <asp:TextBox ID="ProjectExperienceIDTextBox" runat="server" 
                Text='<%# Bind("ProjectExperienceID") %>' />
            <br />
            ProjectCrewNumberID:
            <asp:TextBox ID="ProjectCrewNumberIDTextBox" runat="server" 
                Text='<%# Bind("ProjectCrewNumberID") %>' />
            <br />
            ProjectLicensedID:
            <asp:TextBox ID="ProjectLicensedIDTextBox" runat="server" 
                Text='<%# Bind("ProjectLicensedID") %>' />
            <br />
            ProjectInsuredID:
            <asp:TextBox ID="ProjectInsuredIDTextBox" runat="server" 
                Text='<%# Bind("ProjectInsuredID") %>' />
            <br />
            ProjectRelocationID:
            <asp:TextBox ID="ProjectRelocationIDTextBox" runat="server" 
                Text='<%# Bind("ProjectRelocationID") %>' />
            <br />
            ProjectTitle:
            <asp:TextBox ID="ProjectTitleTextBox" runat="server" 
                Text='<%# Bind("ProjectTitle") %>' />
            <br />
            ProjectStartDate:
            <asp:TextBox ID="ProjectStartDateTextBox" runat="server" 
                Text='<%# Bind("ProjectStartDate") %>' />
            <br />
            ProjectEndDate:
            <asp:TextBox ID="ProjectEndDateTextBox" runat="server" 
                Text='<%# Bind("ProjectEndDate") %>' />
            <br />
            ProjectDescription:
            <asp:TextBox ID="ProjectDescriptionTextBox" runat="server" 
                Text='<%# Bind("ProjectDescription") %>' />
            <br />
            ProjectSpecialNotes:
            <asp:TextBox ID="ProjectSpecialNotesTextBox" runat="server" 
                Text='<%# Bind("ProjectSpecialNotes") %>' />
            <br />
            ProjectAddress:
            <asp:TextBox ID="ProjectAddressTextBox" runat="server" 
                Text='<%# Bind("ProjectAddress") %>' />
            <br />
            ProjectCountryID:
            <asp:TextBox ID="ProjectCountryIDTextBox" runat="server" 
                Text='<%# Bind("ProjectCountryID") %>' />
            <br />
            ProjectCountryName:
            <asp:TextBox ID="ProjectCountryNameTextBox" runat="server" 
                Text='<%# Bind("ProjectCountryName") %>' />
            <br />
            ProjectRegionID:
            <asp:TextBox ID="ProjectRegionIDTextBox" runat="server" 
                Text='<%# Bind("ProjectRegionID") %>' />
            <br />
            ProjectRegionName:
            <asp:TextBox ID="ProjectRegionNameTextBox" runat="server" 
                Text='<%# Bind("ProjectRegionName") %>' />
            <br />
            ProjectCityID:
            <asp:TextBox ID="ProjectCityIDTextBox" runat="server" 
                Text='<%# Bind("ProjectCityID") %>' />
            <br />
            ProjectCityName:
            <asp:TextBox ID="ProjectCityNameTextBox" runat="server" 
                Text='<%# Bind("ProjectCityName") %>' />
            <br />
            ProjectZipcode:
            <asp:TextBox ID="ProjectZipcodeTextBox" runat="server" 
                Text='<%# Bind("ProjectZipcode") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            ContractID:
            <asp:Label ID="ContractIDLabel" runat="server" 
                Text='<%# Eval("ContractID") %>' />
            <br />
            ProjectID:
            <asp:Label ID="ProjectIDLabel" runat="server" Text='<%# Bind("ProjectID") %>' />
            <br />
            ContractDate:
            <asp:Label ID="ContractDateLabel" runat="server" 
                Text='<%# Bind("ContractDate") %>' />
            <br />
            BidderID:
            <asp:Label ID="BidderIDLabel" runat="server" Text='<%# Bind("BidderID") %>' />
            <br />
            BidderRole:
            <asp:Label ID="BidderRoleLabel" runat="server" 
                Text='<%# Bind("BidderRole") %>' />
            <br />
            BidderUsername:
            <asp:Label ID="BidderUsernameLabel" runat="server" 
                Text='<%# Bind("BidderUsername") %>' />
            <br />
            BidderFirstName:
            <asp:Label ID="BidderFirstNameLabel" runat="server" 
                Text='<%# Bind("BidderFirstName") %>' />
            <br />
            BidderLastName:
            <asp:Label ID="BidderLastNameLabel" runat="server" 
                Text='<%# Bind("BidderLastName") %>' />
            <br />
            BidderAddress:
            <asp:Label ID="BidderAddressLabel" runat="server" 
                Text='<%# Bind("BidderAddress") %>' />
            <br />
            BidderCountryID:
            <asp:Label ID="BidderCountryIDLabel" runat="server" 
                Text='<%# Bind("BidderCountryID") %>' />
            <br />
            BidderCountryName:
            <asp:Label ID="BidderCountryNameLabel" runat="server" 
                Text='<%# Bind("BidderCountryName") %>' />
            <br />
            BidderRegionID:
            <asp:Label ID="BidderRegionIDLabel" runat="server" 
                Text='<%# Bind("BidderRegionID") %>' />
            <br />
            BidderRegionName:
            <asp:Label ID="BidderRegionNameLabel" runat="server" 
                Text='<%# Bind("BidderRegionName") %>' />
            <br />
            BidderCityID:
            <asp:Label ID="BidderCityIDLabel" runat="server" 
                Text='<%# Bind("BidderCityID") %>' />
            <br />
            BidderCityName:
            <asp:Label ID="BidderCityNameLabel" runat="server" 
                Text='<%# Bind("BidderCityName") %>' />
            <br />
            BidderZipcode:
            <asp:Label ID="BidderZipcodeLabel" runat="server" 
                Text='<%# Bind("BidderZipcode") %>' />
            <br />
            BidderHomePhoneNumber:
            <asp:Label ID="BidderHomePhoneNumberLabel" runat="server" 
                Text='<%# Bind("BidderHomePhoneNumber") %>' />
            <br />
            BidderMobilePhoneNumber:
            <asp:Label ID="BidderMobilePhoneNumberLabel" runat="server" 
                Text='<%# Bind("BidderMobilePhoneNumber") %>' />
            <br />
            PosterID:
            <asp:Label ID="PosterIDLabel" runat="server" Text='<%# Bind("PosterID") %>' />
            <br />
            PosterRole:
            <asp:Label ID="PosterRoleLabel" runat="server" 
                Text='<%# Bind("PosterRole") %>' />
            <br />
            PosterUsername:
            <asp:Label ID="PosterUsernameLabel" runat="server" 
                Text='<%# Bind("PosterUsername") %>' />
            <br />
            PosterFirstName:
            <asp:Label ID="PosterFirstNameLabel" runat="server" 
                Text='<%# Bind("PosterFirstName") %>' />
            <br />
            PosterLastName:
            <asp:Label ID="PosterLastNameLabel" runat="server" 
                Text='<%# Bind("PosterLastName") %>' />
            <br />
            PosterAddress:
            <asp:Label ID="PosterAddressLabel" runat="server" 
                Text='<%# Bind("PosterAddress") %>' />
            <br />
            PosterCountryID:
            <asp:Label ID="PosterCountryIDLabel" runat="server" 
                Text='<%# Bind("PosterCountryID") %>' />
            <br />
            PosterCountryName:
            <asp:Label ID="PosterCountryNameLabel" runat="server" 
                Text='<%# Bind("PosterCountryName") %>' />
            <br />
            PosterRegionID:
            <asp:Label ID="PosterRegionIDLabel" runat="server" 
                Text='<%# Bind("PosterRegionID") %>' />
            <br />
            PosterRegionName:
            <asp:Label ID="PosterRegionNameLabel" runat="server" 
                Text='<%# Bind("PosterRegionName") %>' />
            <br />
            PosterCityID:
            <asp:Label ID="PosterCityIDLabel" runat="server" 
                Text='<%# Bind("PosterCityID") %>' />
            <br />
            PosterCityName:
            <asp:Label ID="PosterCityNameLabel" runat="server" 
                Text='<%# Bind("PosterCityName") %>' />
            <br />
            PosterZipcode:
            <asp:Label ID="PosterZipcodeLabel" runat="server" 
                Text='<%# Bind("PosterZipcode") %>' />
            <br />
            PosterHomePhoneNumber:
            <asp:Label ID="PosterHomePhoneNumberLabel" runat="server" 
                Text='<%# Bind("PosterHomePhoneNumber") %>' />
            <br />
            PosterMobilePhoneNumber:
            <asp:Label ID="PosterMobilePhoneNumberLabel" runat="server" 
                Text='<%# Bind("PosterMobilePhoneNumber") %>' />
            <br />
            LCID:
            <asp:Label ID="LCIDLabel" runat="server" Text='<%# Bind("LCID") %>' />
            <br />
            ProjectCategoryID:
            <asp:Label ID="ProjectCategoryIDLabel" runat="server" 
                Text='<%# Bind("ProjectCategoryID") %>' />
            <br />
            ProjectCategoryName:
            <asp:Label ID="ProjectCategoryNameLabel" runat="server" 
                Text='<%# Bind("ProjectCategoryName") %>' />
            <br />
            ProjectJobID:
            <asp:Label ID="ProjectJobIDLabel" runat="server" 
                Text='<%# Bind("ProjectJobID") %>' />
            <br />
            ProjectJobTitle:
            <asp:Label ID="ProjectJobTitleLabel" runat="server" 
                Text='<%# Bind("ProjectJobTitle") %>' />
            <br />
            ProjectExperienceID:
            <asp:Label ID="ProjectExperienceIDLabel" runat="server" 
                Text='<%# Bind("ProjectExperienceID") %>' />
            <br />
            ProjectCrewNumberID:
            <asp:Label ID="ProjectCrewNumberIDLabel" runat="server" 
                Text='<%# Bind("ProjectCrewNumberID") %>' />
            <br />
            ProjectLicensedID:
            <asp:Label ID="ProjectLicensedIDLabel" runat="server" 
                Text='<%# Bind("ProjectLicensedID") %>' />
            <br />
            ProjectInsuredID:
            <asp:Label ID="ProjectInsuredIDLabel" runat="server" 
                Text='<%# Bind("ProjectInsuredID") %>' />
            <br />
            ProjectRelocationID:
            <asp:Label ID="ProjectRelocationIDLabel" runat="server" 
                Text='<%# Bind("ProjectRelocationID") %>' />
            <br />
            ProjectTitle:
            <asp:Label ID="ProjectTitleLabel" runat="server" 
                Text='<%# Bind("ProjectTitle") %>' />
            <br />
            ProjectStartDate:
            <asp:Label ID="ProjectStartDateLabel" runat="server" 
                Text='<%# Bind("ProjectStartDate") %>' />
            <br />
            ProjectEndDate:
            <asp:Label ID="ProjectEndDateLabel" runat="server" 
                Text='<%# Bind("ProjectEndDate") %>' />
            <br />
            ProjectDescription:
            <asp:Label ID="ProjectDescriptionLabel" runat="server" 
                Text='<%# Bind("ProjectDescription") %>' />
            <br />
            ProjectSpecialNotes:
            <asp:Label ID="ProjectSpecialNotesLabel" runat="server" 
                Text='<%# Bind("ProjectSpecialNotes") %>' />
            <br />
            ProjectAddress:
            <asp:Label ID="ProjectAddressLabel" runat="server" 
                Text='<%# Bind("ProjectAddress") %>' />
            <br />
            ProjectCountryID:
            <asp:Label ID="ProjectCountryIDLabel" runat="server" 
                Text='<%# Bind("ProjectCountryID") %>' />
            <br />
            ProjectCountryName:
            <asp:Label ID="ProjectCountryNameLabel" runat="server" 
                Text='<%# Bind("ProjectCountryName") %>' />
            <br />
            ProjectRegionID:
            <asp:Label ID="ProjectRegionIDLabel" runat="server" 
                Text='<%# Bind("ProjectRegionID") %>' />
            <br />
            ProjectRegionName:
            <asp:Label ID="ProjectRegionNameLabel" runat="server" 
                Text='<%# Bind("ProjectRegionName") %>' />
            <br />
            ProjectCityID:
            <asp:Label ID="ProjectCityIDLabel" runat="server" 
                Text='<%# Bind("ProjectCityID") %>' />
            <br />
            ProjectCityName:
            <asp:Label ID="ProjectCityNameLabel" runat="server" 
                Text='<%# Bind("ProjectCityName") %>' />
            <br />
            ProjectZipcode:
            <asp:Label ID="ProjectZipcodeLabel" runat="server" 
                Text='<%# Bind("ProjectZipcode") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>" 
        SelectCommand="SELECT * FROM [Contract] ">
    </asp:SqlDataSource>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        Customer Contract</p>
    <p>
        ================</p>
    <asp:FormView ID="FormView2" runat="server" DataKeyNames="ContractID" 
        DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            ContractID:
            <asp:Label ID="ContractIDLabel1" runat="server" 
                Text='<%# Eval("ContractID") %>' />
            <br />
            CustomerID:
            <asp:TextBox ID="CustomerIDTextBox" runat="server" 
                Text='<%# Bind("CustomerID") %>' />
            <br />
            ProjectID:
            <asp:TextBox ID="ProjectIDTextBox" runat="server" 
                Text='<%# Bind("ProjectID") %>' />
            <br />
            ContractDate:
            <asp:TextBox ID="ContractDateTextBox" runat="server" 
                Text='<%# Bind("ContractDate") %>' />
            <br />
            BidderID:
            <asp:TextBox ID="BidderIDTextBox" runat="server" 
                Text='<%# Bind("BidderID") %>' />
            <br />
            BidderUsername:
            <asp:TextBox ID="BidderUsernameTextBox" runat="server" 
                Text='<%# Bind("BidderUsername") %>' />
            <br />
            BidderFirstName:
            <asp:TextBox ID="BidderFirstNameTextBox" runat="server" 
                Text='<%# Bind("BidderFirstName") %>' />
            <br />
            BidderLastName:
            <asp:TextBox ID="BidderLastNameTextBox" runat="server" 
                Text='<%# Bind("BidderLastName") %>' />
            <br />
            PosterUsername:
            <asp:TextBox ID="PosterUsernameTextBox" runat="server" 
                Text='<%# Bind("PosterUsername") %>' />
            <br />
            PosterFirstName:
            <asp:TextBox ID="PosterFirstNameTextBox" runat="server" 
                Text='<%# Bind("PosterFirstName") %>' />
            <br />
            PosterID:
            <asp:TextBox ID="PosterIDTextBox" runat="server" 
                Text='<%# Bind("PosterID") %>' />
            <br />
            PosterLastName:
            <asp:TextBox ID="PosterLastNameTextBox" runat="server" 
                Text='<%# Bind("PosterLastName") %>' />
            <br />
            HighestBid:
            <asp:TextBox ID="HighestBidTextBox" runat="server" 
                Text='<%# Bind("HighestBid") %>' />
            <br />
            CurrencyID:
            <asp:TextBox ID="CurrencyIDTextBox" runat="server" 
                Text='<%# Bind("CurrencyID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            ContractID:
            <asp:TextBox ID="ContractIDTextBox" runat="server" 
                Text='<%# Bind("ContractID") %>' />
            <br />
            CustomerID:
            <asp:TextBox ID="CustomerIDTextBox" runat="server" 
                Text='<%# Bind("CustomerID") %>' />
            <br />
            ProjectID:
            <asp:TextBox ID="ProjectIDTextBox" runat="server" 
                Text='<%# Bind("ProjectID") %>' />
            <br />
            ContractDate:
            <asp:TextBox ID="ContractDateTextBox" runat="server" 
                Text='<%# Bind("ContractDate") %>' />
            <br />
            BidderID:
            <asp:TextBox ID="BidderIDTextBox" runat="server" 
                Text='<%# Bind("BidderID") %>' />
            <br />
            BidderUsername:
            <asp:TextBox ID="BidderUsernameTextBox" runat="server" 
                Text='<%# Bind("BidderUsername") %>' />
            <br />
            BidderFirstName:
            <asp:TextBox ID="BidderFirstNameTextBox" runat="server" 
                Text='<%# Bind("BidderFirstName") %>' />
            <br />
            BidderLastName:
            <asp:TextBox ID="BidderLastNameTextBox" runat="server" 
                Text='<%# Bind("BidderLastName") %>' />
            <br />
            PosterUsername:
            <asp:TextBox ID="PosterUsernameTextBox" runat="server" 
                Text='<%# Bind("PosterUsername") %>' />
            <br />
            PosterFirstName:
            <asp:TextBox ID="PosterFirstNameTextBox" runat="server" 
                Text='<%# Bind("PosterFirstName") %>' />
            <br />
            PosterID:
            <asp:TextBox ID="PosterIDTextBox" runat="server" 
                Text='<%# Bind("PosterID") %>' />
            <br />
            PosterLastName:
            <asp:TextBox ID="PosterLastNameTextBox" runat="server" 
                Text='<%# Bind("PosterLastName") %>' />
            <br />
            HighestBid:
            <asp:TextBox ID="HighestBidTextBox" runat="server" 
                Text='<%# Bind("HighestBid") %>' />
            <br />
            CurrencyID:
            <asp:TextBox ID="CurrencyIDTextBox" runat="server" 
                Text='<%# Bind("CurrencyID") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            ContractID:
            <asp:Label ID="ContractIDLabel" runat="server" 
                Text='<%# Eval("ContractID") %>' />
            <br />
            CustomerID:
            <asp:Label ID="CustomerIDLabel" runat="server" 
                Text='<%# Bind("CustomerID") %>' />
            <br />
            ProjectID:
            <asp:Label ID="ProjectIDLabel" runat="server" Text='<%# Bind("ProjectID") %>' />
            <br />
            ContractDate:
            <asp:Label ID="ContractDateLabel" runat="server" 
                Text='<%# Bind("ContractDate") %>' />
            <br />
            BidderID:
            <asp:Label ID="BidderIDLabel" runat="server" Text='<%# Bind("BidderID") %>' />
            <br />
            BidderUsername:
            <asp:Label ID="BidderUsernameLabel" runat="server" 
                Text='<%# Bind("BidderUsername") %>' />
            <br />
            BidderFirstName:
            <asp:Label ID="BidderFirstNameLabel" runat="server" 
                Text='<%# Bind("BidderFirstName") %>' />
            <br />
            BidderLastName:
            <asp:Label ID="BidderLastNameLabel" runat="server" 
                Text='<%# Bind("BidderLastName") %>' />
            <br />
            PosterUsername:
            <asp:Label ID="PosterUsernameLabel" runat="server" 
                Text='<%# Bind("PosterUsername") %>' />
            <br />
            PosterFirstName:
            <asp:Label ID="PosterFirstNameLabel" runat="server" 
                Text='<%# Bind("PosterFirstName") %>' />
            <br />
            PosterID:
            <asp:Label ID="PosterIDLabel" runat="server" Text='<%# Bind("PosterID") %>' />
            <br />
            PosterLastName:
            <asp:Label ID="PosterLastNameLabel" runat="server" 
                Text='<%# Bind("PosterLastName") %>' />
            <br />
            HighestBid:
            <asp:Label ID="HighestBidLabel" runat="server" 
                Text='<%# Bind("HighestBid") %>' />
            <br />
            CurrencyID:
            <asp:Label ID="CurrencyIDLabel" runat="server" 
                Text='<%# Bind("CurrencyID") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>" 
        SelectCommand="SELECT * FROM [CustomerContract]"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
    Project Photo<br />
    =========<asp:FormView ID="FormView3" runat="server" DataKeyNames="PhotoID" 
        DataSourceID="SqlDataSource3">
        <EditItemTemplate>
            PhotoID:
            <asp:Label ID="PhotoIDLabel1" runat="server" Text='<%# Eval("PhotoID") %>' />
            <br />
            PhotoPath:
            <asp:TextBox ID="PhotoPathTextBox" runat="server" 
                Text='<%# Bind("PhotoPath") %>' />
            <br />
            Caption:
            <asp:TextBox ID="CaptionTextBox" runat="server" Text='<%# Bind("Caption") %>' />
            <br />
            AlbumID:
            <asp:TextBox ID="AlbumIDTextBox" runat="server" Text='<%# Bind("AlbumID") %>' />
            <br />
            ProID:
            <asp:TextBox ID="ProIDTextBox" runat="server" Text='<%# Bind("ProID") %>' />
            <br />
            PhotoRank:
            <asp:TextBox ID="PhotoRankTextBox" runat="server" 
                Text='<%# Bind("PhotoRank") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            PhotoPath:
            <asp:TextBox ID="PhotoPathTextBox" runat="server" 
                Text='<%# Bind("PhotoPath") %>' />
            <br />
            Caption:
            <asp:TextBox ID="CaptionTextBox" runat="server" Text='<%# Bind("Caption") %>' />
            <br />
            AlbumID:
            <asp:TextBox ID="AlbumIDTextBox" runat="server" Text='<%# Bind("AlbumID") %>' />
            <br />
            ProID:
            <asp:TextBox ID="ProIDTextBox" runat="server" Text='<%# Bind("ProID") %>' />
            <br />
            PhotoRank:
            <asp:TextBox ID="PhotoRankTextBox" runat="server" 
                Text='<%# Bind("PhotoRank") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            PhotoID:
            <asp:Label ID="PhotoIDLabel" runat="server" Text='<%# Eval("PhotoID") %>' />
            <br />
            PhotoPath:
            <asp:Label ID="PhotoPathLabel" runat="server" Text='<%# Bind("PhotoPath") %>' />
            <br />
            Caption:
            <asp:Label ID="CaptionLabel" runat="server" Text='<%# Bind("Caption") %>' />
            <br />
            AlbumID:
            <asp:Label ID="AlbumIDLabel" runat="server" Text='<%# Bind("AlbumID") %>' />
            <br />
            ProID:
            <asp:Label ID="ProIDLabel" runat="server" Text='<%# Bind("ProID") %>' />
            <br />
            PhotoRank:
            <asp:Label ID="PhotoRankLabel" runat="server" Text='<%# Bind("PhotoRank") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>" 
        SelectCommand="SELECT * FROM [ProfessionalPhoto]"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    Project Requirement:<br />
    =============<asp:FormView ID="FormView4" runat="server" 
        DataKeyNames="ProjectID" DataSourceID="SqlDataSource4">
        <EditItemTemplate>
            ProjectID:
            <asp:Label ID="ProjectIDLabel1" runat="server" 
                Text='<%# Eval("ProjectID") %>' />
            <br />
            LCID:
            <asp:TextBox ID="LCIDTextBox" runat="server" Text='<%# Bind("LCID") %>' />
            <br />
            CategoryID:
            <asp:TextBox ID="CategoryIDTextBox" runat="server" 
                Text='<%# Bind("CategoryID") %>' />
            <br />
            CategoryName:
            <asp:TextBox ID="CategoryNameTextBox" runat="server" 
                Text='<%# Bind("CategoryName") %>' />
            <br />
            JobID:
            <asp:TextBox ID="JobIDTextBox" runat="server" Text='<%# Bind("JobID") %>' />
            <br />
            JobTitle:
            <asp:TextBox ID="JobTitleTextBox" runat="server" 
                Text='<%# Bind("JobTitle") %>' />
            <br />
            ExperienceID:
            <asp:TextBox ID="ExperienceIDTextBox" runat="server" 
                Text='<%# Bind("ExperienceID") %>' />
            <br />
            CrewNumberID:
            <asp:TextBox ID="CrewNumberIDTextBox" runat="server" 
                Text='<%# Bind("CrewNumberID") %>' />
            <br />
            LicensedID:
            <asp:TextBox ID="LicensedIDTextBox" runat="server" 
                Text='<%# Bind("LicensedID") %>' />
            <br />
            InsuredID:
            <asp:TextBox ID="InsuredIDTextBox" runat="server" 
                Text='<%# Bind("InsuredID") %>' />
            <br />
            RelocationID:
            <asp:TextBox ID="RelocationIDTextBox" runat="server" 
                Text='<%# Bind("RelocationID") %>' />
            <br />
            ProjectTitle:
            <asp:TextBox ID="ProjectTitleTextBox" runat="server" 
                Text='<%# Bind("ProjectTitle") %>' />
            <br />
            StartDate:
            <asp:TextBox ID="StartDateTextBox" runat="server" 
                Text='<%# Bind("StartDate") %>' />
            <br />
            EndDate:
            <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
            <br />
            AmountOffered:
            <asp:TextBox ID="AmountOfferedTextBox" runat="server" 
                Text='<%# Bind("AmountOffered") %>' />
            <br />
            CurrencyID:
            <asp:TextBox ID="CurrencyIDTextBox" runat="server" 
                Text='<%# Bind("CurrencyID") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            SpecialNotes:
            <asp:TextBox ID="SpecialNotesTextBox" runat="server" 
                Text='<%# Bind("SpecialNotes") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            CountryID:
            <asp:TextBox ID="CountryIDTextBox" runat="server" 
                Text='<%# Bind("CountryID") %>' />
            <br />
            CountryName:
            <asp:TextBox ID="CountryNameTextBox" runat="server" 
                Text='<%# Bind("CountryName") %>' />
            <br />
            RegionID:
            <asp:TextBox ID="RegionIDTextBox" runat="server" 
                Text='<%# Bind("RegionID") %>' />
            <br />
            RegionName:
            <asp:TextBox ID="RegionNameTextBox" runat="server" 
                Text='<%# Bind("RegionName") %>' />
            <br />
            CityID:
            <asp:TextBox ID="CityIDTextBox" runat="server" Text='<%# Bind("CityID") %>' />
            <br />
            CityName:
            <asp:TextBox ID="CityNameTextBox" runat="server" 
                Text='<%# Bind("CityName") %>' />
            <br />
            Zipcode:
            <asp:TextBox ID="ZipcodeTextBox" runat="server" Text='<%# Bind("Zipcode") %>' />
            <br />
            DatePosted:
            <asp:TextBox ID="DatePostedTextBox" runat="server" 
                Text='<%# Bind("DatePosted") %>' />
            <br />
            TimeLeft:
            <asp:TextBox ID="TimeLeftTextBox" runat="server" 
                Text='<%# Bind("TimeLeft") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            ProjectID:
            <asp:TextBox ID="ProjectIDTextBox" runat="server" 
                Text='<%# Bind("ProjectID") %>' />
            <br />
            LCID:
            <asp:TextBox ID="LCIDTextBox" runat="server" Text='<%# Bind("LCID") %>' />
            <br />
            CategoryID:
            <asp:TextBox ID="CategoryIDTextBox" runat="server" 
                Text='<%# Bind("CategoryID") %>' />
            <br />
            CategoryName:
            <asp:TextBox ID="CategoryNameTextBox" runat="server" 
                Text='<%# Bind("CategoryName") %>' />
            <br />
            JobID:
            <asp:TextBox ID="JobIDTextBox" runat="server" Text='<%# Bind("JobID") %>' />
            <br />
            JobTitle:
            <asp:TextBox ID="JobTitleTextBox" runat="server" 
                Text='<%# Bind("JobTitle") %>' />
            <br />
            ExperienceID:
            <asp:TextBox ID="ExperienceIDTextBox" runat="server" 
                Text='<%# Bind("ExperienceID") %>' />
            <br />
            CrewNumberID:
            <asp:TextBox ID="CrewNumberIDTextBox" runat="server" 
                Text='<%# Bind("CrewNumberID") %>' />
            <br />
            LicensedID:
            <asp:TextBox ID="LicensedIDTextBox" runat="server" 
                Text='<%# Bind("LicensedID") %>' />
            <br />
            InsuredID:
            <asp:TextBox ID="InsuredIDTextBox" runat="server" 
                Text='<%# Bind("InsuredID") %>' />
            <br />
            RelocationID:
            <asp:TextBox ID="RelocationIDTextBox" runat="server" 
                Text='<%# Bind("RelocationID") %>' />
            <br />
            ProjectTitle:
            <asp:TextBox ID="ProjectTitleTextBox" runat="server" 
                Text='<%# Bind("ProjectTitle") %>' />
            <br />
            StartDate:
            <asp:TextBox ID="StartDateTextBox" runat="server" 
                Text='<%# Bind("StartDate") %>' />
            <br />
            EndDate:
            <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
            <br />
            AmountOffered:
            <asp:TextBox ID="AmountOfferedTextBox" runat="server" 
                Text='<%# Bind("AmountOffered") %>' />
            <br />
            CurrencyID:
            <asp:TextBox ID="CurrencyIDTextBox" runat="server" 
                Text='<%# Bind("CurrencyID") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            SpecialNotes:
            <asp:TextBox ID="SpecialNotesTextBox" runat="server" 
                Text='<%# Bind("SpecialNotes") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            CountryID:
            <asp:TextBox ID="CountryIDTextBox" runat="server" 
                Text='<%# Bind("CountryID") %>' />
            <br />
            CountryName:
            <asp:TextBox ID="CountryNameTextBox" runat="server" 
                Text='<%# Bind("CountryName") %>' />
            <br />
            RegionID:
            <asp:TextBox ID="RegionIDTextBox" runat="server" 
                Text='<%# Bind("RegionID") %>' />
            <br />
            RegionName:
            <asp:TextBox ID="RegionNameTextBox" runat="server" 
                Text='<%# Bind("RegionName") %>' />
            <br />
            CityID:
            <asp:TextBox ID="CityIDTextBox" runat="server" Text='<%# Bind("CityID") %>' />
            <br />
            CityName:
            <asp:TextBox ID="CityNameTextBox" runat="server" 
                Text='<%# Bind("CityName") %>' />
            <br />
            Zipcode:
            <asp:TextBox ID="ZipcodeTextBox" runat="server" Text='<%# Bind("Zipcode") %>' />
            <br />
            DatePosted:
            <asp:TextBox ID="DatePostedTextBox" runat="server" 
                Text='<%# Bind("DatePosted") %>' />
            <br />
            TimeLeft:
            <asp:TextBox ID="TimeLeftTextBox" runat="server" 
                Text='<%# Bind("TimeLeft") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            ProjectID:
            <asp:Label ID="ProjectIDLabel" runat="server" Text='<%# Eval("ProjectID") %>' />
            <br />
            LCID:
            <asp:Label ID="LCIDLabel" runat="server" Text='<%# Bind("LCID") %>' />
            <br />
            CategoryID:
            <asp:Label ID="CategoryIDLabel" runat="server" 
                Text='<%# Bind("CategoryID") %>' />
            <br />
            CategoryName:
            <asp:Label ID="CategoryNameLabel" runat="server" 
                Text='<%# Bind("CategoryName") %>' />
            <br />
            JobID:
            <asp:Label ID="JobIDLabel" runat="server" Text='<%# Bind("JobID") %>' />
            <br />
            JobTitle:
            <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Bind("JobTitle") %>' />
            <br />
            ExperienceID:
            <asp:Label ID="ExperienceIDLabel" runat="server" 
                Text='<%# Bind("ExperienceID") %>' />
            <br />
            CrewNumberID:
            <asp:Label ID="CrewNumberIDLabel" runat="server" 
                Text='<%# Bind("CrewNumberID") %>' />
            <br />
            LicensedID:
            <asp:Label ID="LicensedIDLabel" runat="server" 
                Text='<%# Bind("LicensedID") %>' />
            <br />
            InsuredID:
            <asp:Label ID="InsuredIDLabel" runat="server" Text='<%# Bind("InsuredID") %>' />
            <br />
            RelocationID:
            <asp:Label ID="RelocationIDLabel" runat="server" 
                Text='<%# Bind("RelocationID") %>' />
            <br />
            ProjectTitle:
            <asp:Label ID="ProjectTitleLabel" runat="server" 
                Text='<%# Bind("ProjectTitle") %>' />
            <br />
            StartDate:
            <asp:Label ID="StartDateLabel" runat="server" Text='<%# Bind("StartDate") %>' />
            <br />
            EndDate:
            <asp:Label ID="EndDateLabel" runat="server" Text='<%# Bind("EndDate") %>' />
            <br />
            AmountOffered:
            <asp:Label ID="AmountOfferedLabel" runat="server" 
                Text='<%# Bind("AmountOffered") %>' />
            <br />
            CurrencyID:
            <asp:Label ID="CurrencyIDLabel" runat="server" 
                Text='<%# Bind("CurrencyID") %>' />
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            SpecialNotes:
            <asp:Label ID="SpecialNotesLabel" runat="server" 
                Text='<%# Bind("SpecialNotes") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            CountryID:
            <asp:Label ID="CountryIDLabel" runat="server" Text='<%# Bind("CountryID") %>' />
            <br />
            CountryName:
            <asp:Label ID="CountryNameLabel" runat="server" 
                Text='<%# Bind("CountryName") %>' />
            <br />
            RegionID:
            <asp:Label ID="RegionIDLabel" runat="server" Text='<%# Bind("RegionID") %>' />
            <br />
            RegionName:
            <asp:Label ID="RegionNameLabel" runat="server" 
                Text='<%# Bind("RegionName") %>' />
            <br />
            CityID:
            <asp:Label ID="CityIDLabel" runat="server" Text='<%# Bind("CityID") %>' />
            <br />
            CityName:
            <asp:Label ID="CityNameLabel" runat="server" Text='<%# Bind("CityName") %>' />
            <br />
            Zipcode:
            <asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Bind("Zipcode") %>' />
            <br />
            DatePosted:
            <asp:Label ID="DatePostedLabel" runat="server" 
                Text='<%# Bind("DatePosted") %>' />
            <br />
            TimeLeft:
            <asp:Label ID="TimeLeftLabel" runat="server" Text='<%# Bind("TimeLeft") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>" 
        SelectCommand="SELECT * FROM [ProjectRequirements]"></asp:SqlDataSource>
    <br />
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
