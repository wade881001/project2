using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _0225
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] != null)
            {
                Label2.Text = Session["Name"].ToString();
                Label3.Text = Session["Position"].ToString();
                if (Session["Authority"].ToString() != "M")
                {
                    isM.Visible = false;
               }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Login"] = null;
            Session["Name"] = null;
            Session["Authority"] = null;
            Response.Redirect("Login.aspx");
        }

    }
}    