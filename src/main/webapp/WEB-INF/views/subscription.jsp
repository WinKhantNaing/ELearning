<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscription</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="./css/subscription.css"> -->
    <link href="<c:url value="/resources/css/subscription.css" />" rel="stylesheet">
</head>

<body>
    <div class="pricing6 py-5 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 text-center">
                    <h3 class="mb-3">Subscribe to make your process</h3>
                    <h6 class="subtitle font-weight-normal">We offer 100% satisafaction and Money back Guarantee</h6>
                </div>
            </div>
            <!-- row  -->
            <div class="row mt-4">
                <!-- column  -->
                <div class="col-md-6">
                    <div class="card card-shadow border-0 mb-4">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center">
                                <h5 class="font-weight-medium mb-0">Monthly Plan</h5>
                                <div class="ml-auto"><span
                                        class="badge badge-danger font-weight-normal p-2">Popular</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5 text-center">
                                    <div class="price-box my-3">
                                        <sup>$</sup><span class="text-dark display-5">36</span>
                                        <h6 class="font-weight-light">MONTHLY</h6>
                                        <a class="btn btn-primary font-14 border-0 text-white p-3 btn-block mt-3" href="#" role="button">CHOOSE PLAN</a>
                                    </div>
                                </div>
                                <div class="col-lg-7 align-self-center">
                                    <ul class="list-inline pl-3 font-14 font-weight-medium text-dark">
                                        <li class="py-2"><i class="icon-check text-info mr-2"></i> <span>Access to
                                                all courses
                                            </span></li>
                                        <li class="py-2"><i class="icon-check text-info mr-2"></i> <span>Interactive
                                                learning materials</span></li>
                                        <li class="py-2"><i class="icon-check text-info mr-2"></i> <span>Live
                                                Q&A sessions
                                            </span></li>
                                        <li class="py-2"><i class="icon-check text-info mr-2"></i> <span>Progress
                                                tracking</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- column  -->
                <!-- column  -->
                <div class="col-md-6">
                    <div class="card card-shadow border-0 mb-4">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center">
                                <h5 class="font-medium m-b-0">Yearly Plan</h5>
                            </div>
                            <div class="row">
                                <div class="col-lg-5 text-center">
                                    <div class="price-box my-3">
                                        <sup>$</sup><span class="text-dark display-5">400</span>
                                        <h6 class="font-weight-light">YEARLY</h6>
                                        <a class="btn btn-primary font-14 border-0 text-white p-3 btn-block mt-3" href="#" role="button">CHOOSE PLAN</a>
                                    </div>
                                </div>
                                <div class="col-lg-7 align-self-center">
                                    <ul class="list-inline pl-3 font-14 font-weight-medium text-dark">
                                        <li class="py-2"><i class="icon-check text-info mr-2"></i> <span>Access to
                                                all courses
                                            </span></li>
                                        <li class="py-2"><i class="icon-check text-info mr-2"></i> <span>Interactive
                                                learning materials</span></li>
                                        <li class="py-2"><i class="icon-check text-info mr-2"></i> <span>Live
                                                Q&A sessions
                                            </span></li>
                                        <li class="py-2"><i class="icon-check text-info mr-2"></i> <span>Progress
                                                tracking</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- column  -->
            </div>
        </div>
    </div>
</body>

</html>