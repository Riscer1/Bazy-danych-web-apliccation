<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="mypage - filmy.aspx.cs" Inherits="mypage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:TextBox ID="m_search" runat="server"></asp:TextBox>
    <asp:Button ID="m_refresh" runat="server" Text="Odśwież" OnClick="m_refresh_Click" />

      <asp:Repeater ID="m_rptEmployees" runat="server">
    	<HeaderTemplate>
					<table cellpadding="4" cellspacing="0" border="0"  width="70%">
						<tr style="background-color:#CCFFCC">
							<th align="left">LP</th>

							<th align="left">Nazwa Filmu</th>
							
							<th align="left">Gatuenk</th>

						</tr>
				</HeaderTemplate>
				<ItemTemplate>
					<tr valign="top">
						<td ><a href="editFilmy.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idFilm")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "idFilm")%>"> <%# DataBinder.Eval(Container.DataItem, "idFilm")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Nazwa")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Gatunek")%></td>
					
					</tr>
				</ItemTemplate>
				<AlternatingItemTemplate>
                    <tr valign="top"  style="background-color:#CCFFCC"> 
						<td ><a href="editFilmy.aspx?id=<%# DataBinder.Eval(Container.DataItem, "idFilm")%>" 
                        title="Edit <%# DataBinder.Eval(Container.DataItem, "idFilm")%>"> <%# DataBinder.Eval(Container.DataItem, "idFilm")%></a></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Nazwa")%></td>
                        <td ><%# DataBinder.Eval(Container.DataItem, "Gatunek")%></td>
					
					</tr>
				</AlternatingItemTemplate>
				<FooterTemplate>
					</table>
				</FooterTemplate>
    </asp:Repeater>

</asp:Content>

