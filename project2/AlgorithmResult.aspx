<%@ Page Title="配車結果" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AlgorithmResult.aspx.cs" Inherits="project2.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/azzara.min.css">
    <link rel="stylesheet" href="../../assets/css/demo.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div runat="server" visible="true" id="initial">
        <head>
            <title>配車結果</title>
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
                                <a href="#">物流管理</a>
                            </li>
                            <li class="separator">
                                <i class="flaticon-right-arrow"></i>
                            </li>
                            <li class="nav-item">
                                <a href="CarDistribute.aspx">物流配車</a>
                            </li>
                            <li class="separator">
                                <i class="flaticon-right-arrow"></i>
                            </li>
                            <li class="nav-item">
                                <a href="AlgorithmResult.aspx">配車結果</a>
                            </li>

                        </ul>
                    </div>
                    <div class="card card-round" style="width: 800px; left: 3%">

                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">物流配車-結果</div>
                            </div>
                            <div class="card-body">
                                <div class="body">
                                    <asp:GridView ID="GridView1" style="word-break:break-all" class="display table table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Car" CssClass="display table table-striped table-hover" OnRowCommand="GridView1_RowCommand">
                                        <AlternatingRowStyle Width="600px" Wrap="true"/>
                                        <Columns>
                                            <asp:BoundField DataField="Car" HeaderText="車輛" ReadOnly="True" SortExpression="Car"/>
                                            <asp:BoundField DataField="Route" HeaderText="行駛路線" SortExpression="Route"/>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" CommandName="myy" CommandArgument='<%# Container.DataItemIndex %>' CausesValidation="false" Text="在地圖中查看" />
                                                </ItemTemplate>
                                                <ControlStyle CssClass="btn btn-primary btn-round ml-auto" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle Wrap="False" />
                                        <EmptyDataRowStyle Wrap="True" />
                                        <RowStyle Wrap="True" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString19 %>" DeleteCommand="DELETE FROM [Algorithm] WHERE [Car] = @Car" InsertCommand="INSERT INTO [Algorithm] ([Car], [Route]) VALUES (@Car, @Route)" SelectCommand="SELECT * FROM [Algorithm]" UpdateCommand="UPDATE [Algorithm] SET [Route] = @Route WHERE [Car] = @Car">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Car" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Car" Type="String" />
                                            <asp:Parameter Name="Route" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Route" Type="String" />
                                            <asp:Parameter Name="Car" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
