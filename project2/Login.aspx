<%@ Page title="登入" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_0225.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />

	<link rel="icon" href="assets/img/icon.ico" type="image/x-icon"/>
	<link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="assets/css/azzara.min.css"/>


	<!-- Fonts and icons -->
	<script src="assets/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Open+Sans:300,400,600,700"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands"], urls: ['assets/css/fonts.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>
	
</head>
<body class="login">
	    <form id="form2" runat="server">

	<div class="wrapper wrapper-login">
		<div class="container container-login animated fadeIn">
			<h3 class="text-center">登入</h3>
			<div class="login-form">
				<div class="form-group form-floating-label">
				 <asp:TextBox ID="account" runat="server" class="form-control input-border-bottom" ></asp:TextBox>
					<label for="account" runat="server" class="placeholder">帳號</label>
				</div>
				<div class="form-group form-floating-label">
				 <asp:TextBox ID="password" runat="server" class="form-control input-border-bottom" TextMode="Password"></asp:TextBox>
					<label for="password" runat="server" class="placeholder">密碼</label>
					<div class="show-password">
						<i class="flaticon-interface"></i>
					</div>
				</div>
				<div class="row form-sub m-0">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="rememberme"/>
						<label class="custom-control-label" for="rememberme">Remember Me</label>
					</div>
					
					<a href="#" class="link float-right"></a>
				</div>
				<div class="form-action mb-3">
			
     <asp:Button ID="Button1" runat="server" Text="登入"  class="btn btn-primary btn-rounded btn-login" OnClick="Iscorrect_Click"/>
				</div>
				<div class="login-account">
					<span class="msg"></span>
					<a href="#" id="show-signup" class="link"></a>
				</div>
			</div>
		</div>

		
	</div>
	<script src="assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<script src="assets/js/ready.js"></script>
			</form>
</body>
</html>
