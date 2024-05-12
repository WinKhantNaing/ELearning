<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

			<!DOCTYPE html>
			<html>

			<head>

				<meta charset="utf-8">
				<title>Educenter - Education HTML Template</title>

				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="description" content="Construction Html5 Template">
				<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
				<meta name="author" content="Themefisher">
				<meta name="generator" content="Themefisher Educenter HTML Template v1.0">

				<meta name="theme-name" content="educenter" />

				<link rel="stylesheet" href="<c:url value=" /resources/plugins/bootstrap/bootstrap.min.css" />">

				<link rel="stylesheet" href="<c:url value=" /resources/plugins/slick/slick.css" />">

				<link rel="stylesheet" href="<c:url value=" /resources/plugins/themify-icons/themify-icons.css" />">

				<link rel="stylesheet" href="<c:url value=" /resources/plugins/animate/animate.css" />">

				<link rel="stylesheet" href="<c:url value=" /resources/plugins/aos/aos.css" />">

				<link rel="stylesheet" href="<c:url value=" /resources/plugins/venobox/venobox.css" />">


				<link href="<c:url value=" /resources/css/style.css" />" rel="stylesheet">

				<link href="<c:url value=" /resources/css/color.css" />" rel="stylesheet">
				<link href="<c:url value='/resources/css/feedback.css'/>" rel="stylesheet">
				</link>



				<link rel="shortcut icon" href="<c:url value=" /resources/images/favicon.png" />"
				type="image/x-icon">
				<link rel="icon" href="<c:url value=" /resources/images/favicon.png" />"
				type="image/x-icon">

			</head>

			<body>


				<div class="preloader">
					<img src="<c:url value=" /resources/images/preloader.gif" />"
					alt="preloader">
				</div>

				<header class="fixed-top header">
					<%-- <%-- <div class="top-header py-2 bg-white">
						<div class="container">
							<div class="row no-gutters">
								<div class="col-lg-8 text-center text-lg-right">
									<ul class="list-inline">
										<li class="list-inline-item"><a
												class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block"
												href="<c:url value=" #loginModal" />" data-toggle="modal"
											data-target="#loginModal">login</a></li>
										<li class="list-inline-item">
											<a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block"
												href="<c:url value=" #signupModal" />" data-toggle="modal"
											data-target="#signupModal">register</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						</div> --%>

						<div class="navigation w-100">
							<div class="container">
								<nav class="navbar navbar-expand-lg navbar-dark p-0">
									<a class="navbar-brand" href="index.html"><img src="<c:url value="
											/resources/images/logo.png" />" alt="logo"></a>
									<button class="navbar-toggler rounded-0" type="button" data-toggle="collapse"
										data-target="#navigation" aria-controls="navigation" aria-expanded="false"
										aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>

									<div class="collapse navbar-collapse" id="navigation">
										<ul class="navbar-nav ml-auto text-center">
											<li class="nav-item active"><a class="nav-link" href="<c:url value ="
													/" />">Home</a></li>

											<li class="nav-item @@about"><a class="nav-link" href="about.html">About</a>
											</li>
											<li class="nav-item @@courses"><a class="nav-link"
													href="courses.html">COURSES</a></li>
											<li class="nav-item dropdown view"><a class="nav-link dropdown-toggle"
													href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false"> Administration </a>
												<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
													<li><a class="dropdown-item" href="adduser">Add User</a></li>
													<li><a class="dropdown-item" href="showcourses">Show Courses</a>
													</li>
												</ul>

											</li>
											<li>
												<div style="margin-top: 24px;">
													<a href="<c:url value=" #aboutModal" />" data-toggle="modal"
													data-target="#myModal"> <img src="<c:url value="
														https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbezqZpEuwGSvitKy3wrwnth5kysKdRqBW54cAszm_wiutku3R" />"
													name="aboutme" width="45" height="45" class="img-circle"
													style="border-radius: 25px;"></a>
												</div>
											</li>
											<li class="nav-item"><a class="nav-link" href="<c:url value="
													#loginModal" />"
												data-toggle="modal"
												data-target="#loginModal">login</a></li>

											<li class="nav-item">
												<a class="nav-link" href="<c:url value=" #signupModal" />"
												data-toggle="modal"
												data-target="#signupModal">register</a>
											</li>


										</ul>
									</div>
								</nav>
							</div>
						</div>



				</header>

				<div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content rounded-0 border-0 p-4">
							<div class="modal-header border-0">
								<h3>Register</h3>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="login">
									<span>${success}</span>
									<span>${error}</span>
									<form:form action="register" class="row" id="registrationForm" method="post"
										modelAttribute="regiterbean">
										<!-- <div class="col-12">
                            <input type="text" class="form-control mb-3" id="signupPhone" name="signupPhone" placeholder="Phone">
                        </div> -->
										<div class="col-12">
											<span id="usernameError" class="error"></span>
											<form:input type="text" path="uname" class="form-control mb-3" id="username"
												name="signupName" placeholder="Name" />
										</div>
										<div class="col-12">
											<span id="emailError" class="error"></span><br>
											<form:input type="email" path="uemail" class="form-control mb-3" id="email"
												name="signupEmail" placeholder="Email" />
										</div>
										<div class="col-12">
											<span id="passwordError" class="error"></span><br>
											<form:input type="password" path="upassword" class="form-control mb-3"
												id="password" name="signupPassword" placeholder="Password" />
										</div>

										<div class="col-12">
											<span id="confirmPasswordError" class="error"></span><br>
											<form:input type="password" path="conpassword" class="form-control mb-3"
												id="confirmPassword" name="signupConPassword"
												placeholder="ComfirmPassword" />
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
				<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content rounded-0 border-0 p-4">
							<div class="modal-header border-0">
								<h3>Login</h3>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form:form action="login" class="row" id="loginForm" modelAttribute="loginbean">

									<div class="col-12">
										<span class="error-message" id="loginnameError"></span>
										<form:input type="text" path="email" class="form-control mb-3" id="loginname"
											name="loginName" placeholder="Email" />
									</div>
									<div class="col-12">
										<span class="error-message" id="loginpasswordError"></span>
										<form:input type="password" path="password" class="form-control mb-3"
											id="loginpassword" name="loginPassword" placeholder="Password" />
									</div>
									<div class="col-12">
										<button type="submit" class="btn btn-primary">LOGIN</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
				<footer>
					<!-- newsletter -->
					<!-- Start DEMO HTML (Use the following code into your project)-->

					<div class="newsletter">
						<div class="container">
							<div class="row">
								<div class="col-md-9 ml-auto bg-primary py-5 newsletter-block">
									<h3 class="text-white">Rate Your Experiences</h3>
									<form action="#">
										<div class="input-wrapper">
											<div class="rate-box">

												<input type="radio" name="star" id="star0" /> <label class="star"
													for="star0"></label> <input type="radio" name="star" id="star1" />
												<label class="star" for="star1"></label>
												<input type="radio" name="star" id="star2" checked="checked" />
												<label class="star" for="star2"></label> <input type="radio" name="star"
													id="star3" /> <label class="star" for="star3"></label>
												<input type="radio" name="star" id="star4" /> <label class="star"
													for="star4"></label>

											</div>
											<input type="text" class="form-control border-0" id="newsletter"
												name="newsletter" placeholder="Enter Your Email...">
											<button type="submit" value="send" class="btn btn-primary"
												style="margin-top: 21px">Join</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- END EDMO HTML (Happy Coding!)-->
					<!-- footer content -->
					<div class="footer bg-footer section border-bottom">
						<div class="container">
							<div class="row">
								<div class="col-lg-4 col-sm-8 mb-5 mb-lg-0">
									<!-- logo -->
									<a class="logo-footer" href="index.html"><img class="img-fluid mb-4"
											src="resources/images/logo.png" alt="logo"></a>
									<ul class="list-unstyled">
										<li class="mb-2">23621 15 Mile Rd #C104, Clinton MI, 48035,
											New York, USA</li>
										<li class="mb-2">+1 (2) 345 6789</li>
										<li class="mb-2">+1 (2) 345 6789</li>
										<li class="mb-2">contact@yourdomain.com</li>
									</ul>
								</div>
								<!-- company -->
								<div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
									<h4 class="text-white mb-5">COMPANY</h4>
									<ul class="list-unstyled">
										<li class="mb-3"><a class="text-color" href="about.html">About
												Us</a></li>
										<li class="mb-3"><a class="text-color" href="teacher.html">Our
												Teacher</a></li>
										<li class="mb-3"><a class="text-color" href="contact.html">Contact</a></li>
										<li class="mb-3"><a class="text-color" href="blog.html">Blog</a></li>
									</ul>
								</div>
								<!-- links -->
								<div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
									<h4 class="text-white mb-5">LINKS</h4>
									<ul class="list-unstyled">
										<li class="mb-3"><a class="text-color" href="courses.html">Courses</a></li>
										<li class="mb-3"><a class="text-color" href="events.html">Events</a></li>
										<li class="mb-3"><a class="text-color" href="notice.html">Notice</a></li>
										<li class="mb-3"><a class="text-color" href="scholarship.html">Scholarship</a>
										</li>
									</ul>
								</div>
								<!-- support -->
								<div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
									<h4 class="text-white mb-5">SUPPORT</h4>
									<ul class="list-unstyled">
										<li class="mb-3"><a class="text-color"
												href="https://themefisher.com/blog">Forums</a></li>
										<li class="mb-3"><a class="text-color"
												href="https://docs.themefisher.com/">Documentation</a></li>
										<li class="mb-3"><a class="text-color" href="#!">Language</a></li>
										<li class="mb-3"><a class="text-color" href="#!">Release
												Status</a></li>
									</ul>
								</div>
								<!-- support -->
								<div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
									<h4 class="text-white mb-5">RECOMMEND</h4>
									<ul class="list-unstyled">
										<li class="mb-3"><a class="text-color"
												href="https://themefisher.com/">WordPress</a></li>
										<li class="mb-3"><a class="text-color"
												href="https://themefisher.com/">LearnPress</a></li>
										<li class="mb-3"><a class="text-color"
												href="https://themefisher.com/">WooCommerce</a></li>
										<li class="mb-3"><a class="text-color"
												href="https://themefisher.com/">bbPress</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- copyright -->
					<div class="copyright py-4 bg-footer">
						<div class="container">
							<div class="row">
								<div class="col-sm-7 text-sm-left text-center">
									<p class="mb-0">
										Copyright &copy;
										<script>
											var CurrentYear = new Date().getFullYear()
											document.write(CurrentYear)
										</script>
										, designed & developed by <a href="https://themefisher.com/"
											class="text-muted">Themefisher</a>
									</p>
								</div>
								<div class="col-sm-5 text-sm-right text-center">
									<ul class="list-inline">
										<li class="list-inline-item"><a class="d-inline-block p-2"
												href="https://facebook.com/themefisher/"><i
													class="ti-facebook text-primary"></i></a></li>
										<li class="list-inline-item"><a class="d-inline-block p-2"
												href="https://twitter.com/themefisher"><i
													class="ti-twitter-alt text-primary"></i></a></li>
										<li class="list-inline-item"><a class="d-inline-block p-2"
												href="https://github.com/themefisher"><i
													class="ti-github text-primary"></i></a></li>
										<li class="list-inline-item"><a class="d-inline-block p-2"
												href="https://instagram.com/themefisher/"><i
													class="ti-instagram text-primary"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</footer>

				<script src="<c:url value=" /resources/plugins/jQuery/jquery.min.js" />"></script>
				<!-- Bootstrap JS -->
				<script src="<c:url value=" /resources/plugins/bootstrap/bootstrap.min.js" />"></script>
				<!-- slick slider -->
				<script src="<c:url value=" /resources/plugins/slick/slick.min.js" />"></script>
				<!-- aos -->
				<script src="<c:url value=" /resources/plugins/aos/aos.js" />"></script>
				<!-- venobox popup -->
				<script src="<c:url value=" /resources/plugins/venobox/venobox.min.js" />"></script>
				<!-- filter -->
				<script src="<c:url value=" /resources/plugins/filterizr/jquery.filterizr.min.js" />"></script>
				<!-- google map -->
				<script src="<c:url value="
					https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" />"></script>
				<script src="<c:url value=" /resources/plugins/google-map/gmap.js" />"></script>

				<!-- Main Script -->
				<script src="<c:url value=" /resources/js/script.js" />"></script>
				<<<<<<< HEAD <script src="<c:url value=" /resources/js/register.js" />"></script>
				<script src="<c:url value=" /resources/js/login.js" />"></script>

			</body>

			</html>