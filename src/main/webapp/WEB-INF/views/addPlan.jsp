<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Add plan</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" /> 
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href=" <c:url value="/resources/css/style.css" />">
  <link href="<c:url value ="/adduserresources/vendor/select2/select2.min.css"/>" rel="stylesheet" media="all">
    <link href="<c:url value ="/adduserresources/vendor/datepicker/daterangepicker.css"/>" rel="stylesheet" media="all">
    <!-- Main CSS-->
    <link href="<c:url value ="/adduserresources/css/main.css"/>" rel="stylesheet" media="all">
    <style>
    h2{
    text-align: center;
    }
    
    .button-position {
    text-align: center;
    }
    body{
    background-color: #ffbc3b;
    }
    
    </style>
</head>
<body>
<!-- Credit Card Payment Form - START -->

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-4 mt-5 col-md-offset-4"> 
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                   <h2 >Subscription Plan </h2>
                    </div>
                </div>
                <div class="panel-body">
                <form:form action="user/addsubplan" modelAttribute="subPlanBean" method="post">
                  <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Subscription Plan</label>
                                    <form:input class="input--style-4" type="text" path="plan"/>
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Duration</label>
                                    <form:input class="input--style-4" type="text" path="duration"/>
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Price</label>
                                    <form:input class="input--style-4" type="text" path="price"/>
                                </div>
                            </div>
                        </div>
                        
                
<div class="button-position" >
<button type="submit" class="btn btn-primary mt-5" >ADD</button>
</div>
 </form:form>
                </div>
               
            </div>
        </div>
    </div>
</div>
<!-- Credit Card Payment Form - END -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.10.2.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>