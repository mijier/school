<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridTemplate.aspx.cs" Inherits="Chap8_GridTemplate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用GridView模板列</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ldsProduct" PageSize="5">
        <Columns>
          <asp:TemplateField>
            <HeaderTemplate>
              <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" Text="全选" OnCheckedChanged="ChkAll_CheckedChanged" />
            </HeaderTemplate>
            <ItemTemplate>
              <asp:CheckBox ID="chkItem" runat="server" />
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="ProductId" HeaderText="商品编号" SortExpression="ProductId" />
          <asp:BoundField DataField="ListPrice" HeaderText="商品单价" SortExpression="ListPrice" />
          <asp:BoundField DataField="Name" HeaderText="商品名称" SortExpression="Name" />
          <asp:BoundField DataField="Qty" HeaderText="商品库存" SortExpression="Qty" />
        </Columns>
      </asp:GridView>
      <asp:LinqDataSource ID="ldsProduct" runat="server" ContextTypeName="MyPetShopEntities" TableName="Product" OrderBy="ProductId">
      </asp:LinqDataSource>
      <asp:Button ID="btnSubmit" runat="server" Text="确定" OnClick="BtnSubmit_Click" />
      <asp:Label ID="lblProductId" runat="server" Text=""></asp:Label>
    </div>
  </form>
</body>
</html>
