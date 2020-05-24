<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="editwypozyczenia2.aspx.cs" Inherits="editEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <asp:Label ID="m_id" runat="server" Text="Label"></asp:Label><br />



        Nazwisko klienta:<asp:DropDownList ID="m_klienci" runat="server" Width="150px"></asp:DropDownList><br />
        Nazwa Film:<asp:DropDownList ID="m_film" runat="server" Width="150px"></asp:DropDownList><br />
        Miejsce wypożyczenia:<asp:DropDownList ID="m_plac" runat="server" Width="150px"></asp:DropDownList><br />
        Data od:<asp:TextBox ID="m_data" runat="server" Text="Label"></asp:TextBox><br />
        <asp:Calendar ID="m_dataC" runat="server" OnSelectionChanged="m_dataC_SelectionChanged"></asp:Calendar>
        Data do:<asp:TextBox ID="m_data2" runat="server" Text="Label"></asp:TextBox><br />
        <asp:Calendar ID="m_dataD" runat="server" OnSelectionChanged="m_dataD_SelectionChanged"></asp:Calendar>

        <asp:Button ID="m_update" runat="server" Text="Aktualizuj" OnClick="m_update_Click" />
        <asp:Button ID="m_cancel" runat="server" Text="Anuluj" OnClick="m_cancel_Click" />
    </div>
</asp:Content>

