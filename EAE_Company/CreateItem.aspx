<%@ Page Language="C#" MasterPageFile="~/Admin.Master"   EnableEventValidation="true"   AutoEventWireup="true" CodeBehind="CreateItem.aspx.cs" Inherits="EAE_Company.CreateItem" %>

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

        <div class="row">

            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <h5>Item Information</h5>

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
                    <span class="input-group-addon">Category 1 </span>
                    <asp:DropDownList runat="server"  DataValueField="item_category_id"   DataTextField="category_name"  class="form-control" ID="DropDownList1">
                    </asp:DropDownList>
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">Category 2</span>
                    <asp:DropDownList runat="server"  DataValueField="item_category_id" DataTextField="category_name" class="form-control" ID="DropDownList2">
                    </asp:DropDownList>
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">Category 3</span>
                    <asp:DropDownList runat="server"   DataValueField="item_category_id" DataTextField="category_name" class="form-control" ID="DropDownList3">
                    </asp:DropDownList>
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">Category 4 </span>
                    <asp:DropDownList runat="server"  DataValueField="item_category_id" DataTextField="category_name" class="form-control" ID="DropDownList4">
                    </asp:DropDownList>
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">Category 5 </span>
                    <asp:DropDownList runat="server"  DataValueField="item_category_id" DataTextField="category_name" class="form-control" ID="DropDownList5">
                    </asp:DropDownList>
                </div>
                <br />

            </div>

            <%-- LOAD ALL IMAGES OF ITEM --%>
            <script>
                var listRemove = [];

            </script>
            <div class="col-lg-6 col-md-6">
                <div class="row text-center pad-top">




                    <% 
                        Item item = null;
                        if (Request.QueryString["item_id"] != null)
                        {
                            item = new Item().loadINFOByID(Request.QueryString["item_id"]);

                        }

                        if (null != item && item.getImageList() != null)
                        {
                            int count = 0;
                            foreach (string src in item.getImageList())
                            {
                                if (count == 4)
                                {
                                    break;
                                }
                    %>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id='<%= "img-" + count %>'>
                        <div class="div-square">
                            <button type="button" onclick="myFunction()" class="close" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <a href="#">
                                <%--<asp:Image runat="server" ID="img1" ImageUrl='<%= src %>' />--%>
                                <img style="width: 170px; margin: 10px auto;"
                                    src='<%= src %>' />
                                <h4><%= item.getName() %></h4>
                            </a>
                        </div>
                    </div>

                    <% String temp = "img-" + count; %>
                    <script>
                        function myFunction() {

                            if (confirm('Bạn có muốn xóa ảnh này không ?')) {
                                document.getElementById('<%= temp %>').style.visibility = "hidden";
                                listRemove.push('<%= src %>');
                                SetHiddenField();
                            }

                        }
                    </script>


                    <% 
                                count += 1;
                            }
                        }  %>

                    <%--Set remove image for HiddenField--%>
                    <asp:HiddenField ID="hidden" runat="server" Value="" />

                    <script type="text/javascript">
                        function SetHiddenField() {
                            var vv = listRemove.join("  ");
                            document.getElementById("<%=hidden.ClientID%>").value = vv;

                        }
                    </script>
                </div>
                <br />
                <br />
                <h5>Select Processing </h5>

                <asp:FileUpload ID="FileUpload1" Multiple="Multiple" runat="server" />
                <asp:Button runat="server" ID="btnsave" OnClick="btnsave_Click" class="btn btn-success" Text="Create New Item" />
                <asp:Button runat="server" ID="btnUpdate" OnClick="btnUpdate_Click" class="btn btn-success" Text="Update" Visible="false" />
                <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_Click" class="btn btn-info" Text="Cancel" />
                <%--<asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server"
                            ErrorMessage="Only zip file is allowed!"
                            ValidationExpression="^.+(.jpg|.JPG|.png}.PNG)$"
                            ControlToValidate="FileUpload1"> </asp:RegularExpressionValidator>--%>
                <%--<asp:Button runat="server" ID="btnDelete" OnClick="btnDelete_Click" class="btn btn-danger" Text="Delete" />--%>
            </div>
        </div>


        <!-- /. PAGE WRAPPER  -->
    </div>
</asp:Content>
