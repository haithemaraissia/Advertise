<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TemplateMainUpperButtons.ascx.vb" Inherits="TemplateMainUpperButtons" %>
<link href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/Advertise/testweb/Styles/Site.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/Advertise/testweb/Styles/Menustyle.css" type="text/css" />
<!--[if lte IE 7]>
        <link rel="stylesheet" type="text/css" href=Styles/ie.css" media="screen" />
    <![endif]-->
<script type="text/javascript" src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/Advertise/testweb/Scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" language="javascript" src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/Advertise/testweb/Scripts/jquery.dropdownPlain.js"></script>
<div id="page-wrap">
    <ul class="dropdown" style="z-index:100">
        <li><a id="selected" href="../Home.aspx">Home</a> </li>
        <li><a href="../Advertiser/Compaign/Advertiser.aspx">Advertisement</a>
            <ul>
                <li><a href="/Advertise/Advertiser/Compaign/Current/Home.aspx">Current</a>
                <ul>
                    <li><a href="/Advertise/Advertiser/Compaign/Current/New.aspx">New Compaing</a></li>
                    <li><a href="/Advertise/Advertiser/Compaign/Current/Inventory.aspx">Inventory</a></li>
                    <li><a href="/Advertise/Advertiser/Compaign/Current/Edit.aspx">Edit</a></li>
                    <li><a href="/Advertise/Advertiser/Compaign/Current/Delete.aspx">Delete</a></li>
                </ul>
                </li>
                
      
      
       <li><a href="/Advertise/Advertiser/Compaign/Payment/Payments.aspx">Payment</a>
                <ul>
                    <li><a href="/Advertise/Advertiser/Compaign/Payment/Payments.aspx">Status</a></li>
                </ul>
                </li>
                
                <li><a href="/Advertise/Advertiser/Compaign/Saved/Home.aspx">Saved</a>
                <ul>
                    <li><a href="/Advertise/Advertiser/Compaign/Saved/Inventory.aspx">Inventory</a></li>
                    <li><a href="/Advertise/Advertiser/Compaign/Saved/Edit.aspx">Edit</a></li>
                    <li><a href="/Advertise/Advertiser/Compaign/Saved/Delete.aspx">Delete</a></li>
                </ul>
                </li>
                <li><a href="/Advertise/Advertiser/Compaign/Completed/Home.aspx">Completed</a>
                    <ul>
                        <li><a href="/Advertise/Advertiser/Compaign/Completed/Inventory.aspx">Inventory</a></li>
                        <li><a href="/Advertise/Advertiser/Compaign/Completed/Extend.aspx">Extend</a></li>
                        <li><a href="/Advertise/Advertiser/Compaign/Completed/Delete.aspx">Delete</a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li><a href="../Advertiser/Report/Report.aspx">Report</a>
            <ul>
                <li><a href="/Advertise/Advertiser/Report/Current/Home.aspx">Current</a>
                    <ul>
                        <li><a href="/Advertise/Advertiser/Report/Current/Executive.aspx">Executive</a></li>
                        <li><a href="/Advertise/Advertiser/Report/Current/Advertiser.aspx">Advertiser</a></li>
                        <li><a href="/Advertise/Advertiser/Report/Current/Geographic.aspx">Geographic</a></li>
                        <li><a href="/Advertise/Advertiser/Report/Current/Platform.aspx">Platform</a></li>
                        <li><a href="/Advertise/Advertiser/Report/Current/Profile.aspx">Profile</a></li>
                    </ul>
                </li>
                <li><a href="/Advertise/Advertiser/Report/Completed/Home.aspx">Completed</a>
                    <ul>
                        <li><a href="/Advertise/Advertiser/Report/Completed/Executive.aspx">Executive</a></li>
                        <li><a href="/Advertise/Advertiser/Report/Completed/Advertiser.aspx">Advertiser</a></li>
                        <li><a href="/Advertise/Advertiser/Report/Completed/Geographic.aspx">Geographic</a></li>
                        <li><a href="/Advertise/Advertiser/Report/Completed/Platform.aspx">Platform</a></li>
                        <li><a href="/Advertise/Advertiser/Report/Completed/Profile.aspx">Profile</a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li><a href="../Account/Account.aspx">Account</a>
            <ul>
                <li><a href="../Advertiser/Profile/ViewProfile.aspx">View Profile</a></li>
                <li><a href="../Account/EditProfile.aspx">Edit Profile</a></li>
                <li><a href="../Account/DeleteProfile.aspx">Delete Profile</a></li>
                <li><a href="../Account/ManagePhoto.aspx">Manage Photo</a></li>
                <li><a href="../Account/ChangePassword.aspx">Change Password</a></li>
                <li><a href="../Account/LogOut.aspx">Log Out</a></li>
            </ul>
        </li>
        <li style="width: 132px"><a href="../Help.aspx">Help</a>
            <ul>
                <li><a href="../AboutUs.aspx">About Us</a></li>
                <li><a href="../WhiteBoard.aspx">WhiteBoard</a></li>
                <li><a href="../ContactUs.aspx">Contact Us</a></li>
            </ul>
        </li>
        	<li style="float:right">
        	    <a href="#">
        	         <img id="selected" alt="earth" src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/earth.png" runat="server" height="42" width="42" />
        	     </a>
        		<ul>
        		     <li><a href="?l=en-US"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/US.png" <asp:Label ID="Label1" ForeColor="White" runat="server" Text="<%$ Resources:Resource, English %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a href="?l=fr"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/FR.png" <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, French %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a href="?l=es"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/ES.png"  <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, Spanish %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a href="?l=zh-CN"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/CN.png"  <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, Chinese %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a href="?l=ru"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/RU.png"  <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, Russian %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                                                <li><a href="?l=ar"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/AE.png" <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, Arabic %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                                                <li><a href="?l=ja"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/JP.png" <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, Japanese %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                                                <li><a href="?l=de"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/DE.png" <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource, German %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                            </ul>
        	</li>
        </ul>
	</div>