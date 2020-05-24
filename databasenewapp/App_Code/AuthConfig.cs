using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Membership.OpenAuth;

namespace MySite5
{
    public static class AuthConfig
    {
        public static void RegisterOpenAuth()
        {
            // Zobacz https://go.microsoft.com/fwlink/?LinkId=252803, aby uzyskać szczegółowe informacje o konfigurowaniu tego środowiska ASP.NET
            // w celu obsługi logowania za pośrednictwem usług zewnętrznych.

            //OpenAuth.AuthenticationClients.AddTwitter(
            //    consumerKey: "klucz klienta usługi Twitter",
            //    consumerSecret: "klucz tajny klienta usługi Twitter");

            //OpenAuth.AuthenticationClients.AddFacebook(
            //    appId: "identyfikator aplikacji usługi Facebook",
            //    appSecret: "klucz tajny aplikacji usługi Facebook");

            //OpenAuth.AuthenticationClients.AddMicrosoft(
            //    clientId: "identyfikator klienta konta Microsoft",
            //    clientSecret: "klucz tajny klienta konta Microsoft");

            //OpenAuth.AuthenticationClients.AddGoogle();
        }
    }
}