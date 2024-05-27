<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<style>

 body {
            background-color:#161628;
            height:100vh;
}

.form-gap {
	padding-top: 70px;
}

.password-container{
  display: flex;
  justify-content: space-between;
}

.password-input {
    width: 100%;
    padding: 10px;
    font-size: 16px;
}
.password-input {
    width: 90%;
    padding: 10px;
    font-size: 16px;
}

.toggle-password,
.toggle-password2 {
    transform: translateY(-50%);
    cursor: pointer;
}

.toggle-password i,
.toggle-confirmPassword i {
    font-size: 20px;
}
</style>
</head>
<body>
	<div class="form-gap"></div>
	<div class="container" style="width: 30%;">
		<div class="row">
				<div class="panel panel-default" style=" border-radius: 20px;">
				<div class="panel-body" style="background-color: black; border-radius: 20px; opacity: 0.9;">
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">Forgot Password?</h2>
							<p>You can reset your password here.</p>
							<div class="panel-body">
                <div id="errmsg" style="color: red;"></div>
                <div id="pswerr" style="color: red;"></div>

								<form action="updatePsw" method="post" id="register-form"
									role="form" autocomplete="off" class="form">
									<div class="form-group">
											<div class="password-container">
												
						  <input type="email" name="email" value="${email}" style="display: none;"/>
                          <input type="password" id="password" name="userPassword" placeholder="new password" class="form-control" style="margin-bottom: 20px;" />
                          <span class="toggle-password" id="togglePassword" style="margin-top: 23px; margin-left: 5px;"> <i class="fas fa-eye" id="eyeIcon"></i></span> 
											</div>

									<div class="password-container">

										<input type="password" id="confirmPassword"
											name="confirmPassword" placeholder="confirm Password"
											class="form-control" /> <span class="toggle-confirmPassword"
											id="toggle-confirmPassword"
											style="margin-top: 12px; margin-left: 5px;"> <i
											class="fas fa-eye" id="eyeIcon2"></i></span>
									</div>

								</div>
									<div class="form-group">
										<input name="recover-submit" id="submit"
											class="btn btn-lg btn-primary btn-block" value="Submit"
											type="submit" style="width: 120px;margin-left: 100px;">
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<script type="text/javascript">
	document.getElementById('togglePassword').addEventListener('click', function (e) {
	    // Toggle the type attribute
	    const password = document.getElementById('password');
	    const eyeIcon = document.getElementById('eyeIcon');
	    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
	    password.setAttribute('type', type);
	    
	    // Toggle the eye slash icon
	    eyeIcon.classList.toggle('fa-eye');
	    eyeIcon.classList.toggle('fa-eye-slash');
	});

  document.getElementById('toggle-confirmPassword').addEventListener('click', function (e) {
	    // Toggle the type attribute
      const confirmPassword = document.getElementById('confirmPassword');
	    const eyeIcon2 = document.getElementById('eyeIcon2');
	    const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
	    confirmPassword.setAttribute('type', type);
	    
	    // Toggle the eye slash icon
	    eyeIcon2.classList.toggle('fa-eye');
	    eyeIcon2.classList.toggle('fa-eye-slash');
	});

const passwordTag = document.getElementById('password');
const confirmPasswordTag = document.getElementById('confirmPassword');
const errmsg = document.getElementById('errmsg');
const pswerr = document.getElementById("pswerr");
const submitBtn = document.getElementById("submit");

function checkPasswords() {
    if (passwordTag.value !== confirmPasswordTag.value) {
        errmsg.textContent = "Passwords do not match!";
    } else {
        errmsg.textContent = "";
    }
};

confirmPasswordTag.addEventListener("input", checkPasswords);
submitBtn.addEventListener("click",(event) => {
  if(passwordTag.value.length < 8 || confirmPasswordTag.value.length < 8){
    pswerr.textContent = "Password must be 8 characters at least!";
    event.preventDefault();
  } else {
    pswerr.textContent = "";
  }
})

	</script>
</body>
</html>