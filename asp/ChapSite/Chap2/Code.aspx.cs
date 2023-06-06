using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code : System.Web.UI.Page
{
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "不管您输入什么，我都喜欢ASP.NET!";
    }
}