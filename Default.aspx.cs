using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    static string m_connStr = "server=104.238.160.31;user id=ggbomb;password=ggbomb;persistsecurityinfo=True;database=jjtale;";
    protected void Page_Load(object sender, EventArgs e)
    {
        MySqlConnection conn = null;
        try
        {
            conn = new MySqlConnection(m_connStr);
            conn.Open();
            DataSet ds = new DataSet();
            string strSQL = "select * from tales Order By t_id DESC LIMIT 1;";
            MySqlDataAdapter sql = new MySqlDataAdapter(strSQL, conn);
            sql.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                StreamReader streamReader = null;
                try
                {
                    Last_Tale.InnerText = ds.Tables[0].Rows[0].ItemArray[0].ToString();//t_name
                    //Last_Text.InnerHtml = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                    Last_Image.Src= ds.Tables[0].Rows[0].ItemArray[2].ToString();
                    string filePath = Server.MapPath(ds.Tables[0].Rows[0].ItemArray[1].ToString());
                    streamReader = new StreamReader(filePath, Encoding.UTF8);
                    StringBuilder buffer = new StringBuilder();
                    string rl;
                    while ((rl = streamReader.ReadLine()) != null)
                    {
                        buffer.Append(rl+"<br/>");
                    }
                    Last_Text.InnerHtml = buffer.ToString();
                    streamReader.Close();
                }

                catch (Exception ee)
                {
                    Response.Write("系统提示：" + ee.Message + "<br />");  //输出捕获的错误信息
                    Response.Write("用户自定义：" + "读取文件错误！");  //输出用户自定义的错误信息
                }
                finally
                {
                    if(streamReader!=null)
                    streamReader.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('用户名或密码错误!')</script>");
                //Response.Redirect("Login.aspx");
            }
        }
        catch (MySqlException err)
        {
            Response.Write("<script>alert(\"" + err.Message.ToString() + "\")</script>");
            if (conn != null)
            {
                conn.Close();
            }
        }
    }

}