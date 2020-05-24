<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="editFilmy.aspx.cs" Inherits="editEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <asp:Label ID="m_id" runat="server" Text="Label"></asp:Label><br />
       <%-- <asp:TextBox ID="m_typ" runat="server"></asp:TextBox><br />--%>
        <asp:DropDownList ID="m_typ" runat="server" Width="150px"></asp:DropDownList><br />

        <%--<asp:TextBox ID="m_status" runat="server"></asp:TextBox><br />--%>
        <asp:textbox ID="m_status" runat="server" Width="150px"></asp:textbox><br />

        <asp:Button ID="m_update" runat="server" Text="Aktualizuj" OnClick="m_update_Click" />
        <asp:Button ID="m_cancel" runat="server" Text="Anuluj" OnClick="m_cancel_Click" />
    </div>
</asp:Content>

