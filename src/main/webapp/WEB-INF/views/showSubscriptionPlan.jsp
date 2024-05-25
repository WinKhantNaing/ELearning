<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
     
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%--  <link rel="stylesheet" type="text/css" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' /> --%>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/font-awesome/css/font-awesome.min.css" />' /> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.5/css/dataTables.dataTables.css" />
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href='<c:url value="/resources/css/subForm.css" />'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head> 
<div aria-live="polite" aria-atomic="true" class="position-relative">
  <div class="toast-container top-0 end-0 p-3">

    <!-- Then put toasts within -->
    <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="toast-header">
        
        <strong class="me-auto">Message</strong>
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
      <div class="toast-body">
        <h4>${message}</h4>
      </div>
    </div>
  </div>
</div>

<body class="body">
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
    <c:forEach items="${subscriptionplan2}" var="plan" varStatus="index">
    <tr>
            <td>${index.count }</td>
            <td>${plan.plan}</td>
            <td>${plan.price}</td>
            <td>${plan.duration}</td>
            <td>
                <button type="button" class="btn btn-success mb-3" onclick="location.href='<c:url value="/user/update/${plan.subId}"/>'">Update</button>
                <c:if test="${plan.isActive!=0}">
                <button type="button" class="btn btn-secondary mb-3" onclick="location.href ='<c:url value="/user/delete/${plan.subId}"/>'">Delete</button></c:if>
                <c:if test="${plan.isActive!=1}">
                <button type="button" class="btn btn-primary mb-3" onclick="location.href ='<c:url value="/user/active/${plan.subId}"/>'">Active</button></c:if>
                </td>
        </tr>
    </c:forEach>
        
    </tbody>
</table>
 </div>
        </div>
    </div>
</div>


<c:if test="${plan==true}">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const toastElList = document.querySelectorAll('.toast');
            const option = {}; // Define the options as needed
            const toastList = [...toastElList].map(toastEl => new bootstrap.Toast(toastEl, option));
            toastList.forEach(toast => toast.show()); // Show toasts manually if needed
        });
    </script>
</c:if>
   <script>
  $(document).ready( function () {
	    $('#myTable').DataTable();
	} );
  </script> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.7/js/dataTables.bootstrap5.js"></script>
</body>
</html>