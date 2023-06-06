using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class LinqSqlQuery : System.Web.UI.Page
{
  protected void BtnProject_Click(object sender, EventArgs e)
  {
    //定义数据库上下文
    MyPetShopEntities db = new MyPetShopEntities();

    //LINQ的查询语法
    //var results = from r in db.Product
    //              select new
    //              {
    //                r.ProductId,
    //                r.CategoryId,
    //                r.Name
    //              };

    //LINQ的方法语法
    var results = db.Product.Select(p => new
    {
      p.ProductId,
      p.CategoryId,
      p.Name
    });

    //绑定数据对象集合到GridView
    gvProduct.DataSource = results.ToList();
    gvProduct.DataBind();
  }

  protected void BtnSelect_Click(object sender, EventArgs e)
  {
    //定义数据库上下文
    MyPetShopEntities db = new MyPetShopEntities();

    //LINQ的查询语法
    //var results = from r in db.Product
    //              where r.UnitCost > 20
    //              select r;

    //LINQ的方法语法
    var results = db.Product.Where(p => p.UnitCost > 20);

    //绑定数据对象集合到GridView
    gvProduct.DataSource = results.ToList();
    gvProduct.DataBind();
  }

  protected void BtnOrder_Click(object sender, EventArgs e)
  {
    //定义数据库上下文
    MyPetShopEntities db = new MyPetShopEntities();

    //LINQ的查询语法
    //var results = from r in db.Product
    //              orderby r.UnitCost descending
    //              select r;

    //LINQ的方法语法
    var results = db.Product.OrderByDescending(p => p.UnitCost);

    //绑定数据对象集合到GridView
    gvProduct.DataSource = results.ToList();
    gvProduct.DataBind();
  }

  protected void BtnGroup_Click(object sender, EventArgs e)
  {
    //定义数据库上下文
    MyPetShopEntities db = new MyPetShopEntities();

    //LINQ的查询语法
    //var results = from r in db.Product
    //              group r by r.CategoryId;

    //LINQ的方法语法
    //根据CategoryId分组，再将结果存入results
    var results = db.Product.GroupBy(p => p.CategoryId);
    foreach (var g in results)  //results为外集合，g为外集合中的一个元素并且g也是一个集合
    {
      if (g.Key == 5)  //获取键值等于5的外集合元素
      {
        var results2 = from r in g  //r为键值等于5的组中的一个元素
                       select r;
        gvProduct.DataSource = results2.ToList();
        gvProduct.DataBind();
      }
    }
  }

  protected void BtnPolymerize_Click(object sender, EventArgs e)
  {
    //定义数据库上下文
    MyPetShopEntities db = new MyPetShopEntities();

    //LINQ的查询语法
    //var results = from r in db.Product
    //              group r by r.CategoryId into g
    //              select new
    //              {
    //                Key = g.Key,
    //                Count = g.Count(),
    //                MaxPrice = g.Max(p => p.ListPrice),
    //                MinPrice = g.Min(p => p.ListPrice),
    //                AvgPrice = g.Average(p => p.ListPrice)
    //              };

    //LINQ的方法语法
    var results = db.Product.GroupBy(p => p.CategoryId).
                    Select(g => new
                    {
                      Key = g.Key,
                      Count = g.Count(),
                      MaxPrice = g.Max(p => p.ListPrice),
                      MinPrice = g.Min(p => p.ListPrice),
                      AvgPrice = g.Average(p => p.ListPrice)
                    });

    //绑定数据对象集合到GridView
    gvProduct.DataSource = results.ToList();
    gvProduct.DataBind();
  }

  protected void BtnQuote_Click(object sender, EventArgs e)
  {
    //定义数据库上下文
    MyPetShopEntities db = new MyPetShopEntities();

    //LINQ的查询语法
    //var results = from r in db.Product
    //              select new
    //              {
    //                r.ProductId,
    //                r.CategoryId,
    //                CategoryName = r.Category.Name  //直接引用Category对象
    //              };

    //LINQ的方法语法
    var results = db.Product.Select(p => new
    {
      p.ProductId,
      p.CategoryId,
      CategoryName = p.Category.Name
    });

    //绑定数据对象集合到GridView
    gvProduct.DataSource = results.ToList();
    gvProduct.DataBind();
  }

  protected void BtnJoin_Click(object sender, EventArgs e)
  {
    //定义数据库上下文
    MyPetShopEntities db = new MyPetShopEntities();

    //LINQ的查询语法
    var results = from product in db.Product
                  join category in db.Category on product.CategoryId equals category.CategoryId
                  select new
                  {
                    product.ProductId,
                    product.CategoryId,
                    CategoryName = category.Name
                  };

    //绑定数据对象集合到GridView
    gvProduct.DataSource = results.ToList();
    gvProduct.DataBind();
  }

  protected void BtnFuzzy_Click(object sender, EventArgs e)
  {
    //定义数据库上下文
    MyPetShopEntities db = new MyPetShopEntities();

    //LINQ的查询语法
    //var results = from p in db.Product
    //              where p.Name.Contains("fly")
    //              select p;

    //LINQ的方法语法
    var results = db.Product.Where(p => p.Name.Contains("fly"));

    //绑定数据对象集合到GridView
    gvProduct.DataSource = results.ToList();
    gvProduct.DataBind();
  }
}