// Get the modal
var modal = document.getElementById("modal");

// Get the button that opens the modal
var btn = document.getElementById("openModalBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

// Dummy data - replace with actual values
document.getElementById("itemName").innerText = "Product Name";
document.getElementById("itemPrice").innerText = "$50.00";
document.getElementById("itemQuantity").innerText = "1";
document.getElementById("totalCost").innerText = "$50.00";
document.getElementById("shippingAddress").innerText = "123 Street, City, Country";
document.getElementById("paymentMethod").innerText = "Credit Card";
