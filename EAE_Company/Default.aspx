<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EAE_Company.Default " %>
 
<%@ Import Namespace="EAE_Company.Models" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--CSS--%>
    <link href="/Content/Home/shop-homepage.css" rel="stylesheet">
    <%--<link href="/Content/Home/bootstrap.min.css" rel="stylesheet" type="text/css">--%> <%--LOI --%>

    <!-- Bootstrap core JavaScript -->
   <%-- <script type="text/javascript" src="/Scripts/Home/jquery.min.js"></script>--%>
    <%--<script type="text/javascript" src="/Scripts/Home/bootstrap.bundle.min.js"></script>--%>

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
                            <h2 class="margin-bottom-20 animate-delay carousel-title-v3 border-bottom-title text-uppercase" data-animation="animated fadeInDown">
                                ELECTRONIC <br/><span class="color-red-v2">AUTOMATION</span><br/> ELECTRIC
                            </h2>
                            <p class="carousel-subtitle-v2" data-animation="animated fadeInUp"><asp:Label runat="server" Text="<%$ Resources:SiteMaster, titleSlide1a %>"></asp:Label> <br/>
                            <asp:Label runat="server" Text="<%$ Resources:SiteMaster, titleSlide1b %>"></asp:Label>
                                <br />

                            </p>
                        </div>
                    </div>
                </div>
                
                <!-- Second slide -->
                <div class="item carousel-item-five">
                    <div class="container">
                        <div class="carousel-position-four text-center">
                            <h2 class="animate-delay carousel-title-v4" data-animation="animated fadeInDown">
                                Unlimted
                            </h2>
                            <p class="carousel-subtitle-v2" data-animation="animated fadeInDown">
                                Support Options
                            </p>
                            <p class="carousel-subtitle-v3 margin-bottom-30" data-animation="animated fadeInUp">
                                Fully Setup System
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
                            <span class="carousel-subtitle-v3 margin-bottom-15" data-animation="animated fadeInDown">
                                Maintain  &amp; Support
                            </span>
                            <p class="carousel-subtitle-v4" data-animation="animated fadeInDown">
                                All The Times
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
                                <h2 class="carousel-title-v1 margin-bottom-20" data-animation="animated fadeInDown">
                                    The most <br/>
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
                    <h2> <asp:Label runat="server" Text="<%$ Resources:SiteMaster, newArrivals %>"></asp:Label> </h2>
                    <div class="owl-carousel owl-carousel5">

                        <!-- BEGIN NEW ARRIVAL ITEM LIST -->
                        <% List<Item> newArrivals = (List<Item>)Session["newArrivals"];
                            string language = Session["language"].ToString().Trim();

                            foreach (Item item in newArrivals)
                            {
                                // PATH TO VIEW ITEM DETAIL
                                string url = "Details.aspx?code=" + item.getItemID();
                               
                        %>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src='<%=item.getFirstImage() %>' class="img-responsive" alt=<%= item.getName() %> />
                                    <div>
                                        <a href="<%=item.getFirstImage() %>" class="btn btn-default fancybox-button">Zoom</a>
                                     <%--   <asp:Button  runat="server"  class="btn btn-default fancybox-fast-view" Text="View" OnClick="fastView" /> --%>
                                        <a href='<%= url%>' class="btn btn-default fancybox-button">View</a>
                                    </div>
                                </div>
                                <h3><a href='<%= url %>'><%= item.getName() %></a></h3>
                                <div class="pi-price">$<asp:Label runat="server" Text="<%$ Resources:SiteMaster, price %>"></asp:Label></div>
                                <a href="javascript:;" class="btn btn-default add2cart"><asp:Label runat="server" Text="<%$ Resources:SiteMaster, addToCart %>"></asp:Label></a>
                                <div class="sticker sticker-sale"></div>
                            </div>
                        </div>

                        <%
                            }
                        %>

                        <!-- END NEW ARRIVAL ITEM LIST -->
                    </div>
                </div>
                <!-- END SALE PRODUCT -->
            </div>
            <!-- END SALE PRODUCT & NEW ARRIVALS -->

            <!-- BEGIN SIDEBAR & CONTENT -->
            <div class="row margin-bottom-40 ">
                <!-- BEGIN SIDEBAR -->
                <%  // STRING URL SEARCH 
                        String url_search = "ProductList.aspx?keySearch="; %>
                <div class="sidebar col-md-3 col-sm-4">
                    <ul class="list-group margin-bottom-25 sidebar-menu">
                            <%-- Textile Category  --%>
                        <li class="list-group-item clearfix dropdown">
                            <a href='<%= url_search + "140" %>'>
                                <i class="fa fa-angle-right"></i>
                                <asp:Label runat="server" Text="<%$ Resources:SiteMaster, textileEquipment %>"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "60" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, textile %>"></asp:Label></a>
                                </li>
                                 <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "61" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, garment %>"></asp:Label></a>
                                </li>
                                 <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "32" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, dyeing %>"></asp:Label></a>
                                </li>

                                </ul>
                            </li>

                        <li class="list-group-item clearfix dropdown">
                            <a href='<%= url_search + "77" %>'>
                                <i class="fa fa-angle-right"></i>
                                <asp:Label runat="server" Text="<%$ Resources:SiteMaster, industrialElectronics %>"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "1" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, sensor %>"></asp:Label></a>
                                    <ul class="dropdown-menu">
                                        <li class="list-group-item dropdown clearfix">
                                            <a href='<%= url_search + "124" %>'><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, Optical_sensors %>"></asp:Label> </a>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href='<%= url_search + "125" %>'><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, Proximity_sensor %>"></asp:Label>   </a>
                                        </li>

                                        <li class="list-group-item dropdown clearfix">
                                            <a href='<%= url_search + "126" %>'><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, Inductive_sensor %>"></asp:Label> </a>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href='<%= url_search + "127" %>'><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, Ultrasonic_sensors %>"></asp:Label>   </a>
                                        </li>

                                        <li class="list-group-item dropdown clearfix">
                                            <a href='<%= url_search + "128" %>'><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, Pressure_sensors %>"></asp:Label> </a>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href='<%= url_search + "129" %>'><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, Contrast_sensor %>"></asp:Label>   </a>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href='<%= url_search + "130" %>'><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, Temperature_sensor %>"></asp:Label> </a>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href='<%= url_search + "131" %>'><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, Distance_sensor %>"></asp:Label>   </a>
                                        </li>
                                        <li class="list-group-item dropdown clearfix">
                                            <a href='<%= url_search + "132" %>'><i class="fa fa-angle-right"></i><asp:Label runat="server" Text="<%$ Resources:SiteMaster, Infrared_sensor %>"></asp:Label> </a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href='<%= url_search + "3" %>'><i class="fa fa-angle-right"></i>
                                    <asp:Label runat="server" Text="<%$ Resources:SiteMaster, measuringDevice %>"></asp:Label></a></li>
                                <li><a href='<%= url_search + "57" %>'><i class="fa fa-angle-right"></i>
                                    <asp:Label runat="server" Text="<%$ Resources:SiteMaster, switchgear %>"></asp:Label></a></li>
                                <li><a href='<%= url_search + "58" %>'><i class="fa fa-angle-right"></i>
                                    <asp:Label runat="server" Text="<%$ Resources:SiteMaster, programmingTools %>"></asp:Label></a></li>
                            </ul>
                        </li>

                        <li class="list-group-item clearfix dropdown">
                            <a href='<%= url_search + "77" %>'>
                                <i class="fa fa-angle-right"></i>
                                <asp:Label runat="server" Text="<%$ Resources:SiteMaster, electronicAutomation %>"> </asp:Label>
                            </a>
                        </li>
                        <%-- Misubishi category left menu --%>
                        <li class="list-group-item clearfix dropdown">
                            <a href='<%= url_search + "66" %>'>
                                <i class="fa fa-angle-right"></i>
                                <asp:Label runat="server" Text="<%$ Resources:SiteMaster, mitsubishi %>"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "82" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, mitsbishi_inverter %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "83" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, mitsubishi_cutoff %>"></asp:Label></a>
                                    
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "84" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, PLC_Mitsubishi_Micro %>"></asp:Label></a>
                                   
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "133" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, PLC_Mitsubishi %>"></asp:Label></a>
                                    
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "134" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, PLC_Mitsubishi_Modular %>"></asp:Label></a>
                                   
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "135" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Servo_Mitsubishi %>"></asp:Label></a>
                                </li>
                                <li><a href='<%= url_search + "136" %>'><i class="fa fa-angle-right"></i>
                                    <asp:Label runat="server" Text="<%$ Resources:SiteMaster, HMI_Mitsubishi %>"></asp:Label></a></li>
                                <li><a href='<%= url_search + "137" %>'><i class="fa fa-angle-right"></i>
                                    <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Motion_Controller_Mitsubishi %>"></asp:Label></a></li>
                            </ul>
                        </li>
                        <%--  --%>
                        <%-- ABB Category  --%>
                        <li class="list-group-item clearfix dropdown">
                            <a href='<%= url_search + "63" %>'>
                                <i class="fa fa-angle-right"></i>
                                <asp:Label runat="server" Text="ABB"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "138" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, ABB_boot_software %>"></asp:Label></a>
                                  
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "139" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, ABB_inverter %>"></asp:Label></a>
                                   
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "85" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, ABB_relay_heat %>"></asp:Label></a>
                                   
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "86" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="MCB ABB"></asp:Label></a>
                                   
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "87" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="MCCB ABB"></asp:Label></a>
                                    
                                </li>
                            </ul>
                        </li>
                        <%--  --%>

                        <%-- Siemens Category  --%>
                        <li class="list-group-item clearfix dropdown">
                            <a href='<%= url_search + "64" %>'>
                                <i class="fa fa-angle-right"></i>
                                <asp:Label runat="server" Text="Siemens"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "88" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="PCL Siemens"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "89" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="Switchgear Siemens"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "90" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="Power Supply Siemens"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "91" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="Sensor Siemens"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "92" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="HMI Siemens"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "93" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Siemens_inverter %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "94" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Siemens_boot_software %>"></asp:Label></a>
                                </li>
                            </ul>
                        </li>
                        <%--  --%>

                        <%-- Omron Category  --%>
                        <li class="list-group-item clearfix dropdown">
                            <a href='<%= url_search + "65" %>'>
                                <i class="fa fa-angle-right"></i>
                                <asp:Label runat="server" Text="Omron"> </asp:Label>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "95" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="Encoder Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "96" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="PLC Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "97" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="Timer Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "98" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="Relay Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "99" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="HMI Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "100" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_travel_switch %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "101" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_Temperature_Controller %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "102" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="Servo Omron"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "103" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_Ultrasound_Sensor %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "104" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_pulse_source %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "105" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_inverter %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "106" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_Temperature_Controller %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "107" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_light_sensor %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "108" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_proximity_sensor %>"></asp:Label></a>
                                </li>

                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "109" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster,Omron_counter %>"></asp:Label></a>
                                </li>
                                <li class="list-group-item dropdown clearfix">
                                    <a href='<%= url_search + "110" %>'><i class="fa fa-angle-right"></i>
                                        <asp:Label runat="server" Text="<%$ Resources:SiteMaster, Omron_level_sensor %>"></asp:Label></a>
                                </li>
                            </ul>
                        </li>
                        <%--  --%>
                      
                        <li class="list-group-item clearfix"><a href='<%= url_search + "58" %>'><i class="fa fa-angle-right"></i>
                            <asp:Label runat="server" Text="<%$ Resources:SiteMaster, programmingTools %>"> </asp:Label></a></li>

                    </ul>
                </div>
                <!-- END SIDEBAR -->
                <!-- BEGIN CONTENT -->
                <div class="col-md-9 col-sm-8">
                    <h2 style="color:cornflowerblue"><asp:Label runat="server" Text="<%$ Resources:SiteMaster, threeItems %>"></asp:Label></h2>
                    <div class="owl-carousel owl-carousel3">

                        <!-- Load Item-->
                        <% List<Item> threeItems = (List<Item>)Session["threeItems"];
                            foreach (Item item in threeItems)
                            {
                                // PATH TO VIEW ITEM DETAIL
                                string url = "Details.aspx?code=" + item.getItemID();
                           %>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src='<%= item.getFirstImage()%>' class="img-responsive" alt=<%= item.getName() %> />
                                    <div>
                                        <a href='<%= item.getFirstImage() %>' class="btn btn-default fancybox-button">Zoom</a>
                                        <a href='<%= url %>' class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href='<%= url %>'><%= item.getName() %></a></h3>
                                <div class="pi-price">$<asp:Label runat="server" Text="<%$ Resources:SiteMaster, price %>"></asp:Label></div>
                                <a href="javascript:;" class="btn btn-default add2cart"><asp:Label runat="server" Text="<%$ Resources:SiteMaster, addToCart %>"></asp:Label></a>
                                <div class="sticker sticker-new"></div>
                            </div>
                        </div>

                        <%} %>
                        <%-- Finished Load Thress Items --%>
                    </div>
                </div>
                <!-- END CONTENT -->
            </div>
            <!-- END SIDEBAR & CONTENT -->

            <!-- BEGIN TWO PRODUCTS & PROMO -->
            <div class="row margin-bottom-35 ">
                <!-- BEGIN TWO PRODUCTS -->

                <div class="col-md-6 two-items-bottom-items">
                    <h3 style="color:chocolate"><asp:Label runat="server"   Text="<%$ Resources:SiteMaster, twoItems %>"></asp:Label></h3>
                    <div class="owl-carousel owl-carousel2">
                         <% List<Item> twoItems = (List<Item>)Session["twoItems"];
                             foreach (Item item in twoItems)
                             {
                                  // PATH TO VIEW ITEM DETAIL
                                string url = "Details.aspx?code=" + item.getItemID();
                    %>
                        
                        
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src='<%= item.getFirstImage() %>' class="img-responsive" alt=<%= item.getName() %> />
                                    <div>
                                        <a href='<%= item.getFirstImage() %>' class="btn btn-default fancybox-button">Zoom</a>
                                        <a href='<%= url %>' class="btn btn-default fancybox-fast-view">View</a>
                                    </div>
                                </div>
                                <h3><a href='<%= url %>'><%= item.getName() %></a></h3>
                                <div class="pi-price">$ <asp:Label runat="server" Text="<%$ Resources:SiteMaster, price %>"></asp:Label></div>
                                <a href="javascript:;" class="btn btn-default add2cart"><asp:Label runat="server" Text="<%$ Resources:SiteMaster, addToCart %>"></asp:Label></a>
                            </div>
                        </div>
                        <%} %>
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
                    <img src="assets/pages/img/brands/honeywell.jpg" style="height:102px; width:169px" alt="canon" title="canon"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/abb.jpg" alt="abb" style="height:102px; width:169px" title="abb"></a>
               <%-- <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/honeywell.jpg" style="height:102px; width:169px" alt="honeywell" title="honeywell"></a>--%>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/lenze.jpg" style="height:102px; width:169px" alt="lenze" title="lenze"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/mitsubishi.jpg" style="height:102px; width:169px" alt="mitsubishi" title="mitsubishi"></a>
                 <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/omron.jpg" style="height:102px; width:169px" alt="omron" title="omron"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/honeywell.jpg" style="height:102px; width:169px" alt="canon" title="canon"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/omron.jpg" style="height:102px; width:169px" alt="omron" title="omron"></a>
               <%-- <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/yaskawa.jpg" style="height:102px; width:169px" alt="yaskawa" title="yaskawa"></a>--%>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/abb.jpg" style="height:102px; width:169px" alt="abb" title="abb"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/lenze.jpg" style="height:102px; width:169px" alt="lenze" title="lenze"></a>
                <a href="shop-product-list.html">
                    <img src="assets/pages/img/brands/omron.jpg" style="height:102px; width:169px" alt="omron" title="omron"></a>
            </div>
        </div>
    </div>
    <!-- END BRANDS -->

    <!-- BEGIN STEPS -->
    <!-- END STEPS -->
</asp:Content>
