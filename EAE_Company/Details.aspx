<%@ Page Language="C#" MasterPageFile="~/Site_Left_Menu.master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Details.aspx.cs" Inherits="EAE_Company.Details" %>

<%@ Import Namespace="EAE_Company.Models" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%
        // GET ITEM INFO WITH ITEM COD  
        string itemCODE = Request.QueryString["code"];
        Item item = new Item();
        item = item.loadINFOByID(itemCODE);
    %>
    <!-- BEGIN CONTENT -->
    <div class="col-md-9 col-sm-7">
        <div class="product-page">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="product-main-image">
                        <img src='<%= item.getImageList()[0] %>' alt="<%= item.getDescription() %>" class="img-responsive" data-bigimgsrc='<%= item.getImageList()[0] %>'>
                    </div>
                    <%-- ITEM IMAGES --%>
                    <div class="product-other-images">
                        <% 
                            List<String> imageList = item.getImageList();
                            foreach (String url in imageList)
                            {
                        %>
                        <a href='<%= url %>' class="fancybox-button" rel="photos-lib">
                            <img alt="<%= item.getName() %>" src='<%= url %>'></a>
                        <%    
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <h1><%= item.getName() %></h1>
                    <div class="price-availability-block clearfix">
                        <div class="price">
                            <strong><span>$
                                <asp:Label runat="server" Text="<%$ Resources:SiteMaster, price %>"> </asp:Label>
                            </span></strong>
                            <%--<em>$<span>62.00</span></em>--%>
                        </div>
                        <div class="availability">
                                <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Availability %>"> </asp:Label> : <strong>     <asp:Label runat="server" Text="<%$ Resources:SiteMaster, instock  %>"> </asp:Label></strong>
                        </div>
                    </div>
                    <div class="description">
                        <p>
                            <%= item.getDescription() %>
                        </p>
                    </div>
                </div>

                <div class="product-page-content">
                    <ul id="myTab" class="nav nav-tabs">
                        <li><a href="#Description" data-toggle="tab">
                            <asp:Label runat="server" Text="<%$ Resources:SiteMaster, description %>"> </asp:Label></a></li>
                        <li class="active"><a href="#Information" data-toggle="tab">
                            <asp:Label runat="server" Text="<%$ Resources:SiteMaster, infomation %>"> </asp:Label></a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade" id="Description">
                            <p>
                                <%= item.getDescription() %>
                            </p>
                        </div>
                        <div class="tab-pane fade in active" id="Information">
                            <table class="datasheet">
                                <tr>
                                    <th colspan="2">Additional features</th>
                                </tr>
                                <tr>
                                    <td class="datasheet-features-type">
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Long %>"> </asp:Label></td>
                                    <td><%= 0 %> (cm)</td>
                                </tr>
                                <tr>
                                    <td class="datasheet-features-type">
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Width %>"> </asp:Label></td>
                                    <td><%=0 %> (cm)</td>
                                </tr>
                                <tr>
                                    <td class="datasheet-features-type">
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Height %>"> </asp:Label></td>
                                    <td><%= 0 %> (cm)</td>
                                </tr>

                            </table>
                        </div>

                        <!--<p>There are no reviews for this product.</p>-->

                    </div>
                </div>

                <div class="sticker sticker-sale"></div>
            </div>
        </div>
    </div>
    <!-- END CONTENT -->


    <!-- END SIDEBAR & CONTENT -->

    <!-- BEGIN SIMILAR PRODUCTS -->
    <div class="row margin-bottom-40">
        <div class="col-md-12 col-sm-12">
            <h2>
                <asp:Label runat="server" Text="<%$ Resources:SiteMaster, mostPopularProduct %>"> </asp:Label></h2>
            <div class="owl-carousel owl-carousel4">

                <% List<Item> similarItems = item.findSimilarItems(item.getCategory()[0]);
                    if (similarItems.Count > 0)
                    {
                        foreach (Item i in similarItems)
                        {
                            string urlDetail =  "Detail.aspx?code=" + i.getItemID();

                %>
                <div>
                    <div class="product-item">
                        <div class="pi-img-wrapper">
                            <img src='<%= i.getFirstImage() %>' class="img-responsive" alt='<%= i.getName() %>'>
                            <div>
                                <a href='<%= i.getFirstImage() %>' class="btn btn-default fancybox-button">Zoom</a>
                                <a href='<%= urlDetail %>' class="btn btn-default fancybox-fast-view">View</a>
                            </div>
                        </div>
                        <h3><a href='<%= urlDetail %>'><%= i.getName() %></a></h3>
                        <div class="pi-price"><asp:label runat="server" Text="<%$ Resources:SiteMaster, price %>"></asp:label></div>
                        <a href='#' class="btn btn-default add2cart"><asp:Label runat="server" Text="<%$ Resources:SiteMaster, addToCart %>"></asp:Label></a>
                        <div class="sticker sticker-new"></div>
                    </div>
                </div>

                <% }
                }  %>
            </div>
        </div>
    </div>
    <!-- END SIMILAR PRODUCTS -->



    <!-- BEGIN BRANDS -->
    <!-- END BRANDS -->

    <!-- BEGIN STEPS -->
    <!-- END STEPS -->
</asp:Content>

