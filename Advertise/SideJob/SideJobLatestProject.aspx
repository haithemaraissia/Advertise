<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SideJobLatestProject.aspx.cs" Inherits="SideJobLatestProject" %>

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
             <tr>
                        <td>
                            <h2 id="H2LatestProjects">
                                <asp:Label ID="LatestProjectsLabel" runat="server" Text="<%$ Resources:Resource, LatestProjects %>"
                                    Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                            <div style="background-color: #FFFFFF; text-align: center; border-right-style: solid;
                                border-left-style: solid; border-right-width: 2px; border-left-width: 2px; border-right-color: #003300;
                                border-left-color: #003300;">
                                <asp:DataList ID="TopProjectDataList" runat="server" DataKeyField="ProjectID" 
                                    Width="178px" HorizontalAlign="Center" CellSpacing="4">
                                    <ItemTemplate>
                                        <div style="text-align: center" id="GreenLink">
                                            <asp:ImageButton ID="ProjectImageButton" runat="server" Height="50px" Width="50px"
                                                ImageUrl='<%# Eval("PhotoPath") %>' PostBackUrl='<%# "../Authenticated/ViewProject.aspx?PRID=" + Eval("ProjectID", "{0}") %>' />
                                            <br />
                                            <asp:HyperLink ID="ProjectIDHyperLink" runat="server" NavigateUrl='<%# "../Authenticated/ViewProject.aspx?PRID=" + Eval("ProjectID", "{0}") %>'
                                                Text='<%# Eval("ProjectTitle", "{0}") %>'   Font-Bold="True" Font-Underline="False"></asp:HyperLink>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <div style="text-align: right">
                                    <button id="MoreProjectButton" type="button" runat="server" onmouseover="style.backgroundColor='#336600';"
                                        onmouseout="style.backgroundColor='#003300';" style="background-color: #003300;
                                        color: #FFFFFF;" onclick="window.location='FindJob.aspx';">
                                        <asp:Label ID="MoreProjectsLabel" runat="server" Text="<%$ Resources:Resource, More> %>"></asp:Label>
                                    </button>
                                </div>
                            </div>
                            <div style="background-color: #003300; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 2px; margin-right: 0px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 3px; margin-right: 1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 4px; margin-right: 2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 4px solid #003300; border-right: 4px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 8px; margin-right: 6px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                        </td>
                    </tr>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
