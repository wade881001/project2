<%@ Page title="人員管理系統" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="_0225.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" visible="true" id="initial">
<head>
    <title>人員管理系統</title>
</head>
 <div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<h4 class="page-title">爭鮮配送系統</h4>
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
								<a href="Employee.aspx">人員管理系統</a>
							</li>
						</ul>
					</div>
                    <div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">人員管理系統</h4>
                                        <h4 style="right:21.5%;top:27px;position:absolute;font-size:15px">每頁顯示</h4>
                                        <h4 style="right:13%;top:27px;position:absolute;font-size:15px">筆資料</h4>
                                        <asp:DropDownList ID="DropDownList1" runat="server" style="right:17%;top:19px;position:absolute;font-size:15px;width:50px;height:30px" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="15">15</asp:ListItem>
                                            <asp:ListItem Value="30">30</asp:ListItem>
                                        </asp:DropDownList>
										<asp:Button ID="新增" class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal" runat="server" OnClick="上傳資料_Click" Text="新增資料">
											
										</asp:Button>
									</div>
								</div>
								<div class="card-body">
									<!-- Modal -->
									
                                        <div class="table-responsive">
					<asp:GridView ID="GridView1"  runat="server"  AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="memid" PageSize="3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
        CssClass="display table table-striped table-hover">
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
            <asp:BoundField DataField="memid" HeaderText="員工編號" ReadOnly="True" SortExpression="memid" />
                <asp:BoundField DataField="account" HeaderText="帳號" SortExpression="account" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:BoundField DataField="idnum" HeaderText="身分證字號" SortExpression="idnum" />
                <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                <asp:BoundField DataField="age" HeaderText="年齡" SortExpression="age" />
                <asp:BoundField DataField="position" HeaderText="職位名稱" SortExpression="position" />
            <asp:BoundField DataField="authority" HeaderText="權限" SortExpression="authority" />
        </Columns>
        <EditRowStyle Wrap="False" />
        <EmptyDataRowStyle Wrap="True" />
                        
                        <EmptyDataTemplate>
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="memid" DataSourceID="SqlDataSource1" DefaultMode="Insert"  visible="False" CssClass="display table table-striped table-hover">
                                <Fields>
                                    <asp:BoundField DataField="memid" HeaderText="memid" ReadOnly="True" SortExpression="memid" />
                                    <asp:BoundField DataField="account" HeaderText="account" SortExpression="account" />
                                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                    <asp:BoundField DataField="idnum" HeaderText="idnum" SortExpression="idnum" />
                                     <asp:TemplateField HeaderText="gender" SortExpression="gender">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("gender") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("gender") %>'>
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                    <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                                    <asp:TemplateField HeaderText="position" SortExpression="position">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("position") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("position") %>'>
                                <asp:ListItem>一般職員</asp:ListItem>
                                <asp:ListItem>行銷部門主管</asp:ListItem>
                                <asp:ListItem>測試員</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("position") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="authority" SortExpression="authority">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("authority") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("authority") %>'>
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>N</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("authority") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                    <asp:CommandField ShowCancelButton="False" ShowInsertButton="True" />
                                </Fields>
                            </asp:DetailsView>
                        </EmptyDataTemplate>
                        
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
        <asp:Button ID="上傳資料" runat="server" visible="true" Text="新增" style="left:47%;bottom:6%;position:absolute;width:80px;height:40px"/>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString18 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [idnum], [gender], [age], [position], [authority]) VALUES (@memid, @account, @name, @idnum, @gender, @age, @position, @authority)" SelectCommand="SELECT [memid], [account], [name], [idnum], [gender], [age], [position], [authority] FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [idnum] = @idnum, [gender] = @gender, [age] = @age, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
        <DeleteParameters>
            <asp:Parameter Name="memid" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="memid" Type="String" />
            <asp:Parameter Name="account" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="idnum" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="age" Type="String" />
            <asp:Parameter Name="position" Type="String" />
            <asp:Parameter Name="authority" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="account" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="idnum" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="age" Type="String" />
            <asp:Parameter Name="position" Type="String" />
            <asp:Parameter Name="authority" Type="String" />
            <asp:Parameter Name="memid" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
                         <asp:Button ID="bntBack" runat="server" OnClick="BntBack_Click" Text="返回" visible="false"  style="left:47%;bottom:6%;position:absolute;width:80px;height:40px"/>
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
