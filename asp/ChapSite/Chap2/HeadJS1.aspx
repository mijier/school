<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HeadJS1.aspx.cs" Inherits="HeadJS1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>在&lt;head&gt;元素中的JavaScript代码</title>
    <script>
        function message() {
            alert('在\<head\>元素中');

        }
    </script>
</head>
<body onload="message()">
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
