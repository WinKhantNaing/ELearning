<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<!-- Title Page-->
<title>Adding New Course Form</title>

<!-- Icons font CSS-->
<link
	href="<c:url value ="adduserresources/vendor/mdi-font/css/material-design-iconic-font.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value ="adduserresources/vendor/font-awesome-4.7/css/font-awesome.min.css"/>"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="<c:url value ="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"/>"
	rel="stylesheet">

<!-- Vendor CSS-->
<link
	href="<c:url value ="adduserresources/vendor/select2/select2.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value ="adduserresources/vendor/datepicker/daterangepicker.css"/>"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="<c:url value ="/adduserresources/css/main.css"/>"
	rel="stylesheet" media="all">
	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript" src="<c:url value ="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"/>"></script>
</head>

<body>

	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins"
		style="margin-top: 15px;">
		<div class="wrapper wrapper--w680">
			<div>
				<div class="card card-4">
					<a href='<c:url value="../course/showcourses"/>'><button
							type="button" class="btn btn-primary"
							style="margin: 20px; background-color: lightgrey;">Back</button></a>
					<div class="card-body">

						<h2 class="title">Update Course Form</h2>

						<form:form modelAttribute="courseUpdateBean" action="saveupdatecourse" method="POST" enctype="multipart/form-data">

							<div class="row row-space">
								<div>

									<label class="label">ID</label>

									<form:input path="courseId" class="input--style-4 form-control"
										style="width:300px;" value="${cbean.courseId }"
										readonly="true"></form:input>
								</div>
							</div>
							<div class="row row-space">
								<div>

									<label class="label">Title</label>

									<form:input path="courseName" class="input--style-4 form-control" style="width:300px;" value="${cbean.courseName }"></form:input>
								</div>
							</div>


							<div class="row row-space">
								<div>
									<div>
										<label class="label">Membership</label>
										<div class="p-t-10">
										
											<c:if test="${cbean.courseStatus.equalsIgnoreCase('free')}">
												<label class="radio-container m-r-45">Free <form:radiobutton
														path="courseStatus" checked="checked" value="free"></form:radiobutton>
													<span class="checkmark"></span>
												</label>

												<label class="radio-container">Premium <form:radiobutton
														path="courseStatus" value="premium"></form:radiobutton> <span
													class="checkmark"></span>
												</label>
											</c:if>

											<c:if test="${cbean.courseStatus.equalsIgnoreCase('premium')}">
												<label class="radio-container m-r-45">Free <form:radiobutton
														path="courseStatus" checked="checked" value="premium"></form:radiobutton>
													<span class="checkmark"></span>
												</label> 
											
											<label class="radio-container">Premium <form:radiobutton
														path="courseStatus" value="premium"></form:radiobutton> <span
													class="checkmark"></span>
												</label>
											</c:if>


										</div>
									</div>

									<div class="row row-space">
										<div>

											<label class="label">Is Active</label>

											<form:input path="isActive" class="input--style-4 form-control"
												style="width:300px;" value="${cbean.isActive }"></form:input>
										</div>
									</div>
								</div>
							</div>
							
							<div>
								<label class="label">Write introduction about lesson</label>
								<div class="wrapper-ta">
									<form:textarea value="${cbean.courseIntroduction}" class="form-control"
										path="courseIntroduction" style="width: 400px; height 350px;" id="the-textarea3" />
									<div id="the-count3">
										<span id="current3">0</span> <span id="maximum3">/300</span>
									</div>
								</div>
							</div>
							<script>
						       			CKEDITOR.replace('introduction');
									</script>
							
							<div>
								<label class="label">Write description about lesson</label>
								<div class="wrapper-ta">
									<form:textarea value="${cbean.courseDescription}" class="form-control"
										path="courseDescription" style="width: 400px; height 350px;" id="the-textarea2" />
									<div id="the-count2">
										<span id="current2">0</span> <span id="maximum2">/300</span>
									</div>
								</div>
							</div>
							<div>
								<label class="label">Attach Files</label>
								<div class="file-upload">

									<div class="image-upload-wrap">

										<form:input value="${cbean.courseImagePath }" type='file' path="courseImage" class="file-upload-input" onchange="readURL(this);" />

										<div class="drag-text">
											<h3>Attach any relevant documents or images</h3>
										</div>
									</div>
									<div class="file-upload-content">
										<img class="file-upload-image" src="${cbean.courseImagePath }"
											alt="your image" />
										<div class="image-title-wrap">
											<button type="button" onclick="removeUpload()"
												class="remove-image">
												Remove <span class="image-title">Uploaded Image</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="p-t-15">
								<button type="submit" class="btn btn--radius-2 btn--blue">Update</button>
							</div>

							<!-- form end here -->
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script
		src="<c:url value ="/adduserresources/vendor/jquery/jquery.min.js"/>"></script>
	<!-- Vendor JS-->
	<script
		src="<c:url value ="/adduserresources/vendor/select2/select2.min.js"/>"></script>
	<script
		src="<c:url value ="/adduserresources/vendor/datepicker/moment.min.js"/>"></script>
	<script
		src="<c:url value ="/adduserresources/vendor/datepicker/daterangepicker.js"/>"></script>

	<!-- Main JS-->
	<script src="<c:url value ="/resources/js/global.js"/>"></script>

	<script class="jsbin"
		src="<c:url value ="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"/>"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>