using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// AccountEvent 的摘要说明
/// </summary>
public class AccountEvent
{
    private string _ID;
    private string _Name;
    private decimal _Balance;
    public event EventHandler Overdraw;
    public string ID
    {
        get { return _ID; }
        set { _ID = value; }
    }
    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }
    public decimal Balance
    {
        get { return _Balance; }
        set { _Balance = value; }
    }


    public AccountEvent(string id, string name, decimal balance)
    {
        this._ID = id;//一样的，都是赋值
        _ID = id;
        _Name = name;
        _Balance = balance;

        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    //存款方法
    public void Deposit(decimal amount)
    {
        if (amount > 0)
        {
            _Balance += amount;

        }
        else
        {
            throw new Exception("存款金额不能小于或等于0！");
        }

        //取款方法     
    }
    public void Acquire(decimal amount)
    {
        if (amount < _Balance)
        {
            _Balance -= amount;
        }
        else
        {
            OnOverdraw(this, EventArgs.Empty);
            return;

        }
    }

    public void OnOverdraw(object sender, EventArgs e)
    {
        if (Overdraw != null)//如果此时Overdraw已存在
        {
            Overdraw(this, e);//作用当前对象
        }


    }
    public AccountEvent()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
}