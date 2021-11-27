<%@ Page Title="店家管理系統" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="_0225.Store" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" visible="true" id="initial">
        <head>
            <title>店家管理系統</title>
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
                                <a href="Store.aspx">店家管理系統</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex align-items-center">
                                    <h4 class="card-title">店家管理系統</h4>
                                    <asp:Button ID="Button1" runat="server" style="right: 39%; top: 21px; position: absolute; font-size: 15px" Text="搜尋" OnClick="Search_Click" />
                                    <asp:Button ID="Button2" runat="server" style="right: 33%; top: 21px; position: absolute; font-size: 15px" Text="重置搜尋結果" OnClick="Reset_Click" Visible="false" />
                                    <asp:TextBox ID="Search" runat="server" style="right: 45%; top: 21px; position: absolute; font-size: 15px;width: 120px"></asp:TextBox>
                                    <asp:DropDownList ID="DropDownList2" runat="server" Style="left: 25%; top: 21px; position: absolute; font-size: 15px; width: 120px; height: 28px"  AutoPostBack="True">
                                        <asp:ListItem>選擇查詢目標</asp:ListItem>
                                        <asp:ListItem>公司名稱</asp:ListItem>
                                        <asp:ListItem>店名</asp:ListItem>
                                        <asp:ListItem>店號</asp:ListItem>
                                        <asp:ListItem>地址</asp:ListItem>
                                        <asp:ListItem>夜配</asp:ListItem>
                                        <asp:ListItem>可使用 11T</asp:ListItem>
                                        <asp:ListItem>車輛高度限制</asp:ListItem>
                                        <asp:ListItem>到貨時間限制</asp:ListItem>
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
                                    <asp:GridView ID="GridView1" class="display table table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="Store_num" PageSize="10" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="display table table-striped table-hover">
                                        <AlternatingRowStyle Width="600px" Wrap="False" />
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" SelectText="編輯" />
                                            <asp:BoundField DataField="Comp_name" HeaderText="公司名稱" SortExpression="Comp_name" />
                                            <asp:BoundField DataField="Store_name" HeaderText="店名" SortExpression="Store_name" />
                                            <asp:BoundField DataField="Store_num" HeaderText="店號" SortExpression="Store_num" ReadOnly="True" />
                                            <asp:BoundField DataField="Address" HeaderText="地址" SortExpression="Address" />
                                            <asp:BoundField DataField="Type" HeaderText="夜配" SortExpression="Type" />
                                            <asp:BoundField DataField="Eleven_tons_able" HeaderText="可使用 11T" SortExpression="Eleven_tons_able" />
                                            <asp:BoundField DataField="Car_height_limit" HeaderText="車輛高度限制" SortExpression="Car_height_limit" />
                                            <asp:BoundField DataField="Transport_time_limit" HeaderText="到貨時間限制" SortExpression="Transport_time_limit" />
                                        </Columns>
                                        <EditRowStyle Wrap="False" />
                                        <EmptyDataRowStyle Wrap="True" />
                                        <RowStyle Wrap="True" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSourceCompname" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" SelectCommand="SELECT [Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit] FROM [Store] WHERE ([Comp_name] LIKE '%' + @Comp_name + '%')" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit]) VALUES (@Comp_name, @Store_name, @Store_num, @Address, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit)" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Store_name] = @Store_name, [Address] = @Address, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit WHERE [Store_num] = @Store_num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Comp_name" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceStorename" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit]) VALUES (@Comp_name, @Store_name, @Store_num, @Address, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit)" SelectCommand="SELECT [Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit] FROM [Store] WHERE ([Store_name] LIKE '%' + @Store_name + '%')" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Store_name] = @Store_name, [Address] = @Address, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit WHERE [Store_num] = @Store_num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Store_name" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceStorenum" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit]) VALUES (@Comp_name, @Store_name, @Store_num, @Address, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit)" SelectCommand="SELECT [Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit] FROM [Store] WHERE ([Store_num] LIKE '%' + @Store_num + '%')" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Store_name] = @Store_name, [Address] = @Address, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit WHERE [Store_num] = @Store_num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Store_num" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceAddress" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit]) VALUES (@Comp_name, @Store_name, @Store_num, @Address, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit)" SelectCommand="SELECT [Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit] FROM [Store] WHERE ([Address] LIKE '%' + @Address + '%')" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Store_name] = @Store_name, [Address] = @Address, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit WHERE [Store_num] = @Store_num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Address" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceType" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Store_name], [Address], [Store_num], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit]) VALUES (@Comp_name, @Store_name, @Address, @Store_num, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit)" SelectCommand="SELECT [Comp_name], [Store_name], [Address], [Store_num], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit] FROM [Store] WHERE ([Type] LIKE '%' + @Type + '%')" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Store_name] = @Store_name, [Address] = @Address, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit WHERE [Store_num] = @Store_num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Type" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceEleventonsable" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit]) VALUES (@Comp_name, @Store_name, @Store_num, @Address, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit)" SelectCommand="SELECT [Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit] FROM [Store] WHERE ([Eleven_tons_able] LIKE '%' + @Eleven_tons_able + '%')" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Store_name] = @Store_name, [Address] = @Address, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit WHERE [Store_num] = @Store_num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Eleven_tons_able" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceCarheightlimit" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Address], [Store_num], [Store_name], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit]) VALUES (@Comp_name, @Address, @Store_num, @Store_name, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit)" SelectCommand="SELECT [Comp_name], [Address], [Store_num], [Store_name], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit] FROM [Store] WHERE ([Car_height_limit] LIKE '%' + @Car_height_limit + '%')" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Address] = @Address, [Store_name] = @Store_name, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit WHERE [Store_num] = @Store_num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Car_height_limit" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceTransporttimelimit" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit]) VALUES (@Comp_name, @Store_name, @Store_num, @Address, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit)" SelectCommand="SELECT [Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit] FROM [Store] WHERE ([Transport_time_limit] LIKE '%' + @Transport_time_limit + '%')" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Store_name] = @Store_name, [Address] = @Address, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit WHERE [Store_num] = @Store_num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Search" Name="Transport_time_limit" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit]) VALUES (@Comp_name, @Store_name, @Store_num, @Address, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit)" SelectCommand="SELECT [Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit] FROM [Store]" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Store_name] = @Store_name, [Address] = @Address, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit WHERE [Store_num] = @Store_num">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Comp_name" Type="String" />
                                            <asp:Parameter Name="Store_name" Type="String" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                            <asp:Parameter Name="Car_height_limit" Type="String" />
                                            <asp:Parameter Name="Transport_time_limit" Type="String" />
                                            <asp:Parameter Name="Store_num" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table id="add-row" class="display table table-striped table-hover">
                                    </table>
                                </div>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit], [Latitude], [Longitude], [Address_EN]) VALUES (@Comp_name, @Store_name, @Store_num, @Address, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit, @Latitude, @Longitude, @Address_EN)" SelectCommand="SELECT * FROM [Store]" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Store_name] = @Store_name, [Address] = @Address, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit, [Latitude] = @Latitude, [Longitude] = @Longitude, [Address_EN] = @Address_EN WHERE [Store_num] = @Store_num">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Store_num" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Comp_name" Type="String" />
                                        <asp:Parameter Name="Store_name" Type="String" />
                                        <asp:Parameter Name="Store_num" Type="String" />
                                        <asp:Parameter Name="Address" Type="String" />
                                        <asp:Parameter Name="Type" Type="String" />
                                        <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                        <asp:Parameter Name="Car_height_limit" Type="String" />
                                        <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        <asp:Parameter Name="Latitude" Type="Double" />
                                        <asp:Parameter Name="Longitude" Type="Double" />
                                        <asp:Parameter Name="Address_EN" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Comp_name" Type="String" />
                                        <asp:Parameter Name="Store_name" Type="String" />
                                        <asp:Parameter Name="Address" Type="String" />
                                        <asp:Parameter Name="Type" Type="String" />
                                        <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                        <asp:Parameter Name="Car_height_limit" Type="String" />
                                        <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        <asp:Parameter Name="Latitude" Type="Double" />
                                        <asp:Parameter Name="Longitude" Type="Double" />
                                        <asp:Parameter Name="Address_EN" Type="String" />
                                        <asp:Parameter Name="Store_num" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="Store_num" CssClass="display table table-striped table-hover" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="800px" Visible="False">
                                    <Fields>
                                        <asp:BoundField DataField="Comp_name" HeaderText="公司名稱" SortExpression="Comp_name" />
                                        <asp:BoundField DataField="Store_name" HeaderText="店名" SortExpression="Store_name" />
                                        <asp:BoundField DataField="Store_num" HeaderText="店號" SortExpression="Store_num" ReadOnly="True" />
                                        <asp:BoundField DataField="Address" HeaderText="地址" SortExpression="Address" />
                                        <asp:BoundField DataField="Type" HeaderText="夜配" SortExpression="Type" />
                                        <asp:BoundField DataField="Eleven_tons_able" HeaderText="可使用 11T" SortExpression="Eleven_tons_able" />
                                        <asp:BoundField DataField="Car_height_limit" HeaderText="車輛高度限制" SortExpression="Car_height_limit" />
                                        <asp:BoundField DataField="Transport_time_limit" HeaderText="到貨時間限制" SortExpression="Transport_time_limit" />
                                        <asp:BoundField DataField="Latitude" HeaderText="緯度" SortExpression="Latitude" />
                                        <asp:BoundField DataField="Longitude" HeaderText="經度" SortExpression="Longitude" />
                                        <asp:BoundField DataField="Address_EN" HeaderText="英文地址" SortExpression="Address_EN" />
                                        <asp:TemplateField ShowHeader="False">
                                            <InsertItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary btn-round ml-auto" CausesValidation="True" CommandName="Insert" OnClientClick="return confirm('確認新增此筆資料嗎?')" OnClick="Add_Click" Text="新增"></asp:LinkButton>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                </asp:DetailsView>
                                <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataKeyNames="Store_num" CssClass="display table table-striped table-hover" DataSourceID="SqlDataSource3" Height="50px" Width="500px" Style="right: 40%" OnItemUpdated="DetailsView3_ItemUpdated1" OnItemDeleted="DetailsView3_ItemDeleted" Visible="False">
                                    <Fields>
                                        <asp:BoundField DataField="Comp_name" HeaderText="公司名稱" SortExpression="Comp_name" />
                                        <asp:BoundField DataField="Store_name" HeaderText="店名" SortExpression="Store_name" />
                                        <asp:BoundField DataField="Store_num" HeaderText="店號" SortExpression="Store_num" ReadOnly="True" />
                                        <asp:BoundField DataField="Address" HeaderText="地址" SortExpression="Address" />
                                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                        <asp:BoundField DataField="Eleven_tons_able" HeaderText="可使用 11T" SortExpression="Eleven_tons_able" />
                                        <asp:BoundField DataField="Car_height_limit" HeaderText="車輛高度限制" SortExpression="Car_height_limit" />
                                        <asp:BoundField DataField="Transport_time_limit" HeaderText="到貨時間限制" SortExpression="Transport_time_limit" />
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    </Fields>
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Store] WHERE [Store_num] = @Store_num" InsertCommand="INSERT INTO [Store] ([Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit]) VALUES (@Comp_name, @Store_name, @Store_num, @Address, @Type, @Eleven_tons_able, @Car_height_limit, @Transport_time_limit)" SelectCommand="SELECT [Comp_name], [Store_name], [Store_num], [Address], [Type], [Eleven_tons_able], [Car_height_limit], [Transport_time_limit] FROM [Store] WHERE ([Store_num] = @Store_num)" UpdateCommand="UPDATE [Store] SET [Comp_name] = @Comp_name, [Store_name] = @Store_name, [Address] = @Address, [Type] = @Type, [Eleven_tons_able] = @Eleven_tons_able, [Car_height_limit] = @Car_height_limit, [Transport_time_limit] = @Transport_time_limit WHERE [Store_num] = @Store_num">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Store_num" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Comp_name" Type="String" />
                                        <asp:Parameter Name="Store_name" Type="String" />
                                        <asp:Parameter Name="Store_num" Type="String" />
                                        <asp:Parameter Name="Address" Type="String" />
                                        <asp:Parameter Name="Type" Type="String" />
                                        <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                        <asp:Parameter Name="Car_height_limit" Type="String" />
                                        <asp:Parameter Name="Transport_time_limit" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox4" Name="Store_num" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Comp_name" Type="String" />
                                        <asp:Parameter Name="Store_name" Type="String" />
                                        <asp:Parameter Name="Address" Type="String" />
                                        <asp:Parameter Name="Type" Type="String" />
                                        <asp:Parameter Name="Eleven_tons_able" Type="String" />
                                        <asp:Parameter Name="Car_height_limit" Type="String" />
                                        <asp:Parameter Name="Transport_time_limit" Type="String" />
                                        <asp:Parameter Name="Store_num" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="TextBox4" runat="server" Visible="false"></asp:TextBox>
                                <asp:Button ID="bntBack" class="btn btn-primary btn-round ml-auto" runat="server" OnClick="BntBack_Click" Text="返回" Visible="false" Style="left: 10.5%; bottom: 6.3%; position: absolute; width: 62px; height: 39px" />

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
