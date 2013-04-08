using System;
using System.Globalization;
using System.Linq;
using SidejobModel;


public partial class SideJobLatestProject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           // GetTopProject();
        }
    }

    //protected void GetTopProject()
    //{
    //    var results = new TopProject[3];
    //    using (var context = new SidejobEntities())
    //    {
    //        var currenttimequery = from pr in context.ProjectRequirements
    //                               join p in context.Projects
    //                                   on pr.ProjectID equals p.ProjectID
    //                               where (p.StatusInt == 0) && (pr.EndDate >= DateTime.Now)
    //                               orderby p.ProjectID descending
    //                               select new { p.ProjectID, ProjectTitle = pr.ProjectTitle.Substring(0, 6) };

    //        if (currenttimequery.Count() > 3)
    //        {   
    //            var checkcurrentimequery = currenttimequery.ToList();
    //            var queryresults = checkcurrentimequery.Take(3).ToList();
    //            for (var i = 0; i < results.Length; ++i)
    //                results[i] = new TopProject(int.Parse(queryresults[i].ProjectID.ToString(CultureInfo.InvariantCulture)), queryresults[i].ProjectTitle, "");
    //        }
    //        else
    //        {
    //            var notimequery = from pr in context.ProjectRequirements
    //                              join p in context.Projects
    //                                  on pr.ProjectID equals p.ProjectID
    //                              where (p.StatusInt == 0) 
    //                              orderby p.ProjectID descending
    //                              select new {p.ProjectID, pr.ProjectTitle };
               
    //            if (notimequery.Count() > 3)
    //            { 
    //                var checknotimequery = notimequery.ToList();
    //                var queryresults = checknotimequery.Take(3).ToList();
    //                for (var i = 0; i < results.Length; ++i)
    //                    results[i] = new TopProject(int.Parse(queryresults[i].ProjectID.ToString(CultureInfo.InvariantCulture)), queryresults[i].ProjectTitle, "");
    //            }
    //            else
    //            {
    //                var allprojects = from pr in context.ProjectRequirements
    //                                  join p in context.Projects
    //                                      on pr.ProjectID equals p.ProjectID
    //                                  orderby p.ProjectID descending
    //                                  select new {p.ProjectID, pr.ProjectTitle };
    //                var allprojectquery = allprojects.ToList();
    //                var queryresults = allprojectquery.Take(3).ToList();
    //                for (var i = 0; i < results.Length; ++i)
    //                    results[i] = new TopProject(int.Parse(queryresults[i].ProjectID.ToString(CultureInfo.InvariantCulture)), queryresults[i].ProjectTitle, "");
    //            }
    //        }
    //        ProjectPhoto(results);
    //        TopProjectDataList.DataSource = results;
    //        TopProjectDataList.DataBind();
    //    }
    //}

    //public void ProjectPhoto(TopProject[] results)
    //{
    //    using (var context = new SidejobEntities())
    //    {
    //        for (var i = 0; i < 3; i++)
    //        {
    //            int projectID = results[i].ProjectID;
    //            var minimunPhotoRank = from ph in context.ProjectPhotoes
    //                                   where ph.PhotoRank != -1 && ph.ProjectID == projectID
    //                                   orderby ph.PhotoRank descending
    //                                   select ph;
    //            var photopath = from ph in context.ProjectPhotoes
    //                            where ph.PhotoRank == -1 && ph.ProjectID == projectID
    //                            select ph;
    //            if (minimunPhotoRank.Any())
    //            {
    //                int rank = int.Parse(minimunPhotoRank.First().PhotoRank.ToString(CultureInfo.InvariantCulture));
    //                photopath = from ph in context.ProjectPhotoes
    //                            where ph.PhotoRank == rank && ph.ProjectID == projectID
    //                            select ph;
    //            }
    //            var firstOrDefault = photopath.FirstOrDefault();
    //            if (firstOrDefault != null)
    //                results[i].SetPath(firstOrDefault.PhotoPath.ToString(CultureInfo.InvariantCulture));
    //            else
    //            {
    //                const string projectMissingPrimaryPicture = "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/NoWorkShopImage.jpg";
    //                results[i].SetPath(projectMissingPrimaryPicture);
    //            }
    //        }
    //    }
    //}
}
public class TopProject2
{
    public TopProject2(int id, string title, string path)
    {
        ProjectID = id;
        ProjectTitle = title;
        PhotoPath = path;
    }
    public void SetPath(string path)
    {
        PhotoPath = path;
    }
    public int ProjectID { get; set; }
    public string ProjectTitle { get; set; }
    public string PhotoPath { get; set; }
}
