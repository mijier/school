<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridDelete.aspx.cs" Inherits="Chap8_GridDelete" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>为GridView中“删除”链接按钮添加客户端提示信息</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryId"
        SelectMethod="GvCategory_GetData" DeleteMethod="GvCategory_DeleteItem" UpdateMethod="GvCategory_UpdateItem" OnRowDataBound="GvCategory_RowDataBound">
        <Columns>
          <asp:BoundField DataField="CategoryId" HeaderText="分类Id" InsertVisible="False" ReadOnly="True" />
          <asp:BoundField DataField="Name" HeaderText="分类名称" />
          <asp:BoundField DataField="Descn" HeaderText="分类描述" />
          <asp:CommandField ShowEditButton="True" />
          <asp:CommandField ShowDeleteButton="True" />
        </Columns>
      </asp:GridView>
    </div>
  </form>
</body>
</html>
