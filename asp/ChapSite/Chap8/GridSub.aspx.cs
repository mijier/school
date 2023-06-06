using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Chap8_GridSub : System.Web.UI.Page
{
  MyPetShopEntities db = new MyPetShopEntities();
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack && Request.QueryString["id"] != null)
    {
      int categoryId = int.Parse(Request.QueryString["id"]);
      var results = db.Product.Where(p => p.CategoryId == categoryId);
      gvProduct.DataSource = results.ToList();
      gvProduct.DataBind();
    }
  }
}