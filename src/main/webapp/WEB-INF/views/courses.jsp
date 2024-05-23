<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html lang="en">

<head>

<!-- Basic Page Needs
	================================================== -->
<meta charset="utf-8">
<title>Educenter - Education HTML Template</title>

<!-- Mobile Specific Metas
	================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator"
	content="Themefisher Educenter HTML Template v1.0">


<!-- ** Plugins Needed for the Project ** -->
<!-- Bootstrap -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/bootstrap/bootstrap.min.css" />">
<!-- slick slider -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/slick/slick.css" />">
<!-- themefy-icon -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/themify-icons/themify-icons.css" />">
<!-- animation css -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/animate/animate.css" />">
<!-- aos -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/aos/aos.css" />">
<!-- venobox popup -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/venobox/venobox.css" />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/course.css"/>">
<!--Favicon-->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">
<style>
.search-icon{
color:white;
margin-left: -30px;
margin-right: 30px;
}

</style>
</head>

<body>
	<!-- header -->
	<jsp:include page="indexheader.jsp"></jsp:include>
	<!-- page title -->
	<section class="page-title-section overlay"
		data-background="images/backgrounds/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<ul class="list-inline custom-breadcrumb mb-2">
						<li class="list-inline-item"><a
							class="h2 text-primary font-secondary" href="index.html">Home</a></li>
						<li class="list-inline-item text-white h3 font-secondary nasted">Our
							Courses</li>
					</ul>
					<p class="text-lighten mb-0">Our courses offer a good
						compromise between the continuous assessment favoured by some
						universities and the emphasis placed on final exams by others.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- course searchbar -->
	<section class="section ">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg navbar-light bg-warning">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarTogglerDemo01"
					aria-controls="navbarTogglerDemo01" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse " id="navbarTogglerDemo01">
				
				<ul class="navbar-nav navb mr-auto mt-2 mt-lg-0 bg-warning">
                 <c:if test="${sessionLogin==true}"> 
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="../course/progress" />">Progress Courses</a></li>
						<li class="nav-item"><a class="nav-link "
							href="<c:url value="../course/complete" />">Complete Courses</a></li>
							<li class="nav-item"><a class="nav-link"
							href="<c:url value="../course/courses" />">All Courses</a></li>
							
					 </c:if>
					 
					</ul>
					<c:if test="${sessionLogin!=true}"><i class="bi bi-search search-icon"></i>
					 <input id='myInput' class="form-control col-xs-12" onkeyup='searchCourses()' aria-label="Search" type='text' placeholder='Search courses with name'  >
					 </c:if>
					  <c:if test="${sessionLogin==true}"> 
					 <input id='myInput' class="form-control col-xs-12 col-md-6" onkeyup='searchCourses()' aria-label="Search" type='text' placeholder='Search courses with name...'>
				</c:if>
				</div>
			</nav>
		</div>
	</section>
	<section class="section pt-1 mt-1">

		<div class="container">

			<div class="row justify-content-center">

				<!-- course item -->
				<c:forEach items="${courseList}" var="course">
					<div class="col-lg-4 col-sm-6 mb-5 course-item">
						<div class="card p-0 border-primary rounded-0 hover-shadow">
							<div class="card p-0 border-primary rounded-0">

						
								<img class="card-img-top rounded-0" style="height:280px;" src="${pageContext.request.contextPath}${'\\'}${course.courseImagePath }" alt="course thumb">

								<img class="card-img-top rounded-0" style="height:280px;"
									src="<c:url value='${course.courseImagePath }' />"
									alt="course thumb">

							</div>

							<div class="card-body">
								<ul class="list-inline mb-2">
								<a href="<c:url value="../user/show-single-lesson/${course.courseId}" />">
									<h4 class="card-title">${course.courseName }</h4>
								</a>
									<li class="list-inline-item"><i class="bi bi-star-fill"></i>
										${course.courseStatus}</li>
									<!-- <li class="list-inline-item"><a class="text-color" href="ToeYadanaKyaw">Humanities</a></li> -->
								</ul>
								
								<div class="code-container">
									<p class="card-text mb-3" id="scrollspyHeading1">
										${course.courseDescription }</p>
								</div>
								<div class="mt-2">
									<a href="<c:url value="../user/show-single-lesson/${course.courseId}" />"
										class="btn btn-primary btn-sm">See more..</a>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<jsp:include page="feedback.jsp"></jsp:include>
	<!-- /courses -->
	<jsp:include page="indexfooter.jsp"></jsp:include>


     <script src="<c:url value="/resources/js/course.js" />"></script>
	<!-- jQuery -->
	<script src="<c:url value="/resources/plugins/jQuery/jquery.min.js" />"></script>
	<!-- Bootstrap JS -->
	<script
		src="<c:url value="/resources/plugins/bootstrap/bootstrap.min.js" />"></script>
	<!-- slick slider -->
	<script src="<c:url value="/resources/plugins/slick/slick.min.js" />"></script>
	<!-- aos -->
	<script src="<c:url value="/resources/plugins/aos/aos.js" />"></script>
	<!-- venobox popup -->
	<script
		src="<c:url value="/resources/plugins/venobox/venobox.min.js" />"></script>
	<!-- filter -->
	<script
		src="<c:url value="/resources/plugins/filterizr/jquery.filterizr.min.js" />"></script>
	<!-- google map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"></script>
	<script src="<c:url value="/resources/plugins/google-map/gmap.js" />"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<!-- Main Script -->

	<script src="<c:url value="/resources/js/script.js" />"></script>
</body>

</html>