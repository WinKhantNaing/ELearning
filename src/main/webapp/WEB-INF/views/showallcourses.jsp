<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<c:url value ="resources/css/test.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.5/css/dataTables.dataTables.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        td {
            height: 50px;
        }

    </style>


</head>
<body>
<jsp:include page="indexheader.jsp" />
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

    <div style="margin-top: 150px;height:100vh; background-color:#A16D00;">
        <div style="display:flex; justify-content:end;">
            <a href='<c:url value="../course/addcourse"/>'><button type="button" class="btn btn-primary" style="margin-right:20px;">Add Course</button></a>
        </div>
        <div class="scrollable-table">
            <table class="table table-striped" id="stduentTable">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Course ID</th>
                        <th scope="col">Title</th>
                       <!--  <th scope="col">Description</th> -->
                        <th scope="col">Status</th>
                        <th scope="col">Update/Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${courseLst}" var="course" varStatus="index">
                        <tr>
                            <td scope="row">${index.count}</td>
                            <td>${course.coursePrefix}00${course.courseId}</td>
                            <td>${course.courseName}</td>
                            <%-- <td>${course.courseDescription}</td> --%>
                            <td>${course.courseStatus}</td>
                            <td>
                                <a href="updateCourse?cid=${course.courseId}"><button type="button" class="btn btn-primary">Update</button></a>
                                <a href="deletecourse?cid=${course.courseId}"><button type="button" class="btn btn-primary">Delete</button></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.5/js/dataTables.js"></script>
    <c:if test="${result==true}">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const toastElList = document.querySelectorAll('.toast');
            const option = {}; // Define the options as needed
            const toastList = [...toastElList].map(toastEl => new bootstrap.Toast(toastEl, option));
            toastList.forEach(toast => toast.show()); // Show toasts manually if needed
        });
    </script></c:if>
    <script>
        $(document).ready( function () {
            const dataTable = $('#stduentTable').DataTable({
                "lengthMenu" : [3,5,10],
                "pageLength" : 5,
            });
        });
    </script>
    
</body>
</html>
