<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
   <link rel="stylesheet" href="<c:url value ="https://cdn.datatables.net/2.0.5/css/dataTables.dataTables.css" />">
</head>
<body>

	<table id="table">
		<thead>
			<tr>
				<th>UserName</th>
				<th>Email</th>
				<th>Password</th>
				<th>Gender</th>
				<th>Role</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lstUser}" var="user">

				<tr>
					<td>${user.userName}</td>
					<td>${user.userEmail}</td>
					<td>${user.password}</td>
					<td>${user.gender}</td>
					<td>${user.userRole}</td>
				</tr>

		</c:forEach>
		</tbody>
	</table>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.5/js/dataTables.js"></script>
	<script>
		$(document).ready(function() {
			const dataTable = $('#table').DataTable({
				"lengthMenu" : [ 3, 5, 10 ],
				"pageLength" : 5,
			});

		});
	</script>
</body>
</html>