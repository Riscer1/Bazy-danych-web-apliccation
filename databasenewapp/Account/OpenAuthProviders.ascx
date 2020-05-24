<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OpenAuthProviders.ascx.cs" Inherits="Account_OpenAuthProviders" %>
<%@ Import Namespace="Microsoft.AspNet.Membership.OpenAuth" %>
<fieldset class="open-auth-providers">
    <legend>Zaloguj się za pomocą innej usługi</legend>
    
    <asp:ListView runat="server" ID="providersList" ViewStateMode="Disabled">
        <ItemTemplate>
            <button type="submit" name="provider" value="<%# HttpUtility.HtmlAttributeEncode(Item<ProviderDetails>().ProviderName) %>"
                title="Zaloguj się za pomocą swojego <%# HttpUtility.HtmlAttributeEncode(Item<ProviderDetails>().ProviderDisplayName) %> konta.">
                <%# HttpUtility.HtmlEncode(Item<ProviderDetails>().ProviderDisplayName) %>
            </button>
        </ItemTemplate>
    
        <EmptyDataTemplate>
            <div class="message-info">
                <p>Nie skonfigurowano żadnych zewnętrznych usług uwierzytelniania. Zapoznaj się z <a href="https://go.microsoft.com/fwlink/?LinkId=252803">tym artykułem</a>, aby uzyskać szczegółowe informacje dotyczące konfigurowania tej aplikacji platformy ASP.NET w celu obsługi logowania za pośrednictwem usług zewnętrznych.</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</fieldset>