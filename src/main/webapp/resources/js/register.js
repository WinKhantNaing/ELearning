document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById('registrationForm');
    const usernameInput = document.getElementById('username');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const usernameError = document.getElementById('usernameError');
    const emailError = document.getElementById('emailError');
    const passwordError = document.getElementById('passwordError');
    const confirmPasswordError = document.getElementById('confirmPasswordError');

    function validateUsername() {
        if (usernameInput.value.trim() === '') {
            usernameInput.classList.add('invalid');
            usernameError.textContent = 'Please enter a username.';
            usernameInput.focus();
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
            emailInput.focus();
            return false;
        } else if (!emailPattern.test(email)) {
            emailInput.classList.add('invalid');
            emailError.textContent = 'Please enter a valid email address.';
            emailInput.focus();
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
        passwordInput.focus();
        return false;
    } else if (password.length < 8) {
        passwordInput.classList.add('invalid');
        passwordError.textContent = 'Password must be at least 8 characters long.';
        passwordInput.focus();
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
            confirmPasswordInput.focus();
            return false;
        } else {
            confirmPasswordInput.classList.remove('invalid');
            confirmPasswordError.textContent = '';
            return true;
        }
    }

    function validateForm() {
        return validateUsername() && validateEmail() && validatePassword() && validateConfirmPassword();
    }

    usernameInput.addEventListener('blur', validateUsername);
    emailInput.addEventListener('blur', validateEmail);
    passwordInput.addEventListener('blur', validatePassword);
    confirmPasswordInput.addEventListener('blur', validateConfirmPassword);

    form.addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent the form from submitting
        if (validateForm()) {
            // If validation passes, you can submit the form
            // You might want to do additional checks here before submitting
            form.submit();
        }
    });
});
