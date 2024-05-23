<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
<link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<%@ include file="indexheader.jsp" %>
<section class="page-title-section overlay" data-background="<c:url value ="/resources/images/backgrounds/page-title.jpg"/>">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb mb-2">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="index.html">Home</a></li>
          <li class="list-inline-item text-white h3 font-secondary nasted">About Us</li>
        </ul>
        <p class="text-lighten mb-0">Welcome to [Your Platform Name], the premier online learning destination designed to help you achieve your educational goals at your own pace. Our platform offers a diverse range of courses across various subjects, tailored to fit the needs of learners from all walks of life.</p>
      </div>
    </div>
  </div>
</section>
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <%-- <img class="img-fluid w-100 mb-4" src="<c:url value ="/resources/images/about/about-page.jpg"/>" alt="about image"> --%>
        <h2 class="section-title">Our Mission</h2>
        <p>At [Your Platform Name], we believe that education should be accessible, flexible, and engaging. Our mission is to empower individuals with the knowledge and skills they need to succeed in their personal and professional lives. We strive to create an inclusive learning environment that fosters curiosity, growth, and achievement.</p>
        <!-- <p>exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsum a, facere fugit error accusamus est officiis vero in, nostrum laboriosam corrupti explicabo, cumque repudiandae deleniti perspiciatis quae consectetur enim. Laboriosam!</p> -->
      </div>
    </div>
  </div>
</section>
<!-- /about -->

<!-- funfacts -->
<section class="section-sm bg-primary">
  <div class="container">
    <div class="row">
      <!-- funfacts item -->
     <!--  <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
        <div class="text-center">
          <h2 class="count text-white" data-count="60">0</h2>
          <h5 class="text-white">TEACHERS</h5>
        </div>
      </div> -->
      <!-- funfacts item -->
      <div class="col-md-4 col-sm-7 mb-5 mb-md-1">
        <div class="text-center">
          <h2 class="count text-white" data-count="${course}">0</h2>
          <h5 class="text-white">COURSES</h5>
        </div>
      </div>
      <!-- funfacts item -->
      <div class="col-md-4 col-sm-7 mb-5 mb-md-1">
        <div class="text-center">
          <h2 class="count text-white" data-count="${student}">0</h2>
          <h5 class="text-white">STUDENTS</h5>
        </div>
      </div>
      <!-- funfacts item -->
      <div class="col-md-4 col-sm-7 mb-5 mb-md-1">
        <div class="text-center">
          <h2 class="count text-white" data-count="${client}">0</h2>
          <h5 class="text-white">SATISFIED CLIENT</h5>
        </div>
      </div>
    </div>
  </div>
</section>

    <!-- Card -->
    <div class="card mb-4">
        <!-- Card Header -->
        <div class="card-header d-lg-flex align-items-center justify-content-between">
            <div class="mb-3 mb-lg-0">
                <h3 class="mb-0">Reviews</h3>
                <span>You have full control to manage your own account
                    setting.</span>
            </div>
            <div>
                <a href="#" class="btn btn-outline-primary btn-sm">Export
                    To CSV...</a>
            </div>
        </div>
        <!-- Card Body -->
        <div class="card-body">
            <!-- Form -->
            <form class="row mb-4">
                
            <ul class="list-group list-group-flush border-top">
                <!-- List Group Item -->
                <c:forEach items="${review}" var="reviewlst" begin = "0" end = "2">
                <li class="list-group-item px-0 py-4">
                    <div class="d-flex">
                        <img src="${pageContext.request.contextPath}/${reviewlst.image}" alt=""
     								class="rounded-circle avatar-lg" style="width:40px; height:40px; border-radius:30px; object-fix:cover;"/>
                        <div class="ms-3 mt-2">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <h4 class="mb-0">${reviewlst.viewname}</h4>
                                    <span class="text-muted fs-6">2
                                        hour ago</span>
                                </div>
                                <div>
                                    <a href="#" data-bs-toggle="tooltip" data-placement="top" title="Report Abuse"><i
                                            class="fe fe-flag"></i></a>
                                </div>
                            </div>
                            <div class="mt-2">
                            <c:choose>
                            <c:when test="${reviewlst.ratingview==1}">
                            	<span class="me-1">
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-light fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-light fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-light fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-light fs-6"></i>
                                </span>
                            </c:when>
                             <c:when test="${reviewlst.ratingview==2}">
                            	<span class="me-1">
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-light fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-light fs-6"></i>
                                    <i class="mdi mdi-star text-light fs-6"></i>
                                </span>
                            </c:when>
                            <c:when test="${reviewlst.ratingview==3}">
                            	<span class="me-1">
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-light fs-6"></i>
                                    <i class="mdi mdi-star mb-2 text-light fs-6"></i>
                                </span>
                            </c:when>
                            <c:when test="${reviewlst.ratingview==4}">
                            	<span class="me-1">
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star mb-2 text-light fs-6"></i>
                                </span>
                            </c:when>
                            <c:when test="${reviewlst.ratingview==5}">
                            	<span class="me-1">
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star mb-2 text-warning fs-6"></i>
                                </span>
                            </c:when>
                            </c:choose>
                                
                                <span class="me-1">for</span>
                                <span class="h5">How to easily create a
                                    website with WordPress</span>
                                <p class="mt-2">
                                   ${reviewlst.commentview}
                                </p>
                                <a href="#" class="btn btn-outline-secondary btn-sm">Respond</a>
                            </div>
                        </div>
                    </div>
                </li>
                </c:forEach>
            	<div>
                <a href="seemore" >see more
                    </a>
            	</div>
                <!-- List Group Item -->
                <!-- <li class="list-group-item px-0 py-4">
                    <div class="d-flex">
                        <img src="../assets/images/avatar/avatar-4.jpg" alt="" class="rounded-circle avatar-lg" />
                        <div class="ms-3 mt-2">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <h4 class="mb-0">Jenny Wilson</h4>
                                    <span class="text-muted fs-6">2
                                        hour ago</span>
                                </div>
                                <div>
                                    <a href="#" data-bs-toggle="tooltip" data-placement="top" title="Report Abuse"><i
                                            class="fe fe-flag"></i></a>
                                </div>
                            </div>
                            <div class="mt-2">
                                <span class="me-1">
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star mb-2-half-alt text-warning fs-6"></i>
                                </span>
                                <span class="me-1">for</span>
                                <span class="h5">Getting started - Grunt:
                                    The JavaScript Task...</span>
                                <p class="mt-2">
                                    Quisque semper aliquet lacinia. Ut
                                    molestie felis nec consectetur
                                    hendrerit. Aliquam eu viverra velit. In
                                    non leo ornare, ornare lorem elementum,
                                    efficitur urna. Curabitur fringilla
                                    nulla ac odio dignissim viverra.
                                </p>
                                <a href="#" class="btn btn-outline-secondary btn-sm">Respond</a>
                            </div>
                        </div>
                    </div>
                </li>
                List Group Item
                <li class="list-group-item px-0 py-4">
                    <div class="d-flex">
                        <img src="../assets/images/avatar/avatar-7.jpg" alt="" class="rounded-circle avatar-lg" />
                        <div class="ms-3 mt-2">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <h4 class="mb-0">Brooklyn Simmons</h4>
                                    <span class="text-muted fs-6">2
                                        hour ago</span>
                                </div>
                                <div>
                                    <a href="#" data-bs-toggle="tooltip" data-placement="top" title="Report Abuse"><i
                                            class="fe fe-flag"></i></a>
                                </div>
                            </div>
                            <div class="mt-2">
                                <span class="me-1">
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star me-n1 mb-2 text-warning fs-6"></i>
                                    <i class="mdi mdi-star mb-2-half-alt text-warning fs-6"></i>
                                </span>
                                <span class="me-1">for</span>
                                <span class="h5">Getting started - Vue js:
                                    The JavaScript Task...</span>
                                <p class="mt-2">
                                    Nulla eu cursus lacus. Vestibulum
                                    imperdiet accumsan tempor. Vivamus
                                    lacinia posuere augue ac mollis. Integer
                                    ornare purus ac hendrerit vehicula. In
                                    condimentum efficitur quam, sed
                                    porta turpis lobortis sit amet.
                                </p>
                                <a href="#" class="btn btn-outline-secondary btn-sm">Respond</a>
                            </div>
                        </div>
                    </div>
                </li> -->
            </ul>
        </div>
    </div>


<%@ include file="indexfooter.jsp" %>
</body>
</html>

