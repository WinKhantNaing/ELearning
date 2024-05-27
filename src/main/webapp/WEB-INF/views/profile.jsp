<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<c:url value="/resources/css/unit.css" />" rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>




<link
	href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css"
	rel="stylesheet">

<link href="<c:url value='/resources/css/rate.css'/>" rel="stylesheet">


<link
	href="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />"
	rel="stylesheet">

<link rel="stylesheet" href="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/profile.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link
	href="<c:url value ="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" />"
	rel="stylesheet" media="all">
<link
	href="<c:url value ="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" />"
	rel="stylesheet" media="all">
<link
	href="<c:url value ="/resources/vendor/select2/select2.min.css" />"
	rel="stylesheet" media="all">
<link
	href="<c:url value ="/resources/vendor/datepicker/daterangepicker.css" />"
	rel="stylesheet" media="all">

<link href="<c:url value ="/resources/acss/style.css" />"
	rel="stylesheet" />
<style>
body {
	background-color: #5c5c77
}

table, tr, td {
	border: solid 1px;
	border-collapse: collapse;
}
</style>
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
										<img
											src="${pageContext.request.contextPath}${'\\'}${user.filePath}"
											alt="Admin" class="rounded-circle" width="140" height="140"
											style="object-fit: cover"> <i
											class="fi fi-ts-circle-camera"></i>
									</button>
								</div>

								<div class="mt-3">
									<h5>${user.userName}</h5>

									<c:if test="${sessionuserRole == 'User'}">
										<p class="text-secondary mb-1">
										<h6>
											Level - <span style="color: #FFEA00;">${level}</span>
										</h6>
										</p>
										<p class="text-muted font-size-sm">
										<h6 style="color: #7CFC00;">${subscription}</h6>
										</p>
									</c:if>
									<a class="btn btn-danger" href="logout" role="button">Logout</a>
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

							<form:form action="profilePhoto" method="post"
								modelAttribute="pbean" enctype="multipart/form-data">
								<div class="modal-body">
									<div>
										<label class="label">My Profile Picture</label>
										<div style="text-align: center;">
											<span id="warningmsg" style="color: red; font-size: 15px;"></span>
										</div>
										<div class="file-upload">

											<!-- Container for uploading files -->
											<div class="image-upload-wrap">
												<!-- Input field for selecting files -->
												<form:input type="file" path="file" id="pfimg"
													class="file-upload-input" onchange="readURL(this);" />
												<!-- Text displayed when no file is selected -->
												<div class="drag-text">
													<h3>Choose profile picture</h3>
												</div>
											</div>

											<!-- Container for displaying uploaded files -->
											<div class="file-upload-content">
												<!-- Placeholder for displaying the uploaded image -->
												<img class="file-upload-image" src="#" alt="your image" />
												<!-- Container for the title and remove button of the uploaded image -->
												<div class="image-title-wrap">
													<!-- Button to remove the uploaded image -->
													<button type="button" onclick="removeUpload()"
														class="remove-image">Remove</button>
												</div>
											</div>
										</div>

									</div>
									<br>
									<div class="col text-center">
										<button type="submit" id="submitbtn" class="btn btn-primary">Save</button>
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
							<button type="button" class="btn w-100 hover-btn"
								data-bs-toggle="modal" data-bs-target="#nameModal">
								<div class="row">
									<div class="col-sm-6" style="text-align: left;">
										<h6 class="mb-0">Full Name</h6>
									</div>
									<div class="col-sm-6 text-secondary" style="text-align: left;">
										${user.userName}</div>
								</div>
							</button>

							<!-- Name Modal -->
							<div class="modal fade" id="nameModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<h1 class="modal-title fs-5" id="exampleModalLabel"
											style="padding: 15px;">Edit Your Name</h1>
										<form:form action="changeusername" method="post"
											modelAttribute="user">
											<div class="mb-3" style="padding: 20px;">
												<form:label for="exampleFormControlInput1"
													class="form-label" path="userName">Name
																	</form:label>
												<form:input class="form-control"
													id="exampleFormControlInput1"
													placeholder="name@example.com" path="userName"
													value="${user.userName}"
													style="
												    border: none;
												    border-bottom: 1px solid #80808040;
												    border-radius: 0;
												" />
											</div>
											<div
												style="margin: 20px 0 20px; float: right; margin-right: 30px;">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary">Save</button>
											</div>
										</form:form>
									</div>
								</div>
							</div>

							<hr>

							<button type="button" class="btn w-100 hover-btn"
								data-bs-toggle="modal" data-bs-target="#emailModal">
								<div class="row">
									<div class="col-sm-6" style="text-align: left;">
										<h6 class="mb-0">Email</h6>
									</div>
									<div class="col-sm-6 text-secondary" style="text-align: left;">
										${user.userEmail}</div>
								</div>
							</button>

							<!-- Email Modal -->
							<div class="modal fade" id="emailModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<h1 class="modal-title fs-5" id="exampleModalLabel"
											style="padding: 15px;">Edit Your Email</h1>
										<form:form action="changeemail" method="post"
											modelAttribute="user">
											<div class="mb-3" style="padding: 20px;">
												<form:label for="exampleFormControlInput2"
													class="form-label" path="userEmail">Email
																	</form:label>
												<form:input class="form-control"
													id="exampleFormControlInput2" placeholder="Enter Email"
													path="userEmail" value="${user.userEmail}"
													style="
												    border: none;
												    border-bottom: 1px solid #80808040;
												    border-radius: 0;
												" />
											</div>
											<div
												style="margin: 20px 0 20px; float: right; margin-right: 30px;">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary">Save</button>
											</div>
										</form:form>
									</div>
								</div>
							</div>

							<hr>

							<button type="button" class="btn w-100 hover-btn"
                data-bs-toggle="modal" data-bs-target="#passwordModal">
                <div class="row">
                  <div class="col-sm-6" style="text-align: left;">
                    <h6 class="mb-0">Password</h6>
                  </div>
                  <div class="col-sm-6 text-secondary" style="text-align: left;">
                    ${user.password}</div>
                </div>
              </button>

              <!-- Password Modal -->
              <div class="modal fade" id="passwordModal" tabindex="-1"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <h1 class="modal-title fs-5" id="exampleModalLabel"
                      style="padding: 15px;">Edit Your Password</h1>
                    <form:form action="checkcurrentpassword" method="post"
                      modelAttribute="profile" id="passwordForm">
                      <div class="mb-3" style="padding: 20px;">
                        <form:label for="exampleFormControlInput2"
                          class="form-label" path="password">Current Password
                                  </form:label>
                        <form:password class="form-control" id="currentPassword"
                          placeholder="Enter Current Password" path="password"
                          style="
                            border: none;
                            border-bottom: 1px solid #80808040;
                            border-radius: 0;
                        " />
                        <span id="currentPasswordError" class="error"></span>
                      </div>
                      <div class="mb-3" style="padding: 20px;">
                        <form:label class="form-label" path="newPassword">New Password
                                  </form:label>
                        <form:password class="form-control" id="newPassword"
                          placeholder="Enter New Password" path="newPassword"
                          style="
                            border: none;
                            border-bottom: 1px solid #80808040;
                            border-radius: 0;
                        " />
                        <span id="newPasswordError" class="error"></span>
                      </div>
                      <div class="mb-3" style="padding: 20px;">
                        <form:label class="form-label" path="conNewPassword">Confirm New Password
                                  </form:label>
                        <form:password class="form-control" id="confirmNewPassword"
                          placeholder="Enter New Password" path="conNewPassword"
                          style="
                            border: none;
                            border-bottom: 1px solid #80808040;
                            border-radius: 0;
                        " />
                        <span id="confirmNewPasswordError" class="error"></span>
                      </div>
                      <div
                        style="margin: 20px 0 20px; float: right; margin-right: 30px;">
                        <button type="button" class="btn btn-secondary"
                          data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                      </div>
                    </form:form>
                  </div>
                </div>
              </div>
						</div>
					</div>



					<c:choose>
						<c:when test="${sessionuserRole == 'Admin'}">
							<div class="container-fluid">
								<div class="row justify-content-center">
									<div class="col-lg-4 col-md-12">
										<div class="white-box analytics-info">
											<h3 class="box-title">Total User</h3>
											<ul
												class="list-inline two-part d-flex align-items-center mb-0">
												<li>
													<div id="sparklinedash">
														<canvas width="67" height="30"
															style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
													</div>
												</li>
												<li class="ms-auto"><span class="counter text-success">${usercount}</span>
												</li>
											</ul>
										</div>
									</div>
									<div class="col-lg-4 col-md-12">
										<div class="white-box analytics-info">
											<h3 class="box-title">Total SubscriptionUser</h3>
											<ul
												class="list-inline two-part d-flex align-items-center mb-0">
												<li>
													<div id="sparklinedash2">
														<canvas width="67" height="30"
															style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
													</div>
												</li>
												<li class="ms-auto"><span class="counter text-purple">${subusercount}</span>
												</li>
											</ul>
										</div>
									</div>
									<div class="col-lg-4 col-md-12">
										<div class="white-box analytics-info">
											<h3 class="box-title">Total Feedback</h3>
											<ul
												class="list-inline two-part d-flex align-items-center mb-0">
												<li>
													<div id="sparklinedash3">
														<canvas width="40" height="20"
															style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
													</div>
												</li>
												<li class="ms-auto"><span class="counter text-info">${feedbackcount}</span>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</c:when>

						<c:otherwise>
							<div class="row gutters-sm">
								<div class="col-sm-8 mb-3">
									<div class="card h-100">
										<div class="card-body">
											<%--<jsp:useBean id="now" class="java.util.Date" />
	              						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate"/>--%>
											<c:if test="${currentsub.size()>0}">
												<h5 class="d-flex align-items-center mb-3"
													style="color: #7CFC00;">Current History</h5>
												<table>
													<tr>
														<td><h6>Subscription plan</h6></td>
														<td><h6>&ensp; &ensp;Start date</h6></td>
														<td><h6>&ensp; &ensp;End date</h6></td>
													</tr>
													<c:forEach items="${currentsub}" var="bean">
														<tr>
															<td>${bean.subPlan}(${bean.duration})</td>
															<td>&ensp; &ensp;${bean.startDate}</td>
															<td>&ensp; &ensp;${bean.endDate}</td>
														</tr>
													</c:forEach>
												</table>
												<br>
											</c:if>
											<h5 class="d-flex align-items-center mb-3"
												style="color: #7CFC00;">Purchase History</h5>

											<c:choose>
												<c:when test="${payDescription.size()<=0}">
													<p>No Subscription Plan</p>
												</c:when>
												<c:otherwise>
													<table>
														<tr>
															<td><h6>Subscription plan</h6></td>
															<td><h6>&ensp; &ensp;Start date</h6></td>
															<td><h6>&ensp; &ensp;End date</h6></td>
														</tr>

														<c:forEach items="${payDescription}" var="bean">
															<tr>
																<td>${bean.subPlan}(${bean.duration})</td>
																<td>&ensp; &ensp;${bean.startDate}</td>
																<td>&ensp; &ensp;${bean.endDate}</td>
															</tr>
														</c:forEach>
													</table>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>

								<div class="col-sm-4 mb-3">
									<div class="card h-100">
										<div class="card-body">
											<h5 class="d-flex align-items-center mb-3"
												style="color: #FFEA00;">Complete Courses</h5>
											<ul>
												<c:choose>
													<c:when test="${lstUserCourse.size()<=0}">
														<p>Don't have Complete Course</p>
													</c:when>
													<c:otherwise>
														<c:forEach items="${lstUserCourse}" var="course">
															<li>
																<div>${course.courseName}</div>

															</li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			
			
				<c:if test="${sessionuserRole == 'Admin'}">
					<div class="card white-box p-0">
						<nav id="navbar-example2"
							class="navbar bg-body-tertiary px-3 mb-3">
							<a class="navbar-brand" href="#">
								<h3 class="box-title mb-0"
									style="font-size: 18px; font-style: italic">Recent
									Comments</h3>
							</a>
						</nav>
						<%-- <c:choose>
						<c:when test="${recentcomments!=null}"> --%>
						<div data-bs-spy="scroll" data-bs-target="#navbar-example2"
							data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true"
							class="scrollspy-example bg-body-tertiary p-3 rounded-2"
							tabindex="0" style="height: 300px; overflow-y: auto;">
							<div id="scrollspyHeading1">
								<c:forEach items="${recentcomments}" var="rc">
									<div class="comment-widgets">
										<!-- Comment Row -->
										<div class="d-flex flex-row comment-row p-3 mt-0"
											style="margin-top: 10px">
											<div class="p-2">
												<img
													src="${pageContext.request.contextPath}${'\\'}${rc.filePath}"
													alt="user" width="50" height="50" style="object-fit: cover"
													class="rounded-circle" />
											</div>
											<div class="comment-text ps-2 ps-md-3 w-100">
												<h5 class="font-medium"
													style="font-size: 18px; font-style: initial">${rc.userName}</h5>
												<span class="mb-3 d-block"
													style="font-size: 14px; font-style: revert">
													${rc.comments} </span>
												<div class="comment-footer d-md-flex align-items-center">

													<div class="input-wrapper">
														<div class="rate-box">
															<c:choose>
																<c:when test="${rc.rating == 1}">
																	<span class="me-1"> <i
																		class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-gray fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-gray fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-gray fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-gray fs-6"></i>
																	</span>
																</c:when>

																<c:when test="${rc.rating == 2}">
																	<span class="me-1"> <i
																		class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-gray fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-gray fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-gray fs-6"></i>
																	</span>
																</c:when>

																<c:when test="${rc.rating == 3}">
																	<span class="me-1"> <i
																		class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-gray fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-gray fs-6"></i>
																	</span>
																</c:when>

																<c:when test="${rc.rating == 4}">
																	<span class="me-1"> <i
																		class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-gray fs-6"></i>
																	</span>
																</c:when>

																<c:when test="${rc.rating == 5}">
																	<span class="me-1"> <i
																		class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																		<i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
																	</span>
																</c:when>
															</c:choose>
														</div>
													</div>
												</div>

												<div class="text-muted fs-2 ms-auto mt-2 mt-md-0"
													style="font-size: calc(10px + 3px) !important">
													${rc.date}</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<%-- </c:when>
						<c:otherwise>
							<p>No feedback yet</p>
						</c:otherwise>
					</c:choose> --%>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	
	
	<script>
	
		const uploadInput = document.getElementById("pfimg");
		const submitbtn = document.getElementById("submitbtn");
		const warningmsg = document.getElementById("warningmsg");
		
		submitbtn.addEventListener("click",(event) => {
			if(uploadInput.value == ''){
				event.preventDefault();
				warningmsg.append("Please choose a photo");
				return;
			}
		})
		
	</script>

	
		<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://kit.fontawesome.com/5bb5a852ac.js"	crossorigin="anonymous"></script>

		
		<script
			src="<c:url value ="/resources/vendor/jquery/jquery.min.js" />"></script>
		<!-- Vendor JS-->
		<script
			src="<c:url value ="/resources/vendor/select2/select2.min.js" />"></script>
		<script
			src="<c:url value ="/resources/vendor/datepicker/moment.min.js" />"></script>
		<script
			src="<c:url value ="/resources/vendor/datepicker/daterangepicker.js" />"></script>

		<!-- Main JS-->
		<script src="<c:url value ="/resources/js/global.js" />"></script>

		<script src="<c:url value ="/resources/js/dashboard1.js" />"></script>
		<script src="<c:url value ="/resources/js/level.js" />"></script>

		<script	src="<c:url value ="/resources/aplugins/bower_components/jquery-sparkline/jquery.sparkline.min.js" />"></script>
		<script src="<c:url value ="/resources/aplugins/bower_components/chartist/dist/chartist.min.js" />"></script>
		<script src="<c:url value ="/resources/aplugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js" />"></script>
		
		<script src="<c:url value ="/resources/js/profile.js" />"></script>
		
		<script src="<c:url value="/resources/js/unit.js" />"></script>
</body>

</html>