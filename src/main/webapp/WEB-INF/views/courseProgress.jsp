<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

  <!-- ** Plugins Needed for the Project ** -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap/bootstrap.min.css" />">
  <!-- slick slider -->
  <link rel="stylesheet" href="<c:url value="/resources/plugins/slick/slick.css" />">
  <!-- themefy-icon -->
  <link rel="stylesheet" href="<c:url value="/resources/plugins/themify-icons/themify-icons.css" />">
  <!-- animation css -->
  <link rel="stylesheet" href="<c:url value="/resources/plugins/animate/animate.css" />">
  <!-- aos -->
  <link rel="stylesheet" href="<c:url value="/resources/plugins/aos/aos.css" />">
  <!-- venobox popup -->
  <link rel="stylesheet" href="<c:url value="/resources/plugins/venobox/venobox.css" />">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <!-- Main Stylesheet -->

<link rel="stylesheet" href=" <c:url value="/resources/css/style.css" />">
  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>

<body>
 
<!-- header -->
<jsp:include page="indexheader.jsp"></jsp:include>
<!-- /header -->
<jsp:include page="courseStatus.jsp"></jsp:include>
<!-- courses -->
<section class="section">
  <div class="container">
    <!-- course list -->
<div class="row justify-content-center">
  <!-- course item -->
  <c:forEach items="${progressList}" var="course">
  <div class="col-lg-4 col-sm-6 mb-5">
    <div class="card p-0 border-primary rounded-0 hover-shadow">
      <img class="card-img-top rounded-0" src="<c:url value="${course.courseImagePath }" />" alt="course thumb">
      <div class="card-body">
        <ul class="list-inline mb-2">
          <li class="list-inline-item"> ${course.courseStatus}</li>
          <!-- <li class="list-inline-item"><a class="text-color" href="ToeYadanaKyaw">Humanities</a></li> -->
        </ul>
        <a href="course-single.html">
          <h4 class="card-title">${course.courseName }</h4>
        </a>
        <p class="card-text mb-4"> ${course.courseDescription }</p>
        <a href="<c:url value="/ToeYadanaKyaw/${course.courseId }"/>" class="btn btn-primary btn-sm">Apply now</a>
      </div>
    </div>
  </div>
  </c:forEach>
</div>

  </div>
</section>
<jsp:include page="feedbackform.jsp"></jsp:include>
<!-- /courses -->
<jsp:include page="indexfooter.jsp"></jsp:include>
<!-- jQuery -->
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"></script>
<script src="<c:url value="/resources/plugins/google-map/gmap.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- Main Script -->
  <script src="<c:url value="/resources/js/script.js" />"></script>
</body>
</html>