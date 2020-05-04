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
<script src="components/items.js"></script>
</head>
<body>
	<div class="navbarnav">
		<div class="dropdownnav">
			<button class="dropbtnnav">Hospitals</button>
			<div class="dropdown-contentnav">
				<a href="administrator-dashboard.jsp">View Hospitals Details</a> <a
					href="post-addhospital.jsp">Add Hospital</a> <a
					href="put-hospital.jsp">Update Hospital Details</a> <a
					href="delete-hospital.jsp">Remove Hospital</a>
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
				<form id="formHospital" name="formHospital">
					Hospital Name: 
					<input id="hospitalname" name="hospitalname" type="text" class="form-control form-control-sm" required> <br> 
					Location:
					<input id="location" name="location" type="text" class="form-control form-control-sm" required> <br> 
					Registration Number: 
					<input id="regno" name="regno" type="text" class="form-control form-control-sm" required> <br> 
					Email: 
					<input id="email" name="email" type="text" class="form-control form-control-sm" required> <br> 
					Phone Number: 
					<input id="phone" name="phone" type="text" class="form-control form-control-sm" required> <br> 
					
					<input id="btnSave" name="btnSave" type="button" value="Create Hospital" class="btn btn-primary"> 
					<input type="hidden" id="hidHospitalIDSave" name="hidHospitalIDSave" value="">
					
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