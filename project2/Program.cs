using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace project2
{
    public class Program
    {
        public class ans_store
        {
            public int Car { get; set; }
            public int[] Store { get; set; }

        }
    }
    public static void Main(String[] args)
    {
        string data = "server=.\\SQLExpress;database=test;User=sa;Password=12345678;Trusted_Connection=True;";
        SqlConnection mydata = new SqlConnection(data);
        mydata.Open();
        String num_route = @"select * from dbo.Delivery_route_c_ij";
        SqlCommand myCommand1 = new SqlCommand(num_route, mydata);
        SqlDataReader route = myCommand1.ExecuteReader();
        string[] adress = new string[100];
        int p = 0;
        while (route.Read() & p <= 65)
        {
            if (route["adress"].ToString() != "")
            {
                adress[p] = route["adress"].ToString();
                p += 1;
            }
        }
        route.Close();
        p = 0;
        String num_car = @"select * from dbo.Car_freight_Qk";
        SqlCommand myCommand2 = new SqlCommand(num_car, mydata);
        SqlDataReader car_f = myCommand2.ExecuteReader();
        int[] car_freight = new int[22];
        while (car_f.Read() & p <= 22)
        {
            if (car_f["actual_freight"].ToString() != "")
            {
                car_freight[p] = int.Parse(car_f["actual_freight"].ToString());
                p += 1;
            }
        }
        car_f.Close();
        p = 0;
        //int[][] ans_store = new int [10][];
        List<ans_store> ans_store = new List<ans_store>();
        int[] ans_car = new int[100];
        List<int> store = new List<int>();
        for (int l = 1; l <= 65; l++)
        {
            store.Add(l);
        }
        List<int> car = new List<int>();
        for (int l = 1; l <= 22; l++)
        {
            car.Add(l);
        }
        int[] take = new int[100];
        int[] anss = new int[100];
        int[][] ans2 = new int[5][];
        int k = 0;
        int demand = 30;
        int whichcar = 0;
        int whichst = 0;
        int q = 0;
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
        //for (int F = 0; F < 10; F++)
        //{

        while (check > 0)
        {
            //Console.WriteLine("check"+check);
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
                while (eij != 0)
                {
                    s = r.Next(1, store.Count);
                    s = store[rs + 1];
                    eij = take[s];
                }
                //Console.WriteLine(s);
                String dt = @"select * from dbo.Drive_route_t_ij";
                SqlCommand myCommand3 = new SqlCommand(dt, mydata);
                SqlDataReader rtime = myCommand3.ExecuteReader();
                while (rtime.Read() & p <= 65)
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
                if (tij + t + u < T | demand < q)
                {
                    i = s;
                    anss[0] = s;
                    ans_car[whichcar] = c;
                    ans_store.Add(new ans_store { Car = c });
                    store.Remove(s);
                    car.Remove(c);
                    whichst += 1;
                    q = q - demand;
                    t = t + u + tij;
                    check -= 1;
                    k += 1;
                    outset = 0;
                }
            }
            else
            {
                int[] sort = new int[check + 1];
                int[] all = new int[65];
                int countmin = 1;
                int pp = 0;
                String route_min = @"select * from dbo.Delivery_route_c_ij";
                SqlCommand myCommand5 = new SqlCommand(route_min, mydata);
                SqlDataReader rmin = myCommand5.ExecuteReader();
                while (rmin.Read() & p <= 65)
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
                for (int che = 0; che < 65; che++)
                {
                    if (all[che] == min)
                    {
                        j = che;
                    }
                }
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
                int eij = take[j];
                p = 0;
                while (eij > t)
                {
                    countmin += 1;
                    min = sort[countmin];
                    for (int che = 0; che < 65; che++)
                    {
                        if (all[che] == min)
                        {
                            j = che;
                        }
                    }
                    String limit2 = @"select * from dbo.Early_time_e_i";
                    SqlCommand myCommand7 = new SqlCommand(limit2, mydata);
                    SqlDataReader e2 = myCommand7.ExecuteReader();
                    while (e2.Read() & p <= 65)
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
                while (rtime.Read() & p <= 65)
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
                if (t + u + tij <= T | demand <= q)
                {
                    anss[whichst] = j;
                    store.Remove(j);
                    whichst += 1;
                    q = q - demand;
                    t = t + u + tij;
                    i = j;
                    check -= 1;
                    k += 1;
                }
                else
                {
                    outset = 1;
                    int[] ass = new int[k];
                    for (int kk = 0; kk < k; kk++)
                    {
                        ass[kk] = anss[kk];
                    }
                    whichst = 0;
                    whichcar = 0;
                    t = 0;
                    q = 0;
                    k = 0;
                    for (int a = 0; a < ass.Length; a++)
                    {
                        Console.WriteLine(adress[ass[a]]);
                    }
                    Console.Write("\r\n");
                }
            }

        }

        //}
    }
}