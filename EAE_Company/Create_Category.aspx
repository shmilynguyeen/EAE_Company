<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin.Master"  CodeBehind="Create_Category.aspx.cs" Inherits="EAE_Company.Create_Category" %>
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
        
        <%-- CATEGORY MANAGEMENT --%>
        <% 
            List<Category> categoryList = new Category().getAllCategory();

        %>
        <div class="row">
            <div class="col-lg-12 col-md-12">
                 <div class="row">
            <div class="col-lg-12 col-md-12">
                <h4>Category Management</h4>
                
                 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <h5>Item Information</h5>

                 <div class="input-group">
                    <span class="input-group-addon">Category Code</span>
                    <asp:TextBox runat="server" ID="txtCategoryCode" type="text" class="form-control" placeholder="Category Code " />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">Category Name(vi)</span>
                    <asp:TextBox runat="server" ID="txtCategoryNameVi" type="text" class="form-control" placeholder="Category name(vi)" />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">Category Name(en)</span>
                    <asp:TextBox runat="server" ID="txtCategoryNameEn" type="text" class="form-control" placeholder="Category name(en)" />
                </div>
                <br />
               
                
                <br />
                


            </div>
                <!-- /. ROW  -->
            </div>
        </div>
                <hr />
                <asp:Button runat="server" ID="btnsave" OnClick="btnsave_Click" class="btn btn-success" Text="Create New Item" />
                <asp:Button runat="server" ID="btnCancel" OnClick="btnBack_Click" class="btn btn-info" Text="Back" />
                <!-- /. ROW  -->
            </div>
        </div>
    </div>
</asp:Content>
