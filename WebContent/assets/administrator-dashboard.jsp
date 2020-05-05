<%@page import="com.Hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator | Dashboard</title>
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
<script src="components/Hospital.js"></script>
</head>
<body>
	<div class="navbarnav">
		<div class="dropdownnav">
			<button class="dropbtnnav">Hospitals</button>
			<div class="dropdown-contentnav">
				<a href="administrator-dashboard.jsp">Manage Hospitals Details</a> 
				<a href="search-hospital.jsp">Search Hospital</a>
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
				<h1>Hospital Management</h1>
				<form id="formItem" name="formItem">
					Hospital Name: 
					<input id="Hospital_name" name="Hospital_name" type="text" class="form-control form-control-sm"> <br> 
					Location:
					<input id="Hospital_location" name="Hospital_location" type="text" class="form-control form-control-sm"> <br> 
					Registration Number: 
					<input id="Register_no" name="Register_no" type="text" class="form-control form-control-sm"> <br> 
					Email: 
					<input id="Email" name="Email" type="text" class="form-control form-control-sm"> <br> 
					Phone Number: 
					<input id="Phone" name="Phone" type="text" class="form-control form-control-sm"> <br> 
					
					<input id="btnSave" name="btnSave" type="button" value="Create Hospital" class="btn btn-primary"> 
					<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
					
				</form><br>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemsGrid">
					<%
						Hospital Hospital = new Hospital();
						out.print(Hospital.readHospital());
					%>
				</div>
				<br>
				<br>
			</div>
		</div>
	</div>



</body>
</html>