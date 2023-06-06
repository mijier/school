using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TextBox1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtBox.Focus();
    }

    protected void txtLabel_TextChanged(object sender, EventArgs e)
    {
        if (txtBox.Text == "leaf")
        {
            lblValidate.Text = "用户名已被占用";
        }
        else
        {
            lblValidate.Text = "√";
        }
    }
}