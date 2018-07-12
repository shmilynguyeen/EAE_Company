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


        <%-- CATEGORY MANAGEMENT --%>
        <% 
            List<Category> categoryList = new Category().getAllCategory();

        %>
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <h5>Category Management</h5>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Category Code</th>
                            <th>Category Name (Vi)</th>
                            <th>Category Name (En)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%--  DISPLAY ALL CATEGORY  --%>
                        <% 
                            int index = 1;
                            foreach (Category category in categoryList)
                            {
                        %>
                        <tr>
                            <td>
                                <div contenteditable="true"><%= index %></div>
                            </td>
                            <td><%= category.getCategoryCode() %></td>
                            <td><%= category.getCategoryNameVi() %></td>
                            <td><%= category.getCategoryNameEn() %></td>
                        </tr>
                        <%
                                index += 1;
                            }
                        %>
                    </tbody>
                </table>
                <hr />
                <!-- /. ROW  -->
            </div>
        </div>
    </div>
</asp:Content>
