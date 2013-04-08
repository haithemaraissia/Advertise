<%@ Application Language="C#" %>
<%@ Import Namespace="Roboblob.Utility" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // add some data to the Session so permanent SessionId is assigned
        // otherwise new SessionId is assigned to the user until some data
        // is actually written to Session
        Session["Start"] = DateTime.Now;

        // get current context
        HttpContext currentContext = HttpContext.Current;

        if (currentContext != null)
        {
            if (!OnlineVisitorsUtility.Visitors.ContainsKey(currentContext.Session.SessionID))
                OnlineVisitorsUtility.Visitors.Add(currentContext.Session.SessionID, new WebsiteVisitor(currentContext));
        }

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

        if (this.Session != null)
            OnlineVisitorsUtility.Visitors.Remove(this.Session.SessionID);
    }
       
</script>
