<%@ Page Title="報表管理" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="project2.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
                            <a href="#">物流管理</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">報表管理</a>
                        </li>
                    </ul>
                </div>
                

                <div class="card card-round" style="width: 800px; left: 3%">
                    <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" style="left:30%;height:28px;top:20px;position:absolute">
                                <asp:ListItem>選擇報表種類</asp:ListItem>
                                <asp:ListItem>月報</asp:ListItem>
                                <asp:ListItem>季報</asp:ListItem>
                                <asp:ListItem>年報</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownList4" runat="server" Visible="False" style="left:46%;height:28px;top:20px;position:absolute">
                                <asp:ListItem>選擇年份</asp:ListItem>
                                <asp:ListItem>2021</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownList3" runat="server" Visible="False" style="left:58%;height:28px;top:20px;position:absolute">
                                <asp:ListItem>選擇季度</asp:ListItem>
                                <asp:ListItem>Q1</asp:ListItem>
                                <asp:ListItem>Q2</asp:ListItem>
                                <asp:ListItem>Q3</asp:ListItem>
                                <asp:ListItem>Q4</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownList5" runat="server" Visible="False" style="left:58%;height:28px;top:20px;position:absolute">
                                <asp:ListItem>選擇月份</asp:ListItem>
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查詢" style="left:70%;height:28px;top:20px;position:absolute"/>
                    <div class="card-body" style="height: 500px; left: 600px">

                        <div class="card-title fw-mediumbold">報表管理</div>
                        <div class="row">
                            
                        </div>
                                                    <div id="chart_div">
                            </div>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
