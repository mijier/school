using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
public partial class Chap8_GridDelete : System.Web.UI.Page
{
  //定义数据库上下文
  MyPetShopEntities db = new MyPetShopEntities();
  public List<Category> GvCategory_GetData()
  {
    return db.Category.ToList();
  }

  public void GvCategory_DeleteItem(int CategoryId)
  {
    //获取指定CategoryId值对应的category对象，再删除该对象并同步到数据库
    Category category = db.Category.Find(CategoryId);
    if (category != null)
    {
      db.Category.Remove(category);
      db.SaveChanges();
    }
  }

  public void GvCategory_UpdateItem(int CategoryId)
  {
    //获取指定CategoryId值对应的category对象，再更新该对象属性值并同步到数据库
    Category category = db.Category.Find(CategoryId);
    if (category != null)
    {
      //用Gridview控件中的数据更新category对象相应的属性值
      TryUpdateModel(category);
      if (ModelState.IsValid)
      {
        db.SaveChanges();
      }
    }
  }

  protected void GvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
  {
    if (e.Row.RowType == DataControlRowType.DataRow)  //判断数据行
    {
      try
      {
        //获取“删除”链接
        LinkButton lnkbtnDelete = (LinkButton)e.Row.Cells[4].Controls[0];
        //添加JavaScript代码实现客户端信息的提示
        lnkbtnDelete.OnClientClick = "return confirm('您真要删除分类名为" + e.Row.Cells[1].Text + "的记录吗?');";
      }
      catch
      {
        //若try块有异常，则不做任何操作
      }
    }
  }
}