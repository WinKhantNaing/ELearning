<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
</head>

<body>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Adding New User Form</h2>
                    <form:form action="createuser" method="post"  modelAttribute="aubean">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">User Name</label>
                                    <form:input class="input--style-4" type="text" path="userName"/>
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <form:input class="input--style-4" type="email" path="userEmail"/>
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <form:input class="input--style-4" type="password" path="password"/>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="row mb-4">
                                <div class="input-group">
                                    <label class="col-form-label col-md-2 pt-0">Gender</label>
                                    <div class="col-md-4">
                                        <div class="form-check-inline">
					                        <form:radiobutton label="Male"  class="form-check-input"	id="gridRadios1" path="gender" value="Male" />
					                    </div>		
					                    <div class="form-check-inline">
					                        <form:radiobutton label="Female" class="form-check-input"  id="gridRadios2" path="gender" value="Female" />
					                    </div>
                                    </div>
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
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Add</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

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
<!-- end document-->