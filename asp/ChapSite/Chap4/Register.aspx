<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <asp:Label ID="Label1" runat="server" Text="用户注册"></asp:Label>
    <form id="form1" runat="server">
    <div>       
        <br />
        <br />
    </div>
        用户名：<asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
        <br />
        <br />
 密码： <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <br />
 性别：<br />
        <asp:RadioButtonList ID="RadioButtonListSex" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="male">男</asp:ListItem>
            <asp:ListItem Value="female">女</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        职业：<br />
        <asp:RadioButtonList ID="RadioButtonListWork" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="publicServat">公务员</asp:ListItem>
            <asp:ListItem Value="doctor">医务工作者</asp:ListItem>
            <asp:ListItem Value="teacher">教师</asp:ListItem>
            <asp:ListItem Value="business">个体户</asp:ListItem>
            <asp:ListItem Value="business">学生</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        所属省份：<asp:DropDownList ID="DropDownListProvince" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListProvince_SelectedIndexChanged" style="height: 19px">
            <asp:ListItem Value="guangdong">广东省</asp:ListItem>
            <asp:ListItem Value="jiangsu">江苏省</asp:ListItem>
            <asp:ListItem Value="heilongjiang">黑龙江省</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        所在城市：<asp:ListBox ID="ListBoxCity" runat="server" Height="43px" style="margin-top: 4px" Width="102px"></asp:ListBox>
        <br />
        <br />
        爱好：<asp:CheckBoxList ID="CheckBoxListHobby" runat="server" RepeatColumns="2">
            <asp:ListItem>球类运动</asp:ListItem>
            <asp:ListItem>田径运动</asp:ListItem>
            <asp:ListItem>读书看报</asp:ListItem>
            <asp:ListItem>聊天交友</asp:ListItem>
        </asp:CheckBoxList>
        <br />
       
        <asp:Button ID="ButtonOk" runat="server" OnClick="ButtonOk_Click" Text="确定" />
        <br />
    </form>


</body>
</html>
