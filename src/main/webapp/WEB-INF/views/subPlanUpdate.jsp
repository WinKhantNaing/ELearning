<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
      <link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' />
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/font-awesome/css/font-awesome.min.css" />' /> 
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>
  <link href='<c:url value ="/adduserresources/vendor/select2/select2.min.css"/>' rel="stylesheet" media="all">
    <link href='<c:url value ="/adduserresources/vendor/datepicker/daterangepicker.css"/>' rel="stylesheet" media="all">
    <!-- Main CSS-->
    <link rel="stylesheet" href='<c:url value="/resources/css/subForm.css" />'>
    <link href='<c:url value ="/adduserresources/css/main.css"/>' rel="stylesheet" media="all">
<title>Insert title here</title>
</head>
<body class="body">
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-4 mt-5 col-md-offset-4"> 
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                   <h2 >Subscription Plan Update</h2>
                    </div>
                </div>
                <div class="panel-body">
                <form:form action="../subscriptionPlan" modelAttribute="planBean" method="post">
                       <div class="row">
                            <div class="col-xs-12 mb-3">
                                <div class="form-group">
                                    <label >Subscription plan</label>
                                    <div class="input-group col-xs-12">
                                    <form:hidden path="subId"  value="${subId}" />
                                    <%-- <form:input path="plan" class="input--style-4" type="text" value="${plan}"/> --%>
                                          <form:select class="form-select" path="plan"  id="timePeriod" onchange="updateOptions()">
                   <form:option value="${plan}" />  
                   <form:option value="Monthly" />
                    <form:option value="Yearly" />  
                     
                    </form:select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 mb-3">
                                <div class="form-group">
                                <input type="hidden" value="${planBean.duration }" id="currentOption"/>
                                    <label >Duration</label>
                                    <div class="input-group col-xs-12">
                                         <form:select path="duration" id="options" class="form-select" >
                                         
                                         </form:select>
                                  
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 mb-3">
                                <div class="form-group">
                                    <label >Price</label>
                                    <div class="input-group col-xs-12">
                                           <form:input path="price" class="input--style-4" type="text" value="${price}"/>
                                            <form:hidden path="isActive" value="1"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="button-position" >
                 		<button type="submit" class="btn btn-primary mt-1 pl-2 pr-2 show-button" >Update</button>
						</div>
                      </form:form>
                        </div>
                            </div>
                        </div>
                        
                            </div>
                        </div>
                        

<script src="<c:url value="/resources/js/subPlan.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.10.2.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>