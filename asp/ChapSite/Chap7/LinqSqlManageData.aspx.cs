using System;
using System.Linq;
public partial class Chap7_LinqSqlManageData : System.Web.UI.Page
{
  MyPetShopEntities db = new MyPetShopEntities();

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      BindData();
    }
  }

  protected void BtnInsert_Click(object sender, EventArgs e)
  {
    Category category = new Category();  //建立Category类实例category
    category.Name = txtName.Text;
    category.Descn = txtDescn.Text;
    db.Category.Add(category);  //db是MyPetShopEntities类实例，添加category对象
    db.SaveChanges();  //保存到数据库    
    BindData();  //调用自定义方法，在gvCategory中显示最新结果
  }

  protected void BtnUpdate_Click(object sender, EventArgs e)
  {
    //根据输入的CategoryId获取category对象
    Category category = db.Category.Find(int.Parse(txtId.Text));
    if (category != null)
    {
      //修改内容
      category.Name = txtName.Text;
      category.Descn = txtDescn.Text;
      db.SaveChanges();  //保存到数据库
    }
    BindData();  //调用自定义方法，在gvCategory中显示最新结果
  }

  private void BindData()
  {
    gvCategory.DataSource = db.Category.ToList();
    gvCategory.DataBind();
  }

  protected void BtnDelete_Click(object sender, EventArgs e)
  {
    //根据输入的CategoryId获取category对象
    Category category = db.Category.Find(int.Parse(txtId.Text));
    if (category != null)
    {

      db.Category.Remove(category);  //删除获取的category对象
      db.SaveChanges();  //保存到数据库
    }
    BindData();  //调用自定义方法，在gvCategory中显示最新结果
  }

  protected void BtnProcedure_Click(object sender, EventArgs e)
  {
    db.CategoryInsert(txtName.Text, txtDescn.Text);
    BindData();  //调用自定义方法，在gvCategory中显示最新结果
  }
}