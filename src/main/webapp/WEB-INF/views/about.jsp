<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
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
        <p class="text-lighten mb-0">Our courses offer a good compromise between the continuous assessment favoured by some universities and the emphasis placed on final exams by others.</p>
      </div>
    </div>
  </div>
</section>
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <img class="img-fluid w-100 mb-4" src="<c:url value ="/resources/images/about/about-page.jpg"/>" alt="about image">
        <h2 class="section-title">ABOUT OUR JOURNY</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Saepe ipsa illo quod veritatis, magni debitis fugiat dolore voluptates! Consequatur, aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat perferendis sint optio similique. Et amet magni facilis vero corporis quos.</p>
        <p>exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsum a, facere fugit error accusamus est officiis vero in, nostrum laboriosam corrupti explicabo, cumque repudiandae deleniti perspiciatis quae consectetur enim. Laboriosam!</p>
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
      <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
        <div class="text-center">
          <h2 class="count text-white" data-count="60">0</h2>
          <h5 class="text-white">TEACHERS</h5>
        </div>
      </div>
      <!-- funfacts item -->
      <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
        <div class="text-center">
          <h2 class="count text-white" data-count="50">0</h2>
          <h5 class="text-white">COURSES</h5>
        </div>
      </div>
      <!-- funfacts item -->
      <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
        <div class="text-center">
          <h2 class="count text-white" data-count="1000">0</h2>
          <h5 class="text-white">STUDENTS</h5>
        </div>
      </div>
      <!-- funfacts item -->
      <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
        <div class="text-center">
          <h2 class="count text-white" data-count="3737">0</h2>
          <h5 class="text-white">SATISFIED CLIENT</h5>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /funfacts -->

<!-- success story -->
<section class="section bg-cover" data-background="<c:url value ="/resources/images/backgrounds/success-story.jpg"/>">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-sm-4 position-relative success-video">
        <a class="play-btn venobox" href="<c:url value ="https://youtu.be/nA1Aqp0sPQo"/>" data-vbtype="video">
          <i class="ti-control-play"></i>
        </a>
      </div>
      <div class="col-lg-6 col-sm-8">
        <div class="bg-white p-5">
          <h2 class="section-title">Success Stories</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat.</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris</p>
        </div>
      </div>
    </div>
  </div>
</section>
<%@ include file="indexfooter.jsp" %>
</body>
</html>