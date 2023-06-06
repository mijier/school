<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageMap.aspx.cs" Inherits="Chap4_ImageMap" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用ImageMap控件设计导航条</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:ImageMap ID="imapNav" runat="server" ImageUrl="~/Images/map.jpg">
        <asp:RectangleHotSpot Bottom="26" Right="76" NavigateUrl="https://www.jsahvc.edu.cn/" />
        <asp:RectangleHotSpot Bottom="26" Left="78" Right="141" NavigateUrl="https://www.jsahvc.edu.cn/170/list.htm" />
        <asp:RectangleHotSpot Bottom="26" Left="143" Right="214" NavigateUrl="https://www.jsahvc.edu.cn/nx/2018/0109/c1136a30898/page.htm" />
        <asp:RectangleHotSpot Bottom="26" Left="216" Right="287" />
      </asp:ImageMap>
    </div>
  </form>
</body>
</html>
