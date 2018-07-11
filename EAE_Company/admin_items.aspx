<%@ Page Title="admin_Services" Language="C#" EnableEventValidation="false"  CodeBehind="admin_items.aspx.cs" Inherits="EAE_Company.admin_items" %>

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

                    <!-- /. ROW  -->

                 <asp:Button runat="server" ID="btnCreateItem" OnClick="btnCreateItem_Click" class="btn btn-success" Text="Create New Item" />
                    <%-- CATEGORY MANAGEMENT --%>

                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <h4>Category Management</h4>
                            <asp:GridView ID="GridView1" runat="server" DataKeyNames="item_id" AutoGenerateColumns="false" AllowPaging="true"
                                OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="20" class="table table-striped table-bordered table-hover"
                                OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                                HeaderStyle-HorizontalAlign="Left"  PagerSettings-Mode="NumericFirstLast" PagerSettings-Visible="true"    >
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
    </form>
</body>
</html>
