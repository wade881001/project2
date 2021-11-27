using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _0225
{
    public partial class Store : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('連線逾時，請重新登入');window.location='Login.aspx'</script>");
            }
            if (DropDownList2.SelectedValue == "公司名稱" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceCompname";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "店名" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceStorename";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "店號" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceStorenum";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "地址" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceAddress";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "夜配" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceType";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "可使用11T" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceEleventonsable";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "車輛高度限制" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceCarheightlimit";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "到貨時間限制" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceTransporttimelimit";
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
            TextBox4.Text = this.GridView1.SelectedRow.Cells[3].Text;
            DetailsView3.DataSourceID = "SqlDataSource3";
            DetailsView3.DataBind();
            DetailsView3.Visible = true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "公司名稱")
            {
                GridView1.DataSourceID = "SqlDataSourceCompname";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "店名")
            {
                GridView1.DataSourceID = "SqlDataSourceStorename";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "店號")
            {
                GridView1.DataSourceID = "SqlDataSourceStorenum";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "地址")
            {
                GridView1.DataSourceID = "SqlDataSourceAddress";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "夜配")
            {
                GridView1.DataSourceID = "SqlDataSourceType";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "可使用11T")
            {
                GridView1.DataSourceID = "SqlDataSourceEleventonsable";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "車輛高度限制")
            {
                GridView1.DataSourceID = "SqlDataSourceCarheightlimit";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "到貨時間限制")
            {
                GridView1.DataSourceID = "SqlDataSourceTransporttimelimit";
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSourceID = "SqlDataSource2";
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
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('更新成功!');window.location='Store.aspx'</script>");
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
                if (DropDownList2.SelectedValue == "公司名稱")
                {
                    GridView1.DataSourceID = "SqlDataSourceCompname";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceCompname";
                }
                else if (DropDownList2.SelectedValue == "店名")
                {
                    GridView1.DataSourceID = "SqlDataSourceStorename";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceStorename";
                }
                else if (DropDownList2.SelectedValue == "店號")
                {
                    GridView1.DataSourceID = "SqlDataSourceStorenum";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceStorenum";
                }
                else if (DropDownList2.SelectedValue == "地址")
                {
                    GridView1.DataSourceID = "SqlDataSourceAddress";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceAddress";
                }
                else if (DropDownList2.SelectedValue == "夜配")
                {
                    GridView1.DataSourceID = "SqlDataSourceType";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceType";
                }
                else if (DropDownList2.SelectedValue == "可使用11T")
                {
                    GridView1.DataSourceID = "SqlDataSourceEleventonsable";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceEleventonsable";
                }
                else if (DropDownList2.SelectedValue == "車輛高度限制")
                {
                    GridView1.DataSourceID = "SqlDataSourceCarheightlimit";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceCarheightlimit";
                }
                else if (DropDownList2.SelectedValue == "到貨時間限制")
                {
                    GridView1.DataSourceID = "SqlDataSourceTransporttimelimit";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceTransporttimelimit";
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