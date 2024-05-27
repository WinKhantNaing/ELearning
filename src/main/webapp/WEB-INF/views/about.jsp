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
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="<c:url value ="/" />">Home</a></li>
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
        <h2 class="section-title">Our Mission</h2>
        <p>At [Your Platform Name], we believe that education should be accessible, flexible, and engaging. Our mission is to empower individuals with the knowledge and skills they need to succeed in their personal and professional lives. We strive to create an inclusive learning environment that fosters curiosity, growth, and achievement.</p>
      </div>
      
      <div class="col-12">
        <h2 class="section-title">What We Offer</h2>
        <h5>1. Diverse Courses:</h5>
        <p>We offer a wide variety of courses across multiple disciplines, including technology, business, arts, science, and more. Each course is carefully curated by industry experts and educators to ensure that you receive the most up-to-date and relevant information.</p><br>
        <h5>2. Progress Tracking:</h5>
        <p>Keep track of your learning journey with our intuitive progress tracking system. You can easily monitor which courses you’ve completed, your current progress in ongoing courses, and what you need to do next to achieve your learning goals.</p>
        <h5>3. Quizzes and Assessments:</h5>
        <p>Test your knowledge and understanding with our interactive quizzes and assessments. These tools are designed to reinforce learning and help you gauge your comprehension of the course material.</p>
        <h5>4. Community and Support:</h5>
        <p>Join a vibrant community of learners and educators. Engage in discussions, share insights, and collaborate on projects. Our support team is also available to assist you with any questions or challenges you may encounter along the way.</p>   
      </div>
    </div>
  </div>
</section>
<section class="section-sm bg-primary">
  <div class="container">
    <div class="row">
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
                                    <span class="text-muted fs-6">${reviewlst.reviewdate}</span> 
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
                                <p class="mt-2">
                                   ${reviewlst.commentview}
                                </p>
                            </div>
                        </div>
                    </div>
                </li>
                </c:forEach>
            	<div>
                <a href="seemore" >see more
                    </a>
            	</div>
            </ul>
        </div>
    </div>

<%@ include file="feedback.jsp"%>
<%@ include file="indexfooter.jsp" %>
</body>
</html>