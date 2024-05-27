<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <style>
    
    body {
            background-color:#161628;
            height:100vh;
        }
    
        .form-gap {
    padding-top: 70px;
    }
    </style>
</head>
<body>
   
<div class="form-gap"></div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default" style=" border-radius: 20px;">
				<div class="panel-body" style="background-color: black; border-radius: 20px; opacity: 0.9;">
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h2 class="text-center">Forgot Password?</h2>
                  <p>You can reset your password here.</p>
                  <div class="panel-body">
    
                    <form action="verifyEmail" method="post" id="register-form" role="form" autocomplete="off" class="form">
                        <span style="color: red;">${checkEmail}</span>
                        <div id="errmsg" style="color: red; margin-top: 10px; margin-bottom: 10px;"></div>
                          <div class="form-group">
                         
                              <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                <input type="email" id="userEmail"  name="userEmail"  placeholder="email address" class="form-control" />
                              </div>
                          </div>
                        <div class="form-group">
                          <input id="submit" name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Verify" type="submit">
                        </div>
                      
                      <input type="hidden" class="hide" name="token" id="token" value=""> 
                    </form>
    
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>
<script>
  const submitBtn = document.getElementById("submit");
	const emailInput = document.getElementById("userEmail");
  const errormsg = document.getElementById("errmsg");
	submitBtn.addEventListener("click",(event) => {
		if(emailInput.value == ""){
      errormsg.textContent = "Please enter email!!";
      event.preventDefault();

		}
	})
</script>
</body>
</html>