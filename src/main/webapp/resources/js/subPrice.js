
	document.addEventListener("DOMContentLoaded", function () {
	    const form = document.getElementById('subForm');
	    const priceInput = document.getElementById('price');
	    
	    const priceError = document.getElementById('priceError');
	       function validatePrice() {
	        if (priceInput.value.trim() === '') {
	            priceInput.classList.add('invalid');
	            priceError.textContent = 'Please enter price.';
	            return false;
	        } else {
	            priceInput.classList.remove('invalid');
	            priceError.textContent = '';
	            return true;
	        }
	    }
	    
	  

	    function validateForm() {
	        return  validatePrice();
	    }

	    // Blur event listeners
	   
	    priceInput.addEventListener('blur', validatePrice);
	    // Focus event listeners to clear error messages
	
	    priceInput.addEventListener('focus', function () {
	        priceInput.classList.remove('invalid');
	        priceError.textContent = '';
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
