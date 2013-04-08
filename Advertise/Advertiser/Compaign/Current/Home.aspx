<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="AdManagment._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<h5>Current Compaing</h5>
    
       <div>
           <ul>
               <li><a href="New.aspx">New.aspx</a></li>
               <li><a href="Inventory.aspx">Inventory.aspx</a></li>
               <li><a href="Extend.aspx">Extend.aspx</a></li>
               <li><a href="Edit.aspx">Edit.aspx</a></li>
               <li><a href="Delete.aspx">Delete.aspx</a></li>
           </ul>
       </div>


</asp:Content>
