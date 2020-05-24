<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="addEmployee.aspx.cs" Inherits="editEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <asp:TextBox ID="m_id" runat="server" Text="Label"></asp:TextBox><br />
        <asp:TextBox ID="m_first" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="m_name" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="m_address" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="m_email" runat="server"></asp:TextBox><br />
        <asp:Button ID="m_update" runat="server" Text="Aktualizuj" OnClick="m_update_Click" />
        <asp:Button ID="m_cancel" runat="server" Text="Anuluj" OnClick="m_cancel_Click" />
    </div>
</asp:Content>

