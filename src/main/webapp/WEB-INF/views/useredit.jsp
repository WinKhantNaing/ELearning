<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #A16D00;
        height: 100vh;
    }
    .center-form {
        margin: 0 auto;
        width: 50%;
        background-color: #ffff99;
        padding: 20px;
        border-radius: 5px;
        border: 1px solid #ffcc00; 
    }
    .center-form input,
    .center-form textarea,
    .center-form select {
        border-color: #ffcc00; 
    }
    .center-form input:focus,
    .center-form textarea:focus,
    .center-form select:focus {
        box-shadow: 0 0 5px rgba(255, 204, 0, 0.5); 
        border-color: #ffcc00; 
    }
    .center-form button,
    .center-form input[type="submit"] {
        background-color: #ffcc00; 
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    .center-form button:hover,
    .center-form input[type="submit"]:hover {
        background-color: #ffcc33; 
    }
    .form-label {
        font-weight: bold;
        margin-top: 10px;
        display: inline-block;
        width: 100px;
        text-align: right;
        margin-right: 10px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .center-text {
        text-align: center;
    }
</style>
</head>
<body>
<div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="center-form">
        <h2 class="center-text">User Edit Form</h2>
        <form:form action="../updateuser" method="post" modelAttribute="eubean">
            <div class="form-group">
                <label for="userId" class="form-label">Id:</label>
                <form:input type="text" path="userId" id="userName" class="form-control d-inline-block" style="width: calc(100% - 120px);" readonly="true" />
            </div>
            <div class="form-group">
                <label for="userName" class="form-label">Name:</label>
                <form:input type="text" path="userName" id="username" class="form-control d-inline-block" style="width: calc(100% - 120px);" required="true"/>
            </div>
            <div class="form-group">
                <label for="userEmail" class="form-label">Email:</label>
                <form:input type="text" path="userEmail" id="email" class="form-control d-inline-block" style="width: calc(100% - 120px);" required="true"/>
            </div>
            <%-- <div class="form-group">
                <label for="password" class="form-label">Password:</label>
                <form:input type="text" path="password" id="password" class="form-control d-inline-block" style="width: calc(100% - 120px);"/>
            </div> --%>
            <div class="mt-3 text-center">
                <input type="submit" value="Update" class="btn btn-primary"/>
            </div>
        </form:form>
    </div>
</div>
<script src="<c:url value="/resources/js/register.js" />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</body>
</html>