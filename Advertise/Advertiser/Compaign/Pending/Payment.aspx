<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Advertiser_Compaign_Pending_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h4>Payment Process</h4>
    <div>
        
        Like Inventory , but for payment in progress or denied.
          <br />
        <br />
        <h5>Saved Table</h5>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID" DataSourceID="SqlDataSource2" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="ID" />
                <asp:BoundField DataField="AdName" HeaderText="AdName" 
                    SortExpression="AdName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>" 
            SelectCommand="SELECT [ID], [AdName] FROM [TempAd]" 
            DeleteCommand="DELETE FROM [TempAd] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [TempAd] ([ID], [AdName]) VALUES (@ID, @AdName)" 
            UpdateCommand="UPDATE [TempAd] SET [AdName] = @AdName WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="AdName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AdName" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <br />
        <br />
        <h5>Pending Table</h5>

        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
            AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="ID" />
                <asp:BoundField DataField="AdName" HeaderText="AdName" 
                    SortExpression="AdName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>" 
            SelectCommand="SELECT [ID], [AdName] FROM [PendingAd]" 
            DeleteCommand="DELETE FROM [PendingAd] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [PendingAd] ([ID], [AdName]) VALUES (@ID, @AdName)" 
            UpdateCommand="UPDATE [PendingAd] SET [AdName] = @AdName WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="AdName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AdName" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            
               <br />
        <br />
        <h5>Current Table</h5>
        <p>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="AdID" DataSourceID="SqlDataSource3" AllowPaging="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="AdID" HeaderText="AdID" ReadOnly="True" 
                        SortExpression="AdID" />
                    <asp:BoundField DataField="AdName" HeaderText="AdName" 
                        SortExpression="AdName" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AdDatabaseConnectionString1 %>" 
                
                SelectCommand="SELECT AdAudience.AdID, AdGeneral.AdName FROM AdAudience INNER JOIN AdGeneral ON AdAudience.AdID = AdGeneral.AdID" 
                DeleteCommand="DeleteCurrentAd" DeleteCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="AdID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <h5>Action</h5>
        <table width="700px">
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="ApproveButton" runat="server" Text="Approve" 
                        onclick="ApproveButton_Click" />
                </td>
                <td>
                    <asp:Button ID="DenyButton" runat="server" Text="Deny" 
                        onclick="DenyButton_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

