<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="card mb-4">
        <!-- Card Header -->
        <div class="card-header d-lg-flex align-items-center justify-content-between">
            <div class="mb-3 mb-lg-0">
                <h3 class="mb-0">Reviews</h3>
                <span>You have full control to manage your own account
                    setting.</span>
                    
            </div>
 <button type="button" class="btn btn-secondary mb-3" onclick="location.href='<c:url value="/about"/>'">Back</button>
         
        </div>
        <!-- Card Body -->
        <div class="card-body">
            <!-- Form -->
            <form class="row mb-4">
                
            <ul class="list-group list-group-flush border-top">
                <!-- List Group Item -->
                
                <c:forEach items="${review}" var="reviewlst">
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
            </ul>
            
        </div>
    </div>
</body>
</html>