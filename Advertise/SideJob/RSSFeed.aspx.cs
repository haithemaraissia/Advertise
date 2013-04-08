using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Xml;
using SidejobModel;


public partial class RSSFeed : Page
{

    //Left:
    //Clean up
    //DO selection without images.
    //Keep Image code
    protected void Page_Load(object sender, EventArgs e)
    {
        RSSFeeds();
    }


    protected void RSSFeeds()
    {
        int copyrightyear = DateTime.Now.Year;
        Response.Clear();
        Response.ContentType = "text/xml";
        var writer = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
        writer.WriteStartDocument();
        writer.WriteStartElement("rss");
        writer.WriteAttributeString("xmlns:media", "http://search.yahoo.com/mrss/");
        writer.WriteAttributeString("version", "2.0");
        writer.WriteStartElement("channel");

        writer.WriteElementString("title", "Mikesdotnetting News Feed");
        writer.WriteElementString("link", "http://www.mikesdotnetting.com/rss.aspx");
        writer.WriteElementString("description", "Latest additions to the rubbish that appears on Mikesdotnetting.com.");
        writer.WriteElementString("copyright", "(c) " + copyrightyear.ToString(CultureInfo.InvariantCulture) + ", Mikesdotnetting. All rights reserved.");
        writer.WriteEndElement();

        writer.WriteStartElement("item");
        writer.WriteElementString("title", "title");
        writer.WriteElementString("description", "description");
        writer.WriteElementString("link", "http://www.mikesdotnetting.com/Article.aspx?ArticleID=" + 5);
        writer.WriteElementString("pubDate", "1/1/20011");

        /////////////////////////////Potential Problem with Image:///////////////////////////////////
        ////////////////////////////////Do Selection with Images/////////////////////////////////////
        writer.WriteStartElement("enclosure");
        writer.WriteElementString("url", "http://www.fileparade.com/Images/logo88x31.png");
        writer.WriteElementString("type", "image/jpeg");
        writer.WriteEndElement();

        writer.WriteStartElement("image");
        writer.WriteElementString("url", "http://www.fileparade.com/Images/logo88x31.png");
        writer.WriteElementString("title", "sdfds");
        writer.WriteElementString("length", "200");
        writer.WriteElementString("link", "http://www.fileparade.com/Images/logo88x31.png");
        writer.WriteEndElement();

        writer.WriteStartElement("media:thumbnail");
        writer.WriteElementString("url", "http://www.fileparade.com/Images/logo88x31.png");
        writer.WriteElementString("height", "75");
        writer.WriteElementString("width", "75");
        writer.WriteEndElement();
        /////////////////////////////Potential Problem with Image:///////////////////////////////////
        ////////////////////////////////Do Selection with Images/////////////////////////////////////
        



        ///////////////////////////////////////Format////////////////////////////////////////////////
        //<?xml version="1.0" encoding="utf-8"?>
        //<rss version="2.0">
        //<channel>
        //<title>title</title>
        //<link>http://www.link.com/</link>
        //<description>description</description>
        //<language>en-us</language>
        //<ttl>5</ttl>
        //<item>
        //<title>title of entry</title>
        //<description>description of entry</description>
        //<link>http://www.link.com/</link>
        //<pubDate>publish date</pubDate>
        //</item>
        //<item>
        //<title>title of entry</title>
        //<description>description of entry</description>
        //<link>http://www.link.com/</link>
        //<pubDate>publish date</pubDate>
        //</item>
        //</channel>
        //</rss> 
        ///////////////////////////////////////Format////////////////////////////////////////////////


        //Maybe New Project Lasest 5 Projects
        //NEw stories
        //New PRofessional // Latest 5 Professional
        //New Customer//Latest 5 Customer

        //const string connectionString = "Utils.GetConnString()";
        //using (var conn = new SqlConnection(connectionString))
        //{
        //    using (var objCommand = new SqlCommand("GetRss", conn))
        //    {
        //        objCommand.CommandType = CommandType.StoredProcedure;
        //        conn.Open();
        //        using (SqlDataReader objReader = objCommand.ExecuteReader())
        //        {
        //            while (objReader.Read())
        //            {
        //                writer.WriteStartElement("item");
        //                writer.WriteElementString("title", objReader.GetString(1));
        //                writer.WriteElementString("description", objReader.GetString(2));
        //                writer.WriteElementString("link", "http://www.mikesdotnetting.com/Article.aspx?ArticleID=" + objReader.GetInt32(0).ToString(CultureInfo.InvariantCulture));
        //                writer.WriteElementString("pubDate",
        //        objReader.GetDateTime(3).ToString("R"));
        //                writer.WriteEndElement();
        //            }
        //            objReader.Close();
        //            conn.Close();

        //Maybe New Project Lasest 5 Projects
        //NEw stories
        //New PRofessional // Latest 5 Professional
        //New Customer//Latest 5 Customer

        //const string connectionString = "Utils.GetConnString()";
        //using (var conn = new SqlConnection(connectionString))
        //{
        //    using (var objCommand = new SqlCommand("GetRss", conn))
        //    {
        //        objCommand.CommandType = CommandType.StoredProcedure;
        //        conn.Open();
        //        using (SqlDataReader objReader = objCommand.ExecuteReader())
        //        {
        //            while (objReader.Read())
        //            {
        //                writer.WriteStartElement("item");
        //                writer.WriteElementString("title", objReader.GetString(1));
        //                writer.WriteElementString("description", objReader.GetString(2));
        //                writer.WriteElementString("link", "http://www.mikesdotnetting.com/Article.aspx?ArticleID=" + objReader.GetInt32(0).ToString(CultureInfo.InvariantCulture));
        //                writer.WriteElementString("pubDate",
        //        objReader.GetDateTime(3).ToString("R"));
        //                writer.WriteEndElement();
        //            }
        //            objReader.Close();
        //            conn.Close();


        writer.WriteEndElement();
        writer.WriteEndDocument();
        writer.Flush();
        writer.Close();
        Response.End();
    }


    protected void GetTopProfessional()
    {
        using (var context = new SidejobEntities())
        {

            var query = from pg in context.ProfessionalGenerals
                        join pai in context.ProfessionalAdditionalInformations
                            on pg.ProID equals pai.ProID
                        orderby pai.MoneyEarned, pai.ProjectCompleted, pai.WorkAccomplished,
                        pai.Rank, pai.Points, pai.Reputation
                        select new { pg.ProID, UserName = pg.UserName.Substring(0, 6), pg.PhotoPath };

            var results = query.Take(5).ToList();


           // TopProfessionalDataList.DataSource = results;
            //TopProfessionalDataList.DataBind();

        }
    }


    protected void GetTopProject()
    {
        var results = new TopProject[3];
        using (var context = new SidejobEntities())
        {
            var currenttimequery = from pr in context.ProjectRequirements
                                   join p in context.Projects
                                       on pr.ProjectID equals p.ProjectID
                                   where (p.StatusInt == 0) && (pr.EndDate >= DateTime.Now)
                                   orderby p.ProjectID descending
                                   select new { p.ProjectID, ProjectTitle = pr.ProjectTitle.Substring(0, 6) };

            if (currenttimequery.Count() > 3)
            {
                var checkcurrentimequery = currenttimequery.ToList();
                var queryresults = checkcurrentimequery.Take(3).ToList();
                for (var i = 0; i < results.Length; ++i)
                    results[i] = new TopProject(int.Parse(queryresults[i].ProjectID.ToString(CultureInfo.InvariantCulture)), queryresults[i].ProjectTitle, "");
            }
            else
            {
                var notimequery = from pr in context.ProjectRequirements
                                  join p in context.Projects
                                      on pr.ProjectID equals p.ProjectID
                                  where (p.StatusInt == 0)
                                  orderby p.ProjectID descending
                                  select new { p.ProjectID, pr.ProjectTitle };

                if (notimequery.Count() > 3)
                {
                    var checknotimequery = notimequery.ToList();
                    var queryresults = checknotimequery.Take(3).ToList();
                    for (var i = 0; i < results.Length; ++i)
                        results[i] = new TopProject(int.Parse(queryresults[i].ProjectID.ToString(CultureInfo.InvariantCulture)), queryresults[i].ProjectTitle, "");
                }
                else
                {
                    var allprojects = from pr in context.ProjectRequirements
                                      join p in context.Projects
                                          on pr.ProjectID equals p.ProjectID
                                      orderby p.ProjectID descending
                                      select new { p.ProjectID, pr.ProjectTitle };
                    var allprojectquery = allprojects.ToList();
                    var queryresults = allprojectquery.Take(3).ToList();
                    for (var i = 0; i < results.Length; ++i)
                        results[i] = new TopProject(int.Parse(queryresults[i].ProjectID.ToString(CultureInfo.InvariantCulture)), queryresults[i].ProjectTitle, "");
                }
            }



            ProjectPhoto(results);
            //TopProjectDataList.DataSource = results;
            //TopProjectDataList.DataBind();
        }
    }





    public void ProjectPhoto(TopProject[] results)
    {
        using (var context = new SidejobEntities())
        {
            for (var i = 0; i < 3; i++)
            {
                int projectID = results[i].ProjectID;
                var minimunPhotoRank = from ph in context.ProjectPhotoes
                                       where ph.PhotoRank != -1 && ph.ProjectID == projectID
                                       orderby ph.PhotoRank descending
                                       select ph;
                var photopath = from ph in context.ProjectPhotoes
                                where ph.PhotoRank == -1 && ph.ProjectID == projectID
                                select ph;
                if (minimunPhotoRank.Any())
                {
                    int rank = int.Parse(minimunPhotoRank.First().PhotoRank.ToString(CultureInfo.InvariantCulture));
                    photopath = from ph in context.ProjectPhotoes
                                where ph.PhotoRank == rank && ph.ProjectID == projectID
                                select ph;
                }
                var firstOrDefault = photopath.FirstOrDefault();
                if (firstOrDefault != null)
                    results[i].SetPath(firstOrDefault.PhotoPath.ToString(CultureInfo.InvariantCulture));
                else
                {
                    const string projectMissingPrimaryPicture = "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/NoWorkShopImage.jpg";
                    results[i].SetPath(projectMissingPrimaryPicture);
                }
            }
        }
    }


    protected string EncodeString(string s)
    {
        s = HttpUtility.HtmlEncode(s);
        return s.Replace("\r\n", "<br />\r\n");
    }
}


public class TopProject
{
    public TopProject(int id, string title, string path)
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

public class TopProfessional
{
    public TopProfessional(int id, string name)
    {
        ProID = id;
        UserName = name;
    }
    public int ProID { get; set; }
    public string UserName { get; set; }
    public string PhotoPath { get; set; }
}