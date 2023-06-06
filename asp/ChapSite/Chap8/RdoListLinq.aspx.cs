using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Chap8_RdoListLinq : System.Web.UI.Page
{
  MyPetShopEntities db = new MyPetShopEntities();
  protected void Page_Load(object sender, EventArgs e)
  {
    //页面首次载入时查询Category表并将查询结果绑定到rdoltCategory
    if (!IsPostBack)
    {
      rdoltCategory.DataSource = db.Category.ToList();
      rdoltCategory.DataBind();
    }
  }

  protected void RdoltCategory_SelectedIndexChanged(object sender, EventArgs e)
  {
    //查询Product表中CategoryId字段值与选中单选按钮对应的Category表中CategoryId字段值相同的记录
    var results = db.Product.Where(p => p.CategoryId.ToString() == rdoltCategory.SelectedValue);
    lstProduct.DataSource = results.ToList();
    lstProduct.DataBind();
  }
}