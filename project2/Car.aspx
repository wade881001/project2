<%@ Page Title="車輛管理系統" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Car.aspx.cs" Inherits="_0225.Car" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" visible="true" id="initial">
        <head>
            <title>車輛管理系統</title>
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
                                <a href="Car.aspx">車輛管理系統</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex align-items-center">
                                    <h4 class="card-title">車輛管理系統</h4>
                                    <asp:Button ID="Button1" runat="server" style="right: 39%; top: 21px; position: absolute; font-size: 15px" Text="搜尋" OnClick="Search_Click" />
                                    <asp:Button ID="Button2" runat="server" style="right: 33%; top: 21px; position: absolute; font-size: 15px" Text="重置搜尋結果" OnClick="Reset_Click" Visible="false" />
                                    <asp:TextBox ID="Search" runat="server" style="right: 45%; top: 21px; position: absolute; font-size: 15px;width: 120px"></asp:TextBox>
                                    <asp:DropDownList ID="DropDownList2" runat="server" Style="left: 25%; top: 21px; position: absolute; font-size: 15px; width: 120px; height: 28px"  AutoPostBack="True">
                                        <asp:ListItem>選擇查詢目標</asp:ListItem>
                                        <asp:ListItem>車輛編號</asp:ListItem>
                                        <asp:ListItem>車輛體積</asp:ListItem>
                                        <asp:ListItem>車輛溫度類別</asp:ListItem>
                                        <asp:ListItem>行駛區域</asp:ListItem>
                                    </asp:DropDownList>
                                    <h4 style="right: 23.5%; top: 27px; position: absolute; font-size: 15px">每頁顯示</h4>
                                    <h4 style="right: 13%; top: 27px; position: absolute; font-size: 15px">筆資料</h4>
                                    <asp:DropDownList ID="DropDownList1" runat="server" Style="right: 18%; top: 21px; position: absolute; font-size: 15px; width: 50px; height: 28px" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                        <asp:ListItem Value="15">15</asp:ListItem>
                                        <asp:ListItem Value="30">30</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="新增" class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal" runat="server" OnClick="上傳資料_Click" Text="新增資料"></asp:Button>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- Modal -->

                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" class="display table table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="Num" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="display table table-striped table-hover">
                                        <AlternatingRowStyle Width="600px" Wrap="False" />
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" SelectText="編輯" />
                                            <asp:BoundField DataField="Num" HeaderText="車輛編號" ReadOnly="True" SortExpression="Num" />
                                            <asp:BoundField DataField="Dimension" HeaderText="車輛體積" SortExpression="Dimension" />
                                            <asp:BoundField DataField="Temperature" HeaderText="車輛溫度類別" SortExpression="Temperature" />
                                            <asp:BoundField DataField="Area" HeaderText="行駛區域" SortExpression="Area" />
                                        </Columns>
                                        <EditRowStyle Wrap="False" />
                                        <EmptyDataRowStyle Wrap="True" />
                                        <RowStyle Wrap="True" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSourceNum" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" SelectCommand="SELECT * FROM [Car] WHERE ([Num] LIKE '%' + @Num + '%')" DeleteCommand="DELETE FROM [Car] WHERE [Num] = @Num" InsertCommand="INSERT INTO [Car] ([Num], [Dimension], [Temperature], [Area]) VALUES (@Num, @Dimension, @Temperature, @Area)" UpdateCommand="UPDATE [Car] SET [Dimension] = @Dimension, [Temperature] = @Temperature, [Area] = @Area WHERE [Num] = @Num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Num" Type="String" />
                                            <asp:Parameter Name="Dimension" Type="String" />
                                            <asp:Parameter Name="Temperature" Type="String" />
                                            <asp:Parameter Name="Area" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Num" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Dimension" Type="String" />
                                            <asp:Parameter Name="Temperature" Type="String" />
                                            <asp:Parameter Name="Area" Type="String" />
                                            <asp:Parameter Name="Num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceDimension" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Car] WHERE [Num] = @Num" InsertCommand="INSERT INTO [Car] ([Num], [Dimension], [Temperature], [Area]) VALUES (@Num, @Dimension, @Temperature, @Area)" SelectCommand="SELECT * FROM [Car] WHERE ([Dimension] = @Dimension)" UpdateCommand="UPDATE [Car] SET [Dimension] = @Dimension, [Temperature] = @Temperature, [Area] = @Area WHERE [Num] = @Num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Num" Type="String" />
                                            <asp:Parameter Name="Dimension" Type="String" />
                                            <asp:Parameter Name="Temperature" Type="String" />
                                            <asp:Parameter Name="Area" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Dimension" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Dimension" Type="String" />
                                            <asp:Parameter Name="Temperature" Type="String" />
                                            <asp:Parameter Name="Area" Type="String" />
                                            <asp:Parameter Name="Num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceTemperature" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Car] WHERE [Num] = @Num" InsertCommand="INSERT INTO [Car] ([Num], [Dimension], [Temperature], [Area]) VALUES (@Num, @Dimension, @Temperature, @Area)" SelectCommand="SELECT * FROM [Car] WHERE ([Temperature] LIKE '%' + @Temperature + '%')" UpdateCommand="UPDATE [Car] SET [Dimension] = @Dimension, [Temperature] = @Temperature, [Area] = @Area WHERE [Num] = @Num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Num" Type="String" />
                                            <asp:Parameter Name="Dimension" Type="String" />
                                            <asp:Parameter Name="Temperature" Type="String" />
                                            <asp:Parameter Name="Area" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Temperature" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Dimension" Type="String" />
                                            <asp:Parameter Name="Temperature" Type="String" />
                                            <asp:Parameter Name="Area" Type="String" />
                                            <asp:Parameter Name="Num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceArea" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Car] WHERE [Num] = @Num" InsertCommand="INSERT INTO [Car] ([Num], [Dimension], [Temperature], [Area]) VALUES (@Num, @Dimension, @Temperature, @Area)" SelectCommand="SELECT * FROM [Car] WHERE ([Area] LIKE '%' + @Area + '%')" UpdateCommand="UPDATE [Car] SET [Dimension] = @Dimension, [Temperature] = @Temperature, [Area] = @Area WHERE [Num] = @Num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Num" Type="String" />
                                            <asp:Parameter Name="Dimension" Type="String" />
                                            <asp:Parameter Name="Temperature" Type="String" />
                                            <asp:Parameter Name="Area" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Area" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Dimension" Type="String" />
                                            <asp:Parameter Name="Temperature" Type="String" />
                                            <asp:Parameter Name="Area" Type="String" />
                                            <asp:Parameter Name="Num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Car] WHERE [Num] = @Num" InsertCommand="INSERT INTO [Car] ([Num], [Dimension], [Temperature], [Area]) VALUES (@Num, @Dimension, @Temperature, @Area)" SelectCommand="SELECT * FROM [Car]" UpdateCommand="UPDATE [Car] SET [Dimension] = @Dimension, [Temperature] = @Temperature, [Area] = @Area WHERE [Num] = @Num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Num" Type="String" />
                                            <asp:Parameter Name="Dimension" Type="String" />
                                            <asp:Parameter Name="Temperature" Type="String" />
                                            <asp:Parameter Name="Area" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Dimension" Type="String" />
                                            <asp:Parameter Name="Temperature" Type="String" />
                                            <asp:Parameter Name="Area" Type="String" />
                                            <asp:Parameter Name="Num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table id="add-row" class="display table table-striped table-hover">
                                    </table>
                                </div>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Car] WHERE [Num] = @Num" InsertCommand="INSERT INTO [Car] ([Num], [Dimension], [Temperature], [Area]) VALUES (@Num, @Dimension, @Temperature, @Area)" SelectCommand="SELECT * FROM [Car]" UpdateCommand="UPDATE [Car] SET [Dimension] = @Dimension, [Temperature] = @Temperature, [Area] = @Area WHERE [Num] = @Num">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Num" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Num" Type="String" />
                                        <asp:Parameter Name="Dimension" Type="String" />
                                        <asp:Parameter Name="Temperature" Type="String" />
                                        <asp:Parameter Name="Area" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="GridView1" Name="Num" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Dimension" Type="String" />
                                        <asp:Parameter Name="Temperature" Type="String" />
                                        <asp:Parameter Name="Area" Type="String" />
                                        <asp:Parameter Name="Num" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="Num" CssClass="display table table-striped table-hover" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="800px" Visible="False">
                                    <Fields>
                                        <asp:BoundField DataField="Num" HeaderText="車輛編號" ReadOnly="True" SortExpression="Num" />
                                        <asp:BoundField DataField="Dimension" HeaderText="車輛體積" SortExpression="Dimension" />
                                        <asp:TemplateField HeaderText="車輛溫度類別" SortExpression="Temperature">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Temperature") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Temperature") %>'>
                                                    <asp:ListItem>常溫</asp:ListItem>
                                                    <asp:ListItem>冷藏</asp:ListItem>
                                                    <asp:ListItem>冷凍</asp:ListItem>
                                                </asp:DropDownList>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Temperature") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Area" HeaderText="行駛區域" SortExpression="Area" />
                                        <asp:TemplateField ShowHeader="False">
                                            <InsertItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary btn-round ml-auto" CausesValidation="True" CommandName="Insert" OnClientClick="return confirm('確認新增此筆資料嗎?')" OnClick="Add_Click" Text="新增"></asp:LinkButton>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                </asp:DetailsView>
                                <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataKeyNames="Num" CssClass="display table table-striped table-hover" DataSourceID="SqlDataSource3" Height="50px" Width="500px" Style="right: 40%" OnItemUpdated="DetailsView3_ItemUpdated1" OnItemDeleted="DetailsView3_ItemDeleted" Visible="False">
                                    <Fields>
                                        <asp:BoundField DataField="Num" HeaderText="車輛編號" ReadOnly="True" SortExpression="Num" />
                                        <asp:BoundField DataField="Dimension" HeaderText="車輛體積" SortExpression="Dimension" />
                                        <asp:BoundField DataField="Temperature" HeaderText="車輛溫度類別" SortExpression="Temperature" />
                                        <asp:BoundField DataField="Area" HeaderText="行駛區域" SortExpression="Area" />
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    </Fields>
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Car] WHERE [Num] = @Num" InsertCommand="INSERT INTO [Car] ([Num], [Dimension], [Temperature], [Area]) VALUES (@Num, @Dimension, @Temperature, @Area)" SelectCommand="SELECT * FROM [Car] WHERE ([Num] = @Num)" UpdateCommand="UPDATE [Car] SET [Dimension] = @Dimension, [Temperature] = @Temperature, [Area] = @Area WHERE [Num] = @Num">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Num" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Num" Type="String" />
                                        <asp:Parameter Name="Dimension" Type="String" />
                                        <asp:Parameter Name="Temperature" Type="String" />
                                        <asp:Parameter Name="Area" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox4" Name="Num" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Dimension" Type="String" />
                                        <asp:Parameter Name="Temperature" Type="String" />
                                        <asp:Parameter Name="Area" Type="String" />
                                        <asp:Parameter Name="Num" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="TextBox4" runat="server" Visible="false"></asp:TextBox>
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
