using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2
{
    public partial class HistoricalOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('連線逾時，請重新登入');window.location='Login.aspx'</script>");
            }
            if (DropDownList2.SelectedValue == "訂單編號" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceOrdernum";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "物流箱各種類" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceBoxtype";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "訂貨店家" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceOrderstore";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "訂貨數量" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceNum";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "選擇查詢目標" && isSearch == false)
            {
                GridView1.DataSourceID = "SqlDataSource2";
                GridView1.DataBind();
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "訂單編號")
            {
                GridView1.DataSourceID = "SqlDataSourceOrdernum";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "物流箱各種類")
            {
                GridView1.DataSourceID = "SqlDataSourceBoxtype";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "訂貨店家")
            {
                GridView1.DataSourceID = "SqlDataSourceOrderstore";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "訂貨數量")
            {
                GridView1.DataSourceID = "SqlDataSourceNum";
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSourceID = "SqlDataSource2";
            }
            string a = DropDownList1.SelectedValue.ToString();
            GridView1.PageSize = int.Parse(a);
        }
        Boolean isSearch = false;
        protected void Search_Click(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "選擇查詢目標")
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('請選擇查詢目標後再查詢!');</script>");
            }
            else
            {
                if (DropDownList2.SelectedValue == "訂單日期")
                {
                    GridView1.DataSourceID = "SqlDataSourceDate";
                    GridView1.DataBind();
                }
                else if (DropDownList2.SelectedValue == "訂單編號")
                {
                    GridView1.DataSourceID = "SqlDataSourceOrdernum";
                    GridView1.DataBind();
                }
                else if (DropDownList2.SelectedValue == "物流箱各種類")
                {
                    GridView1.DataSourceID = "SqlDataSourceBoxtype";
                    GridView1.DataBind();
                }
                else if (DropDownList2.SelectedValue == "訂貨店家")
                {
                    GridView1.DataSourceID = "SqlDataSourceOrderstore";
                    GridView1.DataBind();
                }
                else if (DropDownList2.SelectedValue == "訂貨數量")
                {
                    try
                    {
                        GridView1.DataSourceID = "SqlDataSourceNum";
                        GridView1.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('查詢類別錯誤!');</script>");
                    }
                }
                Button1.Visible = false;
                Button2.Visible = true;
                isSearch = true;
            }
        }
        protected void Reset_Click(object sender, EventArgs e)
        {
            Button1.Visible = true;
            GridView1.DataSourceID = "SqlDataSource2";
            Button2.Visible = false;
            Search.Text = null;
            DropDownList2.SelectedValue = "選擇查詢目標";
            isSearch = false;
        }
        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Maintain.aspx");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime strdate = Calendar1.SelectedDates[0];
            DateTime strdate2 = Calendar1.SelectedDates[Calendar1.SelectedDates.Count - 1];


            switch (Calendar1.SelectedDates.Count.ToString())
            {
                case "1":

                    TextBox1.Text = strdate.ToString("yyyy/MM/dd");
                    Label1.Text = " ";
                    TextBox2.Visible = false;
                    break;
                case "7":
                    TextBox1.Text = strdate.ToString("yyyy/MM/dd");
                    Label1.Text = "到";
                    TextBox2.Visible = true;
                    TextBox2.Text = strdate2.ToString("yyyy/MM/dd");
                    break;
                default:
                    TextBox1.Text = strdate.ToString("yyyy/MM/dd");
                    Label1.Text = "到";
                    TextBox2.Visible = true;
                    TextBox2.Text = strdate2.ToString("yyyy/MM/dd");

                    break;

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            GridView1.PageSize = 10000;
            Label1.Text = "";
            DateTime strdate = Calendar1.SelectedDates[0];
            String strdate1 = strdate.ToString("yyyy/MM/dd");
            String year1 = strdate1.Substring(0, 4);
            String month1 = strdate1.Substring(5, 2);
            String day1 = strdate1.Substring(8, 2);

            DataTable dt1 = null;
            DataRow dr = null;
            dt1 = new DataTable();
            dt1.Columns.Add(new DataColumn("日期"));
            dt1.Columns.Add(new DataColumn("訂單編號"));
            dt1.Columns.Add(new DataColumn("物流箱種類"));
            dt1.Columns.Add(new DataColumn("物流箱第二種類"));
            dt1.Columns.Add(new DataColumn("訂單數量"));
            dt1.Columns.Add(new DataColumn("訂單店家"));

            SqlConnection conn = new SqlConnection("Data Source=59.124.220.17\\SQL2008,5857;Initial Catalog=test;User ID=student;Password=Aa123");

            conn.Open();

            switch (Calendar1.SelectedDates.Count.ToString())
            {
                case "1":



                    String query = "select *  from dbo.[Order] where datepart(yy,Date) =" + year1 + "AND datepart(mm,Date)=" + month1 + "AND datepart(dd,Date)=" + day1 + " order by Order_num";
                    SqlDataSourceDate.SelectCommand = query;
                    GridView1.DataSourceID = "SqlDataSourceDate";
                    GridView1.DataBind();
                    conn.Close();
                    break;
                case "7":
                    DateTime strdate7 = Calendar1.SelectedDates[6];
                    String strdate8 = strdate7.ToString("yyyy/MM/dd");
                    String query3 = "select *  from dbo.[Order] where Date between '" + strdate1 + "' AND '" + strdate8 + "' Order by Date";
                    SqlDataSourceDate.SelectCommand = query3;
                    GridView1.DataSourceID = "SqlDataSourceDate";
                    GridView1.DataBind();
                    conn.Close();
                    break;
                default:
                    String query2 = "select *  from dbo.[Order] where datepart(yy,Date) =" + year1 + "AND datepart(mm,Date)=" + month1 + "order by Order_num";
                    SqlDataSourceDate.SelectCommand = query2;
                    GridView1.DataSourceID = "SqlDataSourceDate";
                    GridView1.DataBind();
                    conn.Close();
                    break;
            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "訂單日期")
            {
                Calendar1.Visible = true;
                Label1.Visible = true;
                TextBox1.Visible = true;
                TextBox2.Visible = true;
                Button3.Visible = true;
                Button1.Visible = false;
                Search.Visible = false;
                text1.Visible = false;
                text2.Visible = false;
                DropDownList1.Visible = false;
            }
            else
            {
                GridView1.PageSize = 5;
                GridView1.DataSourceID = "SqlDataSource2";
                Calendar1.Visible = false;
                Label1.Visible = false;
                TextBox1.Visible = false;
                TextBox2.Visible = false;
                Button3.Visible = false;
                Button1.Visible = true;
                Search.Visible = true;
                text1.Visible = true;
                text2.Visible = true;
                DropDownList1.Visible = true;
            }
        }
    }
}