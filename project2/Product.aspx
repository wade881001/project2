<%@ Page Title="產品管理系統" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="_0225.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
    <title>產品管理系統</title>
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
								<a href="Product.aspx">產品管理系統</a>
							</li>
						</ul>
					</div>
                    <div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">產品管理系統</h4>
                                        <h4 style="right:21.5%;top:27px;position:absolute;font-size:15px">每頁顯示</h4>
                                        <h4 style="right:13%;top:27px;position:absolute;font-size:15px">筆資料</h4>
                                        <asp:DropDownList ID="DropDownList1" runat="server" style="right:17%;top:19px;position:absolute;font-size:15px;width:50px;height:30px" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="15">15</asp:ListItem>
                                            <asp:ListItem Value="30">30</asp:ListItem>
                                        </asp:DropDownList>
										<button class="btn btn-primarybtn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
											<i class="fa fa-plus"></i>
											新增
										</button>
									</div>
								</div>
								<div class="card-body">
									<!-- Modal -->
									
                                        <div class="table-responsive">
					<asp:GridView ID="GridView1" class="display table table-striped table-hover" runat="server"  AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="num" PageSize="3"
         >
        <AlternatingRowStyle Width="600px" Wrap="False" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/assets/img/123.png" Text="更新" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/assets/img/123.png" Text="編輯" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/assets/img/1234.png" OnClientClick="return confirm('確定刪除此筆資料嗎')" Text="刪除" />
                </ItemTemplate>
            </asp:TemplateField>
 <asp:BoundField DataField="num" HeaderText="產品編號" ReadOnly="True" SortExpression="num" />
            <asp:BoundField DataField="temptype" HeaderText="產品溫度類別" SortExpression="temptype" />
            <asp:BoundField DataField="name" HeaderText="品名" SortExpression="name" />
            <asp:BoundField DataField="length" HeaderText="長度(cm)" SortExpression="length" />
            <asp:BoundField DataField="width" HeaderText="寬度(cm)" SortExpression="width" />
            <asp:BoundField DataField="height" HeaderText="高度(cm)" SortExpression="height" />
            <asp:BoundField DataField="weight" HeaderText="重量(g)" SortExpression="weight" />
            <asp:BoundField DataField="other" HeaderText="備註" SortExpression="other" />
        </Columns>
        <EditRowStyle Wrap="False" />
        <EmptyDataRowStyle Wrap="True" />
        <RowStyle Wrap="True" />
</asp:GridView>
									</div>
								</div>
             		<div class="card-body">
                    	   
						 									<div class="table-responsive">
                       <table id="add-row" class="display table table-striped table-hover" >
						   </table>
    </div>
    <div runat="server" visible="false" id="add">
        <asp:DetailsView ID="DetailsView1" visible="False" style="left:39%;bottom:15%;position:absolute;width:300px;height:350px" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource1" DefaultMode="Insert" AutoGenerateRows="False" CellPadding="4" DataKeyNames="num" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="num" HeaderText="num" ReadOnly="True" SortExpression="num" />
            <asp:BoundField DataField="temptype" HeaderText="temptype" SortExpression="temptype" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="length" HeaderText="length" SortExpression="length" />
            <asp:BoundField DataField="width" HeaderText="width" SortExpression="width" />
            <asp:BoundField DataField="height" HeaderText="height" SortExpression="height" />
            <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
            <asp:BoundField DataField="other" HeaderText="other" SortExpression="other" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:Button ID="上傳資料" runat="server" visible="true" Text="新增" style="left:47%;bottom:6%;position:absolute;width:80px;height:40px"/>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString17 %>" DeleteCommand="DELETE FROM [Product] WHERE [num] = @num" InsertCommand="INSERT INTO [Product] ([num], [temptype], [name], [length], [width], [height], [weight], [other]) VALUES (@num, @temptype, @name, @length, @width, @height, @weight, @other)" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [temptype] = @temptype, [name] = @name, [length] = @length, [width] = @width, [height] = @height, [weight] = @weight, [other] = @other WHERE [num] = @num">
        <DeleteParameters>
            <asp:Parameter Name="num" Type="String" />
        </DeleteParameters>
        <InsertParameters>
               <asp:Parameter Name="num" Type="String" />
            <asp:Parameter Name="temptype" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="length" Type="Int32" />
            <asp:Parameter Name="width" Type="Int32" />
            <asp:Parameter Name="height" Type="Int32" />
            <asp:Parameter Name="weight" Type="Int32" />
            <asp:Parameter Name="other" Type="String" />
        </InsertParameters>
        <UpdateParameters>
              <asp:Parameter Name="temptype" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="length" Type="Int32" />
            <asp:Parameter Name="width" Type="Int32" />
            <asp:Parameter Name="height" Type="Int32" />
            <asp:Parameter Name="weight" Type="Int32" />
            <asp:Parameter Name="other" Type="String" />
            <asp:Parameter Name="num" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
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
