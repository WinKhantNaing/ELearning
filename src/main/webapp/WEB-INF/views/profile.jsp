<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="<c:url value="/resources/css/profile.css" />" rel="stylesheet">
    <!-- <link rel="stylesheet" href="./css/profile.css"> -->
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
                             <a href="photo.jsp">  <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin"
                                    class="rounded-circle" width="150" ></a> 
                                <div class="mt-3">
                                    <h4>John Doe</h4>
                                    <p class="text-secondary mb-1">Level - Diamond</p>
                                    <p class="text-muted font-size-sm">Subscription Plan - Free</p>
                                    <a class="btn btn-danger" href="#" role="button">Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

				
                <div class="col-md-8">
                    <div class="card mb-3">
                        <div class="card-body">

                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Full Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    "${user.userName}"
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                   "${user.userEmail}"
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Password</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    "${user.password}"
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Gender</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    "${user.userRole}"
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-12">
                                    <a class="btn btn-info" href="profileedit" role="button">Edit</a>
                                </div>
                            </div>
                       </div>
                    </div>
					
                    <div class="row gutters-sm">
                        <div class="col-sm-6 mb-3">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h6 class="d-flex align-items-center mb-3" style="color: #FFEA00;">Progress Courses
                                    </h6>
                                    <ul>
                                        <li>
                                            <small>Web Design</small>
                                        </li>
                                        <li>
                                            <small>Website Markup</small>
                                        </li>
                                        <li>
                                            <small>One Page</small>
                                        </li>
                                        <li>
                                            <small>Mobile Template</small>
                                        </li>
                                        <li>
                                            <small>Backend API</small>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 mb-3">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h6 class="d-flex align-items-center mb-3" style="color: #7CFC00;">Complete Courses
                                    </h6>
                                    <ul>
                                        <li>
                                            <small>Web Design</small>
                                        </li>
                                        <li>
                                            <small>Website Markup</small>
                                        </li>
                                        <li>
                                            <small>One Page</small>
                                        </li>
                                        <li>
                                            <small>Mobile Template</small>
                                        </li>
                                        <li>
                                            <small>Backend API</small>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>

</html>