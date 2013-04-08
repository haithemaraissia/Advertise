using System;
using System.Linq;
using System.Web.UI;
using SidejobModel;


public partial class SideJobLatestProfessional : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetTopProfessional();
        }
    }

    protected void GetTopProfessional()
    {
              using (var context = new SidejobEntities())
        {

                var query  = from pg in context.ProfessionalGenerals
                                         join pai in context.ProfessionalAdditionalInformations
                                             on pg.ProID equals pai.ProID
                                             orderby pai.MoneyEarned, pai.ProjectCompleted, pai.WorkAccomplished,
                                             pai.Rank, pai.Points, pai.Reputation
                                         select new { pg.ProID, UserName = pg.UserName.Substring(0,6), pg.PhotoPath};

                var results = query.Take(3).ToList();
                TopProfessionalDataList.DataSource = results;
                TopProfessionalDataList.DataBind();

        }  
    }
}

public class TopProfessional2
{
    public TopProfessional2(int id, string name)
    {
        ProID = id;
        UserName = name;
    }
    public int ProID { get; set; }
    public string UserName { get; set; }
    public string PhotoPath { get; set; }
}