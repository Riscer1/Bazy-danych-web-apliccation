using System;
using System.Web;
using System.Web.Security;
using DotNetOpenAuth.AspNet;
using Microsoft.AspNet.Membership.OpenAuth;

public partial class Account_RegisterExternalLogin : System.Web.UI.Page
{
    protected string ProviderName
    {
        get { return (string)ViewState["ProviderName"] ?? String.Empty; }
        private set { ViewState["ProviderName"] = value; }
    }

    protected string ProviderDisplayName
    {
        get { return (string)ViewState["ProviderDisplayName"] ?? String.Empty; }
        private set { ViewState["ProviderDisplayName"] = value; }
    }

    protected string ProviderUserId
    {
        get { return (string)ViewState["ProviderUserId"] ?? String.Empty; }
        private set { ViewState["ProviderUserId"] = value; }
    }

    protected string ProviderUserName
    {
        get { return (string)ViewState["ProviderUserName"] ?? String.Empty; }
        private set { ViewState["ProviderUserName"] = value; }
    }

    protected void Page_Load()
    {
        if (!IsPostBack)
        {
            ProcessProviderResult();
        }
    }

    protected void logIn_Click(object sender, EventArgs e)
    {
        CreateAndLoginUser();
    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        RedirectToReturnUrl();
    }

    private void ProcessProviderResult()
    {
        // Przetwórz wynik od dostawcy uwierzytelniania w żądaniu
        ProviderName = OpenAuth.GetProviderNameFromCurrentRequest();

        if (String.IsNullOrEmpty(ProviderName))
        {
            Response.Redirect(FormsAuthentication.LoginUrl);
        }

        ProviderDisplayName = OpenAuth.GetProviderDisplayName(ProviderName);

        // Utwórz adres URL przekierowania na potrzeby weryfikacji OpenAuth
        var redirectUrl = "~/Account/RegisterExternalLogin";
        var returnUrl = Request.QueryString["ReturnUrl"];
        if (!String.IsNullOrEmpty(returnUrl))
        {
            redirectUrl += "?ReturnUrl=" + HttpUtility.UrlEncode(returnUrl);
        }

        // Zweryfikuj ładunek OpenAuth
        var authResult = OpenAuth.VerifyAuthentication(redirectUrl);
        if (!authResult.IsSuccessful)
        {
            Title = "Logowanie zewnętrzne nie powiodło się";
            userNameForm.Visible = false;
            
            providerMessage.Text = String.Format("Logowanie zewnętrzne {0} nie powiodło się,", ProviderDisplayName);
            
            // Aby wyświetlić ten błąd, włącz śledzenie stron w pliku web.config (<system.web><trace enabled="true"/></system.web>) i przejdź do pliku ~/Trace.axd
            Trace.Warn("OpenAuth", String.Format("Wystąpił błąd podczas weryfikowania uwierzytelniania za pomocą {0})", ProviderDisplayName), authResult.Error);
            return;
        }

        // Użytkownik pomyślnie zalogował się za pomocą dostawcy
        // Sprawdź, czy użytkownik jest już zarejestrowany lokalnie
        if (OpenAuth.Login(authResult.Provider, authResult.ProviderUserId, createPersistentCookie: false))
        {
            RedirectToReturnUrl();
        }

        // Przechowuj szczegóły dostawcy we właściwości ViewState
        ProviderName = authResult.Provider;
        ProviderUserId = authResult.ProviderUserId;
        ProviderUserName = authResult.UserName;

        // Usuń akcję z ciągu zapytania
        Form.Action = ResolveUrl(redirectUrl);

        if (User.Identity.IsAuthenticated)
        {
            // Użytkownik jest już uwierzytelniony, dodaj logowanie zewnętrzne i przekieruj do zwrotnego adresu URL
            OpenAuth.AddAccountToExistingUser(ProviderName, ProviderUserId, ProviderUserName, User.Identity.Name);
            RedirectToReturnUrl();
        }
        else
        {
            // Użytkownik jest nowy, zapytaj, jaką chce mieć nazwę członkowską
            userName.Text = authResult.UserName;
        }
    }

    private void CreateAndLoginUser()
    {
        if (!IsValid)
        {
            return;
        }

        var createResult = OpenAuth.CreateUser(ProviderName, ProviderUserId, ProviderUserName, userName.Text);
        if (!createResult.IsSuccessful)
        {
            
                userNameMessage.Text = createResult.ErrorMessage;
                
        }
        else
        {
            // Pomyślnie utworzono i skojarzono użytkownika
            if (OpenAuth.Login(ProviderName, ProviderUserId, createPersistentCookie: false))
            {
                RedirectToReturnUrl();
            }
        }
    }

    private void RedirectToReturnUrl()
    {
        var returnUrl = Request.QueryString["ReturnUrl"];
        if (!String.IsNullOrEmpty(returnUrl) && OpenAuth.IsLocalUrl(returnUrl))
        {
            Response.Redirect(returnUrl);
        }
        else
        {
            Response.Redirect("~/");
        }
    }
}