<%@ Page Title="admin_Services" MasterPageFile="~/Admin.Master" Language="C#" EnableEventValidation="false" CodeBehind="admin_items.aspx.cs" Inherits="EAE_Company.admin_items" %>

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

        <!-- /. ROW  -->

        <asp:Button runat="server" ID="btnCreateItem" OnClick="btnCreateItem_Click" class="btn btn-success" Text="Create New Item" />
        <%-- CATEGORY MANAGEMENT --%>

        <div class="row">
            <div class="col-lg-12 col-md-12">
                <h4>Category Management</h4>
                <asp:GridView ID="GridView1" runat="server" DataKeyNames="item_id" AutoGenerateColumns="false" AllowPaging="true"
                    OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="20" class="table table-striped table-bordered table-hover"
                    OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    HeaderStyle-HorizontalAlign="Left" PagerSettings-Mode="NumericFirstLast" PagerSettings-Visible="true">
                    <Columns>
                        <asp:BoundField ItemStyle-Width="50px" DataField="item_id" HeaderText="ID" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="item_name" HeaderText="Item Name (Vi)" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="item_name_en" HeaderText="Item Name (En)" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="category_name1" HeaderText="Category Code 1" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="category_name2" HeaderText="Category Code 2" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="category_name3" HeaderText="Category Code 3" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="category_name4" HeaderText="Category Code 4" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="category_name5" HeaderText="Category Code 5" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="description" HeaderText="Description (Vi)" />
                        <asp:BoundField ItemStyle-Width="150px" DataField="description_en" HeaderText="Description (En)" />
                        <%--<asp:BoundField ItemStyle-Width="150px" DataField="price" HeaderText="Item Price" />--%>
                        <asp:CommandField ShowEditButton="true" />
                        <asp:CommandField ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
                <hr />
                <!-- /. ROW  -->
            </div>
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
</asp:Content>
