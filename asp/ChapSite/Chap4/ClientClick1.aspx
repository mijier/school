<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClientClick1.aspx.cs" Inherits="ClientClick1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="删除" OnClick="Button1_Click" OnClientClick="return confirm('确定要删除记录吗？')" />
        </div>
    </form>
</body>
</html>
