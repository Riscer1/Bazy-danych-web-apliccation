<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="addwypo.aspx.cs" Inherits="editEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        IdWypozyczenia:<asp:TextBox ID="m_id" runat="server" Text="Label"></asp:TextBox><br />
        Placówka:<asp:DropDownList ID="m_plac" runat="server" Width="150px"></asp:DropDownList><br />
        Data od:<asp:TextBox ID="m_date" runat="server"></asp:TextBox><br />
        Data do:<asp:TextBox ID="m_date2" runat="server"></asp:TextBox><br />
        Klient:<asp:DropDownList ID="m_klienci" runat="server" Width="150px"></asp:DropDownList><br />
        Film:<asp:DropDownList ID="m_film" runat="server" Width="150px"></asp:DropDownList><br />
        <asp:Button ID="m_update" runat="server" Text="Aktualizuj" OnClick="m_update_Click" />
        <asp:Button ID="m_cancel" runat="server" Text="Anuluj" OnClick="m_cancel_Click" />
    </div>
</asp:Content>

