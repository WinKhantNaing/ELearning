document.addEventListener('DOMContentLoaded', function() {
    var usernameField = document.getElementById('username');
    var emailField = document.getElementById('email');
    var editButton = document.getElementById('edit');
    var saveButton = document.getElementById('save');
    
    // Function to enable editing
    function enableEdit() {
        editButton.style.display = 'none';
        saveButton.style.display = 'inline-block';
        usernameField.readOnly = false;
        emailField.readOnly = false;
    }
    
    // Function to save changes
    function saveChanges() {
        // Simulate AJAX request to update data on the server
        // You would replace this with actual AJAX calls to your backend
        // Example:
        // var newUsername = usernameField.value;
        // var newEmail = emailField.value;
        // makeAjaxRequest('/update_profile', { username: newUsername, email: newEmail });
        
        // For demonstration, let's just alert the new values
        alert('Username: ' + usernameField.value + '\nEmail: ' + emailField.value);
        
        // Disable editing after saving changes
        disableEdit();
    }
    
    // Function to disable editing
    function disableEdit() {
        saveButton.style.display = 'none';
        editButton.style.display = 'inline-block';
        usernameField.readOnly = true;
        emailField.readOnly = true;
    }
    
    // Event listener for edit button
    editButton.addEventListener('click', enableEdit);
    
    // Event listener for save button
    saveButton.addEventListener('click', saveChanges);
});
