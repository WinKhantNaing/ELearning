<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Adding New User Form</title>

    <!-- Icons font CSS-->
    <link href="<c:url value ="/adduserresources/vendor/mdi-font/css/material-design-iconic-font.min.css"/>" rel="stylesheet" media="all">
    <link href="<c:url value ="/adduserresources/vendor/font-awesome-4.7/css/font-awesome.min.css"/>" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="<c:url value ="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"/>" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="<c:url value ="/adduserresources/vendor/select2/select2.min.css"/>" rel="stylesheet" media="all">
    <link href="<c:url value ="/adduserresources/vendor/datepicker/daterangepicker.css"/>" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="<c:url value ="/adduserresources/css/main.css"/>" rel="stylesheet" media="all">

     <style>
     
     .error{color: red};
     
     </style>
    
</head>
<%-- <jsp:include page="showuser.jsp" /> --%>
<body>
    
   
    <div class="page-wrapper bg-gra-02  font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                <c:if test="${not empty error}">
                <h4 style="text-align:center"><span class="error">
                    ${error}
                </span></h4>
            </c:if>
                    <h2 class="title">Adding New User Form</h2>
                    <form:form action="createuser" method="post"  modelAttribute="userbean" id="addform">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">User Name</label>
                                    <span id="usernameError1" class="error"></span>
                                    <form:input class="input--style-4" id="username1" type="text" path="userName"/>
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <span id="emailError1" class="error"></span><br>
                                    <form:input class="input--style-4" id="email1" type="email" path="userEmail"/>
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <span id="passwordError1" class="error"></span><br>
                                    <form:input class="input--style-4" id="password1" type="password" path="password"/>
                                </div>
                            </div>
                        </div>                      
                        <div class="input-group">
                            <label class="label">Role</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <form:select path="userRole">
                                    <option disabled="disabled" selected="selected">Choose Role</option>
                                    <option>Admin</option>
                                    <option>User</option>
                                </form:select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <div class="p-t-15 ">
                         <button class="btn btn--radius-2 btn--blue" type="button" onclick="location.href='<c:url value="../user/showusertb"/>'">Back</button>
                        <button class="btn btn--radius-2 btn--blue" type="submit">Add</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
	<script src="<c:url value="/resources/js/addUserForm.js" />"></script>
    <!-- Jquery JS-->
    <script src="<c:url value ="/adduserresources/vendor/jquery/jquery.min.js"/>"></script>
    <!-- Vendor JS-->
    <script src="<c:url value ="/adduserresources/vendor/select2/select2.min.js"/>"></script>
    <script src="<c:url value ="/adduserresources/vendor/datepicker/moment.min.js"/>"></script>
    <script src="<c:url value ="/adduserresources/vendor/datepicker/daterangepicker.js"/>"></script>

    <!-- Main JS-->
    <script src="<c:url value ="/adduserresources/js/global.js"/>"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document--><!-- end document-->