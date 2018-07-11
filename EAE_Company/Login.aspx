<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs"  EnableEventValidation="false"  Inherits ="EAE_Company.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EAE Login</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/my-login.css"/>
</head>
<body  class="my-login-page">
    <form id="form1" runat="server">
       <section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<%--<div class="brand">
						<img src="assets/corporate/img/logos/logo-shop-red.png" style="width : auto">
					</div>--%> 
                    <div >
                        <img src="assets/corporate/img/logos/logo-shop-red.png" style="margin :40px auto ;padding-left : 120px ;"/>
                    </div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">Login</h4>
							<form method="POST">
							 
								<div class="form-group">
									<label for="email">E-Mail Address</label>

									<asp:TextBox runat="server" id="email" type="email" class="form-control" name="email" value="" required autofocus></asp:TextBox>
								</div>

								<div class="form-group">
									<label for="password">Password
										<a href="forgot.html" class="float-right">
											Forgot Password?
										</a>
									</label>
									<asp:TextBox runat="server" TextMode="Password" id="password" type="password" class="form-control" name="password" required data-eye></asp:TextBox>
								</div>

								<div class="form-group">
									<label>
										<input type="checkbox" name="remember"> Remember Me
									</label>
								</div>

								<div class="form-group no-margin">
									<asp:Button runat="server" type="submit" Text="Login" class="btn btn-primary btn-block" ID="btnLogin" OnClick="btnLogin_Click">
										 
									</asp:Button>
								</div>
								<div class="margin-top20 text-center">
									Don't have an account? <a href="register.html">Create One</a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; EAE Company 2018
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="assets/bootstrap/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/bootstrap/js/my-login.js"></script>
    </form>
</body>
</html>
