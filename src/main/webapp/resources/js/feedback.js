document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById('feedbackform');
    const feedbackInput = document.getElementById('feedbackinput');
    const feedbackError = document.getElementById('feedbackerror');


    function validateFeedback() {
        if (feedbackInput.value.trim() === '') {
            feedbackInput.classList.add('invalid');
            feedbackError.textContent = 'Please enter your feedback.';
            return false;
        } else {
            feedbackInput.classList.remove('invalid');
            feedbackError.textContent = '';
            return true;
        }
    }

    

    function validatefeedbackForm() {
        return validateFeedback();
    }

    // Blur event listeners
    feedbackInput.addEventListener('blur', validateFeedback);
    
    // Focus event listeners to clear error messages
    feedbackInput.addEventListener('focus', function () {
        feedbackInput.classList.remove('invalid');
        feedbackError.textContent = '';
    });

   
    form.addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent the form from submitting
        if (validatefeedbackForm()) {
            // If validation passes, you can submit the form
            // You might want to do additional checks here before submitting
            form.submit();
        }
    });
});
