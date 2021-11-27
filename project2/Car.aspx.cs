using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _0225
{
    public partial class Car : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Login"] == null)
            //{
            //    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('連線逾時，請重新登入');window.location='Login.aspx'</script>");
            //}

            if (DropDownList2.SelectedValue == "車輛編號" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceNum";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "車輛體積" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceDimension";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "車輛溫度類別" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceTemperature";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "行駛區域" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceArea";
                GridView1.DataBind();
            }
            else if(DropDownList2.SelectedValue == "選擇查詢目標" && isSearch == false)
            {
                GridView1.DataSourceID = "SqlDataSource2";
                GridView1.DataBind();
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            TextBox4.Text = this.GridView1.SelectedRow.Cells[1].Text;
            DetailsView3.DataSourceID = "SqlDataSource3";
            DetailsView3.DataBind();
            DetailsView3.Visible = true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "車輛編號")
            {
                GridView1.DataSourceID = "SqlDataSourceNum";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "車輛體積")
            {
                GridView1.DataSourceID = "SqlDataSourceDimension";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "車輛溫度類別")
            {
                GridView1.DataSourceID = "SqlDataSourceTemperature";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "行駛區域")
            {
                GridView1.DataSourceID = "SqlDataSourceArea";
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
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('更新成功!');window.location='Car.aspx'</script>");
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
                if (DropDownList2.SelectedValue == "車輛編號")
                {
                    GridView1.DataSourceID = "SqlDataSourceNum";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceNum";
                }
                else if (DropDownList2.SelectedValue == "車輛體積")
                {
                    GridView1.DataSourceID = "SqlDataSourceDimension";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceDimension";
                }
                else if (DropDownList2.SelectedValue == "車輛溫度類別")
                {
                    GridView1.DataSourceID = "SqlDataSourceTemperature";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceTemperature";
                }
                else if (DropDownList2.SelectedValue == "行駛區域")
                {
                    GridView1.DataSourceID = "SqlDataSourceArea";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceArea";
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