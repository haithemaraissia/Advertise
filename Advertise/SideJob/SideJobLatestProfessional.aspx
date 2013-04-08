<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SideJobLatestProfessional.aspx.cs"
    Inherits="SideJobLatestProfessional" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <h2 id="H2TopProfessional">
                        <asp:Label ID="TopProfessionalLabel" runat="server" Text="<%$ Resources:Resource, TopProfessional %>"
                            Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                    <div style="background-color: #FFFFFF; text-align: center; border-right-style: solid;
                        border-left-style: solid; border-right-width: 2px; border-left-width: 2px; border-right-color: #003366;
                        border-left-color: #003366;">
                        <asp:DataList ID="TopProfessionalDataList" runat="server" DataKeyField="ProID" 
                            Width="178px" HorizontalAlign="Center" CellSpacing="4">
                            <ItemTemplate>
                                <div style="text-align: center" id="BlueLink">
                                    <asp:ImageButton ID="ProfessionalImageButton" runat="server" Height="50px" Width="50px"
                                        ImageUrl='<%# Eval("PhotoPath") %>' PostBackUrl='<%# "../Authenticated/ViewProfessionalProfile.aspx?PID=" + Eval("ProID", "{0}") %>' />
                                    <br />
                                    <asp:HyperLink ID="ProfessionalIDHyperLink" runat="server" NavigateUrl='<%# "../Authenticated/ViewProfessionalProfile.aspx?PID=" + Eval("ProID", "{0}") %>'
                                        Text='<%# Eval("UserName", "{0}") %>' Font-Bold="True" Font-Underline="False"></asp:HyperLink>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <div style="text-align: right">
                            <button id="MoreProfessionalButton" type="button" runat="server" style="background-color: #003366;
                                color: #FFFFFF;" onmouseover="style.backgroundColor='#006699';" onmouseout="style.backgroundColor='#003366';"
                                onclick="window.location='FindProfessional.aspx';">
                                <asp:Label ID="MoreProfessionalLabel" runat="server" Text="<%$ Resources:Resource, More> %>"></asp:Label>
                            </button>
                        </div>
                       <%-- <asp:SqlDataSource ID="TopProfessionalSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SIDEJOBSConnectionString1 %>"
                            SelectCommand="GetTopProfessional" SelectCommandType="StoredProcedure"></asp:SqlDataSource>--%>
                    </div>
                    <div style="background-color: #003366; margin-left: 0px; margin-right: -2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                    </div>
                    <div style="background-color: #003366; margin-left: 0px; margin-right: -2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                    </div>
                    <div style="background-color: #003366; margin-left: 1px; margin-right: -1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                    </div>
                    <div style="background-color: #003366; margin-left: 1px; margin-right: -1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                    </div>
                    <div style="background-color: #003366; margin-left: 2px; margin-right: 0px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                    </div>
                    <div style="background-color: #003366; margin-left: 3px; margin-right: 1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                    </div>
                    <div style="background-color: #003366; margin-left: 4px; margin-right: 2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 4px solid #003366; border-right: 4px solid #003366;">
                    </div>
                    <div style="background-color: #003366; margin-left: 8px; margin-right: 6px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
