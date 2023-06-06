<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RepeaterBound.aspx.cs" Inherits="Chap8_RepeaterBound" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用Repeater控件展示数据列表</title>
  <style>
    .item { width: 150px; height: 250px; border: 1px solid black; float: left; margin: 1px; padding: 5px; }
      .item img { width: 100px; height: 100px; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:Repeater ID="rptProduct" runat="server">
        <ItemTemplate>
          <div class="item">
            <h3><%# Eval("Name") %> </h3>
            <p><%# Eval("Descn") %></p>
            <p><%# Eval("UnitCost") %> 元</p>
            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("Image") %>' />
          </div>
        </ItemTemplate>
      </asp:Repeater>
    </div>
  </form>
</body>
</html>
