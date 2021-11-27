using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace project2
{
    /// <summary>
    /// GoogleMapHandler 的摘要描述
    /// </summary>
    public class GoogleMapHandler2 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //傳進來的參數，可用這個去查詢資料庫
            var key = context.Request["key"];
            DataTable table = GetMapInfo(key);

            /*
               JSON 格式
               [{  key : value },{  key : value },{  key : value }]
            */
            int i = 0;
            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            foreach (DataRow item in table.Rows)
            {
                i++;
                sb.Append("{");
                sb.AppendFormat("\"Title\": \"{0}\", \"Lng\": \"{1}\",\"Lat\": \"{2}\"",
                                item["Title"].ToString(),
                                item["經度"].ToString(),
                                item["緯度"].ToString()
                                );

                sb.Append("}");
                if (i < table.Rows.Count)
                    sb.Append(",");
            }
            sb.Append("]");

            context.Response.ContentType = "text/plain";
            //將此JSON格式的資料回傳
            context.Response.Write(sb.ToString());
        }

        /// <summary>
        /// 進資料庫查詢經緯度資料，並傳回DataTable
        /// </summary>
        private DataTable GetMapInfo(string key)
        {

            String query = "SELECT [test].[dbo].[Map].map_num,[test].[dbo].[Map].map_name,[test].[dbo].[Store].Latitude,[test].[dbo].[Store].Longitude FROM[Map] INNER JOIN[Store] ON[test].[dbo].[Map].map_name =[test].[dbo].[Store].Store_name order by [test].[dbo].[Map].map_num";
            // string connectionstring = "Data Source=59.124.220.17\\SQL2008,5857;Initial Catalog=test;User ID=student;Password=Aa123";
            DataTable dt1 = null;

            SqlConnection conn = new SqlConnection("Data Source=59.124.220.17\\SQL2008,5857;Initial Catalog=test;User ID=student;Password=Aa123");
            conn.Open();
            SqlCommand cmd1 = new SqlCommand(query, conn);

            SqlDataReader dr1 = cmd1.ExecuteReader();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);


            dt1 = new DataTable();


            DataRow dr = null;

            dt1.Columns.Add(new DataColumn("經度"));
            dt1.Columns.Add(new DataColumn("緯度"));
            dt1.Columns.Add(new DataColumn("Title"));





            while (dr1.Read())
            {
                dr = dt1.NewRow();
                dr["經度"] = dr1["Longitude"];
                dr["緯度"] = dr1["Latitude"];
                dr["Title"] = dr1["map_name"];

                dt1.Rows.Add(dr);
            }






            conn.Close();
            da1.Dispose();







            return dt1;

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}