using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SimpleResult : System.Web.UI.Page
{
    public string name;
    public string sex;
    public string work;
    public string location;
    public string hobby;

    protected void Page_Load(object sender, EventArgs e)
    {
        name = Request.QueryString["name"];
        sex = Request.QueryString["sex"];
        work = Request.QueryString["work"];
        location = Request.QueryString["location"];
        hobby = Request.QueryString["hobby"];


    }
}