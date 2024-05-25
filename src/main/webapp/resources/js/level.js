
  // Wait until the DOM is fully loaded
  document.addEventListener("DOMContentLoaded", function() {
    // Get the canvas element by its ID
    var canvas = document.getElementById('myCanvas');
    if (canvas.getContext) {
      // Get the 2D drawing context
      var ctx = canvas.getContext('2d');

      // Set the fill color to blue
      ctx.fillStyle = 'blue';

      // Draw a rectangle
      ctx.fillRect(10, 5, 47, 20);

      // Optionally, set the stroke color to red and draw a border around the rectangle
      ctx.strokeStyle = 'red';
      ctx.strokeRect(10, 5, 47, 20);
    }
  });

