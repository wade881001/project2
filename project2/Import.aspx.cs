using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using NPOI.HSSF.UserModel;
using NPOI.XSSF.UserModel;
using NPOI.SS.UserModel;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
               Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('連線逾時，請重新登入');window.location='Login.aspx'</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String savePath = "C:\\temp\\uploads\\";
            if (FileUpload1.HasFile)
            {
                String fileName = FileUpload1.FileName;
                savePath = savePath + fileName;
                if (File.Exists(savePath))
                {
                    File.Delete(savePath);
                }
                FileUpload1.SaveAs(savePath);
                HiddenField1.Value = savePath;
                ReadFromExcelFile(savePath);
            }
            else
            {
            }


        }
        public void ReadFromExcelFile(string filePath)
        {
            Boolean isok = true;

            XSSFWorkbook wk;


            Boolean flag = true;


            using (FileStream fs = new FileStream(HiddenField1.Value.ToString(), FileMode.Open, FileAccess.Read))
            {
                wk = new XSSFWorkbook(fs);
                fs.Close();
                fs.Dispose();
            }


            XSSFSheet hst = (XSSFSheet)wk.GetSheetAt(0);   //第一張EXCEL 表格
            DataTable dt = new DataTable();
            XSSFRow HR1 = (XSSFRow)hst.GetRow(0);
            for (int colIdx = 0; colIdx <= HR1.LastCellNum; colIdx++)
            {

                if (HR1.GetCell(colIdx) != null)
                {
                    dt.Columns.Add(new DataColumn(HR1.GetCell(colIdx).StringCellValue));
                }
            }
            string connectionstring = "Data Source=59.124.220.17\\SQL2008,5857;Initial Catalog=test;uid=student;password=Aa123";




            using (SqlConnection MyConn = new SqlConnection(connectionstring))
            {
                MyConn.Open();
                SqlTransaction transaction;
                transaction = MyConn.BeginTransaction();


                for (int j = 1; j <= hst.LastRowNum; j++)   //從第二行到最後一行
                {

                    DataRow newDataRow = dt.NewRow();
                    XSSFRow HR2 = (XSSFRow)hst.GetRow(j);   //取得當前那一行
                    if (HR2 == null) continue;


                    XSSFCell HC1 = (XSSFCell)HR2.GetCell(0);//第一欄的資料
                    XSSFCell HC2 = (XSSFCell)HR2.GetCell(1);//第二欄的資料
                    XSSFCell HC3 = (XSSFCell)HR2.GetCell(2);//第三欄...
                    XSSFCell HC4 = (XSSFCell)HR2.GetCell(3);
                    XSSFCell HC5 = (XSSFCell)HR2.GetCell(4);
                    using (SqlCommand MyComm = new SqlCommand())
                    {
                        MyComm.Transaction = transaction;
                        try
                        {
                            DateTime myDate = DateTime.Now;
                            String myDateString = myDate.ToString("yyyy-MM-dd");
                            /* String subdate1 = myDateString.Substring(0, 4);
                             String subdate2 = myDateString.Substring(5, 2);
                             String subdate3 = myDateString.Substring(8, 2); */
                            MyComm.Connection = MyConn;
                            MyComm.Parameters.Add("@Order_num", HC1 == null ? "" : HC1.ToString());
                            MyComm.Parameters.Add("@Box_type", HC2 == null ? "" : HC2.ToString());
                            MyComm.Parameters.Add("@Second_Box_type", HC3 == null ? "" : HC3.ToString());
                            MyComm.Parameters.Add("@Num", HC4 == null ? "" : HC4.ToString());
                            MyComm.Parameters.Add("@Order_store", HC5 == null ? "" : HC5.ToString());
                            MyComm.Parameters.Add("@Date", myDateString.ToString());
                            /*MyComm.Parameters.Add("@Month", subdate2);
                            MyComm.Parameters.Add("@Day", subdate3);*/
                            MyComm.CommandText = "INSERT INTO [Order] ([Order_num], [Box_type], [Second_Box_type], [Num], [Order_store],[Date]) VALUES (@Order_num,@Box_type,@Second_Box_type,@Num,@Order_store,@Date)";

                            MyComm.ExecuteNonQuery();
                            //......後續照正常方式處理
                        }
                        catch (Exception ex)
                        {
                            isok = false;
                            flag = false;
                        }



                    }

                    newDataRow[0] = HC1.ToString();
                    newDataRow[1] = HC2.ToString();
                    newDataRow[2] = HC3.ToString();
                    newDataRow[3] = HC4.ToString();
                    newDataRow[4] = HC5.ToString();
                    dt.Rows.Add(newDataRow);








                }
                if (flag)
                {
                    transaction.Commit();
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('匯入欄位資料錯誤或已有重複資料，請檢查後再匯入');</script>");
                    try
                    {
                        transaction.Rollback();
                    }
                    catch (Exception ex2)
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('資料回溯失敗');</script>");
                    }
                }
                MyConn.Close();
                MyConn.Dispose();
            }
            if (isok == true)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('匯入成功!');</script>");
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

        }


    }

}