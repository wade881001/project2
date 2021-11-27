<%@ Page Title="人員管理系統" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="_0225.Employee" %>

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
                                    <asp:Button ID="Button1" runat="server" style="right: 39%; top: 21px; position: absolute; font-size: 15px" Text="搜尋" OnClick="Search_Click" />
                                    <asp:Button ID="Button2" runat="server" style="right: 33%; top: 21px; position: absolute; font-size: 15px" Text="重置搜尋結果" OnClick="Reset_Click" Visible="false" />
                                    <asp:TextBox ID="Search" runat="server" style="right: 45%; top: 21px; position: absolute; font-size: 15px;width: 120px"></asp:TextBox>
                                    <asp:DropDownList ID="DropDownList2" runat="server" Style="left: 25%; top: 21px; position: absolute; font-size: 15px; width: 120px; height: 28px"  AutoPostBack="True">
                                        <asp:ListItem >選擇查詢類別</asp:ListItem>
                                        <asp:ListItem >人員</asp:ListItem>
                                        <asp:ListItem >帳號</asp:ListItem>
                                        <asp:ListItem >姓名</asp:ListItem>
                                        <asp:ListItem >身分證字號</asp:ListItem>
                                        <asp:ListItem >性別</asp:ListItem>
                                        <asp:ListItem >年齡</asp:ListItem>
                                        <asp:ListItem >職位</asp:ListItem>
                                        <asp:ListItem >權限</asp:ListItem>
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
                                    <asp:GridView ID="GridView1" class="display table table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="memid" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                        CssClass="display table table-striped table-hover">
                                        <AlternatingRowStyle Width="600px" Wrap="False" />
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" SelectText="編輯" />
                                            <asp:BoundField DataField="memid" HeaderText="人員" ReadOnly="True" SortExpression="memid" />
                                            <asp:BoundField DataField="account" HeaderText="帳號" SortExpression="account" />
                                            <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                                            <asp:BoundField DataField="idnum" HeaderText="身分證字號" SortExpression="idnum" />
                                            <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                                            <asp:BoundField DataField="age" HeaderText="年齡" SortExpression="age" />
                                            <asp:BoundField DataField="position" HeaderText="職位" SortExpression="position" />
                                            <asp:BoundField DataField="authority" HeaderText="權限" SortExpression="authority" />
                                        </Columns>
                                        <EditRowStyle Wrap="False" />
                                        <EmptyDataRowStyle Wrap="True" />

                                        <RowStyle Wrap="True" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSourceMemid" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [idnum], [gender], [birthday], [position], [authority]) VALUES (@memid, @account, @name, @idnum, @gender, @birthday, @position, @authority)" SelectCommand="SELECT [memid], [account], [name], [idnum], [gender],FLOOR(DATEDIFF(DY,[Birthday],GETDATE())/365.25) AS 'age', [position], [authority] FROM [Employee] WHERE ([memid] LIKE '%' + @memid + '%')" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [idnum] = @idnum, [gender] = @gender, [birthday] = @birthday, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                        <DeleteParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter DbType="Date" Name="birthday" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="memid" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter DbType="Date" Name="birthday" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                            <asp:Parameter Name="memid" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceAccount" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [idnum], [gender], [birthday], [position], [authority]) VALUES (@memid, @account, @name, @idnum, @gender, @birthday, @position, @authority)" SelectCommand="SELECT [memid], [account], [name], [idnum], [gender],FLOOR(DATEDIFF(DY,[Birthday],GETDATE())/365.25) AS 'age', [position], [authority] FROM [Employee] WHERE ([account] LIKE '%' + @account + '%')" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [idnum] = @idnum, [gender] = @gender, [birthday] = @birthday, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                        <DeleteParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="account" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                            <asp:Parameter Name="memid" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceName" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" SelectCommand="SELECT [memid], [account], [name], [idnum], [gender],FLOOR(DATEDIFF(DY,[Birthday],GETDATE())/365.25) AS 'age', [position], [authority] FROM [Employee] WHERE ([name] LIKE '%' + @name + '%')" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [idnum], [gender], [birthday], [position], [authority]) VALUES (@memid, @account, @name, @idnum, @gender, @birthday, @position, @authority)" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [idnum] = @idnum, [gender] = @gender, [birthday] = @birthday, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                        <DeleteParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="name" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                            <asp:Parameter Name="memid" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceIdnum" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [idnum], [gender], [birthday], [position], [authority]) VALUES (@memid, @account, @name, @idnum, @gender, @birthday, @position, @authority)" SelectCommand="SELECT [memid], [account], [name], [idnum], [gender],FLOOR(DATEDIFF(DY,[Birthday],GETDATE())/365.25) AS 'age', [position], [authority] FROM [Employee] WHERE ([idnum] LIKE '%' + @idnum + '%')" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [idnum] = @idnum, [gender] = @gender, [birthday] = @birthday, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                        <DeleteParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="idnum" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                            <asp:Parameter Name="memid" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceGender" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [idnum], [gender], [birthday], [position], [authority]) VALUES (@memid, @account, @name, @idnum, @gender, @birthday, @position, @authority)" SelectCommand="SELECT [memid], [account], [name], [idnum], [gender],FLOOR(DATEDIFF(DY,[Birthday],GETDATE())/365.25) AS 'age', [position], [authority] FROM [Employee] WHERE ([gender] LIKE '%' + @gender + '%')" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [idnum] = @idnum, [gender] = @gender, [birthday] = @birthday, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                        <DeleteParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="gender" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                            <asp:Parameter Name="memid" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceAge" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [idnum], [gender], [birthday], [position], [authority]) VALUES (@memid, @account, @name, @idnum, @gender, @birthday, @position, @authority)" SelectCommand="SELECT [memid], [account], [name], [idnum], [gender],FLOOR(DATEDIFF(DY,[Birthday],GETDATE())/365.25) AS 'age', [position], [authority] FROM [Employee] WHERE (FLOOR(DATEDIFF(DY,[Birthday],GETDATE())/365.25) = @age)" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [idnum] = @idnum, [gender] = @gender, [birthday] = @birthday, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                        <DeleteParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="age" PropertyName="Text" DbType="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                            <asp:Parameter Name="memid" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourcePosition" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [gender], [idnum], [birthday], [position], [authority]) VALUES (@memid, @account, @name, @gender, @idnum, @birthday, @position, @authority)" SelectCommand="SELECT [memid], [account], [name], [gender], [idnum],FLOOR(DATEDIFF(DY,[Birthday],GETDATE())/365.25) AS 'age', [position], [authority] FROM [Employee] WHERE ([position] LIKE '%' + @position + '%')" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [gender] = @gender, [idnum] = @idnum, [birthday] = @birthday, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                        <DeleteParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="position" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                            <asp:Parameter Name="memid" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceAuthority" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [gender], [idnum], [position], [authority]) VALUES (@memid, @account, @name, @gender, @idnum, @position, @authority)" SelectCommand="SELECT [memid], [account], [name], [gender], [idnum],FLOOR(DATEDIFF(DY,[Birthday],GETDATE())/365.25) AS 'age', [position], [authority] FROM [Employee] WHERE ([authority] LIKE '%' + @authority + '%')" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [gender] = @gender, [idnum] = @idnum, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                        <DeleteParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="authority" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                            <asp:Parameter Name="memid" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [idnum], [gender], [birthday], [position], [authority]) VALUES (@memid, @account, @name, @idnum, @gender, @birthday, @position, @authority)" SelectCommand="SELECT [memid], [account], [password], [name], [idnum], [gender],FLOOR(DATEDIFF(DY,[Birthday],GETDATE())/365.25) AS 'age', [position], [authority] FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [idnum] = @idnum, [gender] = @gender, [birthday] = @birthday, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                        <DeleteParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="memid" Type="String" />
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="account" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="idnum" Type="String" />
                                            <asp:Parameter Name="gender" Type="String" />
                                            <asp:Parameter Name="birthday" DbType="Date" />
                                            <asp:Parameter Name="position" Type="String" />
                                            <asp:Parameter Name="authority" Type="String" />
                                            <asp:Parameter Name="memid" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table id="add-row" class="display table table-striped table-hover">
                                    </table>
                                </div>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [password], [name], [idnum], [gender], [birthday], [position], [authority]) VALUES (@memid, @account, @password, @name, @idnum, @gender, @birthday, @position, @authority)" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [account] = @account, [password] = @password, [name] = @name, [idnum] = @idnum, [gender] = @gender, [birthday] = @birthday, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                    <DeleteParameters>
                                        <asp:Parameter Name="memid" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="memid" Type="String" />
                                        <asp:Parameter Name="account" Type="String" />
                                        <asp:Parameter Name="password" Type="String" />
                                        <asp:Parameter Name="name" Type="String" />
                                        <asp:Parameter Name="idnum" Type="String" />
                                        <asp:Parameter Name="gender" Type="String" />
                                        <asp:Parameter Name="birthday" DbType="Date" />
                                        <asp:Parameter Name="position" Type="String" />
                                        <asp:Parameter Name="authority" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="account" Type="String" />
                                        <asp:Parameter Name="password" Type="String" />
                                        <asp:Parameter Name="name" Type="String" />
                                        <asp:Parameter Name="idnum" Type="String" />
                                        <asp:Parameter Name="gender" Type="String" />
                                        <asp:Parameter Name="birthday" DbType="Date" />
                                        <asp:Parameter Name="position" Type="String" />
                                        <asp:Parameter Name="authority" Type="String" />
                                        <asp:Parameter Name="memid" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="memid" CssClass="display table table-striped table-hover" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="800px" Visible="False">
                                    <Fields>
                                        <asp:BoundField DataField="memid" HeaderText="人員" ReadOnly="True" SortExpression="memid" />
                                        <asp:BoundField DataField="account" HeaderText="帳號" SortExpression="account" />
                                        <asp:BoundField DataField="password" HeaderText="密碼" SortExpression="password" />
                                        <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                                        <asp:BoundField DataField="idnum" HeaderText="身分證字號" SortExpression="idnum" />
                                        <asp:TemplateField HeaderText="性別" SortExpression="gender">
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
                                        <asp:BoundField DataField="birthday" HeaderText="生日" SortExpression="birthday" />
                                        <asp:TemplateField HeaderText="職位" SortExpression="position">
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
                                        <asp:TemplateField HeaderText="權限" SortExpression="authority">
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
                                        <asp:TemplateField ShowHeader="False">
                                            <InsertItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary btn-round ml-auto" CausesValidation="True" CommandName="Insert" OnClientClick="return confirm('確認新增此筆資料嗎?')" Text="新增" OnClick="Add_Click"></asp:LinkButton>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                </asp:DetailsView>
                                <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataKeyNames="memid" CssClass="display table table-striped table-hover" Height="50px" Width="800px" Style="right: 40%" OnItemUpdated="DetailsView3_ItemUpdated1" OnItemDeleted="DetailsView3_ItemDeleted" Visible="False">
                                    <Fields>
                                        <asp:BoundField DataField="memid" HeaderText="人員" ReadOnly="True" SortExpression="memid" />
                                        <asp:BoundField DataField="account" HeaderText="帳號" SortExpression="account" />
                                        <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                                        <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                                        <asp:BoundField DataField="idnum" HeaderText="身分證字號" SortExpression="idnum" />
                                        <asp:BoundField DataField="birthday" HeaderText="生日" SortExpression="birthday" DataFormatString="{0:yyyy-MM-dd}" />
                                        <asp:BoundField DataField="position" HeaderText="職位" SortExpression="position" />
                                        <asp:BoundField DataField="authority" HeaderText="權限" SortExpression="authority" />
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    </Fields>
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Employee] WHERE [memid] = @memid" InsertCommand="INSERT INTO [Employee] ([memid], [account], [name], [idnum], [gender], [birthday], [position], [authority]) VALUES (@memid, @account, @name, @idnum, @gender, @birthday, @position, @authority)" SelectCommand="SELECT [memid], [account], [name], [idnum], [gender], [birthday], [position], [authority] FROM [Employee] WHERE ([memid] = @memid)" UpdateCommand="UPDATE [Employee] SET [account] = @account, [name] = @name, [idnum] = @idnum, [gender] = @gender, [birthday] = @birthday, [position] = @position, [authority] = @authority WHERE [memid] = @memid">
                                    <DeleteParameters>
                                        <asp:Parameter Name="memid" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="memid" Type="String" />
                                        <asp:Parameter Name="account" Type="String" />
                                        <asp:Parameter Name="name" Type="String" />
                                        <asp:Parameter Name="idnum" Type="String" />
                                        <asp:Parameter Name="gender" Type="String" />
                                        <asp:Parameter Name="birthday" DbType="Date" />
                                        <asp:Parameter Name="position" Type="String" />
                                        <asp:Parameter Name="authority" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox4" Name="memid" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="account" Type="String" />
                                        <asp:Parameter Name="name" Type="String" />
                                        <asp:Parameter Name="idnum" Type="String" />
                                        <asp:Parameter Name="gender" Type="String" />
                                        <asp:Parameter Name="birthday" DbType="Date" />
                                        <asp:Parameter Name="position" Type="String" />
                                        <asp:Parameter Name="authority" Type="String" />
                                        <asp:Parameter Name="memid" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="TextBox4" runat="server" Visible="false"></asp:TextBox>
                                <asp:Button ID="bntBack" class="btn btn-primary btn-round ml-auto" runat="server" OnClick="BntBack_Click" Text="返回" Visible="false" Style="left: 10.5%; bottom: 7.2%; position: absolute; width: 62px; height: 39px" />


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