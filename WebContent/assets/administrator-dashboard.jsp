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
</head>
<body>
	<div class="navbarnav">
		<div class="dropdownnav">
			<button class="dropbtnnav">Hospitals</button>
			<div class="dropdown-contentnav">
				<a href="get-hospitallist.jsp">View Hospitals Details</a> 
				<a href="post-addhospital.jsp">Add Hospital</a> 
				<a href="put-hospital.jsp">Update Hospital Details</a> 
				<a href="delete-hospital.jsp">Remove Hospital</a>
			</div>
		</div>
		<div class="dropdownnav">
			<button class="dropbtnnav">Accounts</button>
			<div class="dropdown-contentnav">
				<a href="get-appointmtcharges.jsp">Appointment Charges</a>
			</div>
		</div>
	</div>

</body>
</html>