using System;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

public partial class Account_ManagePhoto : System.Web.UI.Page
{
    bool _flag = true;

    protected void Page_Load(Object sender, EventArgs e)
    {
        centerstage.Src = Profile.Picture1;
        photo0.Src = Profile.Picture1;
        photo1.Src = Profile.Picture2;
        photo2.Src = Profile.Picture3;
        photo3.Src = Profile.Picture4;
    }

    protected void ChangePhotoLinkButtonClick(object sender, EventArgs e)
    {
        ChangePhotoModalPopUpExtender.Show();
        switch (ProfileHiddenField.Value)
        {
            case "0":
                Session["SelectedImage"] = 0;
                break;
            case "1":
                Session["SelectedImage"] = 1;
                break;
            case "2":
                Session["SelectedImage"] = 2;
                break;
            case "3":
                Session["SelectedImage"] = 3;
                break;
            default:
                Session["SelectedImage"] = 0;
                break;
        }
    }

    public void ValidateDirectory()
    {
        if (Directory.Exists(GetAdvertiserDirectory()) == false)
        {
            Directory.CreateDirectory(GetAdvertiserDirectory());
        }
    }

    public string GetAdvertiserDirectory()
    {
        var username = User.Identity.Name;
        var rootPath = Server.MapPath("../Advertiser/Ads/");
        return rootPath + username;
    }

    protected void AsyncFileUploadUploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        _flag = true;
        if ((Convert.ToInt32(e.FileSize) >= 4096000))
        {
            _flag = false;
        }

        string typeAllowed = null;
        var extension = Path.GetExtension(e.FileName);
        if (extension != null)
            typeAllowed = extension.ToLower();
        if ((typeAllowed == ".jpg" | typeAllowed == ".jpeg" | typeAllowed == ".gif" | typeAllowed == ".png" | typeAllowed == ".bmp" | typeAllowed == ".tiff" | typeAllowed == ".swf") == false)
        {
            _flag = false;
        }
        if (AsyncFileUpload1.HasFile == false)
        {
            _flag = false;
        }

        if (!_flag) return;
        //save
        var path = Server.MapPath("~/Advertiser/Profile/Photo/") + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
        switch (Session["SelectedImage"].ToString())
        {
            case "0":
                Profile.Picture1 = "~/Advertiser/Profile/Photo/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                break;
            case "1":
                Profile.Picture2 = "~/Advertiser/Profile/Photo/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                break;
            case "2":
                Profile.Picture3 = "~/Advertiser/Profile/Photo/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                break;
            case "3":
                Profile.Picture4 = "~/Advertiser/Profile/Photo/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                break;
            default:
                Profile.Picture1 = "~/Advertiser/Profile/Photo/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                break;
        }
        centerstage.Src = "~/Advertiser/Profile/Photo/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
        AsyncFileUpload1.SaveAs(path);
        Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
        Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
    }

    protected void SaveCreative()
    {
        if (_flag != true) return;
        ValidateDirectory();
        if (AsyncFileUpload1.FileName == null) return;
        string adPath = GetAdvertiserDirectory() + "/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
        AsyncFileUpload1.SaveAs(adPath);
    }

    protected void AsyncFileUploadCustomValidatorServerValidate(object source, ServerValidateEventArgs args)
    {
        if (AsyncFileUpload1.HasFile == false)
        {
            _flag = false;
        }

        args.IsValid = _flag;
    }
}