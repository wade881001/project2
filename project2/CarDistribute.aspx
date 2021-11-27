<%@ Page Title="物流配車" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CarDistribute.aspx.cs" Inherits="project2.CarDistribute" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" visible="true" id="initial">
        <head>
            <title>物流配車</title>
        </head>
        <div id="divProgress" style="text-align:center; display: none; position: fixed; top: 50%;  left: 50%;" >
    <asp:Image ID="imgLoading" runat="server" ImageUrl="~/assets/img/loading.gif" />
    <br />
    <font color="#1B3563" size="20px">配車作業進行中</font>
</div>
<div id="divMaskFrame" style="background-color: #F2F4F7; display: none; left: 0px;
    position: absolute; top: 0px;">
</div>
        <div class="main-panel">
            <div class="content">
                <div class="page-inner">
                    <div class="page-header">
                        <h4 class="page-title">爭鮮配送系統
                        </h4>
                        <ul class="breadcrumbs">
                            <li class="nav-home">
                                <a href="#">
                                    <i class="flaticon-home"></i>
                                </a>
                            </li>
                            <li class="separator">
                                <i class="flaticon-right-arrow"></i>
                            </li>
                            <li class="nav-item">
                                <a href="#">物流管理</a>
                            </li>
                            <li class="separator">
                                <i class="flaticon-right-arrow"></i>
                            </li>
                            <li class="nav-item">
                                <a href="Maintain.aspx">物流配車</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex align-items-center">
                                    <h4 class="card-title">確認當日店家訂單</h4>
                                    <asp:Button ID="Button1" runat="server" Style="right: 26%; top: 21px; position: absolute; font-size: 15px" Text="搜尋" OnClick="Search_Click" />
                                    <asp:Button ID="Button2" runat="server" Style="right: 20%; top: 21px; position: absolute; font-size: 15px" Text="重置搜尋結果" OnClick="Reset_Click" Visible="false" />
                                    <asp:TextBox ID="Search" runat="server" Style="right: 32%; top: 21px; position: absolute; font-size: 15px; width: 120px"></asp:TextBox>
                                    <asp:DropDownList ID="DropDownList2" runat="server" Style="left: 38%; top: 21px; position: absolute; font-size: 15px; width: 120px; height: 28px" AutoPostBack="True">
                                        <asp:ListItem>選擇查詢目標</asp:ListItem>
                                        <asp:ListItem>訂單編號</asp:ListItem>
                                        <asp:ListItem>物流箱各種類</asp:ListItem>
                                        <asp:ListItem>訂貨店家</asp:ListItem>
                                        <asp:ListItem>訂貨數量</asp:ListItem>
                                    </asp:DropDownList>
                                    <h4 style="right: 13.5%; top: 27px; position: absolute; font-size: 15px">每頁顯示</h4>
                                    <h4 style="right: 3%; top: 27px; position: absolute; font-size: 15px">筆資料</h4>
                                    <asp:DropDownList ID="DropDownList1" runat="server" Style="right: 8%; top: 21px; position: absolute; font-size: 15px; width: 50px; height: 28px" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                        <asp:ListItem Value="15">15</asp:ListItem>
                                        <asp:ListItem Value="30">30</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- Modal -->

                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" class="display table table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" PageSize="5"
                                        CssClass="display table table-striped table-hover" DataKeyNames="Order_num,Box_type,Second_box_type">
                                        <AlternatingRowStyle Width="600px" Wrap="False" />
                                        <Columns>
                                            <asp:BoundField DataField="Order_num" HeaderText="訂單編號" SortExpression="Order_num" ReadOnly="True" />
                                            <asp:BoundField DataField="Box_type" HeaderText="物流箱種類" SortExpression="Box_type" ReadOnly="True" />
                                            <asp:BoundField DataField="Second_box_type" HeaderText="物流箱第二種類" SortExpression="Second_box_type" ReadOnly="True" />
                                            <asp:BoundField DataField="Order_store" HeaderText="訂貨店家" SortExpression="Order_store" />
                                            <asp:BoundField DataField="Num" HeaderText="訂貨數量" SortExpression="Num" />
                                        </Columns>
                                        <EditRowStyle Wrap="False" />
                                        <EmptyDataRowStyle Wrap="True" />
                                        <RowStyle Wrap="True" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSourceOrdernum" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" SelectCommand="SELECT [Order_num], [Box_type], [Second_box_type], [Num], [Order_store] FROM [Order] WHERE ([Order_num] LIKE '%' + @Order_num + '%') AND CAST([Order].[Date] AS DATE) = CAST(GETDATE() AS DATE)" DeleteCommand="DELETE FROM [Order] WHERE [Order_num] = @Order_num AND [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type" InsertCommand="INSERT INTO [Order] ([Order_num], [Box_type], [Second_box_type], [Num], [Order_store]) VALUES (@Order_num, @Box_type, @Second_box_type, @Num, @Order_store)" UpdateCommand="UPDATE [Order] SET [Num] = @Num, [Order_store] = @Order_store WHERE [Order_num] = @Order_num AND [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                            <asp:Parameter Name="Num" Type="Int32" />
                                            <asp:Parameter Name="Order_store" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Order_num" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Num" Type="Int32" />
                                            <asp:Parameter Name="Order_store" Type="String" />
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceBoxtype" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Order] WHERE [Order_num] = @Order_num AND [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type" InsertCommand="INSERT INTO [Order] ([Order_num], [Box_type], [Second_box_type], [Order_store], [Num]) VALUES (@Order_num, @Box_type, @Second_box_type, @Order_store, @Num)" SelectCommand="SELECT [Order_num], [Box_type], [Second_box_type], [Order_store], [Num] FROM [Order] WHERE (([Box_type] LIKE '%' + @Box_type + '%') OR ([Second_box_type] LIKE '%' + @Second_box_type + '%')) AND CAST([Order].[Date] AS DATE) = CAST(GETDATE() AS DATE)" UpdateCommand="UPDATE [Order] SET [Order_store] = @Order_store, [Num] = @Num WHERE [Order_num] = @Order_num AND [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                            <asp:Parameter Name="Order_store" Type="String" />
                                            <asp:Parameter Name="Num" Type="Int32" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Box_type" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="Search" Name="Second_box_type" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Order_store" Type="String" />
                                            <asp:Parameter Name="Num" Type="Int32" />
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceOrderstore" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Order] WHERE [Order_num] = @Order_num AND [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type" InsertCommand="INSERT INTO [Order] ([Order_num], [Box_type], [Second_box_type], [Num], [Order_store]) VALUES (@Order_num, @Box_type, @Second_box_type, @Num, @Order_store)" SelectCommand="SELECT [Order_num], [Box_type], [Second_box_type], [Num], [Order_store] FROM [Order] WHERE ([Order_store] LIKE '%' + @Order_store + '%') AND CAST([Order].[Date] AS DATE) = CAST(GETDATE() AS DATE)" UpdateCommand="UPDATE [Order] SET [Num] = @Num, [Order_store] = @Order_store WHERE [Order_num] = @Order_num AND [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                            <asp:Parameter Name="Num" Type="Int32" />
                                            <asp:Parameter Name="Order_store" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Order_store" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Num" Type="Int32" />
                                            <asp:Parameter Name="Order_store" Type="String" />
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceNum" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Order] WHERE [Order_num] = @Order_num AND [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type" InsertCommand="INSERT INTO [Order] ([Order_num], [Box_type], [Second_box_type], [Num], [Order_store]) VALUES (@Order_num, @Box_type, @Second_box_type, @Num, @Order_store)" SelectCommand="SELECT [Order_num], [Box_type], [Second_box_type], [Num], [Order_store] FROM [Order] WHERE ([Num] = @Num) AND CAST([Order].[Date] AS DATE) = CAST(GETDATE() AS DATE)" UpdateCommand="UPDATE [Order] SET [Num] = @Num, [Order_store] = @Order_store WHERE [Order_num] = @Order_num AND [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                            <asp:Parameter Name="Num" Type="Int32" />
                                            <asp:Parameter Name="Order_store" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Num" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Num" Type="Int32" />
                                            <asp:Parameter Name="Order_store" Type="String" />
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" SelectCommand="SELECT [Order_num], [Box_type], [Second_box_type], [Order_store], [Num] FROM [Order] WHERE CAST([Order].[Date] AS DATE) = CAST(GETDATE() AS DATE)" DeleteCommand="DELETE FROM [Order] WHERE [Order_num] = @Order_num AND [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type" InsertCommand="INSERT INTO [Order] ([Order_num], [Box_type], [Second_box_type], [Order_store], [Num]) VALUES (@Order_num, @Box_type, @Second_box_type, @Order_store, @Num)" UpdateCommand="UPDATE [Order] SET [Order_store] = @Order_store, [Num] = @Num WHERE [Order_num] = @Order_num AND [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                            <asp:Parameter Name="Order_store" Type="String" />
                                            <asp:Parameter Name="Num" Type="Int32" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Order_store" Type="String" />
                                            <asp:Parameter Name="Num" Type="Int32" />
                                            <asp:Parameter Name="Order_num" Type="String" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" SelectCommand="SELECT [LogisticBox].Cuft,[Order].Num,[Order].Order_store FROM [Order] INNER JOIN [LogisticBox] ON [Order].Box_type=[LogisticBox].Box_type AND [Order].Second_box_type=[LogisticBox].Second_box_type WHERE ([Order].Year = DATEPART(yyyy, GETDATE())) AND ([Order].Month = DATEPART(mm, GETDATE())) AND ([Order].Day = DATEPART(dd, GETDATE()))">
                                    </asp:SqlDataSource>
                                </div>
                                <asp:Button ID="Button3" class="btn btn-primary btn-round ml-auto" Style="right: 30%; position: absolute; font-size: 15px" runat="server" Text="開始計算最佳配車路線" OnClientClick="ShowProgressBar();" OnClick="Algorithmexe_Click" />
                                <asp:Button ID="Button4" class="btn btn-primary btn-round ml-auto" Style="right: 56%; position: absolute; font-size: 15px" runat="server" Text="查看上次配車路線"  OnClick="Check_Click"/>

                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="add-row" class="display table table-striped table-hover">
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--   Core JS Files   -->
    <script src="../../assets/js/core/jquery.3.2.1.min.js"></script>
    <script src="../../assets/js/core/popper.min.js"></script>
    <script src="../../assets/js/core/bootstrap.min.js"></script>
    <!-- jQuery UI -->
    <script src="../../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
    <script src="../../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
    <!-- Bootstrap Toggle -->
    <script src="../../assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
    <!-- jQuery Scrollbar -->
    <script src="../../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <!-- Datatables -->
    <script src="../../assets/js/plugin/datatables/datatables.min.js"></script>
    <!-- Azzara JS -->
    <script src="../../assets/js/ready.min.js"></script>
    <!-- Azzara DEMO methods, don't include it in your project! -->
    <script src="../../assets/js/setting-demo.js"></script>
    <script>
        function ShowProgressBar() {
            displayProgress();
            displayMaskFrame();
        }

        // 隱藏讀取遮罩
        function HideProgressBar() {
            var progress = $('#divProgress');
            var maskFrame = $("#divMaskFrame");
            progress.hide();
            maskFrame.hide();
        }
        // 顯示讀取畫面
        function displayProgress() {
            var w = $(document).width();
            var h = $(window).height();
            var progress = $('#divProgress');
            progress.css({ "z-index": 999999, "top": (h / 2) - (progress.height() / 2), "left": (w / 2) - (progress.width() / 2) });
            progress.show();
        }
        // 顯示遮罩畫面
        function displayMaskFrame() {
            var w = $(window).width();
            var h = $(document).height();
            var maskFrame = $("#divMaskFrame");
            maskFrame.css({ "z-index": 999998, "opacity": 0.7, "width": w, "height": h });
            maskFrame.show();
        }
    </script>
    <script>
        $(document).ready(function () {
            $('#basic-datatables').DataTable({
            });

            $('#multi-filter-select').DataTable({
                "pageLength": 5,
                initComplete: function () {
                    this.api().columns().every(function () {
                        var column = this;
                        var select = $('<select class="form-control"><option value=""></option></select>')
                            .appendTo($(column.footer()).empty())
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search(val ? '^' + val + '$' : '', true, false)
                                    .draw();
                            });

                        column.data().unique().sort().each(function (d, j) {
                            select.append('<option value="' + d + '">' + d + '</option>')
                        });
                    });
                }
            });

            // Add Row
            $('#add-row').DataTable({
                "pageLength": 5,
            });

            var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip"  class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

            $('#addRowButton').click(function () {
                $('#add-row').dataTable().fnAddData([
                    $("#addName").val(),
                    $("#addPosition").val(),
                    $("#addOffice").val(),
                    action
                ]);
                $('#addRowModal').modal('hide');

            });
        });
    </script>
</asp:Content>

