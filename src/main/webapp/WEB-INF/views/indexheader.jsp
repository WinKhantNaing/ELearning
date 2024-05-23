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
	href="<c:url value="/resources/plugins/bootstrap/bootstrap.min.css" />">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/slick/slick.css" />">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/themify-icons/themify-icons.css" />">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/animate/animate.css" />">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/aos/aos.css" />">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/venobox/venobox.css" />">


<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

<link href="<c:url value="/resources/css/color.css" />" rel="stylesheet">
<link href="<c:url value='/resources/css/feedback.css'/>"
	rel="stylesheet">




<link rel="shortcut icon"
	href="<c:url value="/resources/images/favicon.png" />"
	type="image/x-icon">
<link rel="icon" href="<c:url value="/resources/images/favicon.png" />"
	type="image/x-icon">

</head>

<body>


	<div class="preloader">
		<img src="<c:url value="/resources/images/preloader.gif" />"
			alt="preloader">
	</div>

	<header class="fixed-top header">
		<div class="navigation w-100">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar-dark p-0">
					<a class="navbar-brand" href="index.html"><img
						src="<c:url value="/resources/images/logo.png" />" alt="logo"></a>
					<button class="navbar-toggler rounded-0" type="button"
						data-toggle="collapse" data-target="#navigation"
						aria-controls="navigation" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navigation">
						<ul class="navbar-nav ml-auto text-center">
							<li class="nav-item active"><a class="nav-link"
								href="<c:url value ="/" />">Home</a></li>

							<li class="nav-item @@about"><a class="nav-link" href=<c:url value = "/about" />>About</a></li>
							<li class="nav-item @@courses"><a class="nav-link"
								href='<c:url value="/course/courses" />'>COURSES</a></li>

						<c:if test="${sessionLogin == true}">
							<c:if test="${sessionuserRole=='admin'}">
								<li class="nav-item dropdown view"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> Administration </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item"
											href='<c:url value="../user/adduser"/>'>Add User</a></li>
										<li><a class="dropdown-item"
											href='<c:url value="../course/showcourses"/>'>Show Courses</a></li>
									</ul></li>
							</c:if>
								<li>
									<div style="margin-top: 35px;">
										<a href="<c:url value="/profile/profiledetail" />"> 
										<img src="${pageContext.request.contextPath}${'\\'}${sessionimg}"
											name="aboutme" width="30" height="30" class="img-circle"
											style="border-radius: 25px; object-fit: cover"></a>
									</div>
								</li>
								
							</c:if>


							<li class="nav-item dropdown view"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> Administration </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item"
										href='<c:url value="/user/adduser"/>'>Show All Users</a></li>
									<li><a class="dropdown-item"
										href='<c:url value="../../course/showcourses"/>'>Show Courses</a></li>
								</ul></li>
							<li>
								<div style="margin-top: 24px;">
									<a href="<c:url value="/profile/profiledetail" />"> <img
										src="<c:url value="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbezqZpEuwGSvitKy3wrwnth5kysKdRqBW54cAszm_wiutku3R" />"
										name="aboutme" width="45" height="45" class="img-circle"
										style="border-radius: 25px;"></a>
								</div>
							</li>

							<li class="nav-item"><a class="nav-link"
								href="<c:url value="#loginModal" />" data-toggle="modal"
								data-target="#loginModal">login</a></li>

							<li class="nav-item"><a class="nav-link"
								href="<c:url value="#signupModal" />" data-toggle="modal"
								data-target="#signupModal">register</a></li>


						</ul>
					</div>
				</nav>
			</div>
		</div>



	</header>

	<div class="modal fade" id="signupModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content rounded-0 border-0 p-4">
				<div class="modal-header border-0">
					<h3>Register</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="login">
						<span>${success}</span> <span>${error}</span>
						
						<form:form
							action="${pageContext.request.contextPath}/user/register"
							class="row" id="registrationForm" method="post"
							modelAttribute="registerbean">
							<div class="col-12">
								<span id="usernameError" class="error"></span>
								<form:input type="text" path="uname" class="form-control mb-3"
									id="username" name="signupName" placeholder="Name" />
							</div>
							<div class="col-12">
								<span id="emailError" class="error"></span><br>
								<form:input type="email" path="uemail" class="form-control mb-3"
									id="email" name="signupEmail" placeholder="Email" />
							</div>
							<div class="col-12">
								<span id="passwordError" class="error"></span><br>
								<form:input type="password" path="upassword"
									class="form-control mb-3" id="password" name="signupPassword"
									placeholder="Password" />
							</div>

							<div class="col-12">
								<span id="confirmPasswordError" class="error"></span><br>
								<form:input type="password" path="conpassword"
									class="form-control mb-3" id="confirmPassword"
									name="signupConPassword" placeholder="ComfirmPassword" />
							</div>

							<div class="col-12">
								<button type="submit" class="btn btn-primary">SIGN UP</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content rounded-0 border-0 p-4">
				<div class="modal-header border-0">
					<h3>Login</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			    <p>${loginFail}</p>
				<div class="modal-body">
					<form:form action="${pageContext.request.contextPath}/user/login"
						class="row" id="loginForm" modelAttribute="loginbean"
						method="post">

						<div class="col-12">
							
							<span class="error-message" id="loginnameError"></span>
							<form:input type="text" path="email" class="form-control mb-3"
								id="loginname" name="loginName" placeholder="Email" />
						</div>
						<div class="col-12">
							<span class="error-message" id="loginpasswordError"></span>
							<form:input type="password" path="password"
								class="form-control mb-3" id="loginpassword"
								name="loginPassword" placeholder="Password" />
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-primary">LOGIN</button>
						</div> 
		
						
						<!-- <div class="col-12">
							<button type="submit" class="btn btn-primary">LOGIN</button>
						</div> -->
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
        $(document).ready(function() {
            if (window.location.hash === "#loginModal" && '${loginerror}' !== '') {
                $('#loginModal').modal('show');
            }
        });
    </script>
    
    
    <c:if test = "${loginError}">
	<script> 
	$(document).ready(function(){
		$('#loginModal').modal('show');
	});
	</script>
	</c:if>
	
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
		src="<c:url value="
					https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" />"></script>
	<script src="<c:url value="/resources/plugins/google-map/gmap.js" />"></script>

	<!-- Main Script -->
	<script src="<c:url value="/resources/js/script.js" />"></script>
	<script src="<c:url value="/resources/js/register.js" />"></script>
	<script src="<c:url value="/resources/js/login.js" />"></script>

</body>

</html>