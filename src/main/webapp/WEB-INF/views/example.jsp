<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="profile">
    <h2>Edit Profile</h2>
    <input type="text" id="username" value="Current Username">
    <input type="email" id="email" value="current@example.com">
    <button id="edit">Edit</button>
    <button id="save" style="display: none;">Save Changes</button>
</div>


<script src="<c:url value ="/resources/js/example.js"/>"></script>
</body>
</html>