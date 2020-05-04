<%@page import="com.Hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator | Search</title>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/nav-bar.css">
<link rel="stylesheet" href="css/plugins.css">
<link rel="stylesheet" href="css/animate.min.css" media="screen">
<link rel="stylesheet" href="css/perfect-scrollbar.min.css"
	media="screen">
<link rel="stylesheet" href="css/switchery.min.css" media="screen">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.min.css">
<link rel="stylesheet" href="css/theme-1.css" id="skin_color" />
<script src="components/jquery-3.4.1.min.js"></script>
<script src="components/items.js"></script>
</head>
<body>
	<div class="navbarnav">
		<div class="dropdownnav">
			<button class="dropbtnnav">Hospitals</button>
			<div class="dropdown-contentnav">
				<a href="administrator-dashboard.jsp">Manage Hospitals Details</a> <a
					href="search-hospital.jsp">Search Hospital</a>
			</div>
		</div>
		<div class="dropdownnav">
			<button class="dropbtnnav">Accounts</button>
			<div class="dropdown-contentnav">
				<a href="get-appointmtcharges.jsp">Appointment Charges</a>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Search Hospital</h1>
				<br>
				<input id="regno" name="regno" type="text" class="form-control form-control-sm" required>
				<br>
				<input id="btnSave" name="btnSave" type="button" value="Search" class="btn btn-primary"> 
				<br> <br>
				<div id="divItemsGrid">
					<%
						Hospital Hospital = new Hospital();
						out.print(Hospital.readHospital());
					%>
				</div>
				<br> <br>
			</div>
		</div>
	</div>
</body>
</html>