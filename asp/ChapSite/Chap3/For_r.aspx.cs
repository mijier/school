using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class For_r : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //定义总行数:5
        var line = 5;
        // 外层循环,定义函数,是 1-总函数
        for (var i = 1; i <= line; i++)
        {
            // 内层循环：实现空格
            for (var j = 1; j <= line - i; j++)
            {
                Response.Write("&nbsp;");
            }
            // 内层循环：实现星星，星星数 = 当前行数
            for (var k = 1; k <= i; k++)
            {
                Response.Write("* ");
            }
            // 一行内容结束的换行
            Response.Write("<br>");
        }

    }
}