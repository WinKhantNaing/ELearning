


document.addEventListener("DOMContentLoaded", function () {
    const form1 = document.getElementById('namemodalform');
    const usernameInput = document.getElementById('namemodal');
    const usernameError = document.getElementById('nameModalError');
   
    function validateUsername() {
        if (usernameInput.value.trim() === '') {
            usernameInput.classList.add('invalid');
            usernameError.textContent = 'Please enter  username.';
            return false;
        } else {
            usernameInput.classList.remove('invalid');
            usernameError.textContent = '';
            return true;
        }
    }

   

    function validateForm() {
        return validateUsername();
    }

    usernameInput.addEventListener('blur', validateUsername);
    //focus
    usernameInput.addEventListener('focus', function () {
        usernameInput.classList.remove('invalid');
        usernameError.textContent = '';
        });
    
     
    form1.addEventListener('submit', function (event) {
            event.preventDefault(); // Prevent the form from submitting
        if (validateForm()) {
            // If validation passes, you can submit the form
            // You might want to do additional checks here before submitting
            form1.submit();
        }
        
        /*if (validateForm()) {
       event.preventDefault(); // Prevent the form from submitting
            form.submit();*/
    });
});




document.addEventListener("DOMContentLoaded", function () {
    const form2 = document.getElementById('emailModalForm');
    const emailInput = document.getElementById('emailModal');
    const emailError = document.getElementById('emailModalError');
    
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

 
    function validateForm() {
        return  validateEmail();
    }

    emailInput.addEventListener('blur', validateEmail);

      emailInput.addEventListener('focus', function () {
        emailInput.classList.remove('invalid');
        emailError.textContent = '';
      });


    form2.addEventListener('submit', function (event) {
            event.preventDefault(); // Prevent the form from submitting
        if (validateForm()) {
            // If validation passes, you can submit the form
            // You might want to do additional checks here before submitting
            form2.submit();
        }
        
        /*if (validateForm()) {
       event.preventDefault(); // Prevent the form from submitting
            form.submit();*/
    });
});