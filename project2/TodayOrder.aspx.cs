using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2
{
    public partial class TodayOrder : System.Web.UI.Page
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
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            TextBox4.Text = this.GridView1.SelectedRow.Cells[1].Text;
            TextBox5.Text = this.GridView1.SelectedRow.Cells[2].Text;
            TextBox6.Text = this.GridView1.SelectedRow.Cells[3].Text;
            DetailsView3.DataSourceID = "SqlDataSource3";
            DetailsView3.DataBind();
            DetailsView3.Visible = true;
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
        protected void DetailsView3_ItemUpdated1(object sender, DetailsViewUpdatedEventArgs e)
        {
            DetailsView3.DataBind();
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('更新成功!');window.location='TodayOrder.aspx'</script>");
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
                if (DropDownList2.SelectedValue == "訂單編號")
                {
                    GridView1.DataSourceID = "SqlDataSourceOrdernum";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceOrdernum";
                }
                else if (DropDownList2.SelectedValue == "物流箱各種類")
                {
                    GridView1.DataSourceID = "SqlDataSourceBoxtype";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceBoxtype";
                }
                else if (DropDownList2.SelectedValue == "訂貨店家")
                {
                    GridView1.DataSourceID = "SqlDataSourceOrderstore";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceOrderstore";
                }
                else if (DropDownList2.SelectedValue == "訂貨數量")
                {
                    try
                    {
                        GridView1.DataSourceID = "SqlDataSourceNum";
                        GridView1.DataBind();
                        DetailsView3.DataSourceID = "SqlDataSourceNum";
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
            DetailsView3.Visible = false;
            GridView1.Visible = true;
        }
        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Maintain.aspx");
        }
        protected void DetailsView3_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            DetailsView3.DataBind();
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('刪除成功!');window.location='Employee.aspx'</script>");
        }
    }
}