using System;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class Advertiser_Compaign_Completed_Extend : System.Web.UI.Page
{
    protected override void InitializeCulture()
    {
        string lang = Request.QueryString["l"];
        if (lang != null | !string.IsNullOrEmpty(lang))
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
            Session["LCID"] = Admanagment.Helpers.Utility.GetLCID(lang);
        }
        else
        {
            if (Session["LCID"] != null)
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(Admanagment.Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Admanagment.Helpers.Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
            }
        }

    }

    protected void SEOSiteMap()
    {
        Page.Title = Resources.Resource.HomeTitle;

        var nl1 = new System.Web.UI.WebControls.Literal { Text = Environment.NewLine };
        var title = new HtmlMeta { Name = "title", Content = Resources.Resource.HomeTitle };
        Page.Header.Controls.AddAt(1, title);

        var description = new HtmlMeta { Name = "description", Content = Resources.Resource.HomeDescription };
        Page.Header.Controls.AddAt(2, description);

        var keywords = new HtmlMeta { Name = "keywords", Content = Resources.Resource.HomeKeywords };
        Page.Header.Controls.AddAt(3, keywords);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                SEOSiteMap();
                if (Session["LCID"] == null)
                {
                    Session["LCID"] = 1;
                }
                AdjustAdCalendar();
            }
            catch (Exception)
            {
                Response.Redirect("../../../Account/Login.aspx");

            }
        }
    }

    protected void AdjustAdCalendar()
    {
        {
            StartDateCalendar.SelectedDate = DateTime.Today.Date;
            EndDateCalendar.SelectedDate = DateTime.Today.AddDays(1).Date;
        }
    }

    protected int GetAdID()
    {
        if (Request.QueryString["ID"] == null)
        {
            Response.Redirect("../../../Account/Login.aspx");
            return 0;
        }
        return int.Parse(Request.QueryString["ID"]);
    }

    protected Guid? GetUserID()
    {
        var user = Membership.GetUser();
        if (user != null)
        {
            var userKey = user.ProviderUserKey;

            if (userKey != null)
            {
                var userID = (Guid)userKey;
                return userID;
            }
            else
            {
                Response.Redirect("../../../Account/Login.aspx");
                return null;
            }
        }
        else
        {
            Response.Redirect("../../../Account/Login.aspx");
            return null;
        }
    }

    public void CalenderCheck()
    {
        var result = DateTime.Compare(EndDateCalendar.SelectedDate.Date, StartDateCalendar.SelectedDate.Date);
        if (result < 1)
        {
            DateErrorTextBox.Text = "";
            CalenderCustomValidator.Validate();
        }
        else
        {
            DateErrorTextBox.Text = "";
        }
    }

    protected void EndDateCalendarSelectionChanged(object sender, EventArgs e)
    {
        CalenderCheck();
    }

    protected void StartDateCalendarSelectionChanged(object sender, EventArgs e)
    {
        CalenderCheck();
    }

    protected void CalenderCustomValidatorServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        var result = DateTime.Compare(EndDateCalendar.SelectedDate.Date, StartDateCalendar.SelectedDate.Date);
        args.IsValid = result >= 1;
    }

    protected DateTime GetStartDate()
    {
        return StartDateCalendar.SelectedDate.Date;
    }

    protected DateTime GetEndDate()
    {
        return EndDateCalendar.SelectedDate.Date;
    }

    protected void StartDateCalendar_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date < DateTime.Today.Date)
        {
            e.Cell.Enabled = false; // Changes the Cells Enable Property
            e.Day.IsSelectable = false; // Disables the Cells Click Property
        }
    }

    protected void EndDateCalendar_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date < DateTime.Today.AddDays(1).Date)
        {
            e.Cell.Enabled = false; // Changes the Cells Enable Property
            e.Day.IsSelectable = false; // Disables the Cells Click Property
        }
    }

    protected void ExtendAdButton_Click(object sender, EventArgs e)
    {
        //Save it and Redirect to ReviewAd?ID in saved folder
        //Set Complete to false and active to false
        try
        {
            int y = GetAdID();
            using (var context2 = new AdDatabaseModel.AdDatabaseEntities())
            {
                var adgeneral = (from ad in context2.AdGenerals
                              where ad.ID == y
                              select ad).ToList();
                adgeneral[0].StartDate = GetStartDate();
                adgeneral[0].EndDate = GetEndDate();
                adgeneral[0].IsActive = false;
                adgeneral[0].Completed = false;
                context2.SaveChanges();
                Response.Redirect((string.Format("../Saved/ReviewAd.aspx?ID={0}", GetAdID())), false);
            }
        }
        catch (Exception)
        {

            Response.Redirect((string.Format("Inventory.aspx")), false);
        }
     

    }
}