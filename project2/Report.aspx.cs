using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                // Define the name and type of the client scripts on the page.
                String csname1 = "Script1";
                String csname2 = "Script2";
                Type cstype = this.GetType();

                // Get a ClientScriptManager reference from the Page class.
                ClientScriptManager cs = Page.ClientScript;

                // Check to see if the startup script is already registered.
                // 呼叫 IsStartupScriptRegistered 方法，判斷特定索引鍵和型別組的啟始指令碼是否已註冊，避免不必要的指令碼加入嘗試。
                String query = "";
                switch (DropDownList2.SelectedValue)
                {

                    case "年報":
                        query = "SELECT [Box_type] ,sum(Num) as num FROM [Order]  where datepart(yy,Date)=" + DropDownList4.SelectedValue + "  Group by Box_type order by num desc ";

                        break;
                    case "季報":
                        switch (DropDownList3.SelectedValue)
                        {

                            case "Q1":
                                query = "SELECT [Box_type] ,sum(Num) as num FROM [Order]  where datepart(yy,Date)=" + DropDownList4.SelectedValue + " AND (datepart(mm,Date)=" + 01 + " OR datepart(mm,Date)=" + 02 + " OR datepart(mm,Date)=" + 03 + ") Group by Box_type order by num desc ";
                                break;
                            case "Q2":
                                query = "SELECT [Box_type] ,sum(Num) as num FROM [Order]  where datepart(yy,Date)=" + DropDownList4.SelectedValue + " AND (datepart(mm,Date)=" + 04 + " OR datepart(mm,Date)=" + 05 + " OR datepart(mm,Date)=" + 06 + ") Group by Box_type order by num desc ";
                                break;
                            case "Q3":
                                query = "SELECT [Box_type] ,sum(Num) as num FROM [Order]  where datepart(yy,Date)=" + DropDownList4.SelectedValue + " AND (datepart(mm,Date)=" + 07 + " OR datepart(mm,Date)=" + 08 + " OR datepart(mm,Date)=" + 09 + ") Group by Box_type order by num desc ";
                                break;
                            case "Q4":
                                query = "SELECT [Box_type] ,sum(Num) as num FROM [Order]  where datepart(yy,Date)=" + DropDownList4.SelectedValue + " AND (datepart(mm,Date)=" + 10 + " OR datepart(mm,Date)=" + 11 + " OR datepart(mm,Date)=" + 12 + ") Group by Box_type order by num desc ";
                                break;
                            default:

                                break;
                        }
                        break;
                    case "月報":
                        query = "SELECT [Box_type] ,sum(Num) as num FROM [Order]  where datepart(mm,Date)=" + DropDownList5.SelectedValue + " Group by Box_type order by num desc ";


                        break;

                    default:

                        break;



                }

                if (!cs.IsStartupScriptRegistered(cstype, csname1))
                {
                    String cstext1 = "google.load('visualization', '1.0', { 'packages': ['corechart'] });";
                    cstext1 += "google.setOnLoadCallback(drawChart);";

                    cs.RegisterStartupScript(cstype, csname1, cstext1, true);
                    // 使用 addScriptTags (最後一個)參數，指出 script 參數所提供的指令碼是否包裝在 <script> 項目區塊中。 
                    // 最後一個參數 addScriptTags 設為 true，表示<script>指令碼標記會自動加入。
                }

                // Check to see if the client script is already registered.
                if (!cs.IsClientScriptBlockRegistered(cstype, csname2))
                {
                    StringBuilder cstext2 = new StringBuilder();
                    cstext2.Append("<script type=\"text/javascript\">  function drawChart() {");
                    cstext2.Append("var data = new google.visualization.DataTable();");
                    cstext2.Append("data.addColumn('string', 'Topping');");
                    cstext2.Append("data.addColumn('number', '數量');");
                    SqlDataReader dr5 = null;

                    SqlConnection conn = new SqlConnection("Data Source=59.124.220.17\\SQL2008,5857;Initial Catalog=test;User ID=student;Password=Aa123");
                    conn.Open();
                    SqlCommand cmd1 = new SqlCommand(query, conn);
                    dr5 = cmd1.ExecuteReader();
                    cstext2.Append("data.addRows([");
                    while (dr5.Read())
                    {

                        cstext2.Append("['" + dr5["Box_type"] + "'," + dr5["num"] + "]");


                        if (dr5.Read())
                        {
                            cstext2.Append(",");
                        }
                    }
                    cstext2.Append("]);");
                    //cstext2.Append("data.addRows([['Mushrooms', 3], ['Onions', 1], ['Olives', 1], ['Zucchini', 1], ['Pepperoni', 2]]);");
                    cstext2.Append("var options = { 'title': '報表管理', 'width': 750, 'height': 450 };");
                    cstext2.Append("var chart = new google.visualization.BarChart(document.getElementById('chart_div'));");
                    cstext2.Append("chart.draw(data, options);");
                    cstext2.Append("}</script>");

                    cs.RegisterClientScriptBlock(cstype, csname2, cstext2.ToString(), false);
                }
                // 在網頁上的 OnLoad 事件引發之前。 不保證指令碼區塊可以根據其所註冊的順序來輸出。 
                // 如果指令碼區塊的順序很重要，請使用 StringBuilder 物件，在單一字串中一起蒐集指令碼，
                // 然後在單一用戶端指令碼區塊中註冊所有的指令碼。
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('有欄位尚未選擇，請再檢查');</script>");
            }
            
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DropDownList2.SelectedValue)
            {
                case "年報":
                    Button1.Visible = true;
                    DropDownList3.Visible = false;
                    DropDownList4.Visible = true;
                    DropDownList5.Visible = false;
                    DropDownList4.SelectedValue = "選擇年份";
                    break;
                case "月報":
                    Button1.Visible = true;
                    DropDownList3.Visible = false;
                    DropDownList4.Visible = true;
                    DropDownList4.SelectedValue = "選擇年份";
                    DropDownList5.SelectedValue = "選擇月份";
                    DropDownList5.Visible = true;
                    break;
                case "季報":
                    Button1.Visible = true;
                    DropDownList3.Visible = true;
                    DropDownList4.Visible = true;
                    DropDownList4.SelectedValue = "選擇年份";
                    DropDownList5.Visible = false;
                    break;
                default:
                    Button1.Visible = false;
                    DropDownList3.Visible = false;
                    DropDownList4.Visible = false;
                    DropDownList5.Visible = false;
                    break;
            }
        }
    }
}