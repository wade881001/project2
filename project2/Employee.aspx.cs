using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace _0225
{
    public partial class Employee : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["Login"] == null)
            //{
             //  Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('連線逾時，請重新登入');window.location='Login.aspx'</script>");
            //}


            if (DropDownList2.SelectedValue == "人員" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceMemid";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "帳號" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceAccount";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "姓名" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceName";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "身分證字號" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceIdnum";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "性別" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceGender";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "年齡" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceAge";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "職位" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourcePosition";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "權限" && isSearch == true)
            {
                GridView1.DataSourceID = "SqlDataSourceAuthority";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "選擇查詢類別" && isSearch == false)
            {
                GridView1.DataSourceID = "SqlDataSource2";
                GridView1.DataBind();
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            TextBox4.Text = this.GridView1.SelectedRow.Cells[1].Text;
            DetailsView3.DataSourceID= "SqlDataSource3";
            DetailsView3.DataBind();
            DetailsView3.Visible = true;
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "人員")
            {
                GridView1.DataSourceID = "SqlDataSourceMemid";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "帳號")
            {
                GridView1.DataSourceID = "SqlDataSourceAccount";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "姓名")
            {
                GridView1.DataSourceID = "SqlDataSourceName";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "身分證字號")
            {
                GridView1.DataSourceID = "SqlDataSourceIdnum";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "性別")
            {
                GridView1.DataSourceID = "SqlDataSourceGender";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "年齡")
            {
                GridView1.DataSourceID = "SqlDataSourceAge";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "職位")
            {
                GridView1.DataSourceID = "SqlDataSourcePosition";
                GridView1.DataBind();
            }
            else if (DropDownList2.SelectedValue == "權限")
            {
                GridView1.DataSourceID = "SqlDataSourceAuthority";
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
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('更新成功!');window.location='Employee.aspx'</script>");
        }
        Boolean isSearch = false;
        protected void Search_Click(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "選擇查詢類別")
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('請選擇查詢目標後再查詢!');</script>");
            }
            else
            {
                if (DropDownList2.SelectedValue == "人員")
                {
                    GridView1.DataSourceID = "SqlDataSourceMemid";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceMemid";
                }
                else if (DropDownList2.SelectedValue == "帳號")
                {
                    GridView1.DataSourceID = "SqlDataSourceAccount";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceAccount";
                }
                else if (DropDownList2.SelectedValue == "姓名")
                {
                    GridView1.DataSourceID = "SqlDataSourceName";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceName";
                }
                else if (DropDownList2.SelectedValue == "身分證字號")
                {
                    GridView1.DataSourceID = "SqlDataSourceIdnum";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceIdnum";
                }
                else if (DropDownList2.SelectedValue == "性別")
                {
                    GridView1.DataSourceID = "SqlDataSourceGender";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceGender";
                }
                else if (DropDownList2.SelectedValue == "年齡")
                {
                    GridView1.DataSourceID = "SqlDataSourceAge";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceAge";
                }
                else if (DropDownList2.SelectedValue == "職位")
                {
                    GridView1.DataSourceID = "SqlDataSourcePosition";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourcePosition";
                }
                else if (DropDownList2.SelectedValue == "權限")
                {
                    GridView1.DataSourceID = "SqlDataSourceAuthority";
                    GridView1.DataBind();
                    DetailsView3.DataSourceID = "SqlDataSourceAuthority";
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
            DropDownList2.SelectedValue = "選擇查詢類別";
            //DetailsView3.DataSourceID = "SqlDataSource2";
            //DetailsView3.DataBind();
            DetailsView3.Visible = false;
            isSearch = false;
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