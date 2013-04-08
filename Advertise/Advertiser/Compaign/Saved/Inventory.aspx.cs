using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admanagment.Helpers;

public partial class Advertiser_Compaign_Saved_Inventory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            AdSqlDataSource.SelectParameters[0].DefaultValue = Utility.GetUserID().ToString();
            AdGridView.DataBind();
        }
    }    

    protected void AdGridViewRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#4F5A64'; this.style.color='white'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'");
        }

    }

    protected void AdGridViewSelectedIndexChanged(object sender, EventArgs e)
    {
        if (AdGridView.SelectedDataKey != null)
        {
            Response.Redirect(string.Format("ChangeAd.aspx?ID={0}&P=Temp", AdGridView.SelectedDataKey.Value));
        }
    }
}