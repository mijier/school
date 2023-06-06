<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IsPostBack1.aspx.cs" Inherits="IsPostBack1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="提交" OnClick="BtnSubmit_Click" />
        </div>
    </form>
</body>
</html>
