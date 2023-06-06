using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Enum1 : System.Web.UI.Page
{
    enum Color//声明e
    {
        Red = 1, Green, Blue
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Color enumColor = Color.Green;
        Color enumColor1 = Color.Blue;
        int i = (int)Color.Green;
        int j = (int)Color.Blue;
        Response.Write(enumColor+"<br/>");
        Response.Write(enumColor1+"<br/>");
        Response.Write("i的值为：" + i+"<br/>");
        Response.Write("j的值为：" + j);
    }
}
