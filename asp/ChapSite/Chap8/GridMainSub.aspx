<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridMainSub.aspx.cs" Inherits="Chap8_GridMainSub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>在同一页显示主从表</title>
</head>
<body>
<form id="form1" runat="server">
  <div>
    主表<br />
    <asp:GridView ID="gvCategory" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="ldsCategory" PageSize="3">
      <Columns>
        <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" SortExpression="CategoryId" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Descn" HeaderText="Descn" SortExpression="Descn" />
        <asp:CommandField ShowSelectButton="True" />
      </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="ldsCategory" runat="server" ContextTypeName="MyPetShopEntities" OrderBy="CategoryId" TableName="Category"></asp:LinqDataSource>
    从表<br />
    <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" DataSourceID="ldsProduct" DataKeyNames="ProductId">
      <Columns>
        <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" />
        <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" SortExpression="CategoryId" />
        <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
        <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" SortExpression="UnitCost" />
        <asp:BoundField DataField="SuppId" HeaderText="SuppId" SortExpression="SuppId" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Descn" HeaderText="Descn" SortExpression="Descn" />
        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
        <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
      </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="ldsProduct" runat="server" ContextTypeName="MyPetShopEntities" TableName="Product" Where="CategoryId == @CategoryId">
      <WhereParameters>
        <asp:ControlParameter ControlID="gvCategory" DefaultValue="1" Name="CategoryId" PropertyName="SelectedValue" Type="Int32" />
      </WhereParameters>
    </asp:LinqDataSource>
  </div>
</form>
</body>
</html>
