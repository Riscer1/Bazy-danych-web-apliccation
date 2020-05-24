<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="mypage.aspx.cs" Inherits="mypage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:TextBox ID="m_search" runat="server"></asp:TextBox>
    <asp:Button ID="m_refresh" runat="server" Text="Odśwież" OnClick="m_refresh_Click" />
    <asp:Button ID="add" runat="server" Text="Dodaj" OnClick="m_add_Click" />

      <asp:Repeater ID="m_rptEmployees" runat="server">
    	<HeaderTemplate>
					<table cellpadding="4" cellspacing="0" border="0"  width="70%">
						<tr style="background-color:#CCFFCC">
							<th align="left">Imie</th>
							
							<th align="left">Nazwisko</th>

                            <th align="left">Adres</th>

                            <th align="left">Kontakt</th>

						</tr>
				</HeaderTemplate>
				<ItemTemplate>
					<tr valign="top">
						<td ><%# DataBinder.Eval(Container.DataItem, "Imie")%></td>
						<td ><a href="editEmployee.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idKlienci")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "Nazwisko")%>"> <%# DataBinder.Eval(Container.DataItem, "Nazwisko")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Adres")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Kontakt")%></td>
					</tr>
				</ItemTemplate>
				<AlternatingItemTemplate>
                    <tr valign="top">
						<td ><%# DataBinder.Eval(Container.DataItem, "Imie")%></td>
						<td ><a href="editEmployee.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idKlienci")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "Nazwisko")%>"> <%# DataBinder.Eval(Container.DataItem, "Nazwisko")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Adres")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Kontakt")%></td>
					</tr>
				</AlternatingItemTemplate>
				<FooterTemplate>
					</table>
				</FooterTemplate>
    </asp:Repeater>

</asp:Content>

