using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _0225
{
    public partial class LogisticBox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('連線逾時，請重新登入');window.location='Login.aspx'</script>");
            }
            if (DropDownList2.SelectedValue == "物流箱各種類" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSource4";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "體積或材積" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSource5";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "選擇查詢目標")
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
            DetailsView3.DataSourceID = "SqlDataSource3";
            DetailsView3.DataBind();
            DetailsView3.Visible = true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "選擇查詢目標")
            {
                GridView1.DataSourceID = "SqlDataSource2";
            }
            else if (DropDownList2.SelectedValue == "物流箱各種類")
            {
                GridView1.DataSourceID = "SqlDataSource4";
            }
            else if (DropDownList2.SelectedValue == "體積或材積")
            {
                GridView1.DataSourceID = "SqlDataSource5";
            }
            string a = DropDownList1.SelectedValue.ToString();
            GridView1.PageSize = int.Parse(a);
        }

        protected void BntBack_Click(object sender, EventArgs e)
        {
            新增.Visible = true;
            bntBack.Visible = false;
            DetailsView2.Visible = false;
            DetailsView3.Visible = false;
            GridView1.Visible = true;
        }

        protected void 上傳資料_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            新增.Visible = false;
            bntBack.Visible = true;
            DetailsView2.Visible = true;
            DetailsView3.Visible = false;
        }
        protected void DetailsView3_ItemUpdated1(object sender, DetailsViewUpdatedEventArgs e)
        {
            DetailsView3.DataBind();
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('更新成功!');window.location='LogisticBox.aspx'</script>");
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
                if (DropDownList2.SelectedValue == "物流箱各種類")
                {
                    GridView1.DataSourceID = "SqlDataSource4";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSource4";
                }
                else if (DropDownList2.SelectedValue == "體積或材積")
                {
                    try
                    {
                        GridView1.DataSourceID = "SqlDataSource5";
                        GridView1.DataBind();
                        DetailsView3.DataSourceID = "SqlDataSource5";
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
            Search.Text = null;
            Search2.Text = null;
            Button1.Visible = true;
            GridView1.DataSourceID = "SqlDataSource2";
            GridView1.DataBind();
            Button2.Visible = false;
            DropDownList2.SelectedValue = "選擇查詢目標";
            isSearch = false;
            DetailsView3.Visible = false;
            GridView1.Visible = true;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "物流箱各種類")
            {
                Search.Visible = true;
                Search2.Visible = false;
            }
            else if (DropDownList2.SelectedValue == "體積或材積")
            {
                Search2.Visible = true;
                Search.Visible = false;
            }
            else
            {
                Search.Text = null;
                Search2.Text = null;
            }
        }
        protected void DetailsView3_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            DetailsView3.DataBind();
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('刪除成功!');window.location='Employee.aspx'</script>");
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('新增成功!');window.location='Employee.aspx'</script>");
        }
    }
}
