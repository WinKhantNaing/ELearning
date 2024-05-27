<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>

		<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

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
			<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
			<meta name="author" content="Themefisher">
			<meta name="generator" content="Themefisher Educenter HTML Template v1.0">

			<!-- theme meta -->
			<meta name="theme-name" content="educenter" />

			<!-- ** Plugins Needed for the Project ** -->
			<!-- Bootstrap -->
			<link href="<c:url value="resources/plugins/bootstrap/bootstrap.min.css" />"
			rel="stylesheet"></link>
			<!-- slick slider -->
			<link href="<c:url value="resources/plugins/slick/slick.css" />"
			rel="stylesheet"></link>
			<!-- themefy-icon -->
			<link href="<c:url value="resources/plugins/themify-icons/themify-icons.css" />"
			rel="stylesheet"></link>
			<!-- animation css -->
			<link href="<c:url value="resources/plugins/animate/animate.css" />"
			rel="stylesheet"></link>
			<!-- aos -->
			<link href="<c:url value="resources/plugins/aos/aos.css" />"
			rel="stylesheet"></link>
			<!-- venobox popup -->
			<link href="<c:url value="resources/plugins/venobox/venobox.css" />"
			rel="stylesheet"></link>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
				crossorigin="anonymous">
			<!-- Main Stylesheet -->
			<link href="<c:url value="resources/css/style2.css" />" rel="stylesheet"></link>
			<link href="<c:url value="resources/css/style.css" />" rel="stylesheet"></link>
			<link rel="stylesheet" href="<c:url value=" /resources/css/course.css" />">
			<!--Favicon-->
			<link href="<c:url value="resources/resources/images/favicon.png" />"
			rel="shortcut icon" type="image/x-icon"></link>
			<link href="<c:url value="resources/resources/images/favicon.png" />"
			rel="icon" type="image/x-icon"></link>
			<style>
				.show-button {
					text-align: center;
				}
			</style>
		</head>

		<body>

			<%@ include file="indexheader.jsp" %>
				<!-- /header -->
				<c:if test="${loginError}">
					<script>
						$(document).ready(function () {
							$('#loginModal').modal('show');
						});
					</script>
				</c:if>
				<!-- Modal -->
				<c:if test="${RegisterError}">
					<script>
						$(document).ready(function () {
							$('#signupModal').modal('show');
						});
					</script>
				</c:if>
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
									<span>${success}</span> <span>${error}</span>

									<form:form action="${pageContext.request.contextPath}/user/register" class="row"
										id="registrationForm" method="post" modelAttribute="registerbean">
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

				<%-- <c:if test="${loginAlert}">
					<script type="text/javascript">
						function confirmApply(event) {
							$('#loginModal').modal('show');
							$('#loginModalConfirm').click(function () {
								event.preventDefault();
							});
						}
					</script>
					</c:if> --%>


					<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content rounded-0 border-0 p-4">
								<div class="modal-header border-0">
									<h3>Login</h3>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form:form action="${pageContext.request.contextPath}/user/login" class="row"
										id="loginForm" modelAttribute="loginbean" method="post">

										<div class="col-12">
											<span class="error-message" id="loginnameError"></span>
											<form:input type="text" path="email" class="form-control mb-3"
												id="loginname" name="loginName" placeholder="Email" />
										</div>
										<div class="col-12">
											<span class="error-message" id="loginpasswordError"></span>
											<form:input type="password" path="password" class="form-control mb-3"
												id="loginpassword" name="loginPassword" placeholder="Password" />
										</div>
										
										<div class="col-12">
											<button type="submit" class="btn btn-primary"
												id="loginModalConfirm">LOGIN</button>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
									<!-- hero slider -->
					<section class="hero-section overlay bg-cover"
						data-background="resources/images/banner/banner-1.jpg">
						<div class="container">
							<div class="hero-slider">
								<!-- slider item -->
								<div class="hero-slider-item">
									<div class="row">
										<div class="col-md-8">
											<h1 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5"
												data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">
												Your
												bright future is our mission</h1>
											<p class="text-muted mb-4" data-animation-out="fadeOutRight"
												data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft"
												data-delay-in=".4">Future programming languages form the foundation of software development.
												 As time has progressed, we've observed transformative shifts in the programming language landscape,
												  transitioning from foundational languages such as C and Java to the popularity of Python and JavaScript</p>
											<a href="contact.html" class="btn btn-primary"
												data-animation-out="fadeOutRight" data-delay-out="5"
												data-duration-in=".3" data-animation-in="fadeInLeft"
												data-delay-in=".7">Apply now</a>
										</div>
									</div>
								</div>
								<!-- slider item -->
								<div class="hero-slider-item">
									<div class="row">
										<div class="col-md-8">
											<h1 class="text-white" data-animation-out="fadeOutUp" data-delay-out="5"
												data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".1">
												Your
												bright future is our mission</h1>
											<p class="text-muted mb-4" data-animation-out="fadeOutUp" data-delay-out="5"
												data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".4">
												Future programming languages form the foundation of software development.
												 As time has progressed, we've observed transformative shifts in the programming language landscape,
												  transitioning from foundational languages such as C and Java to the popularity of Python and JavaScript</p>
											<a href="contact.html" class="btn btn-primary"
												data-animation-out="fadeOutUp" data-delay-out="5" data-duration-in=".3"
												data-animation-in="fadeInDown" data-delay-in=".7">Apply now</a>
										</div>
									</div>
								</div>
								<!-- slider item -->
								<div class="hero-slider-item">
									<div class="row">
										<div class="col-md-8">
											<h1 class="text-white" data-animation-out="fadeOutDown" data-delay-out="5"
												data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">
												Your bright
												future is our mission</h1>
											<p class="text-muted mb-4" data-animation-out="fadeOutDown"
												data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInUp"
												data-delay-in=".4">Future programming languages form the foundation of software development.
												 As time has progressed, we've observed transformative shifts in the programming language landscape,
												  transitioning from foundational languages such as C and Java to the popularity of Python and JavaScript</p>
											<a href="contact.html" class="btn btn-primary"
												data-animation-out="fadeOutDown" data-delay-out="5"
												data-duration-in=".3" data-animation-in="zoomIn"
												data-delay-in=".7">Apply now</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- /hero slider -->

					<!-- banner-feature -->
					<section class="bg-gray overflow-md-hidden">
						<div class="container-fluid p-0">
							<div class="row no-gutters">
								<div class="col-xl-4 col-lg-5 align-self-end">
									<img class="img-fluid w-100" src="resources/images/banner/banner-feature.png"
										alt="banner-feature">
								</div>
								<div class="col-xl-8 col-lg-7">
									<div class="row feature-blocks bg-gray justify-content-between">
										<div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
											<i class="ti-book mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
											<h3 class="mb-xl-4 mb-lg-3 mb-4">Scholorship News</h3>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
												sed do eiusmod tempor incididunt ut labore et dolore magna
												aliqua. Ut enim ad</p>
										</div>
										<div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
											<i class="ti-blackboard mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
											<h3 class="mb-xl-4 mb-lg-3 mb-4">Our Notice Board</h3>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
												sed do eiusmod tempor incididunt ut labore et dolore magna
												aliqua. Ut enim ad</p>
										</div>
										<div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
											<i class="ti-agenda mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
											<h3 class="mb-xl-4 mb-lg-3 mb-4">Our Achievements</h3>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
												sed do eiusmod tempor incididunt ut labore et dolore magna
												aliqua. Ut enim ad</p>
										</div>
										<div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
											<i class="ti-write mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
											<h3 class="mb-xl-4 mb-lg-3 mb-4">Admission Now</h3>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
												sed do eiusmod tempor incididunt ut labore et dolore magna
												aliqua. Ut enim ad</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- /banner-feature -->

					<!-- about us -->
					<section class="section">
						<div class="container">
							<div class="row align-items-center">
								<div class="col-md-6 order-2 order-md-1">
									<h2 class="section-title">About Educenter</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
										sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
										Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
										nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
										reprehenderit in voluptate velit esse cillum dolore eu fugiat
										nulla pariatur. Excepteur sint occaecat</p>
									<p>cupidatat non proident, sunt in culpa qui officia deserunt
										mollit anim id est laborum. Sed ut perspiciatis unde omnis iste
										natus error sit voluptatem</p>
									<a href="about.html" class="btn btn-outline-primary">Learn more</a>
								</div>
								<div class="col-md-6 order-1 order-md-2 mb-4 mb-md-0">
									<img class="img-fluid w-100" src="resources/images/about/about-us.jpg"
										alt="about image">
								</div>
							</div>
						</div>
					</section>
					<!-- /about us -->

					<!-- courses -->
					<section class="section-sm">
						<div class="container">
							<div class="row">
								<div class="col-12">
									<div class="d-flex align-items-center section-title justify-content-between">
										<h2 class="mb-0 text-nowrap mr-3">Our Course</h2>
										<div class="border-top w-100 border-primary d-none d-sm-block"></div>
										<div>
											<a href='<c:url value="/course/courses"/>'
												class="btn btn-sm btn-outline-primary ml-sm-3 d-none d-sm-block">see
												all</a>
										</div>
									</div>
								</div>
							</div>
							<!-- course list -->
							<div class="row justify-content-center">
								<!-- course item -->
								<c:forEach items="${courseList}" var="course">
									<div class="col-lg-4 col-sm-6 mb-5">
										<div class="card p-0 border-primary rounded-0 hover-shadow">
											<img class="card-img-top rounded-0" style="height:230px;"
												src="<c:url value='${course.courseImagePath }' />" alt="course thumb">
											<div class="card-body">
												<ul class="list-inline mb-2">
													<a href="<c:url value="
														/user/show-single-lesson/${course.courseId}" />">
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
												<div class="mt-2 show-button">
													<a href="<c:url value="
														/user/show-single-lesson/${course.courseId}" />" class="btn
													btn-primary btn-sm">See more..</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>


								<!-- mobile see all button -->
								<div class="row">
									<div class="col-12 text-center">
										<a href="courses.html"
											class="btn btn-sm btn-outline-primary d-sm-none d-inline-block">sell
											all</a>
									</div>
								</div>
							</div>
					</section>
					<!-- /courses -->

					<!-- cta -->
					<section class="section bg-primary">
						<div class="container">
							<div class="row">
								<div class="col-12 text-center">
									<h6 class="text-white font-secondary mb-0">Click to Join the
										Advance Workshop</h6>
									<h2 class="section-title text-white">Training In Advannce
										Networking</h2>
									<a href="contact.html" class="btn btn-light">join now</a>
								</div>
							</div>
						</div>
					</section>
					<!-- /cta -->

					<!-- success story -->
					<section class="section bg-cover" data-background="resources/images/backgrounds/success-story.jpg">
						<div class="container">
							<div class="row">
								<div class="col-lg-6 col-sm-4 position-relative success-video">
									<a class="play-btn venobox" href="https://youtu.be/nA1Aqp0sPQo" data-vbtype="video">
										<i class="ti-control-play"></i>
									</a>
								</div>
								<div class="col-lg-6 col-sm-8">
									<div class="bg-white p-5">
										<h2 class="section-title">Success Stories</h2>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
											sed do eiusmod tempor incididunt ut labore et dolore magna
											aliqua. Ut enim ad minim veniam, quis nostrud exercitation
											ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
											aute irure dolor in reprehenderit in voluptate velit esse cillum
											dolore eu fugiat nulla pariatur. Excepteur sint occaecat.</p>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
											sed do eiusmod tempor incididunt ut labore et dolore magna
											aliqua. Ut enim ad minim veniam, quis nostrud exercitation
											ullamco laboris</p>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- /success story -->

					<!-- events -->
					<section class="section bg-gray">
						<div class="container">
							<div class="row">
								<div class="col-12">
									<div class="d-flex align-items-center section-title justify-content-between">
										<h2 class="mb-0 text-nowrap mr-3">Upcoming Events</h2>
										<div class="border-top w-100 border-primary d-none d-sm-block"></div>
										<div>
											<a href="events.html"
												class="btn btn-sm btn-outline-primary ml-sm-3 d-none d-sm-block">see
												all</a>
										</div>
									</div>
								</div>
							</div>
							<div class="row justify-content-center">
								<!-- event -->
								<div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
									<div class="card border-0 rounded-0 hover-shadow">
										<div class="card-img position-relative">
											<img class="card-img-top rounded-0"
												src="resources/images/events/event-1.jpg" alt="event thumb">
											<div class="card-date">
												<span>18</span><br>December
											</div>
										</div>
										<div class="card-body">
											<!-- location -->
											<p>
												<i class="ti-location-pin text-primary mr-2"></i>Dhanmondi Lake,
												Dhaka
											</p>
											<a href="event-single.html">
												<h4 class="card-title">Lorem
													ipsum dolor amet, consectetur adipisicing.</h4>
											</a>
										</div>
									</div>
								</div>
								<!-- event -->
								<div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
									<div class="card border-0 rounded-0 hover-shadow">
										<div class="card-img position-relative">
											<img class="card-img-top rounded-0"
												src="resources/images/events/event-2.jpg" alt="event thumb">
											<div class="card-date">
												<span>21</span><br>December
											</div>
										</div>
										<div class="card-body">
											<!-- location -->
											<p>
												<i class="ti-location-pin text-primary mr-2"></i>Dhanmondi Lake,
												Dhaka
											</p>
											<a href="event-single.html">
												<h4 class="card-title">Lorem
													ipsum dolor amet, consectetur adipisicing.</h4>
											</a>
										</div>
									</div>
								</div>
								<!-- event -->
								<div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
									<div class="card border-0 rounded-0 hover-shadow">
										<div class="card-img position-relative">
											<img class="card-img-top rounded-0"
												src="resources/images/events/event-3.jpg" alt="event thumb">
											<div class="card-date">
												<span>23</span><br>December
											</div>
										</div>
										<div class="card-body">
											<!-- location -->
											<p>
												<i class="ti-location-pin text-primary mr-2"></i>Dhanmondi Lake,
												Dhaka
											</p>
											<a href="event-single.html">
												<h4 class="card-title">Lorem
													ipsum dolor amet, consectetur adipisicing.</h4>
											</a>
										</div>
									</div>
								</div>
							</div>
							<!-- mobile see all button -->
							<div class="row">
								<div class="col-12 text-center">
									<a href="course.html"
										class="btn btn-sm btn-outline-primary d-sm-none d-inline-block">sell all</a>
								</div>
							</div>
						</div>
					</section>
					<!-- /events -->

					<!-- teachers -->
					<section class="section">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-12">
									<h2 class="section-title">Our Teachers</h2>
								</div>
								<!-- teacher -->
								<div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
									<div class="card border-0 rounded-0 hover-shadow">
										<img class="card-img-top rounded-0"
											src="resources/images/teachers/teacher-1.jpg" alt="teacher">
										<div class="card-body">
											<a href="teacher-single.html">
												<h4 class="card-title">Jacke Masito</h4>
											</a>
											<p>Teacher</p>
											<ul class="list-inline">
												<li class="list-inline-item"><a class="text-color"
														href="https://facebook.com/themefisher"><i
															class="ti-facebook"></i></a></li>
												<li class="list-inline-item"><a class="text-color"
														href="https://twitter.com/themefisher"><i
															class="ti-twitter-alt"></i></a></li>
												<li class="list-inline-item"><a class="text-color"
														href="https://github.com/themefisher"><i
															class="ti-google"></i></a></li>
												<li class="list-inline-item"><a class="text-color"
														href="https://instagram.com/themefisher/"><i
															class="ti-linkedin"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- teacher -->
								<div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
									<div class="card border-0 rounded-0 hover-shadow">
										<img class="card-img-top rounded-0"
											src="resources/images/teachers/teacher-2.jpg" alt="teacher">
										<div class="card-body">
											<a href="teacher-single.html">
												<h4 class="card-title">Clark Malik</h4>
											</a>
											<p>Teacher</p>
											<ul class="list-inline">
												<li class="list-inline-item"><a class="text-color"
														href="https://facebook.com/themefisher"><i
															class="ti-facebook"></i></a></li>
												<li class="list-inline-item"><a class="text-color"
														href="https://twitter.com/themefisher"><i
															class="ti-twitter-alt"></i></a></li>
												<li class="list-inline-item"><a class="text-color"
														href="https://github.com/themefisher"><i
															class="ti-google"></i></a></li>
												<li class="list-inline-item"><a class="text-color"
														href="https://instagram.com/themefisher/"><i
															class="ti-linkedin"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- teacher -->
								<div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
									<div class="card border-0 rounded-0 hover-shadow">
										<img class="card-img-top rounded-0"
											src="resources/images/teachers/teacher-3.jpg" alt="teacher">
										<div class="card-body">
											<a href="teacher-single.html">
												<h4 class="card-title">John Doe</h4>
											</a>
											<p>Teacher</p>
											<ul class="list-inline">
												<li class="list-inline-item"><a class="text-color"
														href="https://facebook.com/themefisher"><i
															class="ti-facebook"></i></a></li>
												<li class="list-inline-item"><a class="text-color"
														href="https://twitter.com/themefisher"><i
															class="ti-twitter-alt"></i></a></li>
												<li class="list-inline-item"><a class="text-color"
														href="https://github.com/themefisher"><i
															class="ti-google"></i></a></li>
												<li class="list-inline-item"><a class="text-color"
														href="https://instagram.com/themefisher/"><i
															class="ti-linkedin"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- /teachers -->

					<!-- blog -->
					<section class="section pt-0">
						<div class="container">
							<div class="row">
								<div class="col-12">
									<h2 class="section-title">Latest News</h2>
								</div>
							</div>
							<div class="row justify-content-center">
								<!-- blog post -->
								<article class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
									<div
										class="card rounded-0 border-bottom border-primary border-top-0 border-left-0 border-right-0 hover-shadow">
										<img class="card-img-top rounded-0" src="resources/images/blog/post-1.jpg"
											alt="Post thumb">
										<div class="card-body">
											<!-- post meta -->
											<ul class="list-inline mb-3">
												<!-- post date -->
												<li class="list-inline-item mr-3 ml-0">August 28, 2018</li>
												<!-- author -->
												<li class="list-inline-item mr-3 ml-0">By Somrat Sorkar</li>
											</ul>
											<a href="blog-single.html">
												<h4 class="card-title">Lorem ipsum dolor amet, adipisicing
													eiusmod tempor.</h4>
											</a>
											<p class="card-text">Lorem ipsum dolor sit amet, consectetur
												adipisicin</p>
											<a href="blog-single.html" class="btn btn-primary btn-sm">read
												more</a>
										</div>
									</div>
								</article>
								<!-- blog post -->
								<article class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
									<div
										class="card rounded-0 border-bottom border-primary border-top-0 border-left-0 border-right-0 hover-shadow">
										<img class="card-img-top rounded-0" src="resources/images/blog/post-2.jpg"
											alt="Post thumb">
										<div class="card-body">
											<!-- post meta -->
											<ul class="list-inline mb-3">
												<!-- post date -->
												<li class="list-inline-item mr-3 ml-0">August 13, 2018</li>
												<!-- author -->
												<li class="list-inline-item mr-3 ml-0">By Jonathon Drew</li>
											</ul>
											<a href="blog-single.html">
												<h4 class="card-title">Lorem ipsum dolor amet, adipisicing
													eiusmod tempor.</h4>
											</a>
											<p class="card-text">Lorem ipsum dolor sit amet, consectetur
												adipisicin</p>
											<a href="blog-single.html" class="btn btn-primary btn-sm">read
												more</a>
										</div>
									</div>
								</article>
								<!-- blog post -->
								<article class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
									<div
										class="card rounded-0 border-bottom border-primary border-top-0 border-left-0 border-right-0 hover-shadow">
										<img class="card-img-top rounded-0" src="resources/images/blog/post-3.jpg"
											alt="Post thumb">
										<div class="card-body">
											<!-- post meta -->
											<ul class="list-inline mb-3">
												<!-- post date -->
												<li class="list-inline-item mr-3 ml-0">August 24, 2018</li>
												<!-- author -->
												<li class="list-inline-item mr-3 ml-0">By Alex Pitt</li>
											</ul>
											<a href="blog-single.html">
												<h4 class="card-title">Lorem ipsum dolor amet, adipisicing
													eiusmod tempor.</h4>
											</a>
											<p class="card-text">Lorem ipsum dolor sit amet, consectetur
												adipisicin</p>
											<a href="blog-single.html" class="btn btn-primary btn-sm">read
												more</a>
										</div>
									</div>
								</article>
							</div>
						</div>
					</section>
					
					<%@ include file="feedback.jsp" %>
					<%@ include file="indexfooter.jsp" %>


						<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
							integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
							crossorigin="anonymous"></script>
						<script src="<c:url value="/resources/plugins/jQuery/jquery.min.js" />"></script>
						<!-- Bootstrap JS -->
						<script src="<c:url value="/resources/plugins/bootstrap/bootstrap.min.js" />"></script>
						<!-- slick slider -->
						<script src="<c:url value="/resources/plugins/slick/slick.min.js" />"></script>
						<!-- aos -->
						<script src="<c:url value="/resources/plugins/aos/aos.js" />"></script>
						<!-- venobox popup -->
						<script src="<c:url value="/resources/plugins/venobox/venobox.min.js" />"></script>
						<!-- filter -->
						<script src="<c:url value="/resources/plugins/filterizr/jquery.filterizr.min.js" />"></script>
						<!-- google map -->
						<script src="<c:url value="
							https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" />">
						</script>
						<script src="<c:url value="/resources/plugins/google-map/gmap.js" />"></script>

						<!-- Main Script -->
						<script src="<c:url value="/resources/js/script.js" />"></script>
						<script src="<c:url value="/resources/js/register.js" />"></script>
						<script src="<c:url value="/resources/js/login.js" />"></script>




		</body>

		</html>