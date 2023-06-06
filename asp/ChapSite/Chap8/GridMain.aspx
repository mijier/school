<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridMain.aspx.cs" Inherits="Chap8_GridMain" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>在不同页显示主从表</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      主表
  <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False">
    <Columns>
      <asp:BoundField DataField="CategoryId" HeaderText="类别编号" />
      <asp:HyperLinkField DataNavigateUrlFields="CategoryId" DataNavigateUrlFormatString="~/Chap8/GridSub.aspx?id={0}" DataTextField="Name" HeaderText="类别名称" />
      <asp:BoundField DataField="Descn" HeaderText="类别描述" />
    </Columns>
  </asp:GridView>
    </div>
  </form>
</body>
</html>
