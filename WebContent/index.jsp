<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login | Zue Health Care Center</title>
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/plugins.css">
<link rel="stylesheet" href="assets/css/animate.min.css" media="screen">
<link rel="stylesheet" href="assets/css/perfect-scrollbar.min.css"
	media="screen">
<link rel="stylesheet" href="assets/css/switchery.min.css"
	media="screen">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.min.css">
<link rel="stylesheet" href="assets/css/theme-1.css" id="skin_color" />
</head>
<body class="login">
	<div class="row">
		<div
			class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="logo margin-top-30">
				<h2>Zue | Login Now!</h2>
			</div>

			<div class="box-login">
				<form class="form-login" action="Hospital.jsp" method="post">
					<fieldset>

						<p>
							Please enter your name and password to log in.<br />
						</p>
						<div class="form-group">
							<span class="input-icon"> <input type="text"
								class="form-control" name="username" placeholder="Username" required>
							</span>
						</div>
						<div class="form-group form-actions">
							<span class="input-icon"> <input type="text"
								class="form-control password" name="password"
								placeholder="Password" required>
							</span>
						</div>
						<div class="form-actions">

							<button type="submit" class="btn btn-primary pull-left"
								name="submit">Login</button>

							<button type="reset" class="btn btn-primary pull-right"
								name="reset">Reset</button>

						</div>

					</fieldset>
				</form>

				<div class="copyright">
					&copy; <span class="current-year"></span><span
						class="text-bold text-uppercase"> Zue Health Care
						Center</span>. <span>All rights reserved</span>
				</div>

			</div>
		</div>
	</div>
</body>
</html>