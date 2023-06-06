<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    lblMessage.Text = "不管您输入什么，我都喜欢ASP.NET!";
  }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>熟悉单文件页模型</title>
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
