<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="_0225.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <dx:BootstrapGridView runat="server" KeyFieldName="CustomerID" DataSourceID="DataSourceDataToggleInRows">
    <Columns>
        <dx:BootstrapGridViewDataColumn FieldName="CompanyName">
            <DataItemTemplate>
                <%# Eval("CompanyName") %>
                <button type="button" class="btn btn-link" data-toggle="gridview-datarow-edit">
                    <span class="fa fa-pencil-alt"></span>
                </button>
                <button type="button" class="btn btn-link" data-toggle="gridview-datarow-delete">
                    <span class="fa fa-trash"></span>
                </button>
            </DataItemTemplate>
        </dx:BootstrapGridViewDataColumn>
        <dx:BootstrapGridViewDataColumn FieldName="ContactName"></dx:BootstrapGridViewDataColumn>
        <dx:BootstrapGridViewDataColumn FieldName="Country"></dx:BootstrapGridViewDataColumn>
        <dx:BootstrapGridViewDataColumn FieldName="City"></dx:BootstrapGridViewDataColumn>
        <dx:BootstrapGridViewDataColumn FieldName="Address"></dx:BootstrapGridViewDataColumn>
    </Columns>
    <Settings ShowTitlePanel="true" />
    <Templates>
        <TitlePanel>
            Customers
            <button type="button" class="btn btn-link" data-toggle="gridview-newrow">
                <span class="fa fa-plus"></span>
            </button>
        </TitlePanel>
    </Templates>
    <SettingsDataSecurity AllowDelete="true" AllowEdit="true" AllowInsert="true" />
</dx:BootstrapGridView>
    <style>
.mydatagrid
{
width: 80%;
border: solid 2px black;
min-width: 80%;
}
.header
{
background-color: #646464;
font-family: Arial;
color: White;
border: none 0px transparent;
height: 25px;
text-align: center;
font-size: 26px;
}

.rows
{
background-color: #fff;
font-family: Arial;
font-size: 24px;
color: #000;
min-height: 25px;
text-align: left;
border: none 0px transparent;
}
.rows:hover
{
background-color: #ff8000;
font-family: Arial;
color: #fff;
text-align: left;
}
.selectedrow
{
background-color: #ff8000;
font-family: Arial;
color: #fff;
font-weight: bold;
text-align: left;
}
.mydatagrid a /** FOR THE PAGING ICONS **/
{
background-color: Transparent;
padding: 5px 5px 5px 5px;
color: #fff;
text-decoration: none;
font-weight: bold;
}

.mydatagrid a:hover /** FOR THE PAGING ICONS HOVER STYLES**/
{
background-color: #000;
color: #fff;
}
.mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
{
background-color: #c9c9c9;
color: #000;
padding: 5px 5px 5px 5px;
}
.pager
{
background-color: #646464;
font-family: Arial;
color: White;
height: 30px;
text-align: left;
}

.mydatagrid td
{
padding: 5px;
}
.mydatagrid th
{
padding: 5px;
}

     </style>
</asp:Content>
