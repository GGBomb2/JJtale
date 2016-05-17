using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using myControl;


public partial class Default2 : SubmitOncePage
{
    static string m_connStr = "server=104.238.160.31;user id=ggbomb;password=ggbomb;persistsecurityinfo=True;database=jjtale;";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_LoginOnClicked(object sender,EventArgs e)
    {
        if (!this.IsRefreshed)
        {
            MySqlConnection conn = null;
            String username = Request["name2"].Trim();
            String passwd = Request["password2"].Trim();
            try
            {
                conn = new MySqlConnection(m_connStr);
                conn.Open();
                DataSet ds = new DataSet();
                string strSQL = "select * from user where uname='" + username + "' and passw='" + passwd + "';";
                MySqlDataAdapter sql = new MySqlDataAdapter(strSQL, conn);
                sql.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("Clients.aspx");
                }
                else
                {
                    Response.Write("<script>alert('用户名或密码错误!')</script>");
                    //Response.Redirect("Login.aspx");
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