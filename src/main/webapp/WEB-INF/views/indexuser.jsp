<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Educenter - Education HTML Template</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator"
	content="Themefisher Educenter HTML Template v1.0">

<meta name="theme-name" content="educenter" />

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/bootstrap/bootstrap.min.css"/>">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/slick/slick.css"/>">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/themify-icons/themify-icons.css"/>">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/animate/animate.css"/>">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/aos/aos.css"/>">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/venobox/venobox.css"/>">


<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">


<link rel="shortcut icon"
	href="<c:url value="/resources/images/favicon.png"/>"
	type="image/x-icon">
<link rel="icon" href="<c:url value="/resources/images/favicon.png"/>"
	type="image/x-icon">

</head>

<body>


	<div class="preloader">
		<img src="<c:url value="/resources/images/preloader.gif"/>"
			alt="preloader">
	</div>

	<header class="fixed-top header">

		<div class="navigation w-100">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar-dark p-0">
					<a class="navbar-brand" href="index.html"><img
						src="<c:url value="/resources/images/logo.png"/>" alt="logo"></a>
					<button class="navbar-toggler rounded-0" type="button"
						data-toggle="collapse" data-target="#navigation"
						aria-controls="navigation" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navigation">
						<ul class="navbar-nav ml-auto text-center">
							<li class="nav-item active"><a class="nav-link"
								href="index.html">Home</a></li>
							<li class="nav-item @@about"><a class="nav-link"
								href="about.html">About</a></li>
							<li class="nav-item @@courses"><a class="nav-link"
								href="courses.html">COURSES</a></li>
							<li>
								<div style="margin-top: 24px;">
									<a href="<c:url value="#aboutModal"/>" data-toggle="modal"
										data-target="#myModal"> <img
										src="<c:url value="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbezqZpEuwGSvitKy3wrwnth5kysKdRqBW54cAszm_wiutku3R"/>"
										name="aboutme" width="45" height="45" class="img-circle"
										style="border-radius: 25px;"></a>
								</div>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>


	</header>
	<script src="<c:url value="/resources/plugins/jQuery/jquery.min.js"/>"></script>
	<!-- Bootstrap JS -->
	<script
		src="<c:url value="/resources/plugins/bootstrap/bootstrap.min.js"/>"></script>
	<!-- slick slider -->
	<script src="<c:url value="/resources/plugins/slick/slick.min.js"/>"></script>
	<!-- aos -->
	<script src="<c:url value="/resources/plugins/aos/aos.js"/>"></script>
	<!-- venobox popup -->
	<script
		src="<c:url value="/resources/plugins/venobox/venobox.min.js"/>"></script>
	<!-- filter -->
	<script
		src="<c:url value="/resources/plugins/filterizr/jquery.filterizr.min.js"/>"></script>
	<!-- google map -->
	<script
		src="<c:url value="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"/>"></script>
	<script src="<c:url value="/resources/plugins/google-map/gmap.js"/>"></script>

	<!-- Main Script -->
	<script src="<c:url value="/resources/js/script.js"/>"></script>
</body>
</html>