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
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href=" <c:url value="/resources/css/style.css" />">
<style>
table {
  width: 100%;
  border-collapse: collapse;
}
.item{
text-align: right;}
td{
padding: 15px;
}
.custom-icon{
text-align: center;}
.buttonOk{
text-align: center;
}
.btn{
border-radius: 10px;
}
body{
background-color: rgb(33,31,35);
background-repeat: no-repeat;
background-image: radial-gradient(circle at top, rgba(83,69,91,1) 0, rgba(32,30,34,1) 70%);
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
                    <c:if test="${result==1}">
                    <div class="custom-icon">
                    <i class="bi bi-check-circle " style="color: green; font-size: 80px;"></i>
                    </div>
                        <h3 class="text-center">Payment Successful</h3>
                        </c:if>
                    <c:if test="${result==0}">
                         <div class="custom-icon">
                    <i class="bi bi-x-circle " style="color: green; font-size: 80px;"></i>
                    </div>
                        <h3 class="text-center">Payment Fail</h3>
                        </c:if>
                    </div>
                    
                </div>
                <div class="panel-body">
              <table>
<tr>
<td >Payment type</td>
<td class="item"> ${paymentMethod}</td>
</tr>
<tr>
<td>Email</td>
<td class="item"> ${sessionEmail}</td>
</tr>
<tr>
<td>Amount paid </td>
<td class="item"> ${subAmount}</td>
</tr>
<tr>
<td>Transaction id</td>
<td class="item">0100032455634</td>
</tr>

</table>
<c:if test="${ssLessonId != null }">
<div class="buttonOk">
<button type="button" class="btn btn-success mt-5" onclick="location.href ='<c:url value="/unit/showunit" />'">OK</button>
</div>
</c:if>
<c:if test="${ssLessonId == null }">
<div class="buttonOk">
<button type="button" class="btn btn-success mt-5" onclick="location.href ='<c:url value="/" />'">OK</button>
</div>
</c:if>
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