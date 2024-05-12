<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" />
<title>Insert title here</title>
<style>
.img-container{
display: flex;
}

.img-text{
font-size: 18px;
margin-left: 15%;
margin-bottom: 15px;
}
.study-go{
margin-top: 20px;
}

</style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-4 col-md-offset-4">
        
          <div class="page-header">
          <div class="img-container">
          <span class="img-text" style="color:blue;"> ${message}</span>
          </div>
          
    <img class="img-responsive cc-img" style="width:400px; height:400px;" src='<c:url value="/resources/images/avatars/letgo.jpg" />'/>
     <div class="row study-go">
                        <div class="col-xs-12">
                            <button type="button" class="btn btn-warning btn-lg btn-block" onclick='location.href = "<c:url value="/"/>"'>Study Now</button>
                        </div>
                    </div>
    </div>
    </div>
    </div>
    </div>
</body>
</html>