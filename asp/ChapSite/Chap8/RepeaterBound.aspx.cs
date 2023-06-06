using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Chap8_RepeaterBound : System.Web.UI.Page
{
  MyPetShopEntities db = new MyPetShopEntities();
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      rptProduct.DataSource = db.Product.ToList();
      rptProduct.DataBind();
    }
  }
}