<%@ Page Title="admin_ItemList" MasterPageFile="~/Admin.Master" Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="admin_category.aspx.cs" Inherits="EAE_Company.admin_category" %>

<%@ Import Namespace="EAE_Company.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>PRODUCT MANAGEMENT</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
         <asp:Button runat="server" ID="btnCreateCategory" OnClick="btnCreateCategory_Click" class="btn btn-success" Text="Create New Item" />
         <br />

        <%-- CATEGORY MANAGEMENT --%>
       
        <div class="row">
            <div class="col-lg-12 col-md-12">
                 <div class="row">
            <div class="col-lg-12 col-md-12">
                <h4>Category Management</h4>
                
                <div class="row">
                <asp:GridView ID="GridView1" runat="server" DataKeyNames="item_category_id" AutoGenerateColumns="false" AllowPaging="true"
                    OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="20" class="table table-striped table-bordered table-hover"
                    OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    HeaderStyle-HorizontalAlign="Left" PagerSettings-Mode="NumericFirstLast" PagerSettings-Visible="true">
                    <Columns>
                        <asp:BoundField ItemStyle-Width="20px" DataField="item_category_id" HeaderText="ID" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="item_category_code" HeaderText="Category Code" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="category_name" HeaderText="Category Name" />
                        
                        <%--<asp:BoundField ItemStyle-Width="150px" DataField="price" HeaderText="Item Price" />--%>
                        <asp:CommandField ItemStyle-Width="20px" ShowEditButton="true" />
                        <asp:CommandField ItemStyle-Width="20px" ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                    </div>
                <!-- /. ROW  -->
            </div>
        </div>
                <hr />
                <!-- /. ROW  -->
            </div>
        </div>
    </div>
</asp:Content>
