using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SidejobModel;


public partial class SideJobResultQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var context = new SidejobEntities())
        {
            try
            {
                var CustomerContractID = 1;
                var customerID = 165;

                var customerContract = (from c in context.CustomerContracts
                                        where c.ContractID == CustomerContractID
                                        select c).FirstOrDefault();

                var projectrequirement = (from pr in context.ProjectRequirements
                                          where pr.ProjectID == customerContract.ProjectID
                                          select pr).FirstOrDefault();



                //LCID


                // Description have to be invoked by google translate

                //Only 5 photos max might be
                var s = from ph in context.ProjectPhotoes
                        where ph.ProjectID == customerContract.ProjectID
                        select ph;

                //var projectphoto = ( from ph in context.projects)
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}