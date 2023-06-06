<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox1.aspx.cs" Inherits="TextBox1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="name" runat="server" Text="用户名："></asp:Label>
            <asp:TextBox ID="txtBox" runat="server" AutoPostBack="True" OnTextChanged="txtLabel_TextChanged"></asp:TextBox>
            <asp:Label ID="lblValidate" runat="server" ></asp:Label>
            <br />
            <asp:Label ID="password" runat="server" Text="密码："></asp:Label>
            <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password"></asp:TextBox>
            <br />/
            <asp:Label ID="email" runat="server" Text="邮箱："></asp:Label>
            <asp:TextBox ID="txtMail" runat="server" TextMode="Email"></asp:TextBox>
            <br />
            <asp:Button ID="btnMessage" runat="server" Text="提交" />
        </div>
    </form>
</body>
</html>
