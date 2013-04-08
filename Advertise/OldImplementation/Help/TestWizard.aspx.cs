using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test_TestWizard : System.Web.UI.Page
{
    string rootPath = null;
    string DirectoryString = null;
    string VirtualPath = null;


    // CreatedUser event is called when a new user is successfully created
    public void SignUpCreateWizard_CreatedUser(object sender, EventArgs e)
    {


        UploadImages();



    }

    // Activate event fires when the user hits "next" in the CreateUserWizard
    public void AssignUserToRoles_Activate(object sender, EventArgs e)
    {

        // Databind list of roles in the role manager system to a listbox in the wizard
        //AvailableRoles.DataSource = Roles.GetAllRoles(); ;
        //AvailableRoles.DataBind();
    }

    // Deactivate event fires when user hits "next" in the CreateUserWizard 
    public void AssignUserToRoles_Deactivate(object sender, EventArgs e)
    {

        // Add user to all selected roles from the roles listbox
        //for (int i = 0; i < AvailableRoles.Items.Count; i++) {
        //    if (AvailableRoles.Items[i].Selected == true) 
        //        Roles.AddUserToRole(SignUpCreateWizard.UserName, AvailableRoles.Items[i].Value);
        //}
        Roles.AddUserToRole(SignUpCreateWizard.UserName, "Advertiser");
    }





    protected void UploadImages()
    {

        FileUpload Photo1 = ((FileUpload)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FileUpload1"));
        FileUpload Photo2 = ((FileUpload)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FileUpload2"));
        FileUpload Photo3 = ((FileUpload)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FileUpload3"));
        FileUpload Photo4 = ((FileUpload)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FileUpload4"));

        //p.Picture1 = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Picture1")).Text;
        //p.Picture2 = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Picture2")).Text;
        //p.Picture3 = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Picture3")).Text;
        //p.Picture4 = ((TextBox)SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("Picture4")).Text;

        var flag = Validate(Photo1);
        var flag2 = Validate(Photo2);
        var flag3 = Validate(Photo3);
        var flag4 = Validate(Photo4);

        if (flag == true)
        {
            Response.Write("OK for Photo1");
            string p = Photo1.FileName.ToString();



            //  rootPath = Server.MapPath("~/Authenticated/Customer/Images/")
            //DirectoryString = rootPath & Username.ToString & "/"
            //VirtualPath = "http://side/Authenticated/Customer/Images/" & Username.ToString & "/" & Trim(AsyncFileUpload1.FileName.ToString())
            //      Dim PhotoPath As String = DirectoryString.ToString() + AsyncFileUpload1.FileName.ToString()
            //Me.AsyncFileUpload1.SaveAs(PhotoPath.ToString())

        }
        if (flag2 == true)
        {
            Response.Write("OK for Photo2");
        }
        if (flag3 == true)
        {
            Response.Write("OK for Photo3");
        }
        if (flag4 == true)
        {
            Response.Write("OK for Photo4");
        }
    }

    private static bool Validate(FileUpload Photo1)
    {
        bool flag = false;
        if (Photo1.HasFile)
        {
            flag = !(Convert.ToInt32(Photo1.FileBytes) >= 4096000);
            string typeAllowed = null;
            var extension = System.IO.Path.GetExtension(Photo1.FileName);
            if (extension != null)
                typeAllowed = extension.ToLower();
            if ((typeAllowed == ".jpg" | typeAllowed == ".jpeg" | typeAllowed == ".gif" | typeAllowed == ".png" |
                 typeAllowed == ".bmp" | typeAllowed == ".tiff") == false)
            {
                flag = false;
            }
        }
        return flag;
    }
}


