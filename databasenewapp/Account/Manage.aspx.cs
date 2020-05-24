using System;
using System.Collections.Generic;
using System.Linq;

using System.Web.UI.WebControls;

using Microsoft.AspNet.Membership.OpenAuth;

public partial class Account_Manage : System.Web.UI.Page
{
    protected string SuccessMessage
    {
        get;
        private set;
    }

    protected bool CanRemoveExternalLogins
    {
        get;
        private set;
    }

    protected void Page_Load()
    {
        if (!IsPostBack)
        {
            // Wybierz sekcje do renderowania
            var hasLocalPassword = OpenAuth.HasLocalPassword(User.Identity.Name);
            setPassword.Visible = !hasLocalPassword;
            changePassword.Visible = hasLocalPassword;

            CanRemoveExternalLogins = hasLocalPassword;

            // Komunikat o powodzeniu renderowania
            var message = Request.QueryString["m"];
            if (message != null)
            {
                // Usuń akcję z ciągu zapytania
                Form.Action = ResolveUrl("~/Account/Manage");

                SuccessMessage =
                    message == "ChangePwdSuccess" ? "Hasło zostało zmienione."
                    : message == "SetPwdSuccess" ? "Hasło zostało ustawione."
                    : message == "RemoveLoginSuccess" ? "Logowanie zewnętrzne zostało usunięte."
                    : String.Empty;
                successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            }
        }
        

        // Powiąż dane listy kont zewnętrznych
        var accounts = OpenAuth.GetAccountsForUser(User.Identity.Name);
        CanRemoveExternalLogins = CanRemoveExternalLogins || accounts.Count() > 1;
        externalLoginsList.DataSource = accounts;
        externalLoginsList.DataBind();
        
    }

    protected void setPassword_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            var result = OpenAuth.AddLocalPassword(User.Identity.Name, password.Text);
            if (result.IsSuccessful)
            {
                Response.Redirect("~/Account/Manage?m=SetPwdSuccess");
            }
            else
            {
                
                newPasswordMessage.Text = result.ErrorMessage;
                
            }
        }
    }

    
    protected void externalLoginsList_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        var providerName = (string)e.Keys["ProviderName"];
        var providerUserId = (string)e.Keys["ProviderUserId"];
        var m = OpenAuth.DeleteAccount(User.Identity.Name, providerName, providerUserId)
            ? "?m=RemoveLoginSuccess"
            : String.Empty;
        Response.Redirect("~/Account/Manage" + m);
    }

    protected T Item<T>() where T : class
    {
        return GetDataItem() as T ?? default(T);
    }
    

    protected static string ConvertToDisplayDateTime(DateTime? utcDateTime)
    {
        // Możesz zmienić tę metodę, aby przekonwertować datę i godzinę UTC na żądane
        // przesunięcie i format wyświetlania. W tym przypadku data i godzina jest konwertowana na czas w strefie czasowej serwera oraz
        // formatowana jako krótki ciąg daty i długi ciąg godziny przy użyciu bieżącej kultury wątku.
        return utcDateTime.HasValue ? utcDateTime.Value.ToLocalTime().ToString("G") : "[nigdy]";
    }
}