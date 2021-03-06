﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Left_Menu.master" EnableEventValidation="false" AutoEventWireup="false" CodeBehind="ProductList.aspx.cs" Inherits="EAE_Company.ProductList" %>

<%@ Import Namespace="EAE_Company.Models" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="main">
        <div class="container">
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7">
                <div class="row list-view-sorting clearfix">
                    <div class="col-md-2 col-sm-2 list-view">
                        <a href="javascript:;"><i class="fa fa-th-large"></i></a>
                        <a href="javascript:;"><i class="fa fa-th-list"></i></a>
                    </div>
                </div>
                <!-- BEGIN PRODUCT LIST -->
                <div class="row product-list">
                    <%
                        int page = 1;
                        String language = Session["language"].ToString();
                        String key_search = Request.QueryString["keySearch"];
                        String path = HttpContext.Current.Request.Url.AbsoluteUri;
                        String next_path = "ProductList.aspx?keySearch=" + key_search + "&page=" + (page + 1);
                        String previour_path = "";
                        //if(null == key_search)
                        //{
                        //    key_search = Request.QueryString["category"];
                        //}

                        if (null != Request.QueryString["page"])
                        {
                            String a = Request.QueryString["page"].Trim();
                            page = int.Parse(Request.QueryString["page"].Trim());
                        }
                        int max_page = 9 * page;
                        int min_page = 9 * (page - 1);
                        if (page > 1)
                        {
                            previour_path = "ProductList.aspx?keySearch=" + key_search + "&page=" + (page - 1);
                        }
                        else
                        {
                            previour_path = "home.aspx";
                        }





                        Item item = new Item();
                        List<Item> list_item = new List<Item>();
                        list_item = item.searchItem(key_search);
                        int total_item = list_item.Count();
                        int index = 0;
                        for (int i = min_page; i < total_item; i++)
                        {
                            if (i == max_page)
                            {
                                break;
                            }
                            // PATH TO VIEW ITEM DETAIL
                            string url = "Details.aspx?code=" + list_item[i].getItemID();
                            // UPDATE LANGUAGE FOR THIS SESSION 
                            index += 1;
                    %>

                    <!-- PRODUCT ITEM START -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src='<%=  list_item[i].getFirstImage() %>' class="img-responsive" alt="<%=  list_item[i].getName() %>" />
                                <div>
                                    <a href='<%=  list_item[i].getFirstImage() %>' class="btn btn-default fancybox-button">Zoom</a>
                                    <a href='<%= url %>' class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href='<%= url %>'><%=  list_item[i].getName() %></a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>

                    <!-- PRODUCT ITEM END -->
                    <%} %>
                </div>
                <!-- END PRODUCT LIST -->

                <!-- BEGIN PAGINATOR -->
                <% int current_item = 9;
                    if(current_item > total_item )
                    {
                        current_item = total_item;
                    }
                        %>
                <div class="row">
                    <div class="col-md-4 col-sm-4 items-info">Items 1 to <%= current_item %> of <%= total_item %> total</div>
                    <div class="col-md-8 col-sm-8">
                        <ul class="pagination pull-right">
                            <% 
                                if (page > 1)
                                {
                            %>
                            <li><a href='<%= previour_path %>'>&laquo;</a></li>
                            <%
                                }
                            %>



                            <% for (int page_num = 1; page_num < ((total_item / 9) + 1); page_num++)
                                {
                                    if (page_num == page)
                                    {
                            %>

                            <li><span><%= page_num %></span></li>
                            <%

                                }
                                else
                                {

                            %>

                            <li><a href='<%="ProductList.aspx?keySearch=" + key_search + "&page=" + page_num %>'><%=page_num %></a></li>
                            <%
                                    }
                                } %>

                            <% if (page < ((total_item / 9) + 1))
                                {%>

                            <li><a href='<%= next_path %>'>&raquo;</a></li>
                            <%} %>
                        </ul>
                    </div>
                </div>
                <!-- END PAGINATOR -->


            </div>
        </div>
    </div>

</asp:Content>
