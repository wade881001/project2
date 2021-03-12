using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _0225
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (Session["Login"] == null)
            {
             Response.Redirect("Login.aspx");
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string a = DropDownList1.SelectedValue.ToString();
            GridView1.PageSize = int.Parse(a);
        }

        protected void BntBack_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource1";
            新增.Visible = true;
            bntBack.Visible = false;
        }

        protected void 上傳資料_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = null;
            新增.Visible = false;
            bntBack.Visible = true;
        }
    }
}