using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2
{
    public partial class Maintain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Login"] == null)
            //{
            //    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('連線逾時，請重新登入');window.location='Login.aspx'</script>");
            //}
        }

        protected void Today_Click(object sender, EventArgs e)
        {
            Response.Redirect("TodayOrder.aspx");
        }
        protected void History_Click(object sender, EventArgs e)
        {
            Response.Redirect("HistoricalOrder.aspx");
        }
    }
}