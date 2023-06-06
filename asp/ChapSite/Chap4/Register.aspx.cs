using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownListProvince_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (DropDownListProvince.SelectedItem.Text)
        {
            case "广东省":
                ListBoxCity.Items.Clear();
                ListBoxCity.Items.Add("广州市");
                ListBoxCity.Items.Add("深圳市");
                break;
            case "江苏省":
                ListBoxCity.Items.Clear();
                ListBoxCity.Items.Add("泰州市");
                ListBoxCity.Items.Add("常州市");
                ListBoxCity.Items.Add("南京市");
                break;
            case "黑龙江省":
                ListBoxCity.Items.Clear();
                ListBoxCity.Items.Add("哈尔滨市");
                ListBoxCity.Items.Add("齐齐哈尔市");
                break;


        }
    }


    protected void ButtonOk_Click(object sender, EventArgs e)
    {
        string name, password, sex = " ", work, location = "", hobby = "";
        if (TextBoxName.Text == "")
        {
            Response.Write("<script>window.alert('用户名不能为空！');</script>");
        }
        else
        {
            name = TextBoxName.Text;
            password = TextBoxPassword.Text;
            if (RadioButtonListSex.Items[0].Selected)
            {
                sex = "男";
            }
            else if (RadioButtonListSex.Items[1].Selected)
            {
                sex = "女";
            }
            work = RadioButtonListWork.SelectedItem.Text;
            if (ListBoxCity.SelectedItem != null)
            {
                location = DropDownListProvince.SelectedItem.Text + "," + ListBoxCity.SelectedItem.Text;
            }
            for (int i = 0; i < CheckBoxListHobby.Items.Count; i++)
            {
                if (CheckBoxListHobby.Items[i].Selected)
                    hobby += CheckBoxListHobby.Items[i].Text + ",";
            }
            hobby = hobby.TrimEnd(',');
            Response.Redirect(string.Format("SimpleResult.aspx?name={0}&sex={1}&work={2}&location={3}&hobby={4}", name, sex, work, location, hobby));
        }
    }


}