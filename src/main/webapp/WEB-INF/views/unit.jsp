<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.title {
	padding: 8px 8px 8px 32px;
	color: #818181;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>
</head>
<body>


	<div id="mySidenav" class="sidenav">
		<h1 class="title"><c:out value="${lstLessonUnit[0].lessonName}" /></h1>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

		<c:forEach items="${lstLessonUnit}" var="unit">
			<a href="#">${unit.unitName}</a>
		</c:forEach>
		
	</div>

	<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;</span>

	<div>
		<p>This example use media queries to transform the sidebar to a
			top navigation bar when the screen size is 700px or less. We have
			also added a media query for screens that are 400px or less, which
			will vertically stack and center the navigation links.</p>
	</div>

	<%-- <a href="quiz">Take Quiz</a>

	<div>
		<h2>Quiz</h2>

		<form:form action="" method="post">

			<c:forEach items="${lstQuiz}" var="quiz">
				<div>
					<p>${quiz.question}</p>

					<form:form action="" method="post" modelAttribute="option">
						<c:forEach items="${lstOption}" var="option">
							<form:radiobutton path="option" value="${option.optionId}"
								label="${option.option}" />
						</c:forEach>
						<input class="btn btn-primary" type="submit" value="Check">
					</form:form>
				</div>
			</c:forEach>


			<input class="btn btn-primary" type="submit" value="Submit">
		</form:form>


	</div> --%>

	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>

</body>
</html>
