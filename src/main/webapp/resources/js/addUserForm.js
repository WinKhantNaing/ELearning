document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById('addform');
    const usernameInput = document.getElementById('username1');
    const emailInput = document.getElementById('email1');
    const passwordInput = document.getElementById('password1');
    const usernameError = document.getElementById('usernameError1');
    const emailError = document.getElementById('emailError1');
    const passwordError = document.getElementById('passwordError1');

    function validateUsername() {
        if (usernameInput.value.trim() === '') {
            usernameInput.classList.add('invalid');
            usernameError.textContent = 'Please enter a username.';
            return false;
        } else {
            usernameInput.classList.remove('invalid');
            usernameError.textContent = '';
            return true;
        }
    }

    function validateEmail() {
        const email = emailInput.value.trim();
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email === '') {
            emailInput.classList.add('invalid');
            emailError.textContent = 'Please enter an email address.';
            return false;
        } else if (!emailPattern.test(email)) {
            emailInput.classList.add('invalid');
            emailError.textContent = 'Please enter a valid email address.';
            return false;
        } else {
            emailInput.classList.remove('invalid');
            emailError.textContent = '';
            return true;
        }
    }

   function validatePassword() {
    const password = passwordInput.value.trim();
    if (password === '') {
        passwordInput.classList.add('invalid');
        passwordError.textContent = 'Please enter a password.';
        return false;
    } else if (password.length < 8) {
        passwordInput.classList.add('invalid');
        passwordError.textContent = 'Password must be at least 8 characters long.';
        return false;
    } else {
        passwordInput.classList.remove('invalid');
        passwordError.textContent = '';
        return true;
    }
}

  
    function validateForm() {
        return validateUsername() && validateEmail() && validatePassword();
    }

    usernameInput.addEventListener('blur', validateUsername);
    emailInput.addEventListener('blur', validateEmail);
    passwordInput.addEventListener('blur', validatePassword);



		//focus
		usernameInput.addEventListener('focus', function () {
        usernameInput.classList.remove('invalid');
        usernameError.textContent = '';
   		 });
    
    	emailInput.addEventListener('focus', function () {
        emailInput.classList.remove('invalid');
        emailError.textContent = '';
    	});

		passwordInput.addEventListener('focus', function () {
        passwordInput.classList.remove('invalid');
        passwordError.textContent = '';
   		 });

 form.addEventListener('submit', function (event) {
	        event.preventDefault(); // Prevent the form from submitting
	        if (validateForm()) {
	            // If validation passes, you can submit the form
	            // You might want to do additional checks here before submitting
	            form.submit();
	        }
	    });

});