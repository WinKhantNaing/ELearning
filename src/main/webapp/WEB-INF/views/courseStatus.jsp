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

<!-- /header -->

<!-- page title -->
<section class="page-title-section overlay" data-background="images/backgrounds/page-title.jpg">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb mb-2">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="index.html">Home</a></li>
          <li class="list-inline-item text-white h3 font-secondary nasted">Our Courses</li>
        </ul>
        <p class="text-lighten mb-0">Our courses offer a good compromise between the continuous assessment favoured by some universities and the emphasis placed on final exams by others.</p>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->
<section class="section">
  <div class="container-fluid">
  <nav class="navbar navbar-expand-lg navbar-light bg-primary">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#">To Do  <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Progress</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#">Complete</a>
      </li>
    </ul>
    <form:form class="form-inline my-2 my-lg-0" action="searchcourse" modelAttribute="coursesearchform" method="post">
      <form:input class="form-control mr-sm-2" type="search" path="courseName" placeholder="Search course with name " aria-label="Search" value="${searchCourse.courseName }"/>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href = '<c:url value="/cancel"/>'">Cancel</button>
    </form:form>
  </div>
</nav>
  </div>
</section>
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