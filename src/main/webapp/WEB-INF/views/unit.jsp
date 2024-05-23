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
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<c:url value="/resources/css/unit.css" />" rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>
<body>

	<%@ include file="indexheader.jsp"%>

	<span class="navOpen" style="font-size: 30px; cursor: pointer"
		onclick="openNav()">&#9776;</span>

	<div class="main-container">
		<div id="mySidenav" class="sidenav">
			<h1 class="title">${lstLessonUnit[0].lessonName}</h1>
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

			<a href="${pageContext.request.contextPath}/unit/showunit">Introduction</a>

			<c:forEach items="${lstLessonUnit}" var="unit">
				<a
					href="${pageContext.request.contextPath}/unit/unitdetail/${unit.unitId}">${unit.unitName}</a>
			</c:forEach>

		</div>

		<div class="container unit-container">
			<c:if test="${lstQuiz[0].unitId == null}">
				<h1>Introduction</h1>
				<div>
					<p>${lstLessonUnit[0].lessonIntroduction}</p>
				</div>
			</c:if>

			<c:forEach items="${lstLessonUnit}" var="unitId">
				<c:if test="${unitId.unitId == lstQuiz[0].unitId}">
					<h1>${lstQuiz[0].unitName}</h1>
					<div class="common">
						<!-- <textarea name="editor1" id="editor1" rows="10" cols="80">
					        <p>This is a <strong>sample</strong> content with CKEditor.</p>
							<p>It supports <em>various</em> formatting <u>options</u>.</p>
							<ul>
							    <li>Bullet list item 1</li>
							    <li>Bullet list item 2</li>
							</ul>
							<p>And much more...</p>
					    </textarea>
						<script>
							CKEDITOR.replace('editor1');
						</script> -->
						<%-- <p>${uniWorkBean.lessonContent}</p> --%>

						<c:out
							value="${'<p>This is a <strong>sample</strong> content with CKEditor.</p><p>It supports <em>various</em> formatting <u>options</u>.</p><ul><li>Bullet list item 1</li><li>Bullet list item 2</li></ul><p>And much more...</p>'}"
							escapeXml="false" />
					</div>

					<div class="common">
						<h2>Workout</h2>
						<p>${uniWorkBean.workoutQuestion}</p>
					</div>

					<div class="quiz-container common">
						<h2>
							Quiz <small class="text-body-secondary fs-6">(Complete
								the quiz to finish the unit; otherwise, your progress will be
								marked as incomplete.)</small>
						</h2>

						<!-- <div class="p-3 quiz-info rounded">Complete the quiz to
						finish the unit; otherwise, your progress will be marked as
						incomplete.</div> -->
						<p>${lstQuiz[0].quizQuestion}</p>

						<form:form action="../checkquiz" method="post"
							modelAttribute="quiz" onsubmit="return quizCheck()">
							<form:hidden value="${lstQuiz[0].unitId}" path="unitId" />
							<form:radiobutton path="optionId" value="0"
								label="${lstQuiz[0].selection}" />
							<form:radiobutton path="optionId" value="1"
								label="${lstQuiz[1].selection}" />
							<%-- <c:forEach items="${lstQuiz}" var="option">
								<form:hidden value="${option.unitId}" path="unitId" />
								<form:radiobutton path="optionId" value="${option.optionId}"
									label="${option.selection}" />
							</c:forEach> --%>

							<div id="quiz-error"></div>

							<div class="d-flex justify-content-between w-25">

								<c:if test="${userAnswer == null}">
									<div class="btnCheck">
										<input type="submit" value="Check" id="checkBtn">
									</div>
								</c:if>

								<!-- Check whether the user answer is correct or incorrect -->
								<c:if test="${lstQuiz[0].isCorrect == userAnswer}">
									<div class="answer-status d-flex align-items-center">
										<p class="align-middle m-0 correct-text">Correct</p>
									</div>
								</c:if>

								<c:if test="${userAnswer != null}">
									<c:if test="${lstQuiz[0].isCorrect != userAnswer}">
										<div class="answer-status d-flex align-items-center">
											<p class="align-middle m-0 text-danger">Incorrect</p>
										</div>
									</c:if>
								</c:if>
							</div>
						</form:form>
					</div>

					<div class="">
						<c:if test="${unitId.unitId != lstLessonUnit.get(0).unitId}">
							<div class="common d-inline float-start">
								<a class="btn common-btn"
									href="../../unit/previousunit/${lstQuiz[0].unitId}"
									role="button"
									style="background-color: #213555; color: #F0F0F0;">Previous</a>
							</div>
						</c:if>

						<c:if
							test="${unitId.unitId != lstLessonUnit.get(lstLessonUnit.size()-1).unitId}">
							<div class="common d-inline float-end">
								<a class="btn common-btn"
									href="../../unit/nextunit/${lstQuiz[0].unitId}" role="button"
									style="background-color: #213555; color: #F0F0F0;">Next</a>
							</div>
						</c:if>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>


	<a href="../testing">Change Complete</a>

	<%@ include file="indexfooter.jsp"%>



	<script src="<c:url value="/resources/js/unit.js" />"></script>
</body>
</html>