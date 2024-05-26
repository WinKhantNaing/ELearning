<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

				<link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap/bootstrap.min.css" />">

				<link rel="stylesheet" href="<c:url value="/resources/plugins/slick/slick.css" />">

				<link rel="stylesheet" href="<c:url value="/resources/plugins/themify-icons/themify-icons.css" />">

				<link rel="stylesheet" href="<c:url value="/resources/plugins/animate/animate.css" />">

				<link rel="stylesheet" href="<c:url value="/resources/plugins/aos/aos.css" />">

				<link rel="stylesheet" href="<c:url value="/resources/plugins/venobox/venobox.css" />">


				<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
				<link href="<c:url value='resources/css/feedback.css'/>" rel="stylesheet">
				<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.png" />"
				type="image/x-icon">
				<link rel="icon" href="<c:url value="/resources/images/favicon.png" />"
				type="image/x-icon">

			</head>

			<body>

				<footer>

					<!-- newsletter -->
					<!-- Start DEMO HTML (Use the following code into your project)-->

					<c:if test="${sessionLogin == true}">
						<div class="newsletter">
							<div class="container">
								<div class="row">
									<div class="col-md-9 ml-auto bg-primary py-5 newsletter-block">
										<h3 class="text-white">Rate Your Experiences</h3>
										<form:form action="user/Feedback" method="post" modelAttribute="give">
											<div class="input-wrapper">
												<div class="rate-box">

													<form:radiobutton path="rating" name="star" value="5" id="star0" />
													<label class="star" for="star0"></label>
													<form:radiobutton path="rating" name="star" value="4" id="star1" />
													<label class="star" for="star1"></label>
													<form:radiobutton path="rating" name="star" value="3" id="star2"
														checked="checked" />
													<label class="star" for="star2"></label>
													<form:radiobutton path="rating" name="star" value="2" id="star3" />
													<label class="star" for="star3"></label>
													<form:radiobutton path="rating" name="star" value="1" id="star4" />
													<label class="star" for="star4"></label>

												</div>
												<form:input type="text" path="comment" class="form-control border-0"
													id="newsletter" name="newsletter"
													placeholder="Enter Your Email..." />
												<button type="submit" value="send" class="btn btn-primary"
													style="margin-top: 21px">Send</button>
											</div>
										</form:form>

									</div>
								</div>
							</div>
						</div>
					</c:if>




					<!-- END EDMO HTML (Happy Coding!)-->
					<!-- footer content -->
					<div class="footer bg-footer section border-bottom">
						<div class="container">
							<div class="row">
								<div class="col-lg-4 col-sm-8 mb-5 mb-lg-0">
									<!-- logo -->
									<a class="logo-footer" href="index.html"><img class="img-fluid mb-4"
											src="<c:url value="/resources/images/logo.png"/>" alt="logo"></a>
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

			</body>

			</html>