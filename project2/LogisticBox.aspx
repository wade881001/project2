<%@ Page Title="物流箱管理系統" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="LogisticBox.aspx.cs" Inherits="_0225.LogisticBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" visible="true" id="initial">
        <head>
            <title>物流箱管理系統</title>
        </head>
        <div class="main-panel">
            <div class="content">
                <div class="page-inner">
                    <div class="page-header">
                        <h4 class="page-title">爭鮮配送系統
                        </h4>
                        <ul class="breadcrumbs">
                            <li class="nav-home">
                                <a href="MainPage.aspx">
                                    <i class="flaticon-home"></i>
                                </a>
                            </li>
                            <li class="separator">
                                <i class="flaticon-right-arrow"></i>
                            </li>
                            <li class="nav-item">
                                <a href="#">基本資料維護</a>
                            </li>
                            <li class="separator">
                                <i class="flaticon-right-arrow"></i>
                            </li>
                            <li class="nav-item">
                                <a href="LogisticBox.aspx">物流箱管理系統</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex align-items-center">
                                    <h4 class="card-title">物流箱管理系統</h4>
                                    <asp:Button ID="Button1" runat="server" style="right: 39%; top: 21px; position: absolute; font-size: 15px" Text="搜尋" OnClick="Search_Click" />
                                    <asp:Button ID="Button2" runat="server" style="right: 33%; top: 21px; position: absolute; font-size: 15px" Text="重置搜尋結果" OnClick="Reset_Click" Visible="false" />
                                    <asp:TextBox ID="Search" runat="server" style="right: 45%; top: 21px; position: absolute; font-size: 15px;width: 120px"></asp:TextBox>
                                    <asp:TextBox ID="Search2" runat="server" style="right: 45%; top: 21px; position: absolute; font-size: 15px;width: 120px" Visible="false"></asp:TextBox>
                                    <asp:DropDownList ID="DropDownList2" runat="server" Style="left: 25%; top: 21px; position: absolute; font-size: 15px; width: 120px; height: 28px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>選擇查詢目標</asp:ListItem>
                                        <asp:ListItem>物流箱各種類</asp:ListItem>
                                        <asp:ListItem>體積或材積</asp:ListItem>
                                    </asp:DropDownList>
                                    <h4 style="right: 23.5%; top: 27px; position: absolute; font-size: 15px">每頁顯示</h4>
                                    <h4 style="right: 13%; top: 27px; position: absolute; font-size: 15px">筆資料</h4>
                                    <asp:DropDownList ID="DropDownList1" runat="server" Style="right: 18%; top: 21px; position: absolute; font-size: 15px; width: 50px; height: 28px" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                        <asp:ListItem Value="30">30</asp:ListItem>
                                        <asp:ListItem Value="50">50</asp:ListItem>
                                        <asp:ListItem Value="100">100</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="新增" class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal" runat="server" OnClick="上傳資料_Click" Text="新增資料"></asp:Button>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- Modal -->

                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" class="display table table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="Box_type,Second_box_type" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="display table table-striped table-hover">
                                        <AlternatingRowStyle Width="600px" Wrap="False" />
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" SelectText="編輯" />
                                            <asp:BoundField DataField="Box_type" HeaderText="物流箱種類" ReadOnly="True" SortExpression="Box_type" />
                                            <asp:BoundField DataField="Second_box_type" HeaderText="物流箱第二種類" SortExpression="Second_box_type" ReadOnly="True" />
                                            <asp:BoundField DataField="Volumn" HeaderText="體積" SortExpression="Volumn" />
                                            <asp:BoundField DataField="Cuft" HeaderText="材積" SortExpression="Cuft" />
                                        </Columns>
                                        <EditRowStyle Wrap="False" />
                                        <EmptyDataRowStyle Wrap="True" />
                                        <RowStyle Wrap="True" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" SelectCommand="SELECT * FROM [LogisticBox] WHERE (([Box_type] LIKE '%' + @Box_type + '%') OR ([Second_box_type] LIKE '%' + @Second_box_type + '%'))" DeleteCommand="DELETE FROM [LogisticBox] WHERE [Box_type] = @Box_type OR [Second_box_type] = @Second_box_type" InsertCommand="INSERT INTO [LogisticBox] ([Box_type], [Second_box_type], [Volumn], [Cuft]) VALUES (@Box_type, @Second_box_type, @Volumn, @Cuft)" UpdateCommand="UPDATE [LogisticBox] SET [Volumn] = @Volumn, [Cuft] = @Cuft WHERE [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                            <asp:Parameter Name="Volumn" Type="Double" />
                                            <asp:Parameter Name="Cuft" Type="Double" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Box_type" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="Search" Name="Second_box_type" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Volumn" Type="Double" />
                                            <asp:Parameter Name="Cuft" Type="Double" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" SelectCommand="SELECT * FROM [LogisticBox] WHERE (([Cuft] = @Cuft) OR ([Volumn] = @Volumn))" DeleteCommand="DELETE FROM [LogisticBox] WHERE [Box_type] = @Box_type OR [Second_box_type] = @Second_box_type" InsertCommand="INSERT INTO [LogisticBox] ([Box_type], [Second_box_type], [Volumn], [Cuft]) VALUES (@Box_type, @Second_box_type, @Volumn, @Cuft)" UpdateCommand="UPDATE [LogisticBox] SET [Volumn] = @Volumn, [Cuft] = @Cuft WHERE [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                            <asp:Parameter Name="Volumn" Type="Double" />
                                            <asp:Parameter Name="Cuft" Type="Double" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search2" Name="Cuft" PropertyName="Text" Type="Double" />
                                            <asp:ControlParameter ControlID="Search2" Name="Volumn" PropertyName="Text" Type="Double" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Volumn" Type="Double" />
                                            <asp:Parameter Name="Cuft" Type="Double" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [LogisticBox] WHERE [Box_type] = @Box_type OR [Second_box_type] = @Second_box_type" InsertCommand="INSERT INTO [LogisticBox] ([Box_type], [Second_box_type], [Volumn], [Cuft]) VALUES (@Box_type, @Second_box_type, @Volumn, @Cuft)" SelectCommand="SELECT * FROM [LogisticBox]" UpdateCommand="UPDATE [LogisticBox] SET [Volumn] = @Volumn, [Cuft] = @Cuft WHERE [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                            <asp:Parameter Name="Volumn" Type="Double" />
                                            <asp:Parameter Name="Cuft" Type="Double" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Volumn" Type="Double" />
                                            <asp:Parameter Name="Cuft" Type="Double" />
                                            <asp:Parameter Name="Box_type" Type="String" />
                                            <asp:Parameter Name="Second_box_type" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table id="add-row" class="display table table-striped table-hover">
                                    </table>
                                </div>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [LogisticBox] WHERE [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type" InsertCommand="INSERT INTO [LogisticBox] ([Box_type], [Second_box_type], [Volumn], [Cuft]) VALUES (@Box_type, @Second_box_type, @Volumn, @Cuft)" SelectCommand="SELECT * FROM [LogisticBox]" UpdateCommand="UPDATE [LogisticBox] SET [Volumn] = @Volumn, [Cuft] = @Cuft WHERE [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Box_type" Type="String" />
                                        <asp:Parameter Name="Second_box_type" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Box_type" Type="String" />
                                        <asp:Parameter Name="Second_box_type" Type="String" />
                                        <asp:Parameter Name="Volumn" Type="Double" />
                                        <asp:Parameter Name="Cuft" Type="Double" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Volumn" Type="Double" />
                                        <asp:Parameter Name="Cuft" Type="Double" />
                                        <asp:Parameter Name="Box_type" Type="String" />
                                        <asp:Parameter Name="Second_box_type" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="Box_type,Second_box_type" CssClass="display table table-striped table-hover" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="800px" Visible="False">
                                    <Fields>
                                        <asp:BoundField DataField="Box_type" HeaderText="物流箱種類" ReadOnly="True" SortExpression="Box_type" />
                                        <asp:BoundField DataField="Second_box_type" HeaderText="物流箱第二種類" SortExpression="Second_box_type" ReadOnly="True" />
                                        <asp:BoundField DataField="Volumn" HeaderText="體積" SortExpression="Volumn" />
                                        <asp:BoundField DataField="Cuft" HeaderText="材積" SortExpression="Cuft" />
                                        <asp:TemplateField ShowHeader="False">
                                            <InsertItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary btn-round ml-auto" CausesValidation="True" CommandName="Insert" OnClientClick="return confirm('確認新增此筆資料嗎?')" Text="新增" OnClick="Add_Click"></asp:LinkButton>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                </asp:DetailsView>
                                <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataKeyNames="Box_type,Second_box_type" CssClass="display table table-striped table-hover" DataSourceID="SqlDataSource3" Height="50px" Width="500px" Style="right: 40%" OnItemUpdated="DetailsView3_ItemUpdated1" OnItemDeleted="DetailsView3_ItemDeleted" Visible="False">
                                    <Fields>
                                        <asp:BoundField DataField="Box_type" HeaderText="物流箱種類" ReadOnly="True" SortExpression="Box_type" />
                                        <asp:BoundField DataField="Second_box_type" HeaderText="物流箱第二種類" SortExpression="Second_box_type" ReadOnly="True" />
                                        <asp:BoundField DataField="Volumn" HeaderText="體積" SortExpression="Volumn" />
                                        <asp:BoundField DataField="Cuft" HeaderText="材積" SortExpression="Cuft" />
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    </Fields>
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [LogisticBox] WHERE [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type" InsertCommand="INSERT INTO [LogisticBox] ([Box_type], [Second_box_type], [Volumn], [Cuft]) VALUES (@Box_type, @Second_box_type, @Volumn, @Cuft)" SelectCommand="SELECT * FROM [LogisticBox] WHERE (([Box_type] = @Box_type) AND ([Second_box_type] = @Second_box_type))" UpdateCommand="UPDATE [LogisticBox] SET [Volumn] = @Volumn, [Cuft] = @Cuft WHERE [Box_type] = @Box_type AND [Second_box_type] = @Second_box_type">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Box_type" Type="String" />
                                        <asp:Parameter Name="Second_box_type" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Box_type" Type="String" />
                                        <asp:Parameter Name="Second_box_type" Type="String" />
                                        <asp:Parameter Name="Volumn" Type="Double" />
                                        <asp:Parameter Name="Cuft" Type="Double" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox4" Name="Box_type" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="TextBox5" Name="Second_box_type" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Volumn" Type="Double" />
                                        <asp:Parameter Name="Cuft" Type="Double" />
                                        <asp:Parameter Name="Box_type" Type="String" />
                                        <asp:Parameter Name="Second_box_type" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="TextBox4" runat="server" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="TextBox5" runat="server" Visible="false"></asp:TextBox>
                                <asp:Button ID="bntBack" class="btn btn-primary btn-round ml-auto" runat="server" OnClick="BntBack_Click" Text="返回" Visible="false" Style="left: 10.5%; bottom: 11.1%; position: absolute; width: 62px; height: 39px" />

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
	<script >
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

            var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

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
