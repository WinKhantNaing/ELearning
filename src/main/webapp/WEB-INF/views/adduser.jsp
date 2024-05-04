

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
   
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <title>Adding New User Form</title>

   
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
                    <form method="POST">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">User Name</label>
                                    <input class="input--style-4" type="text" name="username">
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="email" name="email">
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <input class="input--style-4" type="password" name="password">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Gender</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Male
                                            <input type="radio" checked="checked" name="gender">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Female
                                            <input type="radio" name="gender">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>                      
                        <div class="input-group">
                            <label class="label">Role</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="subject">
                                    <option disabled="disabled" selected="selected">Choose Role</option>
                                    <option>Admin</option>
                                    <option>User</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="<c:url value ="/adduserresources/vendor/jquery/jquery.min.js"/>"></script>
 
    <script src="<c:url value ="/adduserresources/vendor/select2/select2.min.js"/>"></script>
    <script src="<c:url value ="/adduserresources/vendor/datepicker/moment.min.js"/>"></script>
    <script src="<c:url value ="/adduserresources/vendor/datepicker/daterangepicker.js"/>"></script>

    <script src="<c:url value ="/adduserresources/js/global.js"/>"></script>

</body>
</html>

