<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Edit</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="./css/profile.css"> -->
    <link href="<c:url value="/resources/css/profile.css" />" rel="stylesheet">
</head>

<body>
    <div class="container">
        <div class="main-body">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex flex-column align-items-center text-center">
                                <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="Admin"
                                    class="rounded-circle p-1 bg-primary" width="110">
                                <div class="mt-3">
                                    <h4>John Doe</h4>
                                    <p class="text-secondary mb-1">Level - Diamond</p>
                                    <p class="text-muted font-size-sm">Subscription Plan - Free</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                        	<form:form action="" method="post" modelAttribute="">
                        		<div class="row mb-3">
	                                <div class="col-sm-3">
	                                    <h6 class="mb-0">Full Name</h6>
	                                </div>
	                                <div class="col-sm-9 text-secondary">
	                                    <form:input class="form-control" value="" path=""/>
	                                </div>
	                            </div>
	                            <div class="row mb-3">
	                                <div class="col-sm-3">
	                                    <h6 class="mb-0">Email</h6>
	                                </div>
	                                <div class="col-sm-9 text-secondary">
	                                    <form:input class="form-control" value="" path=""/>
	                                </div>
	                            </div>
	                            <div class="row mb-3">
	                                <div class="col-sm-3">
	                                    <h6 class="mb-0">Password</h6>
	                                </div>
	                                <div class="col-sm-9 text-secondary">
	                                    <form:password class="form-control" value="" path=""/>
	                                </div>
	                            </div>
	                            <div class="row mb-3">
	                                <div class="col-sm-3">
	                                    <h6 class="mb-0">Confirm Password</h6>
	                                </div>
	                                <div class="col-sm-9 text-secondary">
	                                    <form:password type="text" class="form-control" value="" path=""/>
	                                </div>
	                            </div>
	                            <div class="row mb-3">
	                                <div class="col-sm-3">
	                                    <h6 class="mb-0">Gender</h6>
	                                </div>
	                                <div class="col-sm-9 text-secondary">
	                                    <form:radiobutton value="male" path="" label="Male"/>
	                                    <form:radiobutton value="female" path="" label="Female"/>
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="col-sm-3"></div>
	                                <div class="col-sm-9 text-secondary">
	                                    <input type="submit" class="btn btn-primary px-4" value="Save Changes">
	                                </div>
	                            </div>
                        	</form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>