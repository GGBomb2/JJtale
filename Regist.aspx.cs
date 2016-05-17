using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using myControl;

public partial class Regist : SubmitOncePage
{
    static string m_connStr = "server=104.238.160.31;user id=ggbomb;password=ggbomb;persistsecurityinfo=True;database=jjtale;";
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }
    protected void btn_RegistOnClicked(object sender,EventArgs e)
    {
        if(!this.IsRefreshed)
        {
            MySqlConnection conn = null;
            String username = Request["name2"].Trim();
            String passwd = Request["password2"].Trim();
            String email = Request["email2"].Trim();
            String userInformation = Request["userInformation"].Trim();
            try
            {
                conn = new MySqlConnection(m_connStr);
                conn.Open();
                DataSet ds = new DataSet();
                string strSQL = "select * from user where uname='" + username + "' or email='" + email + "';";
                MySqlDataAdapter sql = new MySqlDataAdapter(strSQL, conn);
                sql.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Response.Write("<script>alert('用户名或邮箱已注册')</script>");
                }
                else
                {
                    ds.Clear();
                    strSQL = "insert into user (uname,passw,email,gender,userInformation) values ('" + username + "','" + passwd + "','" + email + "','normal','"+userInformation+"');";
                    sql = new MySqlDataAdapter(strSQL, conn);
                    sql.Fill(ds);
                    conn.Close();
                    Response.Redirect("Login.aspx");
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
            //Response.Write("<script>alert('111')</script>");
        }
        else
        {
            Response.Redirect("Regist.aspx");
        }
        
    }
}