using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Chap8_GridUpdate : System.Web.UI.Page
{
  MyPetShopEntities db = new MyPetShopEntities();
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      gvCategory.DataSource = db.Category.ToList();
      gvCategory.DataBind();
    }
  }
}