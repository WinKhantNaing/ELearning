<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />"
integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="<c:url value="./css/LoginForm.css" />" rel="stylesheet"></link>
<style>
p{
color: red;
}
#success{
color: blue;
}
</style>
</head>
<body>
	<c:if test="${not empty success }">
	<p id = "success">
		${success}
	</p>
	</c:if>
	<c:if test="${not empty loginerrormsg}">
	<p>
		${loginerrormsg}
	</p>
	</c:if>
	<c:if test="${not empty logoutmsg}">
	<p>
		${logoutmsg}
	</p>
	</c:if>
	
	<div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <h2 class="text-center text-dark mt-5">Login Form</h2>

        <div class="card my-5">

          <form:form action="check-login" method="post" id="myForm" onsubmit="return validateForm()" modelAttribute="bean" class="card-body cardbody-color p-lg-5">

            <div class="text-center">
              <img src="https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397__340.png" class="img-fluid profile-image-pic img-thumbnail rounded-circle my-4"
                width="250px" alt="profile">
            </div>

            <div class="mb-3">
              <form:input type="email" class="form-control" path="email" aria-describedby="emailHelp" placeholder="Email" />
              <span id="emailError" class="error"></span>
              <form:errors path="email" cssClass="error" />
            </div>
            <div class="mb-3">
              <form:input type="password" class="form-control" path="password" placeholder="password" />
              <span id="passwordError" class="error"></span>
              <form:errors path="password" cssClass="error" />
            </div>
            <div class="text-center">
            <input type="submit" value="Login" class="btn btn-color px-5 mb-5 w-100"></div>
            <div id="emailHelp" class="form-text text-center mb-5 text-dark">
            Not Registered? 
            <a href="user/register" class="text-dark fw-bold">Create an Account</a>
            </div>
          </form:form>
        </div>

      </div>
    </div>
  </div>
	 <%-- <script src="<c:url value="./js/FormValidation.js" />"></script> --%>
	<!-- <script type="text/javascript" src="./js/FormValidation.js"></script> -->

</body>
</html>