    const passwordInput = document.getElementById('newPassword');
    const confirmPasswordInput = document.getElementById('confirmNewPassword');
    const passwordError = document.getElementById('passwordError');
    const confirmPasswordError = document.getElementById('confirmPasswordError');


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

    function validateConfirmPassword() {
        const confirmPassword = confirmPasswordInput.value.trim();
        const password = passwordInput.value.trim();
        if (confirmPassword === '') {
            confirmPasswordInput.classList.add('invalid');
            confirmPasswordError.textContent = 'Please confirm your password.';
            return false;
        } else {
            confirmPasswordInput.classList.remove('invalid');
            confirmPasswordError.textContent = '';
            return true;
        }
    }

    function validateForm() {
        return validatePassword() && validateConfirmPassword();
    }

    passwordInput.addEventListener('blur', validatePassword);
    confirmPasswordInput.addEventListener('blur', validateConfirmPassword);
    confirmPasswordInput.addEventListener('blur', () => {
    if(passwordInput.value != confirmPasswordInput){
      confirmPasswordError.textContent = "Password and confirm password do not match!!";
    }
  });


		//focus

		passwordInput.addEventListener('focus', function () {
        passwordInput.classList.remove('invalid');
        passwordError.textContent = '';
   		 });

		confirmPasswordInput.addEventListener('focus', function () {
        confirmPasswordInput.classList.remove('invalid');
        confirmPasswordError.textContent = '';
   		 });



    form.addEventListener('submit', function (event) {
            event.preventDefault(); // Prevent the form from submitting
        if (validateForm()) {
            // If validation passes, you can submit the form
            // You might want to do additional checks here before submitting
            form.submit();
        }
        
        /*if (validateForm()) {
       event.preventDefault(); // Prevent the form from submitting
            form.submit();*/
    });