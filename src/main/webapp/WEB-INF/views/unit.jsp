<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/unit.css" />" rel="stylesheet">
</head>
<body>

	<div id="mySidenav" class="sidenav">
		<h1 class="title">${lstLessonUnit[0].lessonName}</h1>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

		<a href="${pageContext.request.contextPath}/unit/showunit">Introduction</a>

		<c:forEach items="${lstLessonUnit}" var="unit">
			<a
				href="${pageContext.request.contextPath}/unit/unitdetail/${unit.unitId}">${unit.unitName}</a>
		</c:forEach>

	</div>

	<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;</span>

	<div class="container unit-container">
		<c:if test="${lstQuiz[0].unitId == null}">
			<div>
				<p>${lstLessonUnit[0].lessonIntroduction}</p>
			</div>
		</c:if>

		<c:forEach items="${lstLessonUnit}" var="unitId">
			<c:if test="${unitId.unitId == lstQuiz[0].unitId}">
				<div class="common">
					<p>${uniWorkBean.lessonContent}</p>
				</div>

				<div class="common">
					<h2>Workout</h2>
					<p>${uniWorkBean.workoutQuestion}</p>
				</div>

				<div class="quiz-container common">
					<h2>Quiz</h2>
					<p>${lstQuiz[0].quizQuestion}</p>

					<form:form action="" method="post" modelAttribute="quiz">
						<c:forEach items="${lstQuiz}" var="option">
							<form:radiobutton path="selection" value="${option.optionId}"
								label="${option.selection}" />
						</c:forEach>

						<div id="quiz-error">Please Choose One Answer!</div>

						<div class="d-flex justify-content-between w-25">
							<!-- Check whether the user answer is correct or incorrect -->
							<%-- <c:if test=""> --%>
							<div class="answer-status d-flex align-items-center">
								<p class="align-middle m-0 correct-text">Correct</p>
							</div>
							<%-- </c:if> --%>

							<c:if test="">
								<div class="answer-status d-flex align-items-center">
									<p class="align-middle m-0 text-danger">Incorrect</p>
								</div>
							</c:if>

							<div class="btnCheck">
								<input type="submit" value="Check">
							</div>
						</div>
					</form:form>
				</div>

				<div class="common">
					<a class="btn" href="#" role="button"
						style="background-color: #213555; color: #F0F0F0;">Finish</a>
				</div>
			</c:if>
		</c:forEach>
	</div>

	<script src="<c:url value="/resources/js/unit.js" />"></script>
</body>
</html>