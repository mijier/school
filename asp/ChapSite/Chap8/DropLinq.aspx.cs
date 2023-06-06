using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Chap8_DropLinq : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //第一次加载时绑定数据
    if (!IsPostBack)
    {
      MyPetShopEntities db = new MyPetShopEntities();
      ddlCategory.DataSource = db.Category.ToList();
      ddlCategory.DataBind();
    }
  }

  protected void DdlCategory_SelectedIndexChanged(object sender, EventArgs e)
  {
    lblMsg.Text = "您选择的CategoryId为：" + ddlCategory.SelectedValue;
  }
}