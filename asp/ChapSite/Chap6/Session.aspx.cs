﻿using System;
public partial class Chap6_Session : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (Session["UserName"] != null)
    {
      lblMsg.Text = Session["UserName"] + "，欢迎您！";
    }
    else
    {
      Response.Redirect("SessionLogin.aspx");
    }
  }
}