document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById('loginForm');
    const usernameInput = document.getElementById('loginname');
    const passwordInput = document.getElementById('loginpassword');
    const usernameError = document.getElementById('loginnameError');
    const passwordError = document.getElementById('loginpasswordError');

    function validateUsername() {
        if (usernameInput.value.trim() === '') {
            usernameInput.classList.add('invalid');
            usernameError.textContent = 'Please enter your username.';
            return false;
        } else {
            usernameInput.classList.remove('invalid');
            usernameError.textContent = '';
            return true;
        }
    }

    function validatePassword() {
        if (passwordInput.value.trim() === '') {
            passwordInput.classList.add('invalid');
            passwordError.textContent = 'Please enter your password.';
            return false;
        } else {
            passwordInput.classList.remove('invalid');
            passwordError.textContent = '';
            return true;
        }
    }

    function validateForm() {
        return validateUsername() && validatePassword();
    }

    // Blur event listeners
    usernameInput.addEventListener('blur', validateUsername);
    passwordInput.addEventListener('blur', validatePassword);

    // Focus event listeners to clear error messages
    usernameInput.addEventListener('focus', function () {
        usernameInput.classList.remove('invalid');
        usernameError.textContent = '';
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
