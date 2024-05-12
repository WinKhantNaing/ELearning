<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Purchase Confirmation</title>
  <link rel="stylesheet" href="<c:url value="/resources/css/pcStyle.css"/>">
</head>
<body>
  <div id="modal" class="modal">
    <div class="modal-content">
      <h2 class="modal-title">Purchase Confirmation</h2>
      <div class="order-summary">
        <p><strong>Order Summary:</strong></p>
        <p>Item: <span id="itemName"></span></p>
        <p>Price: <span id="itemPrice"></span></p>
        <p>Quantity: <span id="itemQuantity"></span></p>
        <p>Total: <span id="totalCost"></span></p>
      </div>
      <div class="shipping-details">
        <p><strong>Shipping Address:</strong></p>
        <p><span id="shippingAddress"></span></p>
      </div>
      <div class="payment-method">
        <p><strong>Payment Method:</strong></p>
        <p><span id="paymentMethod"></span></p>
      </div>
      <button id="confirmBtn" class="button confirm-button">Confirm</button>
      <button id="cancelBtn" class="button cancel-button">Cancel</button> <!-- Added cancel button -->
    </div>
  </div>

  <script src="<c:url value="/resources/js/pcScript.js"/>"></script>
</body>
</html>
