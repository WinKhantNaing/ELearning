
document.addEventListener("DOMContentLoaded", function() {
    updateOptions(); // Call once the DOM is fully loaded

    function updateOptions() {
        const timePeriod = document.getElementById('timePeriod').value;
        const optionsDropdown = document.getElementById('options');
        optionsDropdown.innerHTML = '';
        const currentOption = document.getElementById('currentOption').value;
       // const currentValue = document.getElementById('current').value;
        // Define new options based on the selected time period
        let options;
        if (timePeriod === 'Monthly') { 
            options = [
                "1 month", "2 months", "3 months", "4 months", "5 months", "6 months", 
                "7 months", "8 months", "9 months", "10 months", "11 months", "12 months"
            ];
        }else{
            options = [
                "1 year", "2 years", "3 years", "4 years", "5 years", "6 years", 
                "7 years", "8 years", "9 years", "10 years"
            ];
        }
        
        console.log(currentOption);
        
        // Add new options to the dropdown
        options.forEach(option => {
            const optElement = document.createElement('option');
            optElement.value = option;
            optElement.textContent = option;
            console.log(option,currentOption);
            if (option === currentOption) {
                optElement.selected = true; // Preselect the option if it matches the duration
            }
            optionsDropdown.appendChild(optElement);
        });
        

    }
    
    // Attach event listener
    document.getElementById('timePeriod').addEventListener('change', updateOptions);
});




