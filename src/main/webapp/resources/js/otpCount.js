let resendButton = document.getElementById('resendOtpButton');
let countdownDisplay = document.getElementById('countdown');
let countdownTime = 60;
startCountdown();

function startCountdown() {
    resendButton.disabled = true;
    let countdown = countdownTime;
    let interval = setInterval(() => {
        countdown--;
        countdownDisplay.textContent = `Resend OTP in ${countdown} seconds.`;
        if (countdown <= 0) {
            clearInterval(interval);
            resendButton.disabled = false;
            countdownDisplay.textContent = '';
        }
    }, 1000);
}

 $(document).ready(function() {
            $('#resendOtpButton').click(function(event) {
				 event.preventDefault();
                  const userEmail = $('#email').val(); // Get email from input field

                if (userEmail === '') {
                    alert('Please enter your email');
                    return;
                }

                $.ajax({
                    type: 'POST',
                    url: 'verifyEmail', // Ensure this URL matches your backend endpoint
                    data: { userEmail: userEmail }, // Use dynamic email
                    success: function(response) {
                        //alert(response);
                        startCountdown(); // Restart countdown after a successful resend
                    },
                    error: function(xhr, status, error) {
                        alert('Error: ' + error);
                    }
                });
            });
        });

