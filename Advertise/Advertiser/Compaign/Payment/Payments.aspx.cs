using System;
using System.Web.UI.WebControls;
using Admanagment.Helpers;

public partial class Advertiser_Compaign_Payment_Payments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        PaymentDueSqlDataSource.SelectParameters[0].DefaultValue = Utility.GetUserID().ToString();
        PaymentDueStatusSqlDataSource.SelectParameters[0].DefaultValue = Utility.GetUserID().ToString();
        PaymentDueHistorySqlDataSource.SelectParameters[0].DefaultValue = Utility.GetUserID().ToString();
        PaymentDueGridView.DataBind();
        PaymentDueStatusGridView.DataBind();
        PaymentDueHistoryGridView.DataBind();     
        }
    }    

    protected void PaymentDueGridViewSelectedIndexChanged(object sender, EventArgs e)
    {
        if (PaymentDueGridView.SelectedDataKey != null)
            Response.Redirect("Paypal/PDT/PDTStart.aspx?ID=" + PaymentDueGridView.SelectedDataKey.Value + "&AD=" + PaymentDueGridView.SelectedRow.Cells[0].Text);
    }

    protected void PaymentDueGridViewRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#4F5A64'; this.style.color='white'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'");
        }

    }    
    
    protected void PaymentDueStatusGridViewRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#4F5A64'; this.style.color='white'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'");
        }
    }

    protected void PaymentDueHistoryGridViewRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#4F5A64'; this.style.color='white'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'");
        }
    }

}