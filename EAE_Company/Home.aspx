<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--CSS--%>
    <link href="/Content/Home/shop-homepage.css" rel="stylesheet">
    <%--<link href="/Content/Home/bootstrap.min.css" rel="stylesheet" type="text/css">--%> <%--LOI --%>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="/Scripts/Home/jquery.min.js"></script>
    <script type="text/javascript" src="/Scripts/Home/bootstrap.bundle.min.js"></script>

    <!-- BEGIN SLIDER -->
    <div class="page-slider margin-bottom-35">
        <div id="carousel-example-generic" class="carousel slide carousel-slider">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <!-- First slide -->
                <div class="item carousel-item-four active">
                    <div class="container">
                        <div class="carousel-position-four text-center">
                            <h2 class="margin-bottom-20 animate-delay carousel-title-v3 border-bottom-title text-uppercase" data-animation="animated fadeInDown">Tones of
                                <br />
                                <span class="color-red-v2">EAE Features</span><br />
                                designed
                            </h2>
                            <p class="carousel-subtitle-v2" data-animation="animated fadeInUp">
                                Lorem ipsum dolor sit amet constectetuer diam
                                <br />
                                adipiscing elit euismod ut laoreet dolore.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Second slide -->
                <div class="item carousel-item-five">
                    <div class="container">
                        <div class="carousel-position-four text-center">
                            <h2 class="animate-delay carousel-title-v4" data-animation="animated fadeInDown">Unlimted
                            </h2>
                            <p class="carousel-subtitle-v2" data-animation="animated fadeInDown">
                                Layout Options
                           
                            </p>
                            <p class="carousel-subtitle-v3 margin-bottom-30" data-animation="animated fadeInUp">
                                Fully Services
                           
                            </p>
                            <a class="carousel-btn" href="#" data-animation="animated fadeInUp">See More Details</a>
                        </div>
                        <img class="carousel-position-five animate-delay hidden-sm hidden-xs" src="assets/pages/img/shop-slider/slide2/price.png" alt="Price" data-animation="animated zoomIn">
                    </div>
                </div>

                <!-- Third slide -->
                <div class="item carousel-item-six">
                    <div class="container">
                        <div class="carousel-position-four text-center">
                            <span class="carousel-subtitle-v3 margin-bottom-15" data-animation="animated fadeInDown">Full Admin &amp; Frontend
                            </span>
                            <p class="carousel-subtitle-v4" data-animation="animated fadeInDown">
                                Electronic Automation
                           
                            </p>
                            <p class="carousel-subtitle-v3" data-animation="animated fadeInDown">
                                Is Ready For Your Project
                           
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Fourth slide -->
                <div class="item carousel-item-seven">
                    <div class="center-block">
                        <div class="center-block-wrap">
                            <div class="center-block-body">
                                <h2 class="carousel-title-v1 margin-bottom-20" data-animation="animated fadeInDown">The most
                                    <br />
                                    wanted bijouterie
                                </h2>
                                <a class="carousel-btn" href="#" data-animation="animated fadeInUp">But It Now!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control carousel-control-shop" href="#carousel-example-generic" role="button" data-slide="prev">
                <i class="fa fa-angle-left" aria-hidden="true"></i>
            </a>
            <a class="right carousel-control carousel-control-shop" href="#carousel-example-generic" role="button" data-slide="next">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
            </a>
        </div>
    </div>
    <!-- END SLIDER -->

    <div class="main">
        <div class="container">
            <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
            <div class="row margin-bottom-40">
                <!-- BEGIN SALE PRODUCT -->
                <div class="col-md-12 sale-product">
                    <h2>New Arrivals</h2>
                    <div class="owl-carousel owl-carousel5">
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/model1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/model1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                <div class="sticker sticker-sale"></div>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/model2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/model2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress2</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/may_det/1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/may_det/1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress2</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/may_det/2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/may_det/2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="javascript:;">Berry Lace Dress4</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                <div class="sticker sticker-new"></div>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/model5.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/model5.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress5</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/model3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress3</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/model7.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress3</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END SALE PRODUCT -->
            </div>
            <!-- END SALE PRODUCT & NEW ARRIVALS -->

            <!-- BEGIN SIDEBAR & CONTENT -->
            <div class="row margin-bottom-40 ">
                <!-- BEGIN SIDEBAR -->
                <div class="sidebar col-md-3 col-sm-4">
                    <ul class="list-group margin-bottom-25 sidebar-menu">
                        <li class="list-group-item clearfix dropdown">
                            <a href="shop-product-list.html">
                                <i class="fa fa-angle-right"></i>
                               <asp:Label runat="server" Text="<%$ Resources:SiteMaster, industrialElectronics %>"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, sensor %>"></asp:Label></a>
                                    <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, measuringDevice %>"></asp:Label></a></li>
                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, switchgear %>"></asp:Label></a></li>
                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, programmingTools %>"></asp:Label></a></li>
                            </ul>
                        </li>

                        <li class="list-group-item clearfix dropdown">
                            <a href="shop-product-list.html">
                                <i class="fa fa-angle-right"></i>
                               <asp:Label runat="server" Text="<%$ Resources:SiteMaster, electronicAutomation %>"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health </a>
                                    <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Sound</a></li>
                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>GPS</a></li>
                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Motion</a></li>
                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Temp. & Humi.</a></li>
                            </ul>
                        </li>
                        <%-- Misubishi category left menu --%>
                        <li class="list-group-item clearfix dropdown">
                            <a href="shop-product-list.html">
                                <i class="fa fa-angle-right"></i>
                               <asp:Label runat="server" Text="<%$ Resources:SiteMaster, mitsubishi %>"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, mitsbishi_inverter %>"></asp:Label></a>
                                    <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, mitsubishi_cutoff %>"></asp:Label></a>
                                    <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, PLC_Mitsubishi_Micro %>"></asp:Label></a>
                                    <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, PLC_Mitsubishi %>"></asp:Label></a>
                                    <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, PLC_Mitsubishi_Modular %>"></asp:Label></a>
                                    <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Servo_Mitsubishi %>"></asp:Label></a>
                                    <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, HMI_Mitsubishi %>"></asp:Label></a></li>
                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Motion_Controller_Mitsubishi %>"></asp:Label></a></li>
                            </ul>
                        </li>
                        <%--  --%>
                        <%-- ABB Category  --%>
                         <li class="list-group-item clearfix dropdown">
                            <a href="shop-product-list.html">
                                <i class="fa fa-angle-right"></i>
                               <asp:Label runat="server" Text="ABB"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, ABB_boot_software %>"></asp:Label></a>
                                   <%-- <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>--%>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, ABB_inverter %>"></asp:Label></a>
                                   <%-- <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>--%>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, ABB_relay_heat %>"></asp:Label></a>
                                    <%--<ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>--%>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="MCB ABB"></asp:Label></a>
                                   <%-- <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>--%>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="MCCB ABB"></asp:Label></a>
                                    <%--<ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Classic </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>e-Health 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light  </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 1</a></li>
                                                <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i>Light 2</a></li>
                                            </ul>
                                        </li>
                                    </ul>--%>
                                </li>
                            </ul>
                        </li>
                        <%--  --%>

                         <%-- Siemens Category  --%>
                         <li class="list-group-item clearfix dropdown">
                            <a href="shop-product-list.html">
                                <i class="fa fa-angle-right"></i>
                               <asp:Label runat="server" Text="Siemens"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="PCL Siemens"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="Switchgear Siemens"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="Power Supply Siemens"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="Sensor Siemens"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="HMI Siemens"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Siemens_inverter %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Siemens_boot_software %>"></asp:Label></a>
                                </li>
                            </ul>
                        </li>
                        <%--  --%>

                         <%-- Omron Category  --%>
                         <li class="list-group-item clearfix dropdown">
                            <a href="shop-product-list.html">
                                <i class="fa fa-angle-right"></i>
                               <asp:Label runat="server" Text="Omron"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="Encoder Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="PLC Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="Timer Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="Relay Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="HMI Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_travel_switch %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_Temperature_Controller %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="Servo Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_Ultrasound_Sensor %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_pulse_source %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_inverter %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_Temperature_Controller %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_light_sensor %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_proximity_sensor %>"></asp:Label></a>
                                </li>
                             
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster,Omron_counter %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_level_sensor %>"></asp:Label></a>
                                </li>
                            </ul>
                        </li>
                        <%--  --%>

                        <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, programmingTools %>"> </asp:Label></a></li>
                        <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, programmingTools %>"> </asp:Label></a></li>
                        <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, programmingTools %>"> </asp:Label></a></li>
                    </ul>
                </div>
                <!-- END SIDEBAR -->
                <!-- BEGIN CONTENT -->
                <div class="col-md-9 col-sm-8">
                    <h2>Three items</h2>
                    <div class="owl-carousel owl-carousel3">
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="Item_Detail.aspx">Berry Lace Dress</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                <div class="sticker sticker-new"></div>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress2</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress3</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress4</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                <div class="sticker sticker-sale"></div>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress5</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress6</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END CONTENT -->
            </div>
            <!-- END SIDEBAR & CONTENT -->

            <!-- BEGIN TWO PRODUCTS & PROMO -->
            <div class="row margin-bottom-35 ">
                <!-- BEGIN TWO PRODUCTS -->
                <div class="col-md-6 two-items-bottom-items">
                    <h2>Two items</h2>
                    <div class="owl-carousel owl-carousel2">
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="assets/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="assets/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                <div class="pi-price">$29.00</div>
                                <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END TWO PRODUCTS -->
                <!-- BEGIN PROMO -->
                <div class="col-md-6 shop-index-carousel">
                    <div class="content-slider">
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="assets/pages/img/index-sliders/slide1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                </div>
                                <div class="item">
                                    <img src="assets/pages/img/index-sliders/slide2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                </div>
                                <div class="item">
                                    <img src="assets/pages/img/index-sliders/slide3.jpg" class="img-responsive" alt="Berry Lace Dress">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PROMO -->
            </div>
            <!-- END TWO PRODUCTS & PROMO -->
        </div>
    </div>

    <!-- BEGIN BRANDS -->
    <div class="brands">
        <div class="container">
            <div class="owl-carousel owl-carousel6-brands">
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/honeywell.jpg" height="102" width="169" alt="canon" title="canon"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/abb.jpg" alt="abb" height="102" width="169" title="abb"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/honeywell.jpg" height="102" width="169" alt="honeywell" title="honeywell"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/lenze.jpg" height="102" width="169" alt="lenze" title="lenze"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/mitsubishi.jpg" height="102" width="169" alt="mitsubishi" title="mitsubishi"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/lenze.jpg" height="102" width="169" alt="zara" title="zara"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/honeywell.jpg" height="102" width="169" alt="canon" title="canon"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/omron.jpg" height="102" width="169" alt="omron" title="omron"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/yaskawa.jpg" height="102" width="169" alt="yaskawa" title="yaskawa"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/abb.jpg" height="102" width="169" alt="abb" title="abb"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/lenze.jpg"  height="102" width="169"  alt="lenze" title="lenze"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/omron.jpg"  height="102" width="169" alt="omron" title="omron"></a>
            </div>
        </div>
    </div>
    <!-- END BRANDS -->

    <!-- BEGIN STEPS -->
    <div class="steps-block steps-block-red">
        <div class="container">
            <div class="row">
                <div class="col-md-4 steps-block-col">
                    <i class="fa fa-truck"></i>
                    <div>
                        <h2>Free shipping</h2>
                        <em>Express delivery withing 3 days</em>
                    </div>
                    <span>&nbsp;</span>
                </div>
                <div class="col-md-4 steps-block-col">
                    <i class="fa fa-gift"></i>
                    <div>
                        <h2>Daily Gifts</h2>
                        <em>3 Gifts daily for lucky customers</em>
                    </div>
                    <span>&nbsp;</span>
                </div>
                <div class="col-md-4 steps-block-col">
                    <i class="fa fa-phone"></i>
                    <div>
                        <h2>0907 818 285</h2>
                        <em>24/7 customer care available</em>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END STEPS -->








</asp:Content>
