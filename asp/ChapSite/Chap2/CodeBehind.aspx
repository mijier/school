<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CodeBehind.aspx.cs" Inherits="Chap2_CodeBehind" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>熟悉代码隐藏页模型</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:TextBox ID="txtInput" runat="server">请输入内容</asp:TextBox>
      <asp:Label ID="lblMessage" runat="server"></asp:Label><br />
      <asp:Button ID="btnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="确定" />
    </div>
  </form>
</body>
</html>
