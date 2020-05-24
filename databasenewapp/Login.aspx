<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family: Arial">
        <table style="border: 1px solid black">
            <tr>
                <td colspan="2">
                    <b>Login</b>
                </td>
            </tr>
            <tr>
                <td>
                    User Name
                </td>
                <td>
                    :<asp:TextBox ID="txtUserName" runat="server">
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    :<asp:TextBox ID="txtPassword" TextMode="Password" runat="server">
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkBoxRememberMe" Text="Remember Me" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" 
                        onclick="btnLogin_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor ="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <a href="Account/Register.aspx">Click here to register</a> if you do not have
        a user name and password.
    </div>
    </form>
</body>
</html>
