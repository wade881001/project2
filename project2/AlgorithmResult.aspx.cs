using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "myy")
            {
                int i = Convert.ToInt32(e.CommandArgument);
                String str = GridView1.Rows[i].Cells[1].Text;
                string[] str1 = str.Split('→');
                string connectionstring = "Data Source=59.124.220.17\\SQL2008,5857;Initial Catalog=test;uid=student;password=Aa123";
                using (SqlConnection MyConn1 = new SqlConnection(connectionstring))
                {
                    MyConn1.Open();
                    using (SqlCommand MyComm1 = new SqlCommand())
                    {
                        MyComm1.Connection = MyConn1;
                        MyComm1.CommandText = "TRUNCATE TABLE Map";
                        MyComm1.ExecuteNonQuery();
                    }
                    MyConn1.Close();
                    MyConn1.Dispose();
                }
                for (int num = 0; num < str1.Length; num++)
                {
                    using (SqlConnection MyConn = new SqlConnection(connectionstring))
                    {
                        MyConn.Open();



                        using (SqlCommand MyComm = new SqlCommand())
                        {

                            int num1 = num + 1;
                            MyComm.Connection = MyConn;
                            MyComm.Parameters.Add("@map_name", str1[num] == null ? "" : str1[num].ToString());
                            MyComm.Parameters.Add("@map_num", num1 == null ? "" : num1.ToString());
                            MyComm.CommandText = "INSERT INTO [Map] ([map_name],[map_num]) VALUES (@map_name,@map_num)";
                            MyComm.ExecuteNonQuery();
                            //......後續照正常方式處理

                            //String s = String.Join(",", str1);
                            //Response.Write(s);

                        }
                        MyConn.Close();
                        MyConn.Dispose();

                    }
                }

            }
            Response.Redirect("ShowMap.aspx");
        }
    }
}