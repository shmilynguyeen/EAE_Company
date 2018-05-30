<%@ Page Title="admin_Services" Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="admin_Services.aspx.cs" Inherits="EAE_Company.admin_Services" %>

<%@ Import Namespace="EAE_Company.Models" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Simple Responsive Admin</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/plugins/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/plugins/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/plugins/assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <form id="form1" runat="server">

        <div id="wrapper">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="adjust-nav">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">
                            <img src="assets/img/logo.png" />
                        </a>
                    </div>

                    <span class="logout-spn">
                        <a href="#" style="color: #fff;">LOGOUT</a>

                    </span>
                </div>
            </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">



                    <li>
                        <a href="admin.aspx"><i class="fa fa-desktop "></i>Dashboard <span class="badge">Included</span></a>
                    </li>


                    <li class="active-link">
                        <a href="admin_management.aspx"><i class="fa fa-table "></i>UI Elements  <span class="badge">Included</span></a>
                    </li>
                    <li>
                        <a href="admin_blank.aspx"><i class="fa fa-edit "></i>Blank Page  <span class="badge">Included</span></a>
                    </li>


                    <li>
                        <a href="#"><i class="fa fa-qrcode "></i>My Link One</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o"></i>My Link Two</a>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-edit "></i>My Link Three </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-table "></i>My Link Four</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-edit "></i>My Link Five </a>
                    </li>
                </ul>
            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2>PRODUCT MANAGEMENT</h2>
                    </div>
                </div>
                <!-- /. ROW  -->
                <hr />
                <div class="row">
                    
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        <h5>Item Information</h5>
                        <div class="input-group">
                            <span class="input-group-addon">Category code</span>
                            <asp:TextBox runat="server" ID="txtCategoryCode" class="form-control" placeholder="Category code" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">Item name (vi)</span>
                            <asp:TextBox runat="server" ID="txtItemNameVi" type="text" class="form-control" placeholder="Item name (vi)" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">Item name(en)</span>
                            <asp:TextBox runat="server" ID="txtItemNameEn" type="text" class="form-control" placeholder="Item name(en)" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">Description(vi)</span>
                            <asp:TextBox runat="server" ID="txtDescriptionVi" type="text" class="form-control" placeholder="Description(vi)" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">Description(en)</span>
                            <asp:TextBox runat="server" ID="txtDescriptionEn" type="text" class="form-control" placeholder="Description(en)" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">Price</span>
                            <asp:TextBox runat="server" ID="txtPrice" type="text" class="form-control" placeholder="Price" />
                            <span class="input-group-addon">VNĐ</span>
                        </div>
                        <br />

                        <div class="input-group">
                            <span class="input-group-addon">Group</span>
                            <asp:DropDownList runat="server" class="form-control" ID="txtGroup">
                                <asp:ListItem Value="0">Provide Machines</asp:ListItem>
                                <asp:ListItem Value="3">Services</asp:ListItem>
                                <asp:ListItem Value="2">Mantain & Setting</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <br />

                    </div>

                    <%-- LOAD ALL IMAGES OF ITEM --%>
                    <div class="col-lg-6 col-md-6">
                        <div class="row text-center pad-top">

                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="div-square">
                                    <a href="blank.html">
                                        <i class="fa fa-envelope-o fa-5x"></i>
                                        <h4>Item Images</h4>
                                    </a>
                                </div>


                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="div-square">
                                    <a href="blank.html">
                                        <i class="fa fa-lightbulb-o fa-5x"></i>
                                        <h4>Item Images</h4>
                                    </a>
                                </div>


                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="div-square">
                                    <a href="blank.html">
                                        <i class="fa fa-envelope-o fa-5x"></i>
                                        <h4>Item Images</h4>
                                    </a>
                                </div>


                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="div-square">
                                    <a href="blank.html">
                                        <i class="fa fa-lightbulb-o fa-5x"></i>
                                        <h4>Item Images</h4>
                                    </a>
                                </div>


                            </div>
                            <br />
                            <br />
                            <h5>Select Processing </h5>
                            <asp:Button runat="server" ID="btnsave" OnClick="btnsave_Click" class="btn btn-success" Text="Save" />  
                            <asp:Button runat="server" ID="btnUpdate"  OnClick="btnUpdate_Click" class="btn btn-info" Text="Update" />  
                            <asp:Button runat="server" ID="btnDelete"  OnClick="btnDelete_Click" class="btn btn-danger" Text="Delete" />  

                            





                        </div>
                    </div>

                    <!-- /. ROW  -->


                    <%-- CATEGORY MANAGEMENT --%>
                    <% 
                        // Services with category code = 3
                        Item i = new Item();
                        List<Item> itemList = i.getItems(3);
                        int a = itemList.Count();

                    %>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <h5>Category Management</h5>
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Category Code</th>
                                        <th>Item Name (Vi)</th>
                                        <th>Item Name (En)</th>
                                        <th>Item Description (Vi)</th>
                                        <th>Item Description (En)</th>
                                        <th>Item Price</th>
                                        <th>Item Group</th>
                                        <th>Edit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%--  DISPLAY ALL CATEGORY  --%>
                                    <% 
                                        int index = 1;
                                        foreach (Item item in itemList)
                                        {
                                    %>
                                    <tr>
                                        <td>
                                            <div contenteditable="true"><%= index %></div>
                                        </td>
                                        <td><%= item.getCategory() %></td>
                                        <td><%= item.getNameVi() %></td>
                                        <td><%= item.getNameEn() %></td>

                                        <td><%= item.getDescriptionVi() %></td>
                                        <td><%= item.getDescription() %></td>
                                        <td><%= item.getPrice() %></td>
                                        <td><%= item.getItemGroup() %></td>
                                        <td><a href="#" class="btn btn-danger">Edit</a></td>
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
                    <!-- /. PAGE WRAPPER  -->
                </div>
                <div class="footer">


                    <div class="row">
                        <div class="col-lg-12">
                            &copy;  2018 Eae.copmpany.com | Design by: <a href="#" style="color: #fff;" target="_blank">www.Eae.company.com</a>
                        </div>
                    </div>
                </div>


                <!-- /. WRAPPER  -->
                <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
                <!-- JQUERY SCRIPTS -->
                <script src="assets/plugins/assets/js/jquery-1.10.2.js"></script>
                <!-- BOOTSTRAP SCRIPTS -->
                <script src="assets/plugins/assets/js/bootstrap.min.js"></script>
                <!-- CUSTOM SCRIPTS -->
                <script src="assets/plugins/assets/js/custom.js"></script>
            </div>
        </div>
    </form>
</body>
</html>
