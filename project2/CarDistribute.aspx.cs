using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2
{
    public partial class CarDistribute : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Login"] == null)
            //{
            //    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('連線逾時，請重新登入');window.location='Login.aspx'</script>");
            //}
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
            GridView1.Visible = true;
        }

        protected void Algorithmexe_Click(object sender, EventArgs e)
        {
            //執行演算法和前置作業 main程式
            Program.Main();
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('配車完成，將跳至結果瀏覽');window.location='AlgorithmResult.aspx'</script>");
        }

        protected void Check_Click(object sender, EventArgs e)
        {
            Response.Redirect("AlgorithmResult.aspx");
        }
    }
    public class Program
    {
        public class ans_store
        {
            public int Car { get; set; }
            public int[] Store { get; set; }

        }
        public static void Main()
        {
            string data = "Data Source=59.124.220.17\\SQL2008,5857;Initial Catalog=test;user id=student;password=Aa123";
            SqlConnection mydata = new SqlConnection(data);
            mydata.Open();
            //刪除舊有配車結果
            String deleteOld = @"Delete from dbo.Algorithm";
            SqlCommand myCommand87 = new SqlCommand(deleteOld, mydata);
            SqlDataReader deletePre = myCommand87.ExecuteReader();
            deletePre.Close();
            //抓取店家和其預備需求
            String callStore = @"Select * from dbo.Demand_di";
            SqlCommand myCommand88 = new SqlCommand(callStore, mydata);
            SqlDataReader storeCaller = myCommand88.ExecuteReader();
            double[] totalDemand = new double[66];
            String[] totalStore = new String[66];
            int st = 0;
            while (storeCaller.Read() & st <= 66)
            {
                if (storeCaller["store_name"].ToString() != "")
                {
                    totalStore[st] = storeCaller["store_name"].ToString();
                    totalDemand[st] = 0;
                    st++;
                }
            }
            storeCaller.Close();
            //抓取個別訂單筆數對應其店家需求之材積
            String callDemand = @"select [LogisticBox].Cuft,[Order].Num,[Order].Order_store from [LogisticBox] inner join [Order] on [Order].Box_type=[LogisticBox].Box_type and [Order].Second_box_type=[LogisticBox].Second_box_type where cast([Order].Date as date) = cast(getdate() as date)";
            SqlCommand myCommand89 = new SqlCommand(callDemand, mydata);
            SqlDataReader demandCaller = myCommand89.ExecuteReader();
            int counttimes = 0;
            while (demandCaller.Read())
            {
                counttimes++;
            }
            int[] demandNum = new int[counttimes];
            double[] indivDemand = new double[counttimes];
            String[] demandStore = new String[counttimes];
            demandCaller.Close();
            SqlDataReader demandCaller2 = myCommand89.ExecuteReader();
            for (int i = 0; i < counttimes; i++)
            {
                if (demandCaller2.Read())
                {
                    demandNum[i] = int.Parse(demandCaller2["Num"].ToString());
                    indivDemand[i] = double.Parse(demandCaller2["Cuft"].ToString());
                    demandStore[i] = demandCaller2["Order_store"].ToString();
                }
            }
            demandCaller2.Close();
            //計算每個店家總需求
            for (int i = 0; i < 66; i++)
            {
                for (int j = 0; j < counttimes; j++)
                {
                    if (totalStore[i].ToString() == demandStore[j].ToString())
                    {
                        double temp = indivDemand[j] * demandNum[j];
                        totalDemand[i] += temp;
                    }
                }
            }
            //將每個店家個別總需求update
            for (int i = 0; i < 66; i++)
            {
                string updatedi = "Data Source=59.124.220.17\\SQL2008,5857;Initial Catalog=test;user id=student;password=Aa123";
                SqlConnection di = new SqlConnection(updatedi);
                di.Open();
                SqlCommand updateDemand = new SqlCommand();
                updateDemand.CommandText = "Update dbo.Demand_di set [demand]='" + totalDemand[i] + "' where [store_name]='" + totalStore[i] + "'";
                updateDemand.Connection = di;
                updateDemand.ExecuteNonQuery();
                di.Close();
            }
            //演算法start
            String num_route = @"select * from dbo.Delivery_route_c_ij";
            SqlCommand myCommand1 = new SqlCommand(num_route, mydata);
            SqlDataReader route = myCommand1.ExecuteReader();
            string[] address = new string[100];
            int p = 0;
            while (route.Read() & p <= 66)
            {
                if (route["address"].ToString() != "")
                {
                    address[p] = route["address"].ToString();
                    p += 1;
                }
            }
            route.Close();
            p = 0;
            String num_car = @"select * from dbo.Car_freight_Qk";
            SqlCommand myCommand2 = new SqlCommand(num_car, mydata);
            SqlDataReader car_f = myCommand2.ExecuteReader();
            float[] car_freight = new float[22];
            while (car_f.Read() & p <= 22)
            {
                if (car_f["actual_freight"].ToString() != "")
                {
                    car_freight[p] = float.Parse(car_f["actual_freight"].ToString());
                    p += 1;
                }
            }
            car_f.Close();
            p = 0;
            List<List<string>> ans_store = new List<List<string>>();
            List<List<int>> ans_car = new List<List<int>>();
            List<int> totalr = new List<int>();
            for (int F = 0; F < 5; F++)
            {
                List<string> ans_s1 = new List<string>();
                List<int> ans_c1 = new List<int>();
                List<int> store = new List<int>();
                for (int l = 1; l < 66; l++)
                {
                    store.Add(l);
                }
                List<int> car = new List<int>();
                for (int l = 1; l <= 22; l++)
                {
                    car.Add(l);
                }
                int total = 0;
                string cstore = "";
                int[] take = new int[100];
                float[] demand = new float[66];
                String sd = @"select * from dbo.Demand_di";
                SqlCommand myCommand8 = new SqlCommand(sd, mydata);
                SqlDataReader store_de = myCommand8.ExecuteReader();
                while (store_de.Read() & p <= 66)
                {
                    if (store_de["demand"].ToString() != "")
                    {
                        demand[p] = float.Parse(store_de["demand"].ToString());
                        p += 1;
                    }
                }
                store_de.Close();
                p = 0;
                int whichst = 0;
                float q = 0;
                int u = 20;
                int i = 0;
                int j = 0;
                int s;
                int c;
                int tij;
                int outset = 1;
                int rs;
                int rc;
                int T = 420;
                int t = 0;
                int check = 64;
                int min;
                while (check > 0)
                {
                    if (outset == 1)
                    {
                        Random r = new Random();
                        rs = r.Next(1, store.Count);
                        s = store[rs - 1];
                        rc = r.Next(1, car.Count);
                        c = car[rc - 1];
                        String limit = @"select * from dbo.Early_time_e_i";
                        SqlCommand myCommand4 = new SqlCommand(limit, mydata);
                        SqlDataReader e = myCommand4.ExecuteReader();
                        while (e.Read() & p <= 65)
                        {
                            if (e["ei"].ToString() != "")
                            {
                                take[p] = int.Parse(e["ei"].ToString());
                                p += 1;
                            }
                        }
                        e.Close();
                        p = 0;
                        int eij = take[s];
                        int k = 0;
                        while (eij != 0)
                        {
                            rs = r.Next(1, store.Count);
                            if (rs > store.Count)
                            {
                                goto Skep;
                            }
                            s = store[rs - 1];
                            eij = take[s];
                            k = k + 1;
                            if (k == 10)
                            {
                                goto Skep;
                            }
                        }
                        String dt = @"select * from dbo.Drive_route_t_ij";
                        SqlCommand myCommand3 = new SqlCommand(dt, mydata);
                        SqlDataReader rtime = myCommand3.ExecuteReader();
                        while (rtime.Read() & p <= 66)
                        {
                            if (rtime[outset].ToString() != "")
                            {
                                take[p] = int.Parse(rtime[outset].ToString());
                                p += 1;
                            }
                        }
                        rtime.Close();
                        p = 0;
                        tij = take[s];
                        tij = tij / 60;
                        q = car_freight[c - 1];
                        String route_total = @"select * from dbo.Delivery_route_c_ij";
                        SqlCommand myCommand7 = new SqlCommand(route_total, mydata);
                        SqlDataReader route_t = myCommand7.ExecuteReader();
                        while (route_t.Read() & p <= 66)
                        {
                            if (route_t[2].ToString() != "")
                            {
                                take[p] = int.Parse(route_t[2].ToString());
                                p += 1;
                            }
                        }
                        route_t.Close();
                        p = 0;
                        total = total + take[s];
                        if (tij + t + u < T | demand[s] <= q)
                        {
                            i = s;
                            ans_c1.Add(c);
                            cstore = address[s];
                            store.Remove(s);
                            car.Remove(c);
                            whichst += 1;
                            q = q - demand[s];
                            t = t + u + tij;
                            check -= 1;
                            outset = 0;
                            if (store.Count == 1)
                            {
                                ans_s1.Add(cstore);
                            }
                        }
                    }
                    else
                    {
                        int[] sort = new int[check + 1];
                        int[] all = new int[66];
                        int countmin = 1;
                        int pp = 0;
                        String route_min = @"select * from dbo.Delivery_route_c_ij";
                        SqlCommand myCommand5 = new SqlCommand(route_min, mydata);
                        SqlDataReader rmin = myCommand5.ExecuteReader();
                        while (rmin.Read() & p <= 66)
                        {
                            if (rmin[i + 2].ToString() != "")
                            {
                                if (store.Contains(p))
                                {
                                    sort[pp] = int.Parse(rmin[i + 2].ToString());
                                    pp += 1;
                                }
                                all[p] = int.Parse(rmin[i + 2].ToString());
                                p += 1;
                            }
                        }
                        rmin.Close();
                        p = 0;
                        Array.Sort(sort);
                        min = sort[1];
                        for (int che = 1; che < 66; che++)
                        {
                            if (all[che] == min & store.Contains(che))
                            {
                                j = che;
                            }
                        }
                        String limit = @"select * from dbo.Early_time_e_i";
                        SqlCommand myCommand4 = new SqlCommand(limit, mydata);
                        SqlDataReader e = myCommand4.ExecuteReader();
                        while (e.Read() & p <= 66)
                        {
                            if (e["ei"].ToString() != "")
                            {
                                take[p] = int.Parse(e["ei"].ToString());
                                p += 1;
                            }
                        }
                        e.Close();
                        int eij = take[j];
                        p = 0;
                        while (eij > t)
                        {
                            countmin += 1;
                            if (countmin >= sort.Length)
                            {
                                goto Skep;
                            }
                            min = sort[countmin];
                            for (int che = 0; che < 66; che++)
                            {
                                if (all[che] == min)
                                {
                                    j = che;
                                }
                            }
                            String limit2 = @"select * from dbo.Early_time_e_i";
                            SqlCommand myCommand7 = new SqlCommand(limit2, mydata);
                            SqlDataReader e2 = myCommand7.ExecuteReader();
                            while (e2.Read() & p <= 66)
                            {
                                if (e2["ei"].ToString() != "")
                                {
                                    take[p] = int.Parse(e2["ei"].ToString());
                                    p += 1;
                                }
                            }
                            e2.Close();
                            eij = take[j];
                            p = 0;
                        }
                        String dt = @"select * from dbo.Drive_route_t_ij";
                        SqlCommand myCommand3 = new SqlCommand(dt, mydata);
                        SqlDataReader rtime = myCommand3.ExecuteReader();
                        while (rtime.Read() & p <= 66)
                        {
                            if (rtime[i + 1].ToString() != "")
                            {
                                take[p] = int.Parse(rtime[i + 1].ToString());
                                p += 1;
                            }
                        }
                        rtime.Close();
                        p = 0;
                        tij = take[j];
                        tij = tij / 60;
                        if (t + u + tij <= T | demand[j] <= q)
                        {
                            String route_total = @"select * from dbo.Delivery_route_c_ij";
                            SqlCommand myCommand7 = new SqlCommand(route_total, mydata);
                            SqlDataReader route_t = myCommand7.ExecuteReader();
                            while (route_t.Read() & p <= 66)
                            {
                                if (route_t[i + 2].ToString() != "")
                                {
                                    take[p] = int.Parse(route_t[i + 2].ToString());
                                    p += 1;
                                }
                            }
                            route_t.Close();
                            p = 0;
                            total = total + take[j];
                            cstore = cstore + "," + address[j];
                            store.Remove(j);
                            q = q - demand[j];
                            t = t + u + tij;
                            i = j;
                            check -= 1;
                            if (check == 0)
                            {
                                ans_s1.Add(cstore);
                            }
                        }
                        else
                        {
                            ans_s1.Add(cstore);
                            outset = 1;
                            whichst = 0;
                            t = 0;
                            q = 0;
                            cstore = "";
                        }
                    }

                }
                totalr.Add(total);
                ans_car.Add(ans_c1);
                ans_store.Add(ans_s1);
            Skep:
                continue;
            }
            int total_min = totalr[0];
            int best = 0;
            for (int i = 0; i < totalr.Count; i++)
            {
                if (total_min > totalr[i])
                {
                    total_min = totalr[i];
                    best = i;
                }
            }
            for (int i = 0; i < ans_car[best].Count; i++)
            {
                string input = "Data Source=59.124.220.17\\SQL2008,5857;Initial Catalog=test;user id=student;password=Aa123";
                SqlConnection mydatain = new SqlConnection(input);
                mydatain.Open();
                SqlCommand mydatainsert = new SqlCommand();
                //System.Web.HttpContext.Current.Response.Write(ans_car[best][i].ToString());
                //System.Web.HttpContext.Current.Response.Write(ans_store[best][i].ToString());
                mydatainsert.CommandText = " Insert into dbo.Algorithm ([Car],[Route]) values (@car,@route) ";
                mydatainsert.Parameters.AddWithValue("car", ans_car[best][i]);
                string bestStore = "";
                string[] bestStoreList = ans_store[best][i].Split(',');
                for (int j = 0; j < bestStoreList.Length; j++)
                {
                    if (j < bestStoreList.Length - 1)
                    {
                        bestStore += bestStoreList[j];
                        bestStore += "→";
                    }
                    else
                    {
                        bestStore += bestStoreList[j];
                    }
                }
                mydatainsert.Parameters.AddWithValue("route", bestStore);
                mydatainsert.Connection = mydatain;

                mydatainsert.ExecuteNonQuery();

                mydatain.Close(); //done
            }
        }

    }
}