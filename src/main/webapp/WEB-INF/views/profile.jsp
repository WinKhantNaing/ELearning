<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/profile.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link
	href="<c:url value ="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value ="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value ="/resources/vendor/select2/select2.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value ="/resources/vendor/datepicker/daterangepicker.css"/>"
	rel="stylesheet" media="all">


<!-- <link rel="stylesheet" href="./css/profile.css"> -->
</head>

<body>
	<div class="container">
		<div class="main-body">
			<!-- /Breadcrumb -->
			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">


								<div>
									<button type="button" class="btn" data-bs-toggle="modal"
										data-bs-target="#exampleModal">

										<img src="${pageContext.request.contextPath}/resources/images/profilephoto/439300555_2059881581060262_1169231855395297999_n.jpg" alt="photo" class="rounded-circle" width="150" style="overflow: hidden;">

									</button>
								</div>

								<div class="mt-3">
									<h5>${user.userName}</h5>
									<p class="text-secondary mb-1">
									<h6>Level -${level}</h6>
									</p>
									<p class="text-muted font-size-sm">
									<h6>${subscription}</h6>
									</p>
									<a class="btn btn-danger" href="#" role="button">Logout</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- modal profile -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Select
									New Profile</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>

							<form:form action="profilePhoto"  method="post"  modelAttribute="pbean" enctype="multipart/form-data">
								<div class="modal-body">
									<div>
										<label class="label">My Profile Picture</label>
										<div class="file-upload">

											<!-- Container for uploading files -->
											<div class="image-upload-wrap">
												<!-- Input field for selecting files -->
												<form:input type="file" path="file" id="pfimg" class="file-upload-input"
													onchange="readURL(this);" />
												<!-- Text displayed when no file is selected -->
												<div class="drag-text">
													<h3>Choose profile picture</h3>
												</div>
											</div>

											<!-- Container for displaying uploaded files -->
											<div class="file-upload-content">
												<!-- Placeholder for displaying the uploaded image -->
													<img class="file-upload-image" src="#"
													alt="your image" />
												<!-- Container for the title and remove button of the uploaded image -->
												<div class="image-title-wrap">
													<!-- Button to remove the uploaded image -->
													<button type="button" onclick="removeUpload()"
														class="remove-image">
														Remove 
													</button>
												</div>
											</div>
										</div>

									</div>
									<br>
									<div class="col text-center">
										<button type="submit" class="btn btn-primary">Save</button>
									</div>

								</div>
								<!-- <div class="modal-footer">
									
								</div> -->
							</form:form>

						</div>
					</div>
				</div>

				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">

							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Full Name</h6>
								</div>
								<div class="col-sm-9 text-secondary">${user.userName}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Email</h6>
								</div>
								<div class="col-sm-9 text-secondary">${user.userEmail}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Password</h6>
								</div>
								<div class="col-sm-9 text-secondary" >${user.password}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Gender</h6>
								</div>
								<div class="col-sm-9 text-secondary">${user.gender}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<a class="btn btn-info" href="profileedit" role="button">Edit</a>
								</div>
							</div>
						</div>
					</div>

					<div class="row gutters-sm">
						<div class="col-sm-6 mb-3">
							<div class="card h-100">
								<div class="card-body">
									<h6 class="d-flex align-items-center mb-3"
										style="color: #FFEA00;">Subscription Plan</h6>
									<ul>
										<li><small>Web Design</small></li>
										<li><small>Website Markup</small></li>
										<li><small>One Page</small></li>
										<li><small>Mobile Template</small></li>
										<li><small>Backend API</small></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-sm-6 mb-3">
							<div class="card h-100">
								<div class="card-body">
									<h6 class="d-flex align-items-center mb-3"
										style="color: #7CFC00;">Complete Courses</h6>
									<ul>


										<c:forEach items="${lstUserCourse}" var="course">
											<li>
												<div>${course.courseName}</div>

											</li>
										</c:forEach>


									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/5bb5a852ac.js"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
	const myModal = document.getElementById('exampleModal')
	const myInput = document.getElementById('input')

	myModal.addEventListener('shown.bs.modal', () => {
	  myInput.focus()
	})
	</script>

	<script src="<c:url value ="/resources/vendor/jquery/jquery.min.js"/>"></script>
	<!-- Vendor JS-->
	<script
		src="<c:url value ="/resources/vendor/select2/select2.min.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/datepicker/moment.min.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/datepicker/daterangepicker.js"/>"></script>

	<!-- Main JS-->
	<script src="<c:url value ="/resources/js/global.js"/>"></script>

</body>

</html>