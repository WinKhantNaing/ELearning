<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Credit Card Payment Form Template | PrepBootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" />
    <link rel="stylesheet" href=" <c:url value="/resources/css/style.css" />">
    
    <style>
    .form-control{
     border:none;
     }
    .page-header{
    display:flex;
    align-items: center;
    justify-content: center;
    }
     .cc-img {
        margin: 0 auto;
    }
    .radio-button{
    margin-right: 20%;
    }
    
    .methods{
    display:flex;
    align-items: center;
    justify-content: center;
    padding-top:35px;
    font-size: 14px;
    }
    .method-container{
    margin-bottom: 120px;
    }
  
/* HIDE RADIO */
[type=radio] { 
  position: absolute;
  opacity: 0;
  width: 0;
  height: 0;
}

/* IMAGE STYLES */
[type=radio] + img {
  cursor: pointer;
}

/* CHECKED STYLES */
[type=radio]:checked + img {
  outline: 2px solid #f00;
} 
    </style>
</head>
<body>
<!-- Credit Card Payment Form - START -->

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-4 col-md-offset-4">
          <div class="page-header">
    <span style="color:red;"> ${message}</span>
    
</div> 
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <h3 class="text-center">Payment Details</h3>
                        
                    </div>
                    
                </div>
                <div class="panel-body">
                    <form:form  action="../course/subscribe" modelAttribute="paymentbean" method="post">
                        <div class="row">
                        <div class="method-container">
   <div class="col-lg-3 col-sm-6 mb-4">
                        <div class="card p-0 border-primary rounded-0 hover-shadow">
    <label for="kpay">
    <form:radiobutton path="method" value="kpay" id="kpay" checked="checked" />
  <img style="width:60px; height:60px;" src="<c:url value="/resources/images/avatars/kpay.png" />" alt="Option 1">
    </label>
</div>
</div>
     <div class="col-lg-3 col-sm-6 mb-4">
       <div class="card p-0 border-primary rounded-0 hover-shadow">
    
    <label for="aya">
    <form:radiobutton path="method" value="aya" id="aya" />
          <img style="width:60px; height:60px;" src="<c:url value="/resources/images/avatars/aya.png" />" alt="Option 2"> 
    
    </label>
   </div>
   </div>
    <div class="col-lg-3 col-sm-6 mb-4">
      <div class="card p-0 border-primary rounded-0 hover-shadow">
    <label for="yoma">
     <form:radiobutton path="method" value="yoma" id="yoma" />
  <img style="width:60px; height:60px;" src="<c:url value="/resources/images/avatars/yoma.jpeg" />" alt="Option 3">
    </label>

    </div>
    </div>
     <div class="col-lg-3 col-sm-6 mb-4">
       <div class="card p-0 border-primary rounded-0 hover-shadow">
    <label for="wave">
    <form:radiobutton path="method" value="wave" id="wave" />
          <img style="width:60px; height:60px;" src="<c:url value="/resources/images/avatars/wave.png" />" alt="Option 4"> 
    
    </label> 
</div>
</div>           
                        </div>
                            <div class="col-xs-12 m-4">
                                <div class="form-group">
                                    <label>Course</label>
                                    <div class="input-group col-xs-12">
                                          <form:hidden  path="subId" class="form-control" value="${priceBean.subId }" /> 
                                         <span class="form-control">${priceBean.plan }plan (${priceBean.duration})</span>  
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-6">
                                <div class="form-group">
                                    <label>Start Date</label>
                                    <form:hidden  path="startDate" class="form-control" value="${startDate }" /> 
                                    <span class="form-control">${startDate }</span>
                                </div>
                            </div>
                            <div class="col-xs-4 col-md-6 pull-right">
                                <div class="form-group">
                                    <label>End Date</label>
                                    <span class="form-control">${ endDate}</span>
                                    <form:hidden  path="endDate" class="form-control" value="${ endDate}"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>Amount</label>
                                    <span class="form-control">$ ${priceBean.price }</span>
                                    <form:hidden path="userId" class="form-control" value="1"/>
                                </div>
                            </div>
                        </div>
                        
                    <div class="row">
                        <div class="col-xs-12">
                            <button type="submit" class="btn btn-warning btn-lg btn-block">Process payment</button>
                        </div>
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


</body>
</html>