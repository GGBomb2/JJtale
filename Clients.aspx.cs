using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using myControl;

public partial class Clients : SubmitOncePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void gridview_userInformation_DataBound(object sender, EventArgs e)//当gridview_userInformation绑定数据库时触发
    {
        if(!(gridview_userInformation.Rows.Count>0))                            //判断库中有无数据，若无显示空模板，隐藏控件
        {
            
            text_search.Visible = false;
            btn_new.Visible = false;
            btn_search.Visible = false;
            btn_showAll.Visible = false;
        }
    }


    protected void btn_new_Click(object sender, EventArgs e)//点击新建记录
    {
        gridview_userInformation.DataSourceID = "";                                    //绑定空数据库，显示EmptyDataTemplate空模板，填写新信息
        gridview_userInformation.DataBind();
        text_search.Visible = false;                                                   //隐藏控件
        btn_new.Visible = false;
        btn_search.Visible = false;
        btn_showAll.Visible = false;
    }

    protected void btn_newRecord_Click(object sender, EventArgs e)//点击插入新数据
    {
        if (!this.IsRefreshed)                  //判断是否刷新窗口，防止重复提交表格
        {
            MySqlConnection conn = null;
            
            if (Request["gridview_userInformation$ctl01$name2"] ==null || Request["gridview_userInformation$ctl01$password2"] ==null)//验证用户是否填写了用户名与密码
            {
                Response.Write("<script>alert('请输入用户名和密码(用户名不能全为空格)!')</script>");
            }
            else
            {
                String username = Request["gridview_userInformation$ctl01$name2"].Trim();                       //获取请求中的用户名、密码、email、用户信息
                String passwd = Request["gridview_userInformation$ctl01$password2"].Trim();
                String email = Request["gridview_userInformation$ctl01$email2"].Trim();
                String userInformation = Request["gridview_userInformation$ctl01$userInformation"].Trim();
                try
                {
                    conn = new MySqlConnection(SqlDataSource1.ConnectionString);                                //创建后台数据库连接
                    conn.Open();                                                                                //打开数据库
                    DataSet ds = new DataSet();
                    string strSQL = "select * from user where uname='" + username + "';";
                    MySqlDataAdapter sql = new MySqlDataAdapter(strSQL, conn);
                    sql.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)                                                            //验证是否有重复的用户名或邮箱
                    {
                        Response.Write("<script>alert('用户名已存在')</script>");
                    }
                    else
                    {
                        ds.Clear();                                                                             // 清除DataSet
                        strSQL = "insert into user (uname,passw,email,gender,userInformation) values ('" + username + "','" + passwd + "','" + email + "','normal','" + userInformation + "');";
                        sql = new MySqlDataAdapter(strSQL, conn);
                        sql.Fill(ds);                                                                           //执行插入语句，插入新纪录
                        conn.Close();                                                                           //关闭数据库
                        gridview_userInformation.DataSourceID = "SqlDataSource1";                               //gridview_userInformation重新绑定数据库
                        btn_new.Visible = true;                                                                 //显示控件
                        btn_search.Visible = true;
                        text_search.Visible = true;
                        btn_showAll.Visible = true;
                    }
                }
                catch (MySqlException err)
                {
                    Response.Write("<script>alert('" + err.Message.ToString() + "')</script>");
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
            }
            
            //Response.Write("<script>alert('111')</script>");
        }
        else
        {
            Response.Redirect("Clients.aspx");                      //刷新窗口
        }
    }
    protected void btn_cancel_Click(object sender, EventArgs e)//点击取消键时触发
    {
        try
        {
            gridview_userInformation.DataSourceID = "SqlDataSource1";           //重新绑定数据库，并显示控件
            btn_new.Visible = true;
            btn_search.Visible = true;
            text_search.Visible = true;
            btn_showAll.Visible = true;
        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + err.Message.ToString() + "')</script>");
            Response.Redirect("Clients.aspx");
        }
    }
    protected void btn_search_Click(object sender, EventArgs e)//点击查询记录时触发
    {
        try
        {
            gridview_userInformation.DataSourceID = "";                                 //Sql查询字符串套接字，在各字段查询关键字
            SqlDataSource1.SelectCommand = "SELECT * FROM user where id='";
            SqlDataSource1.SelectCommand += text_search.Text + "'or uname ='";
            SqlDataSource1.SelectCommand += text_search.Text + "'or passw='";
            SqlDataSource1.SelectCommand += text_search.Text + "'or email='";
            SqlDataSource1.SelectCommand += text_search.Text + "'or userInformation='";
            SqlDataSource1.SelectCommand += text_search.Text + "';";
            gridview_userInformation.DataSourceID = "SqlDataSource1";
            gridview_userInformation.DataBind();                            //再次绑定获取gridview_userInformation.Rows.Count
            if (!(gridview_userInformation.Rows.Count > 0))
            {
                Response.Write("<script>alert('表中没有所查询的数据,请插入新数据.')</script>");
            }
        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + err.Message.ToString() + "')</script>");
            Response.Redirect("Clients.aspx");
        }


    }


    protected void btn_showAll_Click(object sender, EventArgs e)//显示全部记录
    {
        gridview_userInformation.DataSourceID = "";                                     //解除数据库绑定
        SqlDataSource1.SelectCommand = "SELECT * FROM user;";                           //查询所有记录
        gridview_userInformation.DataSourceID = "SqlDataSource1";                       //重新绑定数据库
    }
}