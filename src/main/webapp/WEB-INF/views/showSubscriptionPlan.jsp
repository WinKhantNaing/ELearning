<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
     
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' />
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/font-awesome/css/font-awesome.min.css" />' /> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.5/css/dataTables.dataTables.css" />
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
table.dataTable {
  margin: 0 auto;
}
body{
background-color: #ffbc3b;
}
table{
background-color: white;
}

</style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6 mt-5 table"> 
            <div class="panel panel-default">
<table id="myTable" class="display">
    <thead>
        <tr>
            <th>#</th>
            <th>Plan</th>
            <th>Price</th>
            <th>Duration</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${subscriptionplan}" var="plan" varStatus="index">
    <tr>
            <td>${index.count }</td>
            <td>${plan.plan}</td>
            <td>${plan.price}</td>
            <td>${plan.duration}</td>
            <td><button type="button" class="btn btn-success mb-3" onclick="location.href = '<c:url value="/user/edit/${user.userId }"/>'">Update</button>
                <button type="button" class="btn btn-secondary mb-3" onclick="location.href = '<c:url value="/user/delete/${user.userId }"/>'">Delete</button></td>
        </tr>
    </c:forEach>
        
    </tbody>
</table>
 </div>
        </div>
    </div>
</div>
  <script>
  $(document).ready( function () {
	    $('#myTable').DataTable();
	} );
  </script>
<script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.7/js/dataTables.bootstrap5.js"></script>
</body>
</html>