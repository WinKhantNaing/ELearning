<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                   <div style="margin:20px 20px;">
                   	  ${message}
                   	  ${incorrect}
                   </div>
                    <form action="checkOtp" method="post" id="register-form" role="form" autocomplete="off" class="form">
                        <span>${checkEmail}</span>
                        <div id="errmsg" style="color: red; margin-top: 10px; margin-bottom: 10px;"></div>
                          <div class="form-group">
                              <div class="input-group">
                              	<input type="email" name="email" id="email" value="${emailToSend}" style="display: none;"/>
                                <span class="input-group-addon"><i class="fa-solid fa-key"></i></span>
                                <input type="number" id="otp"  name="otp"  placeholder="otp code" class="form-control" />
                              </div>
                          </div>
                        <div class="form-group">
                          <input id="submit" name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Submit" type="submit">

                        </div>
                        <div id="countdown"></div>
                        <button id="resendOtpButton" class="btn btn-lg">resend</button>
                
                    </form>
    
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>
<script src="<c:url value="/resources/js/otpCount.js" />"></script>
<script src="https://kit.fontawesome.com/5bb5a852ac.js" crossorigin="anonymous"></script>
<script>
  const submitBtn = document.getElementById("submit");
  const otpInput = document.getElementById("otp");
  const errormsg = document.getElementById("errmsg");
	submitBtn.addEventListener("click",(event) => {
		if(otpInput.value == ""){
      errormsg.textContent = "Please enter otp!!";
      event.preventDefault();

		}
	})
</script>
</body>
</html>