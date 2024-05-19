<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<c:choose>
		<c:when test="${loginAlert!=null}">
			<script type="text/javascript">
		    	function confirmApply(event) {
		        var confirmed = confirm("You need to login first to apply the lessons");
		        if (!confirmed) {
		            event.preventDefault();
		        	}
		    	}
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
			    function confirmApply(event) {
			        var confirmed = confirm("You need to subscribe first to apply this premium lesson");
			        if (!confirmed) {
			            event.preventDefault();
			        }
			    }
			</script>
		</c:otherwise>
	</c:choose>
</head>
<body>
	<jsp:include page="indexheader.jsp"></jsp:include>
	<section class="page-title-section overlay"
		data-background="images/backgrounds/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<ul class="list-inline custom-breadcrumb mb-2">
						<li class="list-inline-item"><a
							class="h2 text-primary font-secondary" href="courses.html">Our
								Courses</a></li>
						<li class="list-inline-item text-white h3 font-secondary nasted">${slDTO.name}</li>
					</ul>
					<p class="text-lighten mb-0">Our courses offer a good
						compromise between the continuous assessment favoured by some
						universities and the emphasis placed on final exams by others.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- /page title -->

	<!-- section -->
	<section class="section-sm">
		<div class="container">
			<div class="row">
				<div class="col-12 mb-4">
					<!-- course thumb -->
					<img src="images/courses/course-single.jpg" class="img-fluid w-100">
				</div>
			</div>
			<!-- course info -->
			<div class="row align-items-center mb-5">
				<div class="col-xl-3 order-1 col-sm-6 mb-4 mb-xl-0">
					<h2>${slDTO.name}</h2>
				</div>
				<div class="col-xl-6 order-sm-3 order-xl-2 col-12 order-2">
					<ul class="list-inline text-xl-center">
						<li class="list-inline-item mr-4 mb-3 mb-sm-0">
							<div class="d-flex align-items-center">
								<i class="ti-book text-primary icon-md mr-2"></i>
								<div class="text-left">
									<h6 class="mb-0">Total Units</h6>
									<p class="mb-0">${unitCount}</p>
								</div>
							</div>
						</li>
						<!-- <li class="list-inline-item mr-4 mb-3 mb-sm-0">
            <div class="d-flex align-items-center">
              <i class="ti-alarm-clock text-primary icon-md mr-2"></i>
              <div class="text-left">
                <h6 class="mb-0">DURATION</h6>
                <p class="mb-0">03 Hours</p>
              </div>
            </div>
          </li> -->
						<li class="list-inline-item mr-4 mb-3 mb-sm-0">
							<div class="d-flex align-items-center">
								<i class="ti-wallet text-primary icon-md mr-2"></i>
								<div class="text-left">
									<h6 class="mb-0">FEE</h6>
									<p class="mb-0">${slDTO.purStatus}</p>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div
					class="col-xl-3 text-sm-right text-left order-sm-2 order-3 order-xl-3 col-sm-6 mb-4 mb-xl-0">
					<a href="../../user/check-login" class="btn btn-primary"
						onclick="confirmApply(event)">Apply now</a>
				</div>
				<!-- border -->
				<div class="col-12 mt-4 order-4">
					<div class="border-bottom border-primary"></div>
				</div>
			</div>
			<!-- course details -->
			<div class="row">
				<div class="col-12 mb-4">
					<h3>About Course</h3>
					<p>${slDTO.description}</p>
				</div>
				<div class="col-12 mb-4">
					<h3 class="mb-3">Content</h3>
					<div class="col-12 px-0">
						<div class="row">
							<div class="col-md-6">
								<ul class="list-styled">
									<c:forEach items="${unitNameLst}" var="unLst">
										<li>${unLst.unitName}</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="indexfooter.jsp"></jsp:include>
</body>
</html>