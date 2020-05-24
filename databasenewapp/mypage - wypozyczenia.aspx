<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="mypage - wypozyczenia.aspx.cs" Inherits="mypage" %>

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
							<th align="left">Id</th>
							
							<th align="left">Nazwisko Klienta</th>

                            <th align="left">nazwa filmu</th>

                            <th align="left">Data rezerwacji od </th>

                            <th align="left">Data rezerwacji do</th>

                            <th align="left">Id placówki</th>

						</tr>
				</HeaderTemplate>
				<ItemTemplate>
					<tr valign="top">
						<td ><a href="editwypozyczenia2.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idWypozyczenie")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "idWypozyczenie")%>"> <%# DataBinder.Eval(Container.DataItem, "idWypozyczenie")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Nazwisko")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Nazwa")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "termidOd")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "terminDo")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Adres")%></td>
					
					</tr>
				</ItemTemplate>
				<AlternatingItemTemplate>
                    <tr valign="top"  style="background-color:#CCFFCC"> 
						<td ><a href="editwypozyczenia2.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idWypozyczenie")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "idWypozyczenie")%>"> <%# DataBinder.Eval(Container.DataItem, "idWypozyczenie")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Nazwisko")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Nazwa")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "termidOd")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "terminDo")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Adres")%></td>
					
					</tr>
				</AlternatingItemTemplate>
				<FooterTemplate>
					</table>
				</FooterTemplate>
    </asp:Repeater>

</asp:Content>

