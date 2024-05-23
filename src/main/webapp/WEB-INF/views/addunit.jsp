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
<title>Adding New Unit Form</title>

<!-- Icons font CSS-->
<link
	href="<c:url value ="/adduserresources/vendor/mdi-font/css/material-design-iconic-font.min.css" />"
	rel="stylesheet" media="all">
<link
	href="<c:url value ="/adduserresources/vendor/font-awesome-4.7/css/font-awesome.min.css" />"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="<c:url value ="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" />
                "
	rel="stylesheet">

<!-- Vendor CSS-->
<link
	href="<c:url value ="/adduserresources/vendor/select2/select2.min.css" />"
	rel="stylesheet" media="all">
<link
	href="<c:url value ="/adduserresources/vendor/datepicker/daterangepicker.css" />"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="<c:url value ="/adduserresources/css/main.css" />"
	rel="stylesheet" media="all">
	
<link rel="stylesheet" href="<c:url value ="/richtexteditor/rte_theme_default.css" />" />

<script type="text/javascript" src="<c:url value ="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"/>"></script>
</head>

<body>
	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
		<div class="wrapper wrapper--w680">
			<div class="card card-4">
				<div class="card-body">
					<h2 class="title">Adding New Course Form</h2>

					<!-- form start here -->
					
					<form:form modelAttribute="add-unit-dto" action="../unit/create-unit" method="POST" enctype="multipart/form-data"> 
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Unit Name</label> 
									<form:input path="unitName" class="input--style-4" style="width:412.5px;" /> 
								</div>
							</div>
						</div>
						
							<label class="label">Unit Content</label>
							<form:textarea path="content" name="content" id="content" rows="10" cols="80" style="margin-bottom: 40px;" />
								
						<script>
						        CKEDITOR.replace('content');
						</script>

						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Question for WorkOut</label>
									<div class="wrapper-ta">
										<form:textarea path="workOut" name="the-textarea" id="the-textarea"
											maxlength="300" placeholder="Start Typin..."
											style="width: 412.5px;" />
										<div id="the-count">
											<span id="current">0</span> <span id="maximum">/300</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Little Hints for WorkOut</label>
									<div class="wrapper-ta">
										<form:textarea path="hint" name="the-textarea1" id="the-textarea1"
											maxlength="50" placeholder="Start Typin..."
											style="width: 412.5px;" />
										<div id="the-count1">
											<span id="current1">0</span> <span id="maximum1">/50</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Quiz</label>
									<div class="wrapper-ta">
										<form:textarea path="quiz" name="the-textarea2" id="the-textarea2"
											maxlength="300" placeholder="Start Typin..."
											style="width: 412.5px;" />
										<div id="the-count2">
											<span id="current2">0</span> <span id="maximum2">/300</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Option 1</label>
									<div class="wrapper-ta">
										<form:textarea path="option1" name="the-textarea" id="the-textarea"
											maxlength="100" placeholder="Start Typin..."
											style="width: 412.5px;" />
										<div id="the-count3">
											<span id="current3">0</span> <span id="maximum3">/100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Option 2</label>
									<div class="wrapper-ta">
										<form:textarea path="option2" name="the-textarea" id="the-textarea"
											maxlength="100" placeholder="Start Typin..."
											style="width: 412.5px;" />
										<div id="the-count4">
											<span id="current4">0</span> <span id="maximum4">/100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Answer</label>
									<div class="p-t-10">
										<label class="radio-container m-r-45">Option 1
										 <form:radiobutton path="answer" checked="checked"
                                                            value="0"></form:radiobutton>
                                                        <span class="checkmark"></span>
										</label> <label class="radio-container">Option 2
										 <form:radiobutton path="answer" checked="checked"
                                                            value="1"></form:radiobutton>
                                                        <span class="checkmark"></span>
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="p-t-15">
							<button type="submit" class="btn btn--radius-2 btn--blue">Add</button>
						</div>

						<!-- form end here -->
					</form:form>

						<!--Include the JS & CSS-->
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script
		src="<c:url value ="/adduserresources/vendor/jquery/jquery.min.js" />"></script>
	<!-- Vendor JS-->
	<script
		src="<c:url value ="/adduserresources/vendor/select2/select2.min.js" />"></script>
	<script
		src="<c:url value ="/adduserresources/vendor/datepicker/moment.min.js" />"></script>
	<script
		src="<c:url value ="/adduserresources/vendor/datepicker/daterangepicker.js" />"></script>

	<!-- Main JS-->
	<script src="<c:url value ="/adduserresources/js/global.js" />"></script>

	<script class="jsbin"
		src="<c:url value ="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" />"></script>
		
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->