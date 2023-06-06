﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormBootstrap.aspx.cs" Inherits="Chap2_FormBootstrap" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>利用Bootstrap设计表单</title>
    <link href="Scripts/bootstrap.min.css" rel="stylesheet" />
  <link href="Scripts/bootstrap.min.css" rel="stylesheet" />
  <script src="../Scripts/jquery-3.6.3.min.js"></script>
   <script src="../Scripts/bootstrap.min.js"></script>
</head>
<body>
  <div class="row">
    <div class="offset-2 col-md-8">
      <form id="form1" runat="server">
        <div class="mb-3 mt-3">
          <label for="inputEmail">邮箱：</label>
          <input type="email" class="form-control" id="inputEmail" placeholder="请输入邮箱地址" />
        </div>
        <div class="mb-3">
          <label for="inputPassword">密码：</label>
          <input type="text" class="form-control" id="inputPassword" placeholder="请输入密码" />
        </div>
        <div class="mb-3">
          <input type="checkbox" id="inputCheckBox" />
          <label for="inputCheckBox">记住我 </ label>
        </div>
        <asp:Button ID="btnSubmit" CssClass="btn  btn-light" runat="server" Text="提交" />
      </form>
    </div>
  </div>
</body>
</html>
