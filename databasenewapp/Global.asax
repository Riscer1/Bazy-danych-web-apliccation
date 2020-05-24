<%@ Application Language="C#" %>
<%@ Import Namespace="MySite5" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Kod uruchamiany podczas uruchamiania aplikacji
        AuthConfig.RegisterOpenAuth();
        RouteConfig.RegisterRoutes(RouteTable.Routes);
    }
    
    void Application_End(object sender, EventArgs e)
    {
        //  Kod uruchamiany podczas zamykania aplikacji

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Kod uruchamiany po wystąpieniu nieobsługiwanego błędu

    }

</script>
