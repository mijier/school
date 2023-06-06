<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageMap1.aspx.cs" Inherits="ImageMap1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ImageMap ID="ImageMap1" runat="server" ImageUrl="~/Images/map.jpg">
                 <asp:RectangleHotSpot Bottom="26" Right="76" NavigateUrl="http://jw.dhu.edu.cn" />
            </asp:ImageMap>
        </div>
    </form>
</body>
</html>
