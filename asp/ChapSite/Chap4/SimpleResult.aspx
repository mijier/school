<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SimpleResult.aspx.cs" Inherits="SimpleResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    您注册的信息是：<br />
        姓    名：<%=name %><br />
        性    别：<%=sex %><br /> 
        职    业：<%=work %><br />
        所在城市：<%=location %><br />
        爱    好：<%=hobby %><br />
        请牢记你的密码！
    </div>
    </form>
</body>
</html>
