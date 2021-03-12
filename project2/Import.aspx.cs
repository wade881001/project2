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

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String savePath = "C:\\temp\\uploads\\";
            if (FileUpload1.HasFile)
            {
                String fileName = FileUpload1.FileName;
                savePath = savePath + fileName;
                FileUpload1.SaveAs(savePath);

                ReadFromExcelFile(savePath);
            }
            else
            {
            }


        }
        public void ReadFromExcelFile(string filePath)
        {
            IWorkbook wk = null;
            string extension = System.IO.Path.GetExtension(filePath);
            try
            {
                FileStream fs = File.OpenRead(filePath);
                if (extension.Equals(".xls"))
                {
                    wk = new HSSFWorkbook(fs);
                }
                else if (extension.Equals(".xlsx"))
                {
                    wk = new XSSFWorkbook(fs);
                }
                fs.Close();
                
                ISheet sheet = wk.GetSheetAt(0);
                IRow row = sheet.GetRow(0);
                string text = string.Empty;
                for (int colIdx = 0; colIdx <= row.LastCellNum; colIdx++)
                {

                    if (row.GetCell(colIdx) != null)
                    {
                       // dt.Columns.Add(new DataColumn(row.GetCell(colIdx).StringCellValue));
                      // column0,1,2...
                    }
                }
                for (int rowIdx = 1; rowIdx <= sheet.LastRowNum; rowIdx++)
                {
                    IRow row2 = sheet.GetRow(rowIdx);
                    DataRow newDataRow = dt.NewRow();
                    for (int colIdx = row2.FirstCellNum; colIdx <= row2.LastCellNum; colIdx++)
                    {
                        ICell cell = sheet.GetRow(rowIdx).GetCell(colIdx);

                        if (row2.GetCell(colIdx) != null)
                        {
                            switch (cell.CellType)
                            {
                                case CellType.Numeric:
                                    if (DateUtil.IsCellDateFormatted(cell))
                                    {
                                        newDataRow[colIdx] = row2.GetCell(colIdx).DateCellValue.ToString();
                                    }

                                    else
                                    {
                                        newDataRow[colIdx] = row2.GetCell(colIdx).NumericCellValue.ToString();
                                    }
                                    break;
                                case CellType.String:
                                    newDataRow[colIdx] = row2.GetCell(colIdx).StringCellValue;
                                    break;
                                case CellType.Formula:

                                    newDataRow[colIdx] = row2.GetCell(colIdx).CellFormula;
                                    break;
                                default:
                                    newDataRow[colIdx] = row2.GetCell(colIdx).StringCellValue;
                                    break;
                            }



                        }
                    }
                    dt.Rows.Add(newDataRow);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();

                string localCon = "Data Source=LAPTOP-MVSLPF8J\\SQLEXPRESS;Initial Catalog=test;user id=sa2;password=wade881001";
                DataTableToSQLServer(dt, localCon);
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                //釋放 NPOI的資源
                wk = null;

            }

        }
        public static void DataTableToSQLServer(DataTable dt, string connectString)
        {
            string connectionString = connectString;

            using (SqlConnection destinationConnection = new SqlConnection(connectionString))
            {
                destinationConnection.Open();


                using (SqlBulkCopy bulkCopy = new SqlBulkCopy(destinationConnection))
                {


                    try
                    {

                        bulkCopy.DestinationTableName = "dbo.Order";//要插入的表的表名
                        bulkCopy.BatchSize = dt.Rows.Count;
                        bulkCopy.ColumnMappings.Add("訂單編號", "Order_num");
                        bulkCopy.ColumnMappings.Add("物流箱種類", "Box_type");
                        bulkCopy.ColumnMappings.Add("物流箱第二種類", "Second_box_type");//對映欄位名 DataTable列名 ,資料庫 對應的列名 
                        bulkCopy.ColumnMappings.Add("訂單數量", "Num");
                        bulkCopy.ColumnMappings.Add("訂單店家", "Order_store");

                        bulkCopy.WriteToServer(dt);
                        MessageBox.Show("插入成功");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    finally
                    {


                    }
                }


            }

        }

    }

}