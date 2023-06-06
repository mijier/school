using System;
using System.Linq;
public partial class Chap8_UpdateTable : System.Web.UI.Page
{
  MyPetShopEntities db = new MyPetShopEntities();
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack && Request.QueryString["id"] != null)
    {
      int categoryId = int.Parse(Request.QueryString["id"]);
      //获取要修改的记录对象
      Category category = db.Category.Find(categoryId);
      //分类编号是标识，不能更改
      txtCategoryId.ReadOnly = true;
      txtCategoryId.Text = category.CategoryId.ToString();
      txtName.Text = category.Name;
      txtDescn.Text = category.Descn;
    }
  }

  protected void BtnUpdate_Click(object sender, EventArgs e)
  {
    Category category = db.Category.Find(int.Parse(txtCategoryId.Text));
    category.Name = txtName.Text;
    category.Descn = txtDescn.Text;
    db.SaveChanges();
    //返回主界面
    Response.Redirect("~/Chap8/GridUpdate.aspx");
  }
}