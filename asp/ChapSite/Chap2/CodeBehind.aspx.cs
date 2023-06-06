using System;
public partial class Chap2_CodeBehind : System.Web.UI.Page
{
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    lblMessage.Text = "不管您输入什么，我都喜欢ASP.NET!";
  }
}